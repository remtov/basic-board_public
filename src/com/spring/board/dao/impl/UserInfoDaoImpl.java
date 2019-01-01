package com.spring.board.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.UserInfoDao;
import com.spring.board.vo.UserInfoVo;

@Repository
public class UserInfoDaoImpl implements UserInfoDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int userInfoInsert(UserInfoVo userInfoVo) throws Exception {
		System.out.println("다오:파라메터 userInfoVo::" + userInfoVo);
		return sqlSession.insert("userInfo.userInfoInsert", userInfoVo);
	}

	@Override
	public UserInfoVo userInfoSelectloginAction(UserInfoVo userInfoVo) throws Exception {
		System.out.println("다오:파라메터 userInfoVo::" + userInfoVo);
		return sqlSession.selectOne("userInfo.userInfoSelectloginAction", userInfoVo);
	}

}
