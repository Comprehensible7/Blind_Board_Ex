package jp.co.nbbs.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jp.co.nbbs.vo.MemberVO;

/**
 * 회원 관련 DAO
 */
@Repository
public class MemberDAO {
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 회원 가입 처리
	 * @param member 사용자가 입력한 가입 정보
	 */
	public int insert(MemberVO member) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = 0;

		try {
			result = mapper.insertMember(member);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 회원 정보 검색
	 * @param id 검색할 회원 ID
	 */
	public MemberVO getMember(String id) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO member = null;

		try {
			member = mapper.getMember(id);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	/**
	 * 회원 정보 수정
	 * @param member 사용자가 입력한 수정 정보
	 * @return
	 */
	public int updateMember(MemberVO member) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = 0;

		try {
			result = mapper.updateMember(member);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
