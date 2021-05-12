package com.er.domain;

public class Searching extends Paging {

	@Override
	 public String[] getTypeArr() {
		 // TODO Auto-generated method stub
		 
		 return type == null ? new String[] {} : type.split("");
		
	 }
	
}
