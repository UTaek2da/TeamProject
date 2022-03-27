package com.hanulso.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanulso.service.UserService;

@Controller
@RequestMapping("/coroperation/*")
public class CorController {

	@Autowired
	private UserService service;
	
	@GetMapping("/coroperation/cor_list.do")
	public void cor_list() {}
}
