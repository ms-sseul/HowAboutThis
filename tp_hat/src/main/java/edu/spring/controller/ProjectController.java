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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sun.scenario.effect.impl.prism.PrImage;

import edu.spring.domain.Image;
import edu.spring.domain.Present;
import edu.spring.domain.Project;
import edu.spring.domain.ProjectModel;
import edu.spring.persistence.PresentDao;
import edu.spring.persistence.ProjectDao;
import edu.spring.persistence.UserDao;
import edu.spring.service.ProjectService;

@Controller
@RequestMapping(value = "project")
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	private static final String[] IMAGE_ARRAY = { "/controller/resources/images/banner/banner1.png",
			"/controller/resources/images/banner/banner2.png", "/controller/resources/images/banner/banner3.png",
			"/controller/resources/images/banner/banner4.png", "/controller/resources/images/banner/banner5.png"};
	@Autowired
	private ProjectService projectService;
	@Autowired
	private UserDao userDao;
	@Autowired private ProjectDao projectDao;
	@Autowired private PresentDao presentDao; 

	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createProject() {
		logger.info("createProject(GET) Call");
		return "/project/create";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String createPostProject(String targetDate, Project project, MultipartFile[] uploadFiles,
			HttpServletRequest req, Model model) throws Exception {
		List<Image> images = new ArrayList<>();
//		List<Present> presents = new ArrayList<>();

		logger.info("createProject(POST) Call");

		String[] dateArray = targetDate.split("-");
		LocalDate ld = LocalDate.of(Integer.parseInt(dateArray[0]), Integer.parseInt(dateArray[1]),
				Integer.parseInt(dateArray[2]));
		Date date = Date.from(ld.atStartOfDay(ZoneId.systemDefault()).toInstant());
		logger.info("date = {} ", date.toString());

		project.setUserId((String) req.getSession().getAttribute("loginId"));
		project.setTargetTime(date);

//		presents.add(present);
		// TODO : 파일 업로드
//		if(uploadFiles.length!=0) {
//			for(MultipartFile m : uploadFiles) {
//				System.out.println("이름 : " + m.getName());
//				String fileName = m.getOriginalFilename();
//				String filePath = "C:/images/" + fileName;
//				Image i = new Image(0, 0, filePath);
//				images.add(i);
//				System.out.println("filePath : " + filePath);
//				m.transferTo(new File(filePath));	
//			}
//		}
		int result = projectService.insertProject(project, images);
		int pno = projectDao.selectLastProject().getPno();
		logger.info("pno = {}" , pno);
		model.addAttribute("insertProjectResult", result);
		model.addAttribute("pno", pno);
		return "project/create-reward";
	}

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String projectMain(Model model, HttpServletRequest req, RedirectAttributes rttr) {
		projectDao.updateFinishedProject();
		// 메인 배너 이미지
		List<Image> bannerImageList = new ArrayList<>();
		for (int i = 0; i < 5; i++) {
			bannerImageList.add(new Image(3, 1, IMAGE_ARRAY[i]));
		}
		model.addAttribute("bannerImageList", bannerImageList);

		List<ProjectModel> closingTimeProjectModels = new ArrayList<>();
		// 마감임박순
		List<Project> closingTimeProject = projectService.selectClosingTimeProject();
		List<Image> closingTimeImageList = new ArrayList<>();
		for(Project p : closingTimeProject) {
			closingTimeImageList.add(projectService.selectProjectImage(p.getPno()));
		}
		for (int i = 0; i < 3; i++) {
			closingTimeProjectModels.add(new ProjectModel(closingTimeImageList.get(i), closingTimeProject.get(i)));
		}
		
		model.addAttribute("closingTimeProjects", closingTimeProjectModels);

		// 인기순
		List<ProjectModel> popularProjectModels = new ArrayList<>();
		List<Project> popularProject = projectService.selectPopularProject();
		List<Image> popularImageList = new ArrayList<>();
		for(Project p : popularProject) {
			popularImageList.add(projectService.selectProjectImage(p.getPno()));
		}
		
		for (int i = 0; i < 3; i++) {
			popularProjectModels.add(new ProjectModel(popularImageList.get(i), popularProject.get(i)));
		}
		model.addAttribute("popularProjects", popularProjectModels);

		// 최신순 프로젝트
		List<ProjectModel> lastestProjectModel = new ArrayList<>();
		List<Project> lastestProject = projectService.selectLastestProject();
		List<Image> lastestImageList = new ArrayList<>();
		// 실제 이미지 데이터 빼오는 코드 
		for(Project p :lastestProject) {
			lastestImageList.add(projectService.selectProjectImage(p.getPno()));
		}
		if (rttr.getFlashAttributes()!=null) {
			rttr.addFlashAttribute("createResult", "success");
		}

		for (int i = 0; i < 3; i++) {
			lastestProjectModel.add(new ProjectModel(lastestImageList.get(i), lastestProject.get(i)));
			logger.info("D-day({})",lastestProjectModel.get(i).getRestDay());
		}
		model.addAttribute("lastestProjects", lastestProjectModel);

		return "/web/main";
	}

	@RequestMapping(value = "description" , method = RequestMethod.GET)
	public String detailProject(int pno, Model model) {
		Project project = projectService.selectOneProject(pno);
//		List<Image> image = projectService.selectProjectImage(pno);
		Image image = projectService.selectProjectImage(pno);
		List<Image> images = projectService.selectProjectImages(pno);
		ProjectModel projectModel = new ProjectModel(image, project);
		model.addAttribute("images", images);
		model.addAttribute("projectModel", projectModel);
		return "web/description";
	}
	
	@RequestMapping(value = "theme" , method = RequestMethod.GET)
	public String projectByCategory(int category, Model model) {
		List<Project> projects = new ArrayList<>();
		List<Image> images = new ArrayList<>();
		List<ProjectModel> projectModels = new ArrayList<>();
		List<Image> bannerImageList = new ArrayList<>();
		for (int i = 0; i < 5; i++) {
			bannerImageList.add(new Image(3, 1, IMAGE_ARRAY[i]));
		}
		model.addAttribute("bannerImageList", bannerImageList);
		model.addAttribute("option", "not null");
		if(category >=1 && category <=6) {
			projects = projectService.selectProjectByCategory(category);
		}	else  {
			projects = projectService.selectAllProject();
		}
		for(Project p : projects) {
			images.add(projectService.selectProjectImage(p.getPno()));
		}
		for(int i = 0; i < projects.size() ;i++) {
			projectModels.add(new ProjectModel(images.get(i),projects.get(i)));
		}
		model.addAttribute("projectModels", projectModels);
		switch (category) {
		case 0:
			model.addAttribute("categoryName", "전체 프로젝트");
		case 1:
			model.addAttribute("categoryName", "테크 & 가전");
			break;
		case 2:
			model.addAttribute("categoryName", "패션");
			break;
		case 3:
			model.addAttribute("categoryName", "디자인");
			break;
		case 4:
			model.addAttribute("categoryName", "반려동물");
			break;
		case 5:
			model.addAttribute("categoryName", "취미");
			break;
		case 6:
			model.addAttribute("categoryName", "소셜");
			break;
		default:
			model.addAttribute("categoryName", "전체보기");
			break;
		}
		return "web/main";
	}
	
	
	@RequestMapping(value= "rewards" , method=RequestMethod.GET)
	public String rewardProject(HttpServletRequest req, int pno, Model model) {
		List<Present> rewards = projectService.selectProjectPresents(pno);
		Project project = projectService.selectOneProject(pno);
		String userId = (String)req.getSession().getAttribute("loginId");
		
		
		model.addAttribute("userPoint", userDao.selectOne(userId).getPoint());
		model.addAttribute("rewards", rewards);
		model.addAttribute("projectTitle", project.getTitle());
		model.addAttribute("pno", pno);
		
		return "project/rewards";
	}
	
	@RequestMapping(value = "rewards", method = RequestMethod.POST)
	public String confirmSupportProject(int pno, int supportAmount, Model model, HttpServletRequest request, RedirectAttributes rttr) {
		model.addAttribute("result", "result");
		logger.info("pno = {}",pno);
		logger.info("supportAmount = {}" , supportAmount);
		projectService.updateProjectCurrentAmount(pno, supportAmount);
		userDao.updateSupportPoint((String)request.getSession().getAttribute("loginId"), supportAmount);
		rttr.addFlashAttribute("result", "success");
		
		
		return "redirect:../project/description?pno=" + pno;
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String searchProject(String keyword, Model model) {
		List<Image> bannerImageList = new ArrayList<>();
		for (int i = 0; i < 5; i++) {
			bannerImageList.add(new Image(3, 1, IMAGE_ARRAY[i]));
		}
		model.addAttribute("bannerImageList", bannerImageList);
		List<Project> projects = projectService.selectSearchProject(keyword);
		List<Image> images = new ArrayList<>();
		List<ProjectModel> projectModels = new ArrayList<>();
		logger.info("keyword : {}" , keyword);
		model.addAttribute("option", "not null");
		for(Project p:projects) {
			images.add(projectService.selectProjectImage(p.getPno()));
		}
		
		for(int i =0 ; i <projects.size(); i++) {
			projectModels.add(new ProjectModel(images.get(i), projects.get(i)));
			logger.info("pno : {}",projectModels.get(i).getPno());
		}
		model.addAttribute("projectModels", projectModels);

		
		return "web/main";
	}
	@RequestMapping(value = "createReward", method = RequestMethod.POST)
	public String createRewards(Integer[] amount, Integer[] step, String[] component, int pno, RedirectAttributes rttr) {
		List<Present> presents = new ArrayList<>();
		for(int i = 0; i < step.length; i++) {
			if(!component[i].equals("")) {
				presents.add(new Present(pno, step[i], component[i], amount[i]));
			}
		}
		presentDao.createPresent(presents);
		rttr.addFlashAttribute("createResult", "success");
		return "redirect:main";
	}
}
