package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.service.ComCodeService;
import com.spring.board.service.boardService;
import com.spring.board.service.userInfoService;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.UserInfoVo;
import com.spring.common.CommonUtil;

@Controller
public class UserInfoController {

	@Autowired
	private boardService boardService;

	@Autowired
	private userInfoService userInfoService;

	@Autowired
	private ComCodeService comCodeService;

	@RequestMapping(value = "/userInfo/join.do", method = RequestMethod.GET)
	public String boardJoin(Locale locale, Model model) throws Exception {
		List<ComCodeVo> comCodeList = new ArrayList<ComCodeVo>();
		String comCodeType = "phone";
		comCodeList = comCodeService.selectComCodeList(comCodeType);
		System.out.println("모델에담기전 comCodeList?" + comCodeList);
		model.addAttribute("comCodeList", comCodeList);

		System.out.println("모델에담은 후 model" + model);

		return "board/join";
	}

	@RequestMapping(value = "/userInfo/joinWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String joinWriteAction(Locale locale, UserInfoVo userInfoVo) throws Exception {

		System.out.println("컨트롤러:화면에서 받은 파라메터 userInfoVo::" + userInfoVo);

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = userInfoService.userInfoInsert(userInfoVo);
		System.out.println("컨트롤러:다오찍고 돌아온 값? resultCnt::" + resultCnt);

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("컨트롤러:다오찍고 돌아온 결과 callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

	@RequestMapping(value = "/userInfo/login.do", method = RequestMethod.GET)
	public String boardLogin(Locale locale, Model model) throws Exception {

		return "board/login";
	}

	@RequestMapping(value = "/userInfo/loginAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String loginAction(UserInfoVo userInfoVo, HttpSession httpSession, Model model) throws Exception {
		System.out.println("컨트롤러:화면에서 받은 파라메터 userInfoVo::" + userInfoVo);
		HashMap<String, String> result = new HashMap<String, String>();
		UserInfoVo loginResult = null;
		String resultGetSuccess = null;
		if (httpSession.getAttribute("userlogininfo") != null) {
			httpSession.removeAttribute("userlogininfo");
		} else {
			loginResult = userInfoService.userInfoSelectloginAction(userInfoVo);
			System.out.println("컨트롤러:loginResult???" + loginResult);
			result.put("success", (loginResult != null) ? "Y" : "N");
			httpSession.setAttribute("userlogininfo", loginResult);
			resultGetSuccess = result.get("success");
			System.out.println("컨트롤러:콜백메세지-성공여부 : " + resultGetSuccess);
		}
		return resultGetSuccess;
	}

	// 로그아웃
	@RequestMapping(value = "/userInfo/logOutAction.do", method = RequestMethod.POST)
	public @ResponseBody Integer logOutAction(HttpSession httpSession) {
		httpSession.invalidate();

		return 1;
	}

	@RequestMapping(value = "/userInfo/idCheckDuplicatesAction.do", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int idCheckDuplicatesAction(Locale locale, Model model, UserInfoVo userInfoVo) throws Exception {
		System.out.println("컨트롤러:화면에서 가져온 userId::" + userInfoVo.getUserId());

		int idDuplicationTestResult = boardService.idCheckDuplicatesAction(userInfoVo.getUserId());
		System.out.println("컨트롤러:아이디중복 됬는지 SQL찍고 돌아온 결과 값::" + idDuplicationTestResult);
		model.addAttribute("userId", userInfoVo.getUserId());

		return idDuplicationTestResult;
	}

}
