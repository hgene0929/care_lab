package com.care.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.dto.BoardDTO;
import com.care.root.mybatis.board.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired BoardMapper mapper;
	@Autowired BoardFileService bfs;
	
	public void boardAllList(Model model) {
		model.addAttribute("boardAllList", mapper.boardAllList());
	}

	@Override
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		BoardDTO dto = new BoardDTO();
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		dto.setId(mul.getParameter("id"));
		
		MultipartFile file = mul.getFile("image_file_name");
		if(file.getSize() != 0) {
			dto.setImageFileName(bfs.saveFile(file));
		} else {
			dto.setImageFileName("nan");
		}
		
		int result = 0;
		result = mapper.writeSave(dto); //성공하면 1, 실패하면 0
		String msg, url;
		if(result == 1) {
			msg = "새 글이 추가되었습니다.";
			url = "/root/board/boardAllList";
		} else {
			msg = "문제가 발생하였습니다.";
			url ="/root/board/writeForm";
		}
		return bfs.getMessage(msg, url);
	}

	private void upHit(int writeNo) {
		mapper.upHit(writeNo);
	}
	
	@Override
	public void contentView(Model model, int writeNo) {
		upHit(writeNo);
		model.addAttribute("data", mapper.contentView(writeNo));
	}

	@Override
	public void delete(int writeNo) {
		mapper.delete(writeNo);
	}

	@Override
	public void update(BoardDTO dto) {
		mapper.update(dto);
	}
	
}













