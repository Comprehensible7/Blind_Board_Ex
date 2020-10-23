package jp.co.nbbs.vo;

import lombok.Data;

/**
 * 게시글 정보 VO
 */
@Data
public class BoardVO {
	private int boardnum;				//글번호
	private String id;					//작성자ID
	private String title;				//제목
	private String contents;			//내용
	private String inputdate;			//작성일,
	private int hits;					//조회수
	private String originalfile;		//첨부파일 원래이름
	private String savedfile;			//첨부파일 저장된 이름
}
