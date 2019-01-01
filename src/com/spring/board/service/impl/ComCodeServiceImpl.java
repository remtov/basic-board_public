package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.ComCodeDao;
import com.spring.board.service.ComCodeService;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;

@Service
public class ComCodeServiceImpl implements ComCodeService {

	@Autowired
	ComCodeDao comCodeDao;

	@Override
	public List<ComCodeVo> selectComCodeList(String comCodeType) throws Exception {
		// TODO Auto-generated method stub
		return comCodeDao.SelectComCodeList(comCodeType);
	}

}
