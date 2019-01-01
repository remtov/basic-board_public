package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.service.ComCodeService;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {

	@Autowired
	private boardService boardService;

	@Autowired
	private ComCodeService comCodeService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model, PageVo pageVo, String codeId) throws Exception {

		List<BoardVo> boardList = new ArrayList<BoardVo>();
		List<ComCodeVo> comCodeList = new ArrayList<ComCodeVo>();

		int page = 1;
		int totalCnt = 0;
		System.out.println("컨트롤러:pageVo-getPageNo??" + pageVo.getPageNo());

		if (pageVo.getPageNo() == 0) {
			pageVo.setPageNo(page);
		}
		System.out.println("파라미터받은codeId???" + codeId);
		System.out.println("파라미터받은pageVo???" + pageVo);

		boardList = boardService.selectBoardList(pageVo, codeId);
		totalCnt = boardService.selectBoardCnt(pageVo);
		page = boardService.numberDividedPages(totalCnt, pageVo);
		String comCodeType="menu";
		comCodeList = comCodeService.selectComCodeList(comCodeType);

		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);
		model.addAttribute("comCodeList", comCodeList);
		model.addAttribute("pageVo", pageVo);

		System.out.println("컨트롤러:모델 boardList??" + boardList);
		System.out.println("컨트롤러:모델 totalCnt??" + totalCnt);
		System.out.println("컨트롤러:모델 page??" + page);
		System.out.println("컨트롤러:모델 comCodeList??" + comCodeList);

		return "board/boardList";
	}

	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model, @PathVariable("boardType") String boardType,
			@PathVariable("boardNum") int boardNum) throws Exception {

		BoardVo boardVo = new BoardVo();
		List<ComCodeVo> comCodeList = new ArrayList<ComCodeVo>();

		boardVo = boardService.selectBoard(boardType, boardNum);
		String comCodeType="menu";
		comCodeList = comCodeService.selectComCodeList(comCodeType);

		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		model.addAttribute("comCodeList", comCodeList);

		System.out.println("comCodeList?" + comCodeList);

		return "board/boardView";
	}

	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardUpdateView.do", method = RequestMethod.GET)
	public String boardUpdateView(Locale locale, Model model, @PathVariable("boardType") String boardType,
			@PathVariable("boardNum") int boardNum) throws Exception {

		BoardVo boardVo = new BoardVo();
		List<ComCodeVo> comCodeList = new ArrayList<ComCodeVo>();
		String comCodeType="menu";
		comCodeList = comCodeService.selectComCodeList(comCodeType);
		boardVo = boardService.selectBoard(boardType, boardNum);

		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		model.addAttribute("comCodeList", comCodeList);
		System.out.println("comCodeList?" + comCodeList);
		return "board/boardUpdateView";
	}

	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model) throws Exception {

		List<ComCodeVo> comCodeList = new ArrayList<ComCodeVo>();
		String comCodeType="menu";
		comCodeList = comCodeService.selectComCodeList(comCodeType);
		System.out.println("모델에담기전 comCodeList?" + comCodeList);
		model.addAttribute("comCodeList", comCodeList);

		System.out.println("모델에담은 후 model" + model);

		return "board/boardWrite";
	}

	// 빈문자열이 작성이 가능한점 확인할 것
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale, BoardVo boardVo) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		System.out.println("controller-write_boardVo?--" + boardVo);
		int resultCnt = boardService.boardInsert(boardVo);
		System.out.println("컨트롤러:resultCnt???" + resultCnt);
		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

	@RequestMapping(value = "/board/updateBoard.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardUpdateAction(Locale locale, BoardVo boardVo) throws Exception {
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = boardService.boardUpdate(boardVo);
		System.out.println("컨트롤러:resultCnt???" + resultCnt);

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);
		System.out.println("컨트롤러: callbackMsg :" + callbackMsg);

		return callbackMsg;

	}

	@RequestMapping(value = "/board/boardDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardDeleteAction(Locale locale, BoardVo boardVo) throws Exception {

		System.out.println("boardVo??--" + boardVo);

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = boardService.boardDelete(boardVo);
		System.out.println("컨트롤러:resultCnt???" + resultCnt);
		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);
		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;

	}


}
