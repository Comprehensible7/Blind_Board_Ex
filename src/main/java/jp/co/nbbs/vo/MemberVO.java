package jp.co.nbbs.vo;

import lombok.Data;

/**
 * 회원 정보 VO
 */
@Data
public class MemberVO {
	private String id;					//회원ID
	private String password;			//비밀번호
	private String name;				//이름
	private String phone;				//전화번호
	private String address;				//주소
	private String email;				//이메일주소
}
