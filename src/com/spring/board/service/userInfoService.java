package com.spring.board.service;

import com.spring.board.vo.UserInfoVo;

public interface userInfoService {

	public int userInfoInsert(UserInfoVo userInfoVo) throws Exception;

	public UserInfoVo userInfoSelectloginAction(UserInfoVo userInfoVo) throws Exception;;

}
