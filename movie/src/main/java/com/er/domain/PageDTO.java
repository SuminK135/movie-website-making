package com.er.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Paging pg;
	
	public PageDTO(Paging pg, int total) {
		// TODO Auto-generated constructor stub
		
		this.pg = pg;
		this.total = total;
		
		this.endPage = (int) (Math.ceil( pg.getPageNum() / 5.0 ) ) * 5;
		
		this.startPage = this.endPage - 4;
		
		int realEnd = (int) (Math.ceil( (total * 1.0) / pg.getAmount()) );
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
		
	}

	
}
