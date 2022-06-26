package com.care.root.board.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class BoardFileServiceImpl implements BoardFileService {

	@Override
	public String getMessage(String msg, String url) {
		String message = null;
		message = "<script>alert('"+msg+"');";
		message += "location.href='"+url+"';</script>";
		return message;
	}

	@Override
	public String saveFile(MultipartFile file) {
		SimpleDateFormat s = new SimpleDateFormat("yyyyMMddHHmmss-");
		String sysFileName = s.format(new Date());
		sysFileName += file.getOriginalFilename();
		File saveFile = new File(IMAGE_REPO+"/"+sysFileName);
		
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sysFileName;
	}

	@Override
	public void deleteImage(String fileName) {
		File d = new File(IMAGE_REPO+"/"+fileName);
		d.delete();
	}

}











