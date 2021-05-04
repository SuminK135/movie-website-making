package com.er.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.er.domain.BoardVO;
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
		log.info("list: " + pg);
		
		model.addAttribute("list", service.getList(pg));
	}
	
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info("register: " + board);
		
		service.register(board);
		
		rttr.addFlashAttribute("result", board.getSeq());
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("seq") int seq, Model model) {
		
		log.info("/get");
		
		//Hit Count
		service.viewHitUpadate(seq);
		
		model.addAttribute("board", service.get(seq));
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("seq") int seq, Model model) {
		
		log.info("/modify");
		
		model.addAttribute("board", service.get(seq));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		
		log.info("modify..... " + board);
		
		//System.out.println("확인1: " + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
			//System.out.println("확인2");
		}
		
		//System.out.println("확인3: " + service.modify(board));
		
		return "redirect:/board/get?seq=" + board.getSeq();
	}
	
	@GetMapping("/remove")
	public void remove(@RequestParam("seq") int seq, Model model) {
		
		log.info("/remove");
		
		model.addAttribute("board", service.get(seq));
	}
	
	@PostMapping("/remove")
	public String remove(BoardVO board, RedirectAttributes rttr) {
		
		log.info("remove....." + board);
		
		if(service.remove(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
		
	}
	
	
}
