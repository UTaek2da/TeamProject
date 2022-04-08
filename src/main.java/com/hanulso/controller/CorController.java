package com.hanulso.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanulso.service.UserService;
import com.hanulso.service.ProductService;

@Controller
@RequestMapping("/coroperation/*")
public class CorController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/coroperation/cor_view.do")
	public void cor_view(String username,Model model) {
		model.addAttribute("uvo",userService.user_select(username));
		model.addAttribute("cvo", userService.member_select(username));
		model.addAttribute("pList", productService.product_view_list(username));
	}
	
/*
 * ##### 아래는 임시로 추가해둔 파일입니다 #####
 * ##### 병합 후 삭제 예정 #####	
 */
	
	@GetMapping("/coroperation/cor_list.do")
	public void cor_list() {}

	@GetMapping("/coroperation/cor_list2.do")
	public void cor_list2() {}
}
