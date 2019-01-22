package edu.spring.service;

import java.util.List;

import org.aspectj.runtime.internal.PerObjectMap;
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
import edu.spring.persistence.UserDao;

@Service
public class ProjectServiceImple implements ProjectService {
	private static final Logger logger = LoggerFactory.getLogger(ProjectServiceImple.class);
	@Autowired private ProjectDao projectDao;
	@Autowired private ImageDao imageDao;
	@Autowired private PresentDao presentDao;
	@Autowired private UserDao userDao;
	
	@Override
	public int insertProject(Project project, List<Image> images) {
		int result = projectDao.createProject(project);
		logger.info("result = {}" , result);
		project = projectDao.selectLastProject();
		logger.info("pno = {}", project.getPno() );
		for(Image i : images) {
			i.setPno(project.getPno());
			result +=imageDao.createImage(i);
			logger.info("result = {}" , result);
		}
		return result;
	}

	@Override
	public List<Project> selectPopularProject() {
		return projectDao.selectProjectByPopularity();
	}

	@Override
	public Image selectProjectImage(int pno) {
		return imageDao.selectOneImage(pno);
	}

	@Override
	public List<Project> selectClosingTimeProject() {
		return projectDao.selectClosingTimeProject();
	}

	@Override
	public List<Project> selectAllProject() {
		return projectDao.selectAllProject();
	}

	@Override
	public List<Project> selectSearchProject(String keyword) {
		return projectDao.SelectProjectByKeyword(keyword);
	}

	@Override
	public List<Project> selectLastestProject() {
		return projectDao.selectLastestProject();
	}

	@Override
	public Project selectOneProject(int pno) {
		projectDao.updateProjectReadCnt();
		return projectDao.selectOneProject(pno);
	}

	@Override
	public List<Image> selectProjectImages(int pno) {
		return imageDao.selectImage(pno);
	}

	@Override
	public List<Present> selectProjectPresents(int pno) {
		return presentDao.selectPresent(pno);
	}

	@Override
	public int deleteProject(int pno) {
		return projectDao.deleteProject(pno);
	}

	@Override
	public int updateProject(Project project) {
		return projectDao.updateProject(project);
	}

	@Override
	public int updatePresents(List<Present> presents) {
		int result = 0;	
		for(Present p : presents) {
			result += presentDao.updatePresent(p);
		}		
		return result;
	}

	@Override
	public int updateImages(List<Image> images) {
		int result = 0;
		for(Image i : images) {
			result += imageDao.updateImage(i);
		}
		return result;
	}

	@Override
	public List<Project> selectProjectByCategory(int category) {
		return projectDao.selectProjectByCategory(category);
	}


	@Override
	public int updateProjectCurrentAmount(int pno, int supportAmount) {
		int result = 0;
		
		projectDao.updateProjectCurrentAmount(pno, supportAmount);
		
		return result;
	}

	
	
	

}
