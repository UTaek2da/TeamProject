package com.hanulso.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hanulso.domain.*;
import com.hanulso.service.*;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
public class ProductController {

	@Autowired
	private ProductService productservice;

	@Autowired
	private UserService userSerivce;

	@Autowired
	private FavoriteService favoriteservice;

	// parameter username = 로그인 사용자 이름
	@PostMapping("/product_view.do")
	public String product_view(HttpServletRequest request, HttpServletResponse response, HttpSession session,@RequestParam("pno") int pno, String username, Model model) {
		ProductVO pvo = productservice.product_view(pno);
		
		if(username!=null && !username.equals("")) {
			FavoriteVO fvo = favoriteservice.likecheck(pno, username);
			model.addAttribute("fvo", fvo);
		}
		CorVO cvo = userSerivce.member_select(pvo.getUsername());
		
		//쿠키생성
		Cookie[] cookies = request.getCookies();
		//비교하기 위한 새로운 쿠키
		Cookie viewCookie = null;
		
		//쿠키가 있을경우
		if (cookies != null && cookies.length > 0) {
			for(int i = 0; i < cookies.length; i++) {
				//Cookie의 name이 cookie + pno와 일치하는 쿠키를 viewCookie에 넣어줌
				if(cookies[i].getName().equals("cookie"+pno)) {
					log.info("쿠키 있음");
					viewCookie = cookies[i];
				}
			}
		}
		
		if(pvo != null) {
				log.info("페이지 넘어감");
				if (viewCookie == null) {
				//만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가처리
				productservice.product_view_count(pno);
				log.info("쿠키 없음");
				//쿠키 생성(이름, 값)
				Cookie newCookie = new Cookie("cookie"+pno, "|" + pno + "|");

				
				//쿠키 추가
				newCookie.setMaxAge(60 * 60 * 24);
				response.addCookie(newCookie);
				}
		}
		
		model.addAttribute("pvo", pvo);
		model.addAttribute("cvo", cvo);
		model.addAttribute("pList", productservice.product_view_list(pvo.getUsername()));

		// 사진파일 리스트 (썸네일 제외)
		// jsp파일에서 경로를 /upload/{picList의 하나} 형태로 사용
		String[] picList = pvo.getPicture().split("/");
		model.addAttribute("picList", picList);
		model.addAttribute("picListLength", picList.length);
		
		//productservice.product_view_count(pno);
		return "/product/product_view";
	}

	@GetMapping("/product_write_backUp.do")
	public void product_write_backUp() {
	}

	@GetMapping("/product_write.do")
	public void product_write() {
	}

	@GetMapping("/product_write3.do")
	public void product_write3() {
	}

	@PostMapping("/product_write_pro.do")
	public String product_write_pro(ProductVO pvo, MultipartFile[] pictureFile) {
		System.out.println(pvo);

		/* 파일업로드 시작 */
		String uploadFolder = "C:\\upload";
		String folderPath = getFolder();
		File uploadPath = new File(uploadFolder, folderPath);
		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}

		String picture = null; // 사진을 *로 구분하여 저장
		try {
			for (int i = 0; i < pictureFile.length; i++) {
				MultipartFile mfile = pictureFile[i];
				if (!mfile.isEmpty()) { // 업로드 된 파일이 있을때에만
					String uploadFileName = UUID.randomUUID().toString() /* 중복 처리 */
							+ "_"
							+ mfile.getOriginalFilename().substring(mfile.getOriginalFilename().lastIndexOf("\\") + 1); // 모든
																														// 경로까지
																														// 저장되는
																														// ie
																														// 브라우저용
																														// 처리

					File saveFile = new File(uploadPath, uploadFileName);
					mfile.transferTo(saveFile);

					String savePath = folderPath + File.separator + uploadFileName;

					if (i != 0) {
						if (picture != null) {
							picture += "/" + savePath;
						} else {
							picture = savePath;
						}
					} else {
						pvo.setThumbnail(savePath);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		pvo.setPicture(picture);

		/* 파일업로드 끝 */

		productservice.product_insert(pvo);
		return "redirect:/";
	}

	// 날짜로 년도/월/일 로 경로 생성
	public String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(); // 오늘날짜
		return sdf.format(date).replace("-", File.separator); // File.separator : 윈도우의 경우 "//"
	}

}
