package com.er.domain;

import lombok.Data;

@Data
public class BoardAttachVO {

	private String uuid; // PK
	private String uploadPath; // 실제 파일이 업로드된 경로
	private String fileName; // 파일 이름
	private boolean fileType; // 이미지파일 여부
	
	private int seq; // 해당 게시물 번호 저장

	
}
