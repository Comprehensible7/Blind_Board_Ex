package jp.co.nbbs.vo;

import lombok.Data;

/**
 * 리플 정보 VO
 */
@Data
public class ReplyVO {
	int replynum;				//리플번호
	int boardnum;				//본문 글번호
	String id;					//작성자 ID
	String text;				//리플내용
	String inputdate;			//작성날짜
}
