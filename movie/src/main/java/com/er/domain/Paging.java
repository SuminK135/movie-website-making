package com.er.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class Paging {

	// 현재 페이지
	private int pageNum;
	// 페이지당 게시글 수
	private int amount;
	// 페이지 넘기기
	private int skip;
	
	// 검색기능
	protected String type;
	protected String keyword;
	
	public Paging() {
		
		this(1,10);
		this.skip = 0;
		
	}

	public Paging(int pageNum, int amount) {
		// TODO Auto-generated constructor stub
		
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum - 1) * amount;
		
	}

	public void setPageNum(int pageNum) {
		
		this.skip = (pageNum - 1) * this.amount;
		
		this.pageNum = pageNum;
		
	}

	public void setAmount(int amount) {
		
		this.skip = (this.pageNum - 1) * amount;
		
		this.amount = amount;
		
	}

	public void setSkip(int skip) {
		
		this.skip = skip;
		
	}
	
	
	public void setType(String type) {
		
		this.type = type;
		
	}

	public void setKeyword(String keyword) {
		
		this.keyword = keyword;
		
	}
	
	public String[] getTypeArr() {
		 // TODO Auto-generated method stub
		 
		 return type == null ? new String[] {} : type.split("");
		
	 }
	
}
