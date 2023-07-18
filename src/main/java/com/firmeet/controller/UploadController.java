package com.firmeet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.firmeet.service.ClubService;
import com.firmeet.service.UploadService;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.UploadVo;

@Controller
@RequestMapping(value="/upload")
public class UploadController {
	@Autowired
	private UploadService uploadService;
	
	@Autowired 
	private ClubService clubService;
	
	@RequestMapping(value="/clubImg", method= RequestMethod.GET)
	
	public String clubMainImg(@RequestParam("file") MultipartFile file,
							 @ModelAttribute UploadVo uploadVo,
							 @ModelAttribute ClubVo clubVo, Model model) {
		System.out.println("UploadController.clubMainImg()");
		
		uploadService.clubImgUpload(file , uploadVo ,clubVo);
		return"";
	}
	
	
}
