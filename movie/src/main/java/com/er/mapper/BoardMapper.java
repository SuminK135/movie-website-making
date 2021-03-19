package com.er.mapper;

import java.util.List;

import com.er.domain.BoardVO;

public interface BoardMapper {

	//@Select("select * from board1 where seq > 0")
	List<BoardVO> getList();
	
	// Create(Insert)
	void insert(BoardVO board);
	
	void insertSelectKey(BoardVO board);
	
	// Read
	BoardVO read(int seq);
	
	// Delete
	int delete(int seq);
	
	// Update
	int update(BoardVO board);
	
}
