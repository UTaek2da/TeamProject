package com.hanulso.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanulso.domain.CorInfoVO;
import com.hanulso.domain.Criteria;
import com.hanulso.domain.PageVO;
import com.hanulso.domain.UserVO;
import com.hanulso.service.AdminService;
import com.hanulso.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminController {
/*
 * ##### 하위폴더가 존재해서 컨트롤러 오류 남으로 1:1 직접 매핑 걸어줄것 ! ##### 
 */
	@Autowired
	private AdminService service;
	
	@Autowired
	private UserService uservice;
	
	@GetMapping("/manage/admin_user_list.do")
	public String user_list(Criteria cri, Model model) {
		List<UserVO> list = service.user_list(cri);
		int total = service.userTotalCount(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker",new PageVO(cri, total));
		return "/admin/manage/admin_user_list";
	}
	
	@GetMapping("/manage/admin_cor_list.do")
	public String cor_list(Criteria cri, Model model) {
		List<CorInfoVO> list = service.coruser_list(cri);
		int total = service.getTotalCount(cri);
		model.addAttribute("list", list);
		PageVO pavo = new PageVO(cri, total);
		model.addAttribute("pageMaker", pavo);
		log.info(pavo);
		return "/admin/manage/admin_cor_list";
	}
	
	@GetMapping("/manage/admin_adm_list.do")
	public void adm_list(Criteria cri, Model model) {
		model.addAttribute("list", service.adm_list(cri));
		model.addAttribute("pageMaker", new PageVO(cri, service.admTotalCount(cri)));
	}
	
	@PostMapping("/manage/admin_user_delete.do")
	public void admin_user_delete(HttpServletRequest request, HttpServletResponse response) {
		String[] username_list = request.getParameter("username").split(",");
		try {
		for(String username : username_list) {
			uservice.user_delete_favorite(username);
			uservice.user_delete_alert(username);
			uservice.user_delete_user(username);
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println("<script>alert('삭제 완료');location.href='/admin/manage/admin_user_list.do'</script>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/manage/admin_cor_delete.do")
	public void admin_cor_delete(String username, HttpServletRequest request, HttpServletResponse response) {
		uservice.cor_delete(username);
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().println("<script>alert('삭제 완료');location.href='/admin/manage/admin_cor_list.do'</script>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 유저랑 어드민 이랑 사실상 같으므로 유저삭제를 이용
	public void admin_adm_delete(HttpServletRequest request ,HttpServletResponse response) {
		String[] username_list = request.getParameter("username").split(",");
		try {
			for(String username : username_list) {
				uservice.user_delete_user(username);
			}
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().println("<script>alert('삭제 완료');location.href='/admin/manage/admin_adm_list.do'</script>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
