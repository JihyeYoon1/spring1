package com.poseidon.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poseidon.dao.TestDAO;
import com.poseidon.util.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


//이렇게 붙여준 이유는 controller에 나와요 
@Service("testService")
public class TestServiceImpl implements TestService {
	Logger log = Logger.getLogger(this.getClass());

	//@Autowired
	@Resource(name = "testDAO")
	private TestDAO testDAO;
	
	@Autowired
	private Util util;
	
//	@Override
//	public List<Map<String, Object>> boardList() {
//		return testDAO.boardList();
//	}

	@Override
	public List<Map<String, Object>> boardList(Map<String, Object> map) {
		return testDAO.boardList(map);
	}
	@Override
	public Map<String, Object> login(Map<String, Object> map) {
		return testDAO.login(map);
	}


	@Override
	public PaginationInfo paginationInfo(Map<String, Object> map) {
		int totalCount = testDAO.totalCount(map);
		PaginationInfo info = new PaginationInfo();
		info.setCurrentPageNo(util.strInt(map.get("pageNo")));
		info.setRecordCountPerPage(10);
		info.setPageSize(10);
		info.setTotalRecordCount(totalCount);
		
		return info;
	}
	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		return testDAO.detail(map);
	}

}
