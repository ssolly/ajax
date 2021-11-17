package com.care.root;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController				//page가 아닌 data를 돌려주는 컨트롤러
public class TestController {

	/*
	 요청 방식
	  - GET : 모든 데이터를 요청한다
	  - POST : 데이터를 추가한다
	  - PUT : 데이터를 모두 수정한다
	  - DELETE : 데이터를 모두 제거한다
	 */
	
	@GetMapping(value="rest", produces="application/json; charset=utf-8")	//responsebody가 생략되어있다
	public String get() {
		return "{\"execute\" : \"get 데이터 요청할 때 사용\" }";
	}
	
	@PostMapping(value="rest", produces="application/json; charset=utf-8")	//responsebody가 생략되어있다
	public String post() {
		return "{\"execute\" : \"post 데이터 추가할 때 사용\" }";
	}
	
	@PutMapping(value="rest", produces="application/json; charset=utf-8")	//responsebody가 생략되어있다
	public String put() {
		return "{\"execute\" : \"put 데이터 수정할 때 사용\" }";
	}
	
	@DeleteMapping(value="rest", produces="application/json; charset=utf-8")	//responsebody가 생략되어있다
	public String delete() {
		return "{\"execute\" : \"delete 데이터 삭제할 때 사용\" }";
	}
	
}
