package com.er.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.er.domain.BoardAttachVO;
import com.er.domain.BoardVO;
import com.er.domain.Paging;
import com.er.mapper.BoardAttachMapper;
import com.er.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class BoardServiceImp implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	
/*
	@Override
	public List<BoardVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}
*/	
	@Override
	public List<BoardVO> getList(Paging pg) {
		// TODO Auto-generated method stub
		log.info("get List for Paging: " + pg);
		
		return mapper.getListForPaging(pg);
	}
	
	@Override
	public int getBoardTotalCount(Paging pg) {
		// TODO Auto-generated method stub
		log.info("get total count");
		
		return mapper.getBoardTotalCount(pg);
	}
	
	@Transactional
	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("register............" + board);
		
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		
		board.getAttachList().forEach(attach -> {
			attach.setSeq(board.getSeq());
			attachMapper.insert(attach);
		});
			
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
		log.info("modify............" + board);
		
		return mapper.update(board) == 1;
	}

	@Transactional
	@Override
	public boolean remove(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("delete............" + board);
		
		attachMapper.deleteAll(board.getSeq());
		
		return mapper.delete(board) == 1;
	}

	@Override
	public List<BoardAttachVO> getAttachList(int seq) {
		// TODO Auto-generated method stub
		log.info("Get attach list by seq: " + seq);
		
		return attachMapper.findBySeq(seq);
	}
	
}
