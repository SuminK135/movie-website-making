package com.er.mapper;

import java.util.List;

import com.er.domain.BoardVO;

public interface BoardMapper {

	//@Select("select * from board1 where seq > 0")
	public List<BoardVO> getList();
	
	// Create(Insert)
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	// Read
	public BoardVO read(int seq);
	
	// Delete
	public int delete(int seq);
	
	// Update
	public int update(BoardVO board);
	
}
