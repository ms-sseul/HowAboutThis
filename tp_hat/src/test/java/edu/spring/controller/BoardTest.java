package edu.spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.domain.Board;
import edu.spring.service.BoardService;
import edu.spring.util.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"}
)
@WebAppConfiguration
public class BoardTest {
	
	@Autowired private BoardService boardService;
	@Test
	public void doTest() {
//		int result = insertBoard();
//		System.out.println("result =" + result);
//		List<Board> list = selectAllBoard();
//		System.out.println(list.toString());
		testCreate();
	}
	private int insertBoard() {
		int result = 0;
		Board board = new Board(0, "김기명", "시간이 제대로 나올까요?", "과연....", 0, 0, null);
		result = boardService.insertBoard(board);
		return result;
	}
	
	private void testCreate() {
		for (int i = 1; i <= 100; i++) {
			Board board = new Board();
			board.setTitle(i + "번째 글 제목입니다...");
			board.setContent(i + "번쨰 글 내용입니다...");
			board.setUserId("김상현" + i);
			
			boardService.insertBoard(board);
		}
	}
	
	private List<Board> selectAllBoard(Criteria criteria){
		List<Board> list = new ArrayList<Board>();
		list = boardService.selectAllBoard(criteria);
		return list;
	}
}
