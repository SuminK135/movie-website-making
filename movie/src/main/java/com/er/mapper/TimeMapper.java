package com.er.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

	@Select("SELECT ename FROM emp")
	public String getTime();
	
	public String getTime2();
	
}
