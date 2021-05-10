package com.er.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Searching extends Paging {

	private String type;
	private String keyword;
	
	public String[] getTypeArr() {
		
		return type == null ? new String[] {} : type.split("");
	}

	
}
