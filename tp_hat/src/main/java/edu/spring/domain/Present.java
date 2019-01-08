package edu.spring.domain;

public class Present {
	
	private int pno;			// 선물 번호
	private int step;			// 선물 단계
	private String component;	// 구성품
	private String amount;      // 가격
	
	public Present() {}


	public Present(int pno, int step, String component, String amount) {
		this.pno = pno;
		this.step = step;
		this.component = component;
		this.amount = amount;
	}


	public String getAmount() {
		return amount;
	}


	public void setAmount(String amount) {
		this.amount = amount;
	}


	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public String getComponent() {
		return component;
	}

	public void setComponent(String component) {
		this.component = component;
	}


	@Override
	public String toString() {
		return "Present [pno=" + pno + ", step=" + step + ", component=" + component + ", amount=" + amount + "]";
	}

	
	
}
