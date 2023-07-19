package com.firmeet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.firmeet.service.GalleryService;

@Controller
@RequestMapping("/gallery")
public class GalleryController {
	
	@Autowired
	private GalleryService galleryService;
	
	@RequestMapping(value =  "/list/{clubId}", method = {RequestMethod.GET, RequestMethod.POST})
	public String galleryList(@PathVariable("clubId") int clubId) {
		System.out.println("galleryList 확인");
		System.out.println("clubId : "+clubId);
		
		return "/gallery/gallery";
	}
	
	@RequestMapping(value =  "/uploadForm/{clubId}", method = {RequestMethod.GET, RequestMethod.POST})
	public String uploadForm(@PathVariable("clubId") int clubId) {
		System.out.println("uploadForm 확인");
		System.out.println("clubId : "+clubId);
		
		return "/gallery/galleryUploadForm";
	}
}
