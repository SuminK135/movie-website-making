package com.er.service;

import java.util.List;

import com.er.domain.Paging;
import com.er.domain.ReplyVO;

public interface ReplyService {

	int register(ReplyVO vo);
	
	ReplyVO get(int rno);
	
	int modify(ReplyVO vo);
	
	int remove(int rno);
	
	List<ReplyVO> getList(Paging pg, int seq);
	
	
}
