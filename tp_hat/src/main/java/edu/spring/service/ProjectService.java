package edu.spring.service;

import java.util.List;

import edu.spring.domain.Image;
import edu.spring.domain.Present;
import edu.spring.domain.Project;

public interface ProjectService {

	int insertProject(Project project, List<Image> images, List<Present> presents);
	List<Project> selectAllProject();				// 전체 프로젝트 
	List<Project> selectSearchProject(String keyword); // 검색어에 해당하는 프로젝트 출력
	List<Project> selectProjectByCategory(int category);	// 카테고리 별 프로젝트 출력
	List<Project> selectPopularProject();			// 인기순
	List<Project> selectClosingTimeProject(); 		// 마감임박 순
	List<Project> selectLastestProject(); 			// 최근 순
	Project selectOneProject(int pno);				// 프로젝트 상세보기
	Image selectProjectImage(int pno);				// 썸네일 이미지
	List<Image> selectProjectImages(int pno);		// 해당 프로젝트 전체 이미지
	List<Present> selectProjectPresents(int pno);	// 해당 프로젝트 전체 리워드
	int deleteProject(int pno);							// 해당 프로젝트 삭제
	int updateProject(Project project);							// 해당 프로젝트 수정
	int updatePresents(List<Present> presents);	// 해당 프로젝트의 리워드 수정
	int updateImages(List<Image> images);		// 해당 프로젝트 이미지 수정
	int updateProjectCurrentAmount(int pno, int supportAmount);  // 유저가 후원 금액만큼 프로젝트의 현재 모금 금액을 갱신
	
	
	
	
}
