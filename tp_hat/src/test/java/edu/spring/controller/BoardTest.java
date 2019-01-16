package edu.spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import edu.spring.domain.Board;
import edu.spring.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
)
public class BoardTest {
	
	@Autowired private BoardService boardService;
	@Test
	public void doTest() {
		int result = insertBoard();
		System.out.println("result =" + result);
//		List<Board> list = selectAllBoard();
//		System.out.println(list.toString());
	}
	private int insertBoard() {
		int result = 0;
		Board board = new Board(0, "김기명", "시간이 제대로 나올까요?", "과연....", 0, 0, null);
		result = boardService.insertBoard(board);
		return result;
	}
	
	private List<Board> selectAllBoard(){
		List<Board> list = new ArrayList<Board>();
		list = boardService.selectAllBoard();
		return list;
	}
}
