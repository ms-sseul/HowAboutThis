package edu.spring.persistence;

import java.util.List;

import edu.spring.domain.Present;

public interface PresentDao {

	int createPresent(List<Present> present);		// 리워드 생성
	int updatePresent(Present present);		// 리워드 갱신
	int deletePresent(int pno);				// 리워드 제거
	List<Present> selectPresent(int pno);	// 해당 프로젝트 리워드 출력
}
