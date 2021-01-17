package com.er.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.er.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
	/*
	 * @Test public void testExist() {
	 * 
	 * log.info(service); assertNotNull(service);
	 * 
	 * }
	 */
	
	/*
	 * @Test public void testRegister() {
	 * 
	 * BoardVO board = new BoardVO(); board.setSubject("새글");
	 * board.setContent("새내용"); board.setWriter("새작성자");
	 * board.setPassword("123456"); board.setWip("127.0.0.1");
	 * 
	 * service.register(board);
	 * 
	 * log.info("생성된 게시물의 번호: " + board.getSeq()); }
	 */
	
	/*
	 * @Test public void testGetList() {
	 * 
	 * service.getList().forEach(board -> log.info(board));
	 * 
	 * }
	 */
	
	/*
	 * @Test public void testGet() { log.info(service.get(1)); }
	 */
	
	/*
	 * @Test public void testDelete() { log.info("REMOVE RESULT: " +
	 * service.remove(11)); }
	 */
	@Test
	public void testUpdate() {
		BoardVO board = service.get(12);
		
		if(board == null) {
			return;
		}
		
		board.setSubject("수정된 제목");
		log.info("MODIFIED RESULT: " + service.modify(board));
		
	}
	
}
