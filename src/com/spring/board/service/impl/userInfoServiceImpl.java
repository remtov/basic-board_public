package com.spring.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.UserInfoDao;
import com.spring.board.service.userInfoService;
import com.spring.board.vo.UserInfoVo;

@Service
public class userInfoServiceImpl implements userInfoService {
	
	@Autowired
	UserInfoDao userInfoDao;

	@Override
	public int userInfoInsert(UserInfoVo userInfoVo) throws Exception {
		// TODO Auto-generated method stub
		return userInfoDao.userInfoInsert(userInfoVo);
	}

	@Override
	public UserInfoVo userInfoSelectloginAction(UserInfoVo userInfoVo) throws Exception {
		// TODO Auto-generated method stub
		return userInfoDao.userInfoSelectloginAction(userInfoVo);
	}

}
