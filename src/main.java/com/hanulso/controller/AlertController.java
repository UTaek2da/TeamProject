package com.hanulso.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanulso.domain.AlertVO;
import com.hanulso.domain.CorVO;
import com.hanulso.domain.Criteria;
import com.hanulso.domain.KnowledgeVO;
import com.hanulso.domain.PageVO;
import com.hanulso.domain.PremiumVO;
import com.hanulso.security.CustomUserDetails;
import com.hanulso.service.AlertService;
import com.hanulso.service.NoticeService;
import com.hanulso.service.PremiumService;
import com.hanulso.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/alert/*")
public class AlertController {

	@Setter(onMethod_ = @Autowired)
	private AlertService service;

	@Setter(onMethod_ = @Autowired)
	private NoticeService noticeservice;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PremiumService premiumService;

	@GetMapping("/alert_list.do")
	public void alert_list(Criteria cri, Model model) {
		List<KnowledgeVO> list = noticeservice.notice_list(cri);
		int total = noticeservice.getTotalCount(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
		int alertCnt = 10; // 표시할 알림의 개수
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (!principal.toString().equals("anonymousUser")) { // 로그인 되어 있는 경우
			CustomUserDetails user = (CustomUserDetails) principal;
			List<AlertVO> alertList = service.alert_list(user.getUsername(), alertCnt);
			log.info(alertList);
			model.addAttribute("alertList", alertList);
			// one_alert 테이블에서 username이 로그인 한 유저인 행을 모두 가져온다
			
			// 중개사 회원으로 로그인 한 경우 판별 후 이름 넘기기
			CorVO cvo = userService.member_select(user.getUsername());
			if(cvo != null) {
				PremiumVO prevo = premiumService.premium_select(user.getUsername());
				
				if(prevo != null) {
					Calendar cal = Calendar.getInstance(); 
					cal.setTime(prevo.getPLastdate());
					Date date = new Date();
							
					
				}
				
				model.addAttribute("prevo", prevo);

				model.addAttribute("username", user.getUsername());
			}
		}
	}
	
	@PostMapping("/premium_insert_pro.do")
	public String premium_insert(PremiumVO prevo) {
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 31);
		
		Date date = new Date(cal.getTimeInMillis());
		
		prevo.setPLastdate(date);
		premiumService.premium_insert(prevo);
		return "redirect:/";
	}
	
	
}
