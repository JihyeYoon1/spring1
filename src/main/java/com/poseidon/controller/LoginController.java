package com.poseidon.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.poseidon.common.CommandMap;
import com.poseidon.service.IPServiceImpl;
import com.poseidon.service.LoginService;
import com.poseidon.service.TestService;

@Controller
public class LoginController {

	@Resource(name = "testService")
	private TestService testService;
	
	@Resource(name="ipService")
	private IPServiceImpl ipService;
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@Autowired
	private HttpServletRequest req;
	
	//로그인 페이지부터 열어주기(get방식으로)
	@GetMapping("/login.do")
	public String login() {
		ipService.saveLog(req,"login.GET");
		return "login";
	}
	
	@PostMapping("/login.do")
	public String login(CommandMap map, HttpSession session) {
		ipService.saveLog(req, "login.POST", (String) map.getMap().get("id"));
		System.out.println("map : " + map.getMap()); // 맵 내용 출력하기
		// map : {pw=, id=} 형태
		Map<String, Object> result = testService.login(map.getMap());
		System.out.println(result); // 서버에서 오는 값.
		// 1이 나오면 정상 로그인 한 것
		if (Integer.parseInt(String.valueOf(result.get("count"))) > 0) {
			// 세션만들어서 올리기
			session.setAttribute("id", result.get("member_id"));
			session.setAttribute("name", result.get("member_name"));
			return "redirect:/main.do"; // 다시 main.do 컨트롤러
		} else {
			return "redirect:/login.do?error=error"; // 다시 로그인 컨트롤러
		}

	}
	
	
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		if(session.getAttribute("id") != null){
			//id세션이 있다면 지워라
			session.removeAttribute("id");
		}
		if(session.getAttribute("name") != null){
			//id세션이 있다면 지워라
			session.removeAttribute("name");
		}
		//전체종료
		session.invalidate();
		return "login";
	} 
	
	@GetMapping("/postcode.do")
	public String postcode() {
		
		return "postcode";
	}
	
	@PostMapping("/postcode.do")
	public String postcode(CommandMap map) {
		System.out.println(map.getMap());
		return "";
	}
	
	@GetMapping("/myInfo@{id}.do")
	public void myInfo(@PathVariable("id") String id, HttpSession session) {
		System.out.println(id);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pathID", id);

		if(session.getAttribute("id") != null) {			
			map.put("sessionID", session.getAttribute("id"));
		}
		
		Map<String, Object> result = loginService.myInfo(map);
		System.out.println(result);
	}
}






















