package com.spring.board.dao;

import com.spring.board.vo.UserInfoVo;

public interface UserInfoDao {

	public int userInfoInsert(UserInfoVo userInfoVo) throws Exception;

	public UserInfoVo userInfoSelectloginAction(UserInfoVo userInfoVo) throws Exception;

}
