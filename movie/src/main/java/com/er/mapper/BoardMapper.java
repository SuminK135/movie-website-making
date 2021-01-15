package com.er.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.er.domain.BoardVO;

public interface BoardMapper {

	//@Select("select * from board1 where seq > 0")
	public List<BoardVO> getList();
	
}
