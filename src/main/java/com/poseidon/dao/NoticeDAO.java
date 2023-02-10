package com.poseidon.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO  {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> noticeList(Map<String, Object> map) {
		return selectList("notice.list",map);
	}

	public int write(Map<String, Object> map) {
		return (int)insert("notice.write",map); //(mapper이름, 나갈값)
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> noticeDetailAjax(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("notice.noticeDetailAjax",map);
	}

	public int noticeDel(Map<String, Object> map) {
		return (int) delete("notice.noticeDel",map);
	}

	public int noticeUpdate(Map<String, Object> map) {
		return (int) insert("notice.noticeUpdate",map);
	}


}
