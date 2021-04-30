package com.er.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.er.domain.BoardVO;
import com.er.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImp implements BoardService {
	
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("register............" + board);
		
		mapper.insertSelectKey(board);
	}

	@Override
	public BoardVO get(int seq) {
		// TODO Auto-generated method stub
		return mapper.read(seq);
	}
	
	@Override
	public boolean viewHitUpadate(int seq) {
		// TODO Auto-generated method stub
		return mapper.viewHitUpadate(seq) == 1;
	}	

	@Override
	public boolean modify(BoardVO board) {
		// TODO Auto-generated method stub
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(int seq) {
		// TODO Auto-generated method stub
		return mapper.delete(seq) == 1;
	}

	@Override
	public List<BoardVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	
	
	
}
