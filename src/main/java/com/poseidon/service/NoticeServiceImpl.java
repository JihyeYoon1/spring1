package com.poseidon.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.poseidon.dao.NoticeDAO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	
	@Resource(name="noticeDAO") //noticeDAO를 아래 이름으로 연결할것이다
	private NoticeDAO noticeDAO;

	@Override
	public List<Map<String, Object>> noticeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeList(map);
	}

	@Override
	public int noticeCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> noticeDetailAjax(Map<String, Object> map) {
		return noticeDAO.noticeDetailAjax(map);
	}

	@Override
	public void detailUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int write(Map<String, Object> map) {
		return noticeDAO.write(map); //dao한테 일시키기
	}

	@Override
	public int noticeDel(Map<String, Object> map) {
		return noticeDAO.noticeDel(map);
	}

	@Override
	public int noticeUpdate(Map<String, Object> map) {
		return noticeDAO.noticeUpdate(map);
	}

}
