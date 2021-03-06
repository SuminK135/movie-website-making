package com.er.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private int seq;
	private String subject;
	private String writer;
	private String mail;
	private String password;
	private String content;
	private int hit;
	private Date wdate;
	private int wgap;
	
	//댓글 수 (반정규화)
	private int replyCnt;

	private List<BoardAttachVO> attachList;
}
