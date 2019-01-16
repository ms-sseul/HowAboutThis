package edu.spring.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import edu.spring.domain.Image;
import edu.spring.domain.Present;
import edu.spring.domain.Project;
import edu.spring.service.ProjectService;

@Controller
@RequestMapping(value ="project")
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired private ProjectService projectService;
	
	@RequestMapping(value = "/create" , method = RequestMethod.GET )
	public String createProject() {
		
		return "/project/create";
	}
	
	@RequestMapping(value = "/create" , method = RequestMethod.POST)
	public String createPostProject(Project project, MultipartFile[] uploadFiles, List<Present> presents) throws Exception{
		List<Image> images = new ArrayList<>();
		for(MultipartFile m : uploadFiles) {
			if(!m.isEmpty()) {
				System.out.println("이름 : " + m.getName());
				String fileName = m.getOriginalFilename();
				String filePath = "C:/images/" + fileName;
				Image i = new Image(0, 0, filePath);
				images.add(i);
				System.out.println("filePath : " + filePath);
				m.transferTo(new File(filePath));	
			}
		}
		projectService.insertProject(project, images, presents);
		return "main";
	}
}
