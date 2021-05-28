package com.er.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.er.domain.BoardVO;
import com.er.domain.Paging;

public interface BoardMapper {

	//@Select("select * from board1 where seq > 0")
	//List<BoardVO> getList();
	
	List<BoardVO> getListForPaging(Paging pg);
	
	int getBoardTotalCount(Paging pg);
	
	// Create(Insert)
	//void insert(BoardVO board);
	void insertSelectKey(BoardVO board);
	
	// Read
	BoardVO read(int seq);
	
	// viewHitUpadate
	int viewHitUpadate(int seq);
	
	// Update
	int update(BoardVO board);

	// Delete
	int delete(BoardVO board);
	
	// 반정규화(Denormalization)
	void updateReplyCnt(@Param("seq") int seq, @Param("amount") int amount);

}
