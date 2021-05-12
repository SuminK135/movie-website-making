package com.er.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.er.domain.BoardVO;
import com.er.domain.Paging;
import com.er.domain.Searching;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	/*
	  @Test 
	  public void testGetList() { 
		  mapper.getList().forEach(board -> log.info(board)); 
	  }
	 */
	
	/*
	@Test
	public void testPaging() {
		
		Paging pg = new Paging();
		
		pg.setPageNum(3);
		pg.setAmount(10);
		
		List<BoardVO> list = mapper.getListForPaging(pg);
		
		list.forEach(Board -> log.info(Board.getSeq()));
	}
	*/
	
	@Test
	public void testSearch() {
		
		Paging pg = new Paging();
		pg.setKeyword("새로");
		pg.setType("SC");
		
		List<BoardVO> list = mapper.getListForPaging(pg);
		
		list.forEach(board -> log.info(board));
		
	}
	
	/*
	 * @Test public void testInsert() {
	 * 
	 * BoardVO board = new BoardVO(); board.setSubject("새제목");
	 * board.setWriter("새작성자"); board.setMail("새메일"); board.setPassword("123456");
	 * board.setContent("새로 작성하는 내용"); board.setWip("127.0.0.1");
	 * board.setWdate("2021-01-17");
	 * 
	 * mapper.insert(board);
	 * 
	 * log.info(board); }
	 */

	/*
	 * @Test public void testInsertSelectKey() {
	 * 
	 * BoardVO board = new BoardVO(); board.setSubject("selectkey_제목");
	 * board.setWriter("새작성자"); board.setMail("새메일"); board.setPassword("123456");
	 * board.setContent("새로 작성하는 내용"); board.setWip("127.0.0.1");
	 * board.setWdate("2021-01-17");
	 * 
	 * mapper.insertSelectKey(board);
	 * 
	 * log.info(board);
	 * 
	 * }
	 */
	
	
	/*
	 * @Test public void testRead() {
	 * 
	 * BoardVO board = mapper.read(5);
	 * 
	 * log.info(board);
	 * 
	 * }
	 */
	  
		/*
		 * @Test public void testDelete() { log.info("DELETE COUNT: " +
		 * mapper.delete(10)); }
		 */
	 /*
	  @Test
	  public void testUpdate() {
		  
		  BoardVO boardVO = new BoardVO();
		  boardVO.setSeq(11);
		  boardVO.setSubject("수정된 제목");
		  boardVO.setPassword("123456");
		  boardVO.setContent("수정된 내용");
		  boardVO.setWriter("수정된 작성자");
		  
		  int count = mapper.update(boardVO);
		  
		  log.info("UPDATE COUNT: " + count);
		  
	  }
	  */
}
