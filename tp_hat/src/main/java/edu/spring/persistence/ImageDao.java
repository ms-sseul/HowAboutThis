package edu.spring.persistence;

import java.util.List;

import edu.spring.domain.Image;

public interface ImageDao {

	int createImage(Image image);			// 이미지 생성
	int updateImage(Image image);			// 이미지 수정
	int deleteImage(int ino);				// 이미지 제거
	List<Image> selectImage(int pno);		// 해당 프로젝트 이미지 출력
	Image selectOneImage(int pno);			// 메인 화면에 보여질 이미지 한개만 출력
}
