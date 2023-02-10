package com.poseidon.service;

import java.util.List;
import java.util.Map;

//보기 편할라고 모아둔곳.
public interface NoticeService {
	//목록
	List<Map<String, Object>> noticeList(Map<String, Object> map);
	//총 게시글수
	int noticeCount(Map<String, Object> map);
	//상세보기
	Map<String, Object> noticeDetailAjax(Map<String, Object> map);
	
	void detailUpdate(Map<String, Object> map);
	
	int write(Map<String, Object> map);
	
	int noticeDel(Map<String, Object> map);
	
	int noticeUpdate(Map<String, Object> map);
	
}