package com.spring.board.service;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;

public interface boardService {

	public String selectTest() throws Exception;

	public List<BoardVo> selectBoardList(PageVo pageVo, String codeId) throws Exception;

	public BoardVo selectBoard(String boardType, int boardNum) throws Exception;

	public int selectBoardCnt(PageVo pageVo) throws Exception;

	public int boardInsert(BoardVo boardVo) throws Exception;

	public int boardUpdate(BoardVo boardVo) throws Exception;

	public int boardDelete(BoardVo boardVo) throws Exception;

	public int numberDividedPages(int totalCnt, PageVo pageVo) throws Exception;

	public int idCheckDuplicatesAction(String userId) throws Exception;

}
