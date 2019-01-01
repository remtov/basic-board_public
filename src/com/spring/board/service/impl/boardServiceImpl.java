package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;

@Service
public class boardServiceImpl implements boardService {

	@Autowired
	BoardDao boardDao;

	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectTest();
	}

	@Override
	public List<BoardVo> selectBoardList(PageVo pageVo, String codeId) throws Exception {
		System.out.println("서비스codeId??" + codeId);
		System.out.println("서비스pageVo??" + pageVo);
		if (codeId == null || codeId == "") {
			System.out.println("서비스:pageVo에 codeId로 들어간 값이 없습니다.");
			
		} else {
			String[] codeIdArray = codeId.split(",");
			for (int i = 0; i < codeIdArray.length; i++) {
				if (i == 0) {
					pageVo.setCodeId01(codeIdArray[i]);
					System.out.println("서비스:pageVo의 codeId01에 값이 들어갔습니다.");
				}
				if (i == 1) {
					pageVo.setCodeId02(codeIdArray[i]);
					System.out.println("서비스:pageVo의 codeId02에 값이 들어갔습니다.");
				}
				if (i == 2) {
					pageVo.setCodeId03(codeIdArray[i]);
					System.out.println("서비스:pageVo의 codeId03에 값이 들어갔습니다.");
				}
				if (i == 3) {
					pageVo.setCodeId04(codeIdArray[i]);
					System.out.println("서비스:pageVo의 codeId04에 값이 들어갔습니다.");
				}
			}

			System.out.println("서비스에서 코드아이디 넣은 후의 pageVo??" + pageVo);
		}

		return boardDao.selectBoardList(pageVo);
	}

	@Override
	public int selectBoardCnt(PageVo pageVo) throws Exception {
		// 보트의 숫자를 세는 로직 추가할 것
		return boardDao.selectBoardCnt(pageVo);
	}
	
	

	@Override
	public BoardVo selectBoard(String boardType, int boardNum) throws Exception {

		BoardVo boardVo = new BoardVo();

		boardVo.setBoardType(boardType);
		boardVo.setBoardNum(boardNum);

		return boardDao.selectBoard(boardVo);
	}

	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		System.out.println("service-write_boardVo?--" + boardVo);
		return boardDao.boardInsert(boardVo);

	}

	@Override
	public int boardUpdate(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.boardUpdate(boardVo);
	}

	@Override
	public int boardDelete(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.boardDelete(boardVo);
	}

	@Override
	public int numberDividedPages(int totalCnt, PageVo pageVo) {
		int page = (totalCnt / 10)+1;
		pageVo.setPageNo(page);
		System.out.println("서비스:10개씩끊어서 페이징한 갯수는??" + page);
		return page;
	}

	@Override
	public int idCheckDuplicatesAction(String userId) throws Exception {
		return boardDao.idCheckDuplicatesAction(userId);

		
	}




}
