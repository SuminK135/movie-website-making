package com.er.service;

import java.util.List;

import com.er.domain.BoardVO;

public interface BoardService {

	void register(BoardVO board);
	
	BoardVO get(int seq);
	
	boolean viewHitUpadate(int seq);
	
	boolean modify(BoardVO board);
	
	boolean remove(int seq);
	
	List<BoardVO> getList();
	
}
