package com.poseidon.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poseidon.dao.IPDAO;
import com.poseidon.util.Util;

@Service("ipService")
public class IPServiceImpl {
	
	@Autowired
	private Util util;
	
	@Autowired
	private IPDAO ipDAO;
	
	public void  saveLog(HttpServletRequest req, String target) {
		Map<String,Object> map = new HashMap<String, Object>();
		//System.out.println("ip는 : "+util.getIP(req));
		map.put("ip", util.getIP(req));
		HttpSession session = req.getSession();
		//삼항연산자
		map.put("id", session.getAttribute("id") != null ? session.getAttribute("id") : "익명");
		map.put("target", target); //각 페이지마다 다르기때문에
		
		
		//System.out.println(map.getMap());
		
//		if(map.get("target").equals("login.POST")) {
//			//id/pw에 값을 넣고 로그인 버튼을 눌렀다면
//			map.put("id", session)
//		}
		
		ipDAO.saveIP(map);
		
	}
	public void  saveLog(HttpServletRequest req, String target, String attemptID) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("ip", util.getIP(req));
		map.put("target", target); //각 페이지마다 다르기때문에
		map.put("id", attemptID); //로그인을 시도한 ID
		
		ipDAO.saveIP(map);
		
	}
	public List<Map<String, Object>> logList(Map<String, Object> map) {
		return ipDAO.logList(map);
	}
}
