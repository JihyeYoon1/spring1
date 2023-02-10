package com.poseidon.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("testDAO")
public class TestDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> boardList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("test.boardList",map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> login(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("test.login",map);
	}

	public int totalCount(Map<String, Object> map) {
		return (int) selectOne("test.totalCount", map);
	}

	//댓글 갯수 가져오기 (갯수라는 컬럼은 1개니까 selectOne)
	@SuppressWarnings("unchecked")
	public Map<String, Object> detail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("test.detail",map);
	}

}
