package edu.spring.util;

// 페이징처리를 도와줄 클래스
public class Criteria {
	
	private int page;			// 현재 페이지 번호
	private int perPageNum;		// 페이지 당 출력되는 게시글의 갯수
	
	public Criteria() {			// 기본생성자, 현재페이지를 1, 페이지당 출력할 게시글의 갯수를 10으로 기본 셋팅
		this.page = 1;			
		this.perPageNum = 10;	
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if(perPageNum <=0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	

} // end class Criteria
