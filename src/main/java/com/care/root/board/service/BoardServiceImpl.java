package com.care.root.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.dto.BoardDTO;
import com.care.root.board.dto.BoardRepDTO;
import com.care.root.mybatis.board.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired BoardMapper mapper;
	@Autowired BoardFileService bfs;
	
	public void boardAllList(Model model, int num) {
		int pageLetter = 3;
		int allCount = mapper.selectBoardCount();
		int repeat = allCount/ pageLetter;
		if(allCount%pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end +1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("boardAllList", mapper.boardAllList(start, end));
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
			msg = "새 게시글이 추가되었습니다.";
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
	public String delete(int writeNo, String imageFileName) {
		int result = mapper.delete(writeNo);
		
		String msg, url;
		if(result == 1) {
			bfs.deleteImage(imageFileName);
			msg = "게시글을 삭제하였습니다.";
			url = "/root/board/boardAllList";
		} else {
			msg = "문제가 발생하였습니다.";
			url = "/root/board/contentView";
		}
		return bfs.getMessage(msg, url);
	}

	@Override
	public String update(MultipartHttpServletRequest mul) {
		BoardDTO dto = new BoardDTO();
		dto.setWriteNo(Integer.parseInt(mul.getParameter("writeNo")));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		MultipartFile file = mul.getFile("imageFileName");
		if(file.getSize() != 0) {
			dto.setImageFileName(bfs.saveFile(file));
			bfs.deleteImage(mul.getParameter("originFileName"));
		} else {
			dto.setImageFileName(mul.getParameter("originFileName"));
		}
		
		String msg, url;
		int result = mapper.update(dto);
		if(result == 1) {
			msg = "게시글을 수정하였습니다.";
			url = "/root/board/boardAllList";
		} else {
			msg = "문제가 발생하였습니다.";
			url = "/root/board/update_form";
		}
		return bfs.getMessage(msg, url);
	}

	@Override
	public void addReply(BoardRepDTO dto) {
		mapper.addReply(dto);
	}

	@Override
	public List<BoardRepDTO> getRepList(int write_group) {
		return mapper.getRepList(write_group);
	}
	
}













