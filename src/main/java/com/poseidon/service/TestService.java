package com.poseidon.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

public interface TestService {

   List<Map<String, Object>> boardList(Map<String, Object> map);

   Map<String, Object> login(Map<String, Object> map);

   PaginationInfo paginationInfo(Map<String, Object> map);

   Map<String, Object> detail(Map<String, Object> map);
}