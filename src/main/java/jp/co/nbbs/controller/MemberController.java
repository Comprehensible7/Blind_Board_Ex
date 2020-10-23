package jp.co.nbbs.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import jp.co.nbbs.dao.MemberDAO;
import jp.co.nbbs.vo.MemberVO;

/**
 * 회원 정보 관련 콘트롤러
 */
@Controller
@RequestMapping("member") //a href로 넘어온거다. 클래스 전체에 /member/를 씌운거
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberDAO dao;		//회원 관련 데이터 처리 객체
	
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
	public String login() {
		return "memberView/loginForm";
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
