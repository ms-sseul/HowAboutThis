package edu.spring.domain;

import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ProjectModel extends Project {
	private static final Logger logger = LoggerFactory.getLogger(ProjectModel.class);
	private Image image;
	private float percent;
	private int restDay;
	
	
	public int getRestDay() {
		return restDay;
	}

	public void setRestDay(int restDay) {
		this.restDay = restDay;
	}

	public float getPercent() {
		return percent;
	}

	public void setPercent(float percent) {
		this.percent = percent;
	}

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
	}

	public ProjectModel(Image image, Project project) {
		super(project.getPno(), project.getTitle(), project.getContent(), 
				project.getRecommendation(), project.getCategory(), project.getCurrentAmount(), 
				project.getTargetAmount(), project.getUserId(), project.getTargetTime(), 
				project.getRegTime(), project.getReadCnt(), project.getReplyCnt(), 
				project.getFinished());
		this.image = image;
		this.percent = Float.parseFloat(String.format("%.2f", Float.parseFloat(String.valueOf(project.getCurrentAmount())) / project.getTargetAmount()));
//		this.restDay = -Period.between(LocalDate.now(), LocalDate.ofInstant(project.getTargetTime().toInstant(), ZoneId.systemDefault())).getDays();
		this.restDay = new Date().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getDayOfYear()-project.getTargetTime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getDayOfYear();
				
				/*new Date().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().
				compareTo(project.getTargetTime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate());*/
		logger.info("restDay = {}" ,restDay);
	}
	
	public ProjectModel() {}
}
