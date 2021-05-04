package com.er.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class Paging {

	private int pageNum;
	private int amount;
	private int skip;
	
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
	
	
	
}
