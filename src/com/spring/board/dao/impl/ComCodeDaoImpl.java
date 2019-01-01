package com.spring.board.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.ComCodeDao;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;

@Repository
public class ComCodeDaoImpl implements ComCodeDao {

	@Autowired
	private SqlSession sqlSession;


	@Override
	public List<ComCodeVo> SelectComCodeList(String comCodeType) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("comCode.comCodeList",comCodeType);
	}

}
