package com.spring.board.service;

import java.util.List;

import com.spring.board.vo.ComCodeVo;

public interface ComCodeService {

	List<ComCodeVo> selectComCodeList(String comCodeType) throws Exception;

}
