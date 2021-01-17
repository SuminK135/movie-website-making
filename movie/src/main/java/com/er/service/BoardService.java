package com.er.service;

import java.util.List;

import com.er.domain.BoardVO;

public interface BoardService {

	public void register(BoardVO board);
	
	public BoardVO get(int seq);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(int seq);
	
	public List<BoardVO> getList();
	
}
