package com.er.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private int rno;
	private int seq;
	
	private String reply;
	private String writer;
	private Date wdate;
	private Date mdate;
	
}
