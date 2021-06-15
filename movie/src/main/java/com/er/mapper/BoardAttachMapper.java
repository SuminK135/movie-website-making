package com.er.mapper;

import java.util.List;

import com.er.domain.BoardAttachVO;

public interface BoardAttachMapper {

	void insert(BoardAttachVO vo);
	
	void delete(String uuid);
	
	List<BoardAttachVO> findBySeq(int seq);
	
	void deleteAll(int seq);
	
}
