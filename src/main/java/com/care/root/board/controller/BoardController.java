package com.care.root.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.dto.BoardDTO;
import com.care.root.board.service.BoardFileService;
import com.care.root.board.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {

	@Autowired BoardService bs;
	
	@GetMapping("boardAllList")
	public String boardAllList(Model model,
							   @RequestParam(value = "num", required = false, defaultValue = "1")int num) {
		
		bs.boardAllList(model, num);
		return "board/boardAllList";
	}
	
	@GetMapping("**")
	public void writeForm() {
//		return "board/writeForm";
	}
	
	@PostMapping("writeSave")
	public void writeSave(MultipartHttpServletRequest mul,
						  HttpServletRequest request, HttpServletResponse response)
						  throws Exception {
		
		String message = bs.writeSave(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(message);
	}
	
	@GetMapping("contentView")
	public String contentView(@RequestParam int writeNo, Model model) {
		
		bs.contentView(model, writeNo);
		return "board/contentView";
	}
	
	@GetMapping("download")
	public void download(@RequestParam String imageFileName,
						 HttpServletResponse response) throws Exception {
		response.addHeader("Content-dispotion", "attachment; fileName="+imageFileName);
		File file = new File(BoardFileService.IMAGE_REPO+"/"+imageFileName);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	
	@GetMapping("delete")
	public void delete(@RequestParam int writeNo,
						 @RequestParam String imageFileName,
						 HttpServletResponse response) throws Exception {
		String message = bs.delete(writeNo, imageFileName);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(message);
	}
	
	@GetMapping("update_form")
	public String update_form(@RequestParam int writeNo, Model model) {
		
		bs.contentView(model, writeNo);
		return "board/updateForm";
	}
	
	@PostMapping("update")
	public void update(MultipartHttpServletRequest mul, HttpServletResponse response)
						 throws Exception {
		
		String message = bs.update(mul);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(message);
	}
}














