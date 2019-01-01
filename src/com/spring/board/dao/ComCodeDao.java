package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;

public interface ComCodeDao {

	public List<ComCodeVo> SelectComCodeList(String comCodeType);

}
