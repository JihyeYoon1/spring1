package com.poseidon.util;
//ip, 숫자검사, 변경

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

@Component
public class Util {
	public String changeText(String txt) {
		txt = txt.replaceAll("<", "&lt;");
		txt = txt.replaceAll(">", "&gt;");
		
		return txt;
	}		
		
		
	public String changeEnter(String txt) {
		txt = txt.replaceAll("\n", "<br>");
		
		return txt;
		}


	// 숫자로
		public int strInt(String str) {
			try {
				return Integer.parseInt(str);
			} catch (Exception e) {
				return 0;
			}
		}

		public int strInt(Object obj) {
			try {
				return Integer.parseInt((String) obj);
			} catch (Exception e) {
				return 1;
			}
		}

		//ip얻어오기(다 뒤지기)
		public String getIP(HttpServletRequest request) {
			String ip = request.getHeader("X-FORWARD-FOR");
			if(ip == null) {
				ip = request.getHeader("Proxy-Client-IP");
			} 
			if(ip == null) { 
				ip = request.getHeader("WL-Proxy-Client-IP");
			}
			if(ip == null) { 
				ip = request.getHeader("HTTP_CLIENT_IP");
			}
			if(ip == null) { 
				ip = request.getHeader("HTTP_X_FORWARDED_FOR");
			}
			if(ip == null) { 
				ip = request.getRemoteAddr();
			}
			
			return ip;
		}
		
		
	}
