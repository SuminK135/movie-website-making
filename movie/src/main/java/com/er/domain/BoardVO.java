package com.er.domain;

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
	private String wip;
	private String wdate;
	
}
