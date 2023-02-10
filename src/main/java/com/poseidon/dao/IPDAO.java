package com.poseidon.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class IPDAO extends AbstractDAO {

	public void saveIP(Map<String, Object>map) {
		insert("ip.saveIP",map);
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> logList(Map<String, Object> map) {
		return selectList("ip.logList",map);
	}
	
}
