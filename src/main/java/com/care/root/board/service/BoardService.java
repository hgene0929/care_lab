package com.care.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.dto.BoardDTO;

public interface BoardService {
	public void boardAllList(Model model);
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	public void contentView(Model model, int writeNo);
	public void delete(int writeNo);
	public void update(BoardDTO dto);
}
