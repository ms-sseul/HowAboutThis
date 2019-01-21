package edu.spring.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.domain.Board;
import edu.spring.persistence.BoardDao;
import edu.spring.controller.BoardController;
import edu.spring.service.BoardService;
import edu.spring.service.BoardServiceImple;
import edu.spring.util.Criteria;
import edu.spring.util.PageMaker;

@Controller
@RequestMapping(value = "board")
public class BoardController {
	private final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired private BoardService boardService;
	@Autowired private BoardDao boardDao;
	// 게시판 list
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void list(Model model, Criteria criteria) {
		logger.info("list() 호출");
		logger.info("criteria = ({})", criteria);
		/*logger.info("searchType =({})", searchType);
		logger.info("keyWord = ({})", keyWord);*/
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countBoard(criteria));
		
		List<Board> boardlist = boardService.selectAllBoard(criteria);
		
		logger.info("boardlist = ({})", boardlist);
		model.addAttribute("boardList", boardlist);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "listSearch" , method = RequestMethod.GET)
	public void listSearch(Integer searchType, String keyWord, Model model, Criteria criteria) {
		// logger.info("queryString({})", queryString);
		logger.info("listSearch() 호출");
		logger.info("searchType({}) 호출", searchType);
		logger.info("keyWord({}) 호출", keyWord);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countSelectedBoard(searchType, keyWord, criteria));
		List<Board> boardlist = boardService.searchByKeyword(searchType, keyWord, criteria); 
		logger.info("boardList = ({})", boardlist);
		
		logger.info("pageMaker = ({})", pageMaker);
		model.addAttribute("boardList", boardlist);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("searchType", searchType);
		// model.addAttribute("queryString", queryString);
		
	}
	
	// 게시글 상세보기
	@RequestMapping(value = "detail")
	public void detail(@RequestParam int bno, Model model, @ModelAttribute Criteria criteria) {
		logger.info("detail(bno={}) 호출", bno);
		boardDao.updateBoardReadCnt(bno);
		Board board = boardService.selectOneBoard(bno);
		model.addAttribute("board", board);
	}
	
	@RequestMapping(value = "detailSearch")
	public void detailSearch(@RequestParam int bno, Model model, @ModelAttribute Criteria criteria, Integer searchType, String keyWord) {
		logger.info("detail(bno={}) 호출", bno);
		Board board = boardService.selectOneBoard(bno);
		model.addAttribute("board", board);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("searchType", searchType);
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
		logger.info("insert(board) POST 호출");
		boardService.insertBoard(board);
		
		return "redirect:list";
	}
	
	// 게시글 수정
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public void update(int bno, Model model) {
		logger.info("update(bno={}) GET 호출", bno);
		Board board = boardService.selectOneBoard(bno);
		model.addAttribute("board", board);
	}
	
	// 게시글 수정
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(Board board, RedirectAttributes reAttrs) {
		logger.info("update({}) POST 호출", board.toString());
		
		int result = boardService.updateBoard(board);
		logger.info("게시글 수정 결과: {}", result);
		
		if (result == 1) {
			reAttrs.addFlashAttribute("updateResult", "success");
		}
		return "redirect:list";
	}
	
	
	// 게시글 삭제
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int bno, RedirectAttributes reAttrs) {
		logger.info("delete(bno={})", bno);
		
		int result = boardService.deleteBoard(bno);
		if (result == 1) {
			reAttrs.addFlashAttribute("deleteResult", "success");
			reAttrs.addFlashAttribute("deleteBno", bno);
		}
		
		return "redirect:list";
	}
	
}
