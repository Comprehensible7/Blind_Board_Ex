package jp.co.nbbs.dao;

import jp.co.nbbs.vo.MemberVO;

/**
 * 회원 관련 Mybatis 사용 메서드
 */
public interface MemberMapper {
	//회원 정보 저장
	public int insertMember(MemberVO member);
	//회원 정보 검색
	public MemberVO getMember(String id);
	//회원 정보 수정
	public int updateMember(MemberVO member);
}
