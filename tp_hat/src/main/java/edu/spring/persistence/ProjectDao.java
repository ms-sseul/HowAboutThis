package edu.spring.persistence;

import java.util.List;

import edu.spring.domain.Project;
public interface ProjectDao {

	int createProject(Project project); 						// 프로젝트 생성
	int deleteProject(int pno);									// 프로젝트 제거
	int updateProject(Project project);							// 프로젝트 갱신
	int updateProjectCurrentAmount(int pno, int suppotyAmount);	// 프로젝트 모금금액 업데이트
	int updateProjectReadCnt();									// 프로젝트 조회수 증가 
	List<Project> selectAllProject();							// 모든 프로젝트 출력
	List<Project> selectProjectByCategory(int category);		// 카테고리별 프로젝트 출력
	List<Project> selectProjectByPopularity();					// 인기순 프로젝트 출력
	Project selectOneProject(int pno);							// 프로젝트 상세보기
	Project selectLastProject();								// 가장 최근에 저장된 프로젝트
	List<Project> selectLastestProject();						// 최근 생성된 프로젝트 3개
	List<Project> selectClosingTimeProject();					// 마감순 프로젝트 
	int updateFinishedProject();								// 목표시간이 지난 프로젝트 종요여부 갱신
}
