package com.firmeet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.firmeet.service.GalleryService;
import com.firmeet.vo.GalleryImgVo;
import com.firmeet.vo.GalleryVo;
import com.firmeet.vo.ScheduleVO;

@Controller
@RequestMapping("/gallery")
public class GalleryController {

    @Autowired
    private GalleryService galleryService;

    // 갤러리 목록 조회
    @RequestMapping(value = "/list/{clubId}", method = {RequestMethod.GET, RequestMethod.POST})
    public String galleryList(@PathVariable("clubId") int clubId, Model model) {
        System.out.println("galleryList 확인");
        System.out.println("clubId : " + clubId);

        List<GalleryVo> gList = galleryService.getGalleryList(clubId);
        for (GalleryVo galleryVo : gList) {
            List<GalleryImgVo> gImgVos = galleryService.getGalleryImg(galleryVo.getGalleryNo());
        }

        model.addAttribute("galleryList", gList);

        return "/gallery/gallery";
    }

    // 갤러리 업로드 폼
    @RequestMapping(value = "/uploadForm/{clubId}", method = {RequestMethod.GET, RequestMethod.POST})
    public String uploadForm(@PathVariable("clubId") int clubId, Model model) {
        System.out.println("uploadForm 확인");
        System.out.println("clubId : " + clubId);

        List<ScheduleVO> sList = galleryService.getMeet(clubId);

        model.addAttribute("meetList", sList);

        return "/gallery/galleryUploadForm";
    }

    // 갤러리 업로드
    @RequestMapping(value = "/upload/{clubId}", method = {RequestMethod.GET, RequestMethod.POST})
    public String upload(@PathVariable("clubId") int clubId,
                         @RequestParam("meet") int meet,
                         @RequestParam("uploadPicture") List<MultipartFile> files) {
        System.out.println("upload 확인");
        System.out.println("clubId: " + clubId);
        System.out.println("meet: " + meet);

        int galleryNo = galleryService.getGalleryNo(meet);

        for (MultipartFile file : files) {
            System.out.println("file: " + file.getOriginalFilename());
            galleryService.upload(clubId, galleryNo, file);
        }

        return "redirect:/gallery/list/" + clubId;
    }
}
