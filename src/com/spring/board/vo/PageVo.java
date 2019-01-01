package com.spring.board.vo;

public class PageVo {

	private Integer pageNo = 0;
	private String codeId01;
	private String codeId02;
	private String codeId03;
	private String codeId04;

	public PageVo() {

	}

	@Override
	public String toString() {
		return "PageVo [pageNo=" + pageNo + ", codeId01=" + codeId01 + ", codeId02=" + codeId02 + ", codeId03="
				+ codeId03 + ", codeId04=" + codeId04 + "]";
	}

	public PageVo(Integer pageNo, String codeId01, String codeId02, String codeId03, String codeId04) {
		super();
		this.pageNo = pageNo;
		this.codeId01 = codeId01;
		this.codeId02 = codeId02;
		this.codeId03 = codeId03;
		this.codeId04 = codeId04;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public String getCodeId01() {
		return codeId01;
	}

	public void setCodeId01(String codeId01) {
		this.codeId01 = codeId01;
	}

	public String getCodeId02() {
		return codeId02;
	}

	public void setCodeId02(String codeId02) {
		this.codeId02 = codeId02;
	}

	public String getCodeId03() {
		return codeId03;
	}

	public void setCodeId03(String codeId03) {
		this.codeId03 = codeId03;
	}

	public String getCodeId04() {
		return codeId04;
	}

	public void setCodeId04(String codeId04) {
		this.codeId04 = codeId04;
	}

}
