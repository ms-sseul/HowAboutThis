package edu.spring.service;

import java.util.List;

import edu.spring.domain.Image;
import edu.spring.domain.Present;
import edu.spring.domain.Project;

public interface ProjectService {

	int insertProject(Project project, List<Image> images, List<Present> presents);
	List<Project> selectPopularProject();
	Image selectProjectImage(int pno);
	List<Project> selectClosingTimeProject();
	
	
}
