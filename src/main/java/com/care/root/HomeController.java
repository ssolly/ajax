package com.care.root;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@GetMapping("ajax01")
	public String ajax01() {
		return "ajax01";
	}
	
	@GetMapping("ajax02")
	public String ajax02() {
		return "ajax02";
	}
	
	@PostMapping(value="ajax_result01", produces="application/json; charset=utf-8")	//produces:받아주는 타입 지정
	@ResponseBody
	public InfoDTO ajaxResult01(@RequestBody InfoDTO dto) {	//json으로 넘어오는 타입을 이름이 같다면 DTO로 자동적으로 넘겨준다
		System.out.println("이름 : " + dto.getName());
		System.out.println("나이 : " + dto.getAge());
		//dto.setName("해당하는 아이디는 사용 가능합니다");
		return dto;											//ajax01.jsp의 result값이 dto에 추가된다
	}
	
	@PostMapping(value="ajax_result02", produces="application/json; charset=utf-8")	//produces:받아주는 타입 지정
	@ResponseBody
	public Map ajaxResult02(@RequestBody Map map) {	//json으로 넘어오는 타입이 DTO와 다르다면 Map으로 받아주면 된다
		System.out.println("이름 : " + map.get("name"));
		System.out.println("나이 : " + map.get("age"));
		System.out.println("주소 : " + map.get("addr"));
		//dto.setName("해당하는 아이디는 사용 가능합니다");
		return map;											
	}
}
