package edu.spring.controller;

import java.io.File;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import edu.spring.domain.Image;
import edu.spring.domain.Present;
import edu.spring.domain.Project;
import edu.spring.domain.ProjectModel;
import edu.spring.service.ProjectService;

@Controller
@RequestMapping(value ="project")
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired private ProjectService projectService;
	
	@RequestMapping(value = "/create" , method = RequestMethod.GET )
	public String createProject() {
		logger.info("createProject(GET) Call");
		return "/project/create";
	}
	
	@RequestMapping(value = "/create" , method = RequestMethod.POST)
	public String createPostProject(String targetDate,Project project, MultipartFile[] uploadFiles, Present present, HttpServletRequest req) 
			throws Exception{
		List<Image> images = new ArrayList<>();
		List<Present> presents = new ArrayList<>();
		
		logger.info("createProject(POST) Call");
		
		String[] dateArray = targetDate.split("-");
		LocalDate ld = LocalDate.of(Integer.parseInt(dateArray[0]), Integer.parseInt(dateArray[1]), Integer.parseInt(dateArray[2]));
		Date date = Date.from(ld.atStartOfDay(ZoneId.systemDefault()).toInstant());
		logger.info("date = {} " , date.toString());

		
		project.setUserId((String)req.getSession().getAttribute("loginId"));
		project.setTargetTime(date);
		
		presents.add(present);
//		if(uploadFiles.length!=0) {
//		for(MultipartFile m : uploadFiles) {
//				System.out.println("이름 : " + m.getName());
//				String fileName = m.getOriginalFilename();
//				String filePath = "C:/images/" + fileName;
//				Image i = new Image(0, 0, filePath);
//				images.add(i);
//				System.out.println("filePath : " + filePath);
//				m.transferTo(new File(filePath));	
//			}
//		}
		projectService.insertProject(project, images, presents);
		return "redirect:../web/main";
	}
	
	@RequestMapping(value = "main" , method = RequestMethod.GET)
	public String projectMain(Model model, HttpServletRequest req) {
		// 메인 배너 이미지
		List<Image> bannerImageList = new ArrayList<>();
		bannerImageList.add(new Image(1, 1, "/controller/resources/images/dummy1.jpg"));
		bannerImageList.add(new Image(2, 1, "/controller/resources/images/dummy2.jpg"));		
		bannerImageList.add(new Image(3, 1, "/controller/resources/images/dummy3.jpg"));	
		model.addAttribute("bannerImageList", bannerImageList);
		
		
		List<ProjectModel> closingTimeProjectModels = new ArrayList<>();
		// 마감임박순 
		List<Project> closingTimeProject = projectService.selectClosingTimeProject();
		List<Image> closingTimeImageList = new ArrayList<>();
		closingTimeImageList.add(new Image(4, 1, "/controller/resources/images/dummy4.jpg"));
		closingTimeImageList.add(new Image(5, 1, "/controller/resources/images/dummy5.jpg"));
		closingTimeImageList.add(new Image(6, 1, "/controller/resources/images/dummy6.jpg"));
		for(int i = 0 ; i <3 ; i++) {
			closingTimeProjectModels.add(new ProjectModel(closingTimeImageList.get(i), closingTimeProject.get(i)));
		}
		logger.info(closingTimeProjectModels.get(0).getTitle());
		logger.info(closingTimeProjectModels.get(1).getTitle());
		logger.info(closingTimeProjectModels.get(2).getTitle());
		model.addAttribute("closingTimeProjects", closingTimeProjectModels);
		
		// 인기순
		List<ProjectModel> popularProjectModels = new ArrayList<>();
		List<Project> popularProject = projectService.selectPopularProject();
		List<Image> popularImageList = new ArrayList<>();
		popularImageList.add(new Image(7, 1, "/controller/resources/images/dummy7.jpg"));
		popularImageList.add(new Image(8, 1, "/controller/resources/images/dummy8.jpg"));
		popularImageList.add(new Image(9, 1, "/controller/resources/images/dummy9.jpg"));
		for(int i = 0; i<3 ; i ++) {
			popularProjectModels.add(new ProjectModel(popularImageList.get(i), popularProject.get(i)));
		}
		model.addAttribute("popularProjects", popularProjectModels);
		
		//최신순 프로젝트 
		List<ProjectModel> lastestProjectModel = new ArrayList<>();
		List<Project> lastestProject = projectService.selectLastestProject();
		List<Image> lastestImageList = new ArrayList<>();
//		for(Project p :lastestProject) {
//			Image image = projectService.selectProjectImage(p.getPno());
//			lastestImageList.add(image.getImage());
//		}

		lastestImageList.add(new Image(10, 1, "/controller/resources/images/dummy10.jpg"));
		lastestImageList.add(new Image(11, 1, "/controller/resources/images/dummy11.jpg"));
		lastestImageList.add(new Image(12, 1, "/controller/resources/images/dummy12.jpg"));
		for(int i = 0; i <3 ; i ++) {
			lastestProjectModel.add(new ProjectModel(lastestImageList.get(i),lastestProject.get(i)));
		}
		model.addAttribute("lastestProjects", lastestProjectModel);
		
		return "/web/main";
	}
}
