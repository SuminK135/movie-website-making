package com.er.service;

import java.util.List;

import com.er.domain.BoardVO;
import com.er.domain.Paging;

public interface BoardService {

	//List<BoardVO> getList();
	
	List<BoardVO> getList(Paging pg);
	
	void register(BoardVO board);
	
	BoardVO get(int seq);
	
	boolean viewHitUpadate(int seq);
	
	boolean modify(BoardVO board);
	
	boolean remove(BoardVO board);
	
}
