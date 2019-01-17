package edu.spring.domain;

import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.Date;

public class ProjectModel extends Project {
	private Image image;
	private float percent;
	private int restDay;
	
	
	public long getRestDay() {
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
		super(project.getPno(), project.getTitle(), project.getContent(), project.getRecommendation(), project.getCategory(), project.getCurrentAmount(), project.getTargetAmount(), project.getUserId(), project.getTargetTime(), project.getRegTime(), project.getReadCnt(), project.getReplyCnt(), project.getFinished());
		this.image = image;
		this.percent = Float.parseFloat(String.format("%.2f", Float.parseFloat(String.valueOf(project.getCurrentAmount())) / project.getTargetAmount()));
		this.restDay = Period.between(LocalDate.now(), LocalDate.ofInstant(project.getTargetTime().toInstant(), ZoneId.systemDefault())).getDays();
	}
	
	public ProjectModel() {}
}
