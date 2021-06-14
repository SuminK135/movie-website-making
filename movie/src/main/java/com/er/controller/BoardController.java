package com.er.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.er.domain.BoardAttachVO;
import com.er.domain.BoardVO;
import com.er.domain.PageDTO;
import com.er.domain.Paging;
import com.er.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;
/*	
	@GetMapping("/list")
	public void list(Model model) {
		
		log.info("list");
		model.addAttribute("list", service.getList());
		
	}
*/
	@GetMapping("/list")
	public void list(Paging pg, Model model) {
		log.info("list.....: " + pg);
		
		int total = service.getBoardTotalCount(pg);
		
		log.info("총 게시글 수: " + total);
		
		model.addAttribute("list", service.getList(pg));
		model.addAttribute("pageMaker", new PageDTO(pg, total));
	}
	
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info("==============================");
		
		log.info("register: " + board);
		
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		log.info("==============================");
		
		service.register(board);
		
		rttr.addFlashAttribute("result", board.getSeq());
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("seq") int seq, @ModelAttribute("pg") Paging pg, Model model) {
		
		log.info("/get");
		
		//Hit Count
		service.viewHitUpadate(seq);
		
		model.addAttribute("board", service.get(seq));
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(int seq) {
		
		log.info("getAttachList: " + seq);
		
		return new ResponseEntity<>(service.getAttachList(seq), HttpStatus.OK);
	}
	
	
	@GetMapping("/modify")
	public void modify(@RequestParam("seq") int seq, @ModelAttribute("pg") Paging pg,  Model model) {
		
		log.info("/modify");
		
		model.addAttribute("board", service.get(seq));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("pg") Paging pg, RedirectAttributes rttr) {
		
		log.info("modify..... " + board);
		
		//System.out.println("확인1: " + board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
			//System.out.println("확인2");
		}
		//System.out.println("확인3: " + service.modify(board));
		
		rttr.addAttribute("pageNum", pg.getPageNum());
		rttr.addAttribute("amount", pg.getAmount());
		rttr.addAttribute("type", pg.getType());
		rttr.addAttribute("keyword", pg.getKeyword());
		
		return "redirect:/board/get?seq=" + board.getSeq();
	}
	
	@GetMapping("/remove")
	public void remove(@RequestParam("seq") int seq, @ModelAttribute("pg") Paging pg, Model model) {
		
		log.info("/remove");
		
		model.addAttribute("board", service.get(seq));
	}
	
	@PostMapping("/remove")
	public String remove(BoardVO board, @ModelAttribute("pg") Paging pg, RedirectAttributes rttr) {
		
		log.info("remove....." + board);
		
		if(service.remove(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		//UriComponentsBuilder (2)
		//rttr.addAttribute("pageNum", pg.getPageNum());
		//rttr.addAttribute("amount", pg.getAmount());
		//rttr.addAttribute("type", pg.getType());
		//rttr.addAttribute("keyword", pg.getKeyword());
		
		return "redirect:/board/list" + pg.getListLink();
		
	}
	
	
}
