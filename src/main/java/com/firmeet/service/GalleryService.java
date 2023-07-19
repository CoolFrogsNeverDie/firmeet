package com.firmeet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firmeet.dao.GalleryDao;

@Service
public class GalleryService {

	@Autowired
	private GalleryDao galleryDao;
	
}
