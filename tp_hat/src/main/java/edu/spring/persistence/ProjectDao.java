package edu.spring.persistence;

import java.util.List;

import edu.spring.domain.Project;
public interface ProjectDao {

	int createProject(Project project); 						// 프로젝트 생성
	int deleteProject(int pno);									// 프로젝트 제거
	int updateProject(Project project);							// 프로젝트 갱신
	int updateProjectRecommendation(int increment);				// 프로젝트 추천 수 업데이트
	List<Project> selectAllProject();							// 모든 프로젝트 출력
	List<Project> selectProjectByCategory(int category);		// 카테고리별 프로젝트 출력
	List<Project> selectProjectByPopularity();					// 인기순 프로젝트 출력
	Project selectOneProject(int pno);							// 프로젝트 상세보기
	Project selectLastProject();								// 최근에 저장된 프로젝트
}
