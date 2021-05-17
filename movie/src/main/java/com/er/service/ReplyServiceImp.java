package com.er.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.er.domain.Paging;
import com.er.domain.ReplyVO;
import com.er.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImp implements ReplyService {

	//@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		// TODO Auto-generated method stub
		log.info("register.........." + vo);
		
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(int rno) {
		// TODO Auto-generated method stub
		log.info("get.........." + rno);
		
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		// TODO Auto-generated method stub
		log.info("modify.........." + vo);
		
		return mapper.update(vo);
	}

	@Override
	public int remove(int rno) {
		// TODO Auto-generated method stub
		log.info("remove.........." + rno);
		
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Paging pg, int seq) {
		// TODO Auto-generated method stub
		log.info("Get Reply List of a Board: " + seq);
		
		return mapper.getListWithPaging(pg, seq);
	}

}
