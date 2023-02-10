package com.poseidon.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.poseidon.common.CommandMap;
import com.poseidon.service.IPServiceImpl;

@Controller
public class IPController {

	@Autowired
	IPServiceImpl ipService;
	
	@GetMapping("log.do")
	public ModelAndView log(CommandMap map) {
		ModelAndView mv = new ModelAndView("log");
		List<Map<String, Object>> log = ipService.logList(map.getMap());
		
		mv.addObject("log",log);
		return mv;
	}
}
