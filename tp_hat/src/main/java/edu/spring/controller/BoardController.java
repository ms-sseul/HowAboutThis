package edu.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.domain.Board;
import edu.spring.service.BoardService;

@Controller
@RequestMapping(value = "board")
public class BoardController {
	@Autowired private BoardService boardService;
	
	// 게시판 list
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void list(Model model) {
		List<Board> boardlist = boardService.selectAllBoard();
		model.addAttribute("boardList", boardlist);
	}
	
	// 게시글 상세보기
	@RequestMapping(value = "detail")
	public void detail(int bno, Model model) {
		Board board = boardService.selectOneBoard(bno);
		model.addAttribute("board", board);
	}
	
	// 게시글 쓰기
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public void insert() {
		System.out.println("insert() call");
//		return "redirect:insert";
	}
	
	// 게시글 쓰기
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insertPost(Board board) {
		boardService.insertBoard(board);
		return "redirect:list";
	}
}
