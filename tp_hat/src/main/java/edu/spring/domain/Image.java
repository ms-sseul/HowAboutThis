package edu.spring.domain;

public class Image {
	
	private int pno;		// 프로젝트 번호
	private int ino;		// 이미지 번호
	private String image;	// 이미지
	
	public Image() {}

	public Image(int pno, int ino, String image) {
		super();
		this.pno = pno;
		this.ino = ino;
		this.image = image;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getIno() {
		return ino;
	}

	public void setIno(int ino) {
		this.ino = ino;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Image [pno=" + pno + ", ino=" + ino + ", image=" + image + "]";
	}
	
}
