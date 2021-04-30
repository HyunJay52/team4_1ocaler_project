package com.team4.localer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	//1. 컨트롤러가 호출 되기 전에 먼저 실행되는 메소드
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		//1. 로그인 정보 구하기
		String userid = (String)req.getSession().getAttribute("logId"); //""문자도 확인
		
		//2. 로그인 상태 확인하기
		if(userid==null || userid.equals("")) {
			//ajax 리퀘스트인지 확인
			if(checkAjaxReq(req)) {
				System.out.println("ajax로 error 400 보냄");
				res.sendError(400);
			}else{
				System.out.println("인터셉터에서 페이지를 보냄");
				res.sendRedirect(req.getContextPath()+"/login");
			}
			//3. 로그인 페이지로 이동
			return false; // 접속한 컨트롤러의 실행중지 후, 지정 컨트롤러로 이동
		}
		return true; //실행한 컨트롤러 계속 실행
	}

	//2. 컨트롤러가 실행된 후, view 페이지로 이동하기 전에 호출되는 메소드
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, @Nullable ModelAndView modelandview) throws Exception {
		
	}
	//3. 컨트롤러가 실행된 후, 호출되는 메소드
	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object handler, @Nullable Exception ex) throws Exception {
		
	}
	
	//ajax의 리퀘스트인지 확인 하는 메소드
	private boolean checkAjaxReq(HttpServletRequest req) {
		String header = req.getHeader("AJAX");
		if("true".equals(header)) {
			System.out.println("에이작스 리퀘스트 확인~");
			return true;
		}else {
			return false;
		}
	}
}
