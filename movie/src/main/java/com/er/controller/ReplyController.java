package com.er.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.er.domain.Paging;
import com.er.domain.ReplyVO;
import com.er.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {

	private ReplyService service;
/*
	 produces : 해당 메서드가 생산하는 MIME 타입
	 @RequestBody : 전달된 요청(request)의 내용(body)을 이용하여 해당 파라미터의 타입으로 변환(JSON 데이터를 ReplyVO 타입으로 변환)
	 @PathVariable : URL경로의 일부를 파라미터로 사용할 때 이용
	 ResponseEntity: 데이터와 함께 HTTP 헤더의 상태 메시지 등을 같이 전달하는 용도로 사용
	 브라우저 : JSON 타입의 댓글 데이터를 전송하고,
	 서버 : 댓글의 처리가 정상적인지 문자열(success)로 반환
*/
	@PostMapping(value = "/new",
		consumes = "application/json",
		produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		
		log.info("ReplyVO..........: " + vo);
		
		int insertCount = service.register(vo);
		
		log.info("REPLY INSERT COUNT: " + insertCount);
		
		return insertCount == 1
			? new ResponseEntity<>("success", HttpStatus.OK)
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/pages/{seq}/{page}",
		produces = { MediaType.APPLICATION_XML_VALUE,
					 MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ReplyVO>> getList(@PathVariable("page") int page, @PathVariable("seq") int seq) {
		
		log.info("getList..........");
		
		Paging pg = new Paging(page, 10);
		
		log.info(pg);
		
		return new ResponseEntity<>(service.getList(pg, seq), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{rno}",
		produces = { MediaType.APPLICATION_XML_VALUE,
					 MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") int rno) {
		
		log.info("get..........:" + rno);
		
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("rno") int rno) {
		
		log.info("remove..........:" + rno);
		
		return service.remove(rno) == 1
			? new ResponseEntity<>("success", HttpStatus.OK)
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
		value = "/{rno}",
		consumes = "application/json",
		produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") int rno) {
		
		vo.setRno(rno);
		
		log.info("rno: " + rno);
		
		log.info("modify..........:" + vo);
		
		return service.modify(vo) == 1
			? new ResponseEntity<>("success", HttpStatus.OK)
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
