package com.spring.board.vo;

public class BoardVo {
	public BoardVo() {

	}

	private String boardType;
	private Integer boardNum;
	private String boardTitle;
	private String boardComment;
	private String creator;
	private String modifier;
	private int totalCnt;

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public Integer getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(Integer boardNum) {
		this.boardNum = boardNum;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardComment() {
		return boardComment;
	}

	public void setBoardComment(String boardComment) {
		this.boardComment = boardComment;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	@Override
	public String toString() {
		return "BoardVo [boardType=" + boardType + ", boardNum=" + boardNum + ", boardTitle=" + boardTitle
				+ ", boardComment=" + boardComment + ", creator=" + creator + ", modifier=" + modifier + ", totalCnt="
				+ totalCnt + "]";
	}

	public BoardVo(String boardType, Integer boardNum, String boardTitle, String boardComment, String creator,
			String modifier, int totalCnt) {
		super();
		this.boardType = boardType;
		this.boardNum = boardNum;
		this.boardTitle = boardTitle;
		this.boardComment = boardComment;
		this.creator = creator;
		this.modifier = modifier;
		this.totalCnt = totalCnt;
	}

}
