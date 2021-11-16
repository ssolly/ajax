package com.care.root;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@GetMapping("non_ajax")
	public String nonAjax() {
		System.out.println("non_ajax 실행");
		return "non_ajax";
	}
	
	@GetMapping("ajax")
	public String ajax() {
		System.out.println("ajax 실행");
		return "ajax";
	}
	
	static int cnt=0;		//보통 DB에 있는 값을 가져와서 사용
	@GetMapping("ajax_result")
	@ResponseBody			//ajax사용할 때 반드시 필요 -> 응답해주는 값
	public String ajaxResult() {
		return ++cnt + "";	//숫자 + ""(문자) -> string
	}
}
