package com.er.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.er.domain.Paging;
import com.er.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	private int[] seqArr = { 122, 123, 125, 126, 127 };
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	@Test
	public void testMapper() {
		
		log.info(mapper);
	}	
/*	
	@Test
	public void testCreate() {
		
		IntStream.rangeClosed(1, 10).forEach(i -> {
			
			ReplyVO vo = new ReplyVO();
			
			//게시물의 번호
			vo.setSeq(seqArr[i % 5]);
			vo.setReply("댓글 테스트 " + i);
			vo.setWriter("작성자" + i);
			
			mapper.insert(vo);
		});
		
	}
*/	
/*
	@Test
	public void testRead() {
		
		int targetRno = 5;
		
		ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
		
	}
*/
/*
	@Test
	public void testDelete() {
		
		int targetRno = 1;
		
		mapper.delete(targetRno);
		
	}
*/	
/*
	@Test
	public void testUpdate() {
		
		int targetRno = 10;
		
		ReplyVO vo = mapper.read(targetRno);
		
		vo.setReply("Update Reply ");
		
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT: " + count);
		
	}
*/
/*
	@Test
	public void testList() {
		
		Paging pg = new Paging();
		List<ReplyVO> replies = mapper.getListWithPaging(pg, seqArr[0]);
		
		replies.forEach(reply -> log.info(reply));
		
	}
*/
	@Test
	public void testList2() {
		
		Paging pg = new Paging(2, 10);
		
		List<ReplyVO> replies = mapper.getListWithPaging(pg, 113);
		
		replies.forEach(reply -> log.info(reply));
	}
}
