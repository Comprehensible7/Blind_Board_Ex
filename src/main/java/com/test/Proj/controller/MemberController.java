package com.test.Proj.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.test.Proj.dao.MemberDAO;
import com.test.Proj.naver.NaverLoginBO;
import com.test.Proj.vo.MemberVO;

/**
 * 회원 정보 관련 콘트롤러
 */
@Controller
@RequestMapping("member") //a href로 넘어온거다. 클래스 전체에 /member/를 씌운거
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	
	
	
	@Autowired
	MemberDAO dao;		//회원 관련 데이터 처리 객체
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	
	/**
	 * 회원 가입 폼 보기
	 */
	@RequestMapping (value="join", method=RequestMethod.GET)
	public String joinForm(Model model) {
		return "memberView/joinForm";
	}

	/**
	 * 회원 가입 처리
	 */
	@RequestMapping (value="join", method=RequestMethod.POST)
	public String join(Model model, MemberVO member) {
		
		logger.info("{}",member);
		
		int result = dao.insert(member);
		if (result != 1) {
			return "memberView/joinForm";
		}
		return "redirect:/";
	}
	
	

	/**
	 * 로그인 폼으로 이동
	 */
	@RequestMapping (value="login", method=RequestMethod.GET)
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
//네이버
		model.addAttribute("url", naverAuthUrl);
		return "memberView/loginForm";
	}
	
	//네이버 로그인 성공시 callback호출 메소드
		@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
		public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
				throws IOException, ParseException {
			System.out.println("여기는 callback");
			OAuth2AccessToken oauthToken;
			oauthToken = naverLoginBO.getAccessToken(session, code, state);
	//1. 로그인 사용자 정보를 읽어온다.
			apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
			/**
			 * apiResult json 구조 {"resultcode":"00", "message":"success",
			 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
			 **/
	//2. String형식인 apiResult를 json형태로 바꿈
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
	//3. 데이터 파싱
	//Top레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject) jsonObj.get("response");
	//response의 nickname값 파싱
			String nickname = (String) response_obj.get("nickname");
			System.out.println(nickname);
			String age = (String) response_obj.get("age");
			System.out.println(age);
			String birthday = (String) response_obj.get("birthday");
			System.out.println(birthday);
			String email = (String) response_obj.get("email");
			System.out.println(email);
	//4.파싱 닉네임 세션으로 저장
			session.setAttribute("sessionId", nickname); // 세션 생성
			session.setAttribute("age", age);
			session.setAttribute("birthday", birthday);
			session.setAttribute("email", email);
			model.addAttribute("result", apiResult);
			return "home";
		}

	/**
	 * 로그인 처리
	 */
	@RequestMapping (value="login", method=RequestMethod.POST)
	public String login(Model model, HttpSession session, String id, String password) {
		MemberVO member = dao.getMember(id);
		
		//ID가 존재하고 비밀번호도 맞으면 세션에 ID와 이름을 저장하고 메인화면으로 리다이렉트
		if (member != null && member.getPassword().equals(password)) {
			session.setAttribute("loginId", member.getId());
			session.setAttribute("loginName", member.getName());
			return "redirect:/";
		}
		//ID가 없거나 비밀번호가 틀리면 로그인 화면으로 다시 포워딩
		else {
			model.addAttribute("errorMsg", "ID 또는 비밀번호가 틀립니다.");
			return "memberView/loginForm";
		}
	}
	
	/**
	 * 로그아웃
	 */
	@RequestMapping (value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("loginName");
		return "redirect:/";
	}
	
	/**
	 * 개인정보 수정 폼으로 이동
	 */
	@RequestMapping (value="update", method=RequestMethod.GET)
	public String update(Model model, HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		MemberVO member = dao.getMember(loginId);
		model.addAttribute("member", member);
		return "memberView/updateForm";
	}

	
	
	/**
	 * 개인정보 수정 처리
	 */
	@RequestMapping (value="update", method=RequestMethod.POST)
	public String update(Model model, HttpSession session, MemberVO member) {
		String loginId = (String) session.getAttribute("loginId");
		member.setId(loginId);;
		
		int res = dao.updateMember(member);
		if (res != 0) {
			return "redirect:/";
		}
		else {
			return "memberView/updateForm";
		}
	}
	
}
