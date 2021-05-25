package com.er.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.er.domain.Paging;
import com.er.domain.ReplyVO;

public interface ReplyMapper {

	int insert(ReplyVO vo);
	
	ReplyVO read(int seq);
	
	int delete(int rno);
	
	int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(
			@Param("pg") Paging pg,
			@Param("seq") int seq
			);
	
	public int getCountBySeq(int seq);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
