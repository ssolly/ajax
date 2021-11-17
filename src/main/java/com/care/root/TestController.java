package com.care.root;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	//DB 연결 전 대체 역할
	static int cnt=0;
	static Map<String, InfoDTO> DBMap = new HashMap<String, InfoDTO>();
	
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
	
	@GetMapping(value="users", produces="application/json; charset=utf-8")
	public ArrayList<InfoDTO> users() {
		ArrayList<InfoDTO> list = new ArrayList<InfoDTO>();
		//DB가 없어서 DB역할로 data 생성
		for(int i=cnt; i<cnt+10; i++) {
			InfoDTO info = new InfoDTO();
			info.setName("홍길동"+i);
			info.setAge(10+i);
			list.add(info);
			DBMap.put("홍길동"+i, info);
		}
		cnt += 10;
		return list;
	}
	
	@GetMapping(value="user", produces="application/json; charset=utf-8")
	public InfoDTO user(@RequestParam String id) {
		//select * from member where id=id;
		return DBMap.get(id);
	}
	
	@GetMapping(value="user/{name}", produces="application/json; charset=utf-8")
	public InfoDTO user1(@PathVariable String name) {	
		//select * from member where id=id;
		return DBMap.get(name);
	}
	
	@PutMapping(value="modify", produces="application/json; charset=utf-8")
	public InfoDTO modify(@RequestBody InfoDTO dto) {	//이름 동일할 시 dto로 받을 수 있음
		//update member set age=? where name=?
		System.out.println(dto.getName());
		System.out.println(dto.getAge());
		DBMap.replace(dto.getName(), dto);
		return DBMap.get(dto.getName());
	}
	
	@PostMapping(value="membership", produces="application/json; charset=utf-8")
	public String membership(@RequestBody Map<String,Object> member) {
		System.out.println("uId : " + member.get("uId"));
		System.out.println("uName : " + member.get("uName"));
		System.out.println("uAge : " + member.get("uAge"));
		System.out.println("uAddr : " + member.get("uAddr"));
		System.out.println("uPhone : " + member.get("uPhone"));
		
		return "{\"test\":true}";
	}
}
