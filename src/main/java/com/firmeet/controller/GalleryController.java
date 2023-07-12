package com.firmeet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/gallery")
public class GalleryController {
	
	@RequestMapping("/list")
	public String galleryList() {
		System.out.println("galleryList 확인");
		
		return "/gallery/gallery";
	}
	
	@RequestMapping("uploadForm")
	public String uploadForm() {
		System.out.println("uploadForm 확인");
		
		return "/gallery/galleryUploadForm";
	}
}
