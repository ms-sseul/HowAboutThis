package edu.spring.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.domain.Image;
import edu.spring.domain.Present;
import edu.spring.domain.Project;
import edu.spring.persistence.ImageDao;
import edu.spring.persistence.PresentDao;
import edu.spring.persistence.ProjectDao;

@Service
public class ProjectServiceImple implements ProjectService {
	private static final Logger logger = LoggerFactory.getLogger(ProjectServiceImple.class);
	@Autowired private ProjectDao projectDao;
	@Autowired private ImageDao imageDao;
	@Autowired private PresentDao presentDao;
	
	@Override
	public int insertProject(Project project, List<Image> images, List<Present> presents) {
		int result = projectDao.createProject(project);
		logger.info("result = {}" , result);
		project = projectDao.selectLastProject();
		for(Image i : images) {
			i.setPno(project.getPno());
			imageDao.createImage(i);
			result += 1;
			logger.info("result = {}" , result);
		}
		for(Present p : presents) {
			p.setPno(project.getPno());
			presentDao.createPresent(p);
			result += 1;
			logger.info("result = {}" , result);
		}
		return result;
	}

	@Override
	public List<Project> selectPopularProject() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Image selectProjectImage(int pno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Project> selectClosingTimeProject() {
		// TODO Auto-generated method stub
		return null;
	}

}
