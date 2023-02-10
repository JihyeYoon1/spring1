package com.poseidon.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.poseidon.common.CommandMap;
import com.poseidon.service.IPServiceImpl;
import com.poseidon.service.TestService;
import com.poseidon.util.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class TestController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "testService")
	private TestService testService;
	
	@Resource(name = "ipService")
	private IPServiceImpl ipService;
	
	
	@Autowired
	private HttpServletRequest req;

	
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String indes(CommandMap map) {
		ipService.saveLog(req, "index.do");
		
		return "index";
	}
	
	@GetMapping("/main.do")
	public ModelAndView main(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("main");
		
		if(map.isEmpty() || !(map.containsKey("pageNo"))) {
			map.put("pageNo", 1);
		}
		
		//전자정부 페이징 작업 해주세요 = 서비스가 페이징 작업하는 걸로 
		PaginationInfo info = testService.paginationInfo(map.getMap());
		map.put("startPage", info.getFirstRecordIndex());
		map.put("lastPage", info.getRecordCountPerPage());
		
		
		List<Map<String, Object>> list = testService.boardList(map.getMap());
		mv.addObject("paginationInfo", info);
		mv.addObject("list", list);
		return mv;
	}
	
	//detail.do?b_no=45
	@GetMapping("/detail.do")
	public ModelAndView detail(CommandMap map) {
		System.out.println(map.getMap());
		ModelAndView mv = new ModelAndView("detail");
		
		Map<String, Object> detail = testService.detail(map.getMap());
		mv.addObject("detail",detail);
		
		
		return mv;
	}
	
	
}



























