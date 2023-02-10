package com.poseidon.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.poseidon.common.CommandMap;
import com.poseidon.service.NoticeService;
import com.poseidon.util.Util;
import com.poseidon.service.IPServiceImpl;


//
// controller -> serviceImpl(service인터페이스) -> DAO(AbstractDAO) -> mybatis -> DB

//@RequestMapping("/api") //경로추가
//@RestController //다 이 용도로 쓰겠다
@Controller
public class NoticeController {

	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	@Resource(name="ipService")
	private IPServiceImpl ipService;
	
	@Autowired
	private Util util;
	
	@Autowired
	private HttpServletRequest req;
	
	//화면띄우기
	@GetMapping("/notice.do")
	public ModelAndView notice() {
		ModelAndView mv = new ModelAndView("notice");
		//데이터베이스에서 값 가져오기 (여러줄로 -> Map)
		List<Map<String,Object>> list = noticeService.noticeList(null); //실제 담길곳은 이름이 list인 Map. 이걸 list에 담음.
		mv.addObject("list",list);
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/write.do")
	public String write(CommandMap map, HttpSession session) {
		System.out.println(map.getMap());
		map.put("id",session.getAttribute("id")); //"id"라는 k값에 session밸류넣기
		
		int result = noticeService.write(map.getMap()); //몇개의 줄이 저장됬는지 출력(insert에 영향받은 행의 갯수)delete, update모두 가능.
		//System.out.println("저장결과:"+result);
		
		//json형태로 내보내기
		JSONObject json = new JSONObject(); //java에서 json으로 변경
		json.put("result", result); //{result : 1} //result이름으로 내보내기   
		
		return json.toString(); //[object Object] //{result : 1}(object)를 data(Object)가 감싸서 반환(제이슨 타입을 string화 시켜서 전송) 
	}
	
	
	//detail
	@ResponseBody
	@PostMapping(value="/noticeDetailAjax.do", produces = "application/json;charset=UTF-8")
//	@PostMapping(value="요청들어오는 값", produces = "출력할때 데이터 형식(한글)")
	public String noticeDetailAjax(CommandMap map, HttpSession session) {
		//System.out.println(map.getMap());
		map.put("id", session.getAttribute("id"));
		JSONObject json = new JSONObject();
		//엔터처리 (\n 들어오면 <br>로 변경하기
		
		
		
		
		if(map.containsKey("no")) {
		//	int no = Integer.parseInt((String) map.getMap().get("no"));
			Map<String,Object> detail = noticeService.noticeDetailAjax(map.getMap());
			//System.out.println(detail);
			
			detail.put("n_content", util.changeEnter((String)(detail.get("n_content"))));
			
			
			json.put("result", detail);
		}else {
			json.put("result", 0);
		}
		return json.toString();
	}
	
	@GetMapping("/noticeDel.do")
	public String noticeDel (CommandMap map, HttpSession session) {
		
		System.out.println("오는값: "+map.getMap());
		map.put("id",session.getAttribute("id"));
		int result = noticeService.noticeDel(map.getMap());
		System.out.println("처리결과: "+result);
		
		return"redirect:/notice.do";
	}
	
	@ResponseBody //rest API용도로만 쓰는것(뷰를 사용하지 않고 값전달 위한 용도)
	//HTTP 요청의 바디내용을 통째로 자바객체로 변환해서 매핑된 메소드 파라미터로 전달해준다. 
	@PostMapping("/noticeUpdate.do")
	public String noticeUpdate (CommandMap map, HttpSession session) {
		ipService.saveLog(req,"index.POST");
		//System.out.println("오는값: "+map.getMap());
		
		
		map.put("id", session.getAttribute("id"));
		int result = noticeService.noticeUpdate(map.getMap());
		
		JSONObject json = new JSONObject();
		json.put("result", result); //json에 값을 담아 보냄
		
		
		return json.toString();
	}
	
	
}











