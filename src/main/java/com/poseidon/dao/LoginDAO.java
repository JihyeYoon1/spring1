package com.poseidon.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> myInfo(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("login.myInfo",map);
	}

	
	
	
	
}
