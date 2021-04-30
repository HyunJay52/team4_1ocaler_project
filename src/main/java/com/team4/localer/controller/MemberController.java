package com.team4.localer.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.MemberService;
import com.team4.localer.vo.MemberVO;

@Controller
public class MemberController {
	@Inject
	MemberService service;
	
	@RequestMapping("/login")
	public String loginFrm() {
		return "member/login";
	}
// 로그인	
	@RequestMapping(value="/loginConfrim", method=RequestMethod.POST)
	public String loginConfirm(String userid, String userpwd, HttpSession ses) {
		String goPage = "";

		MemberVO logVO = service.memLogin(userid, userpwd);
		if(logVO.getMem_name()!=null && !logVO.getMem_name().equals("")) {
			ses.setAttribute("logId", logVO.getUserid());
			ses.setAttribute("logName", logVO.getMem_name());
			ses.setAttribute("logLoc_gu", logVO.getLoc_gu());
			goPage = "home";
			System.out.println("로그인 성공!");
		}else {
			goPage = "member/login";
		}
		return goPage;
	}
// 로그아웃
	@RequestMapping("/logOut")
	public String logOut(HttpSession ses) {
		ses.invalidate();
		return "home";
	}
	
// 일반회원가입	
	@RequestMapping("/joinMember")
	public String joinMember() {
		return "member/joinMember";
	}
	@RequestMapping(value="/memJoinOk", method = RequestMethod.POST) //profFile
	public ModelAndView memJoinOk(MemberVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
/////////////////////////////////프로필 사진 업로드부터 실행		
		//업로드 파일 경로 찾기
		String profPath = req.getSession().getServletContext().getRealPath("/img/mem_prof");
		
		//첨부파일 받아오기 
		MultipartHttpServletRequest mem_mr = (MultipartHttpServletRequest)req;
		MultipartFile mem_prof = mem_mr.getFile("profFile");
		
		String uploadMemprofname = "";
		
		if(mem_prof!=null) {
			String originName = mem_prof.getOriginalFilename();
			if(!originName.equals("")) {
				File uploadFile = new File(profPath, originName);
				//중복파일 확인
				int idx = 1;
				while(uploadFile.exists()) {
					int lastDot = originName.lastIndexOf(".");
					String prof_name = originName.substring(0, lastDot);
					String prof_exe = originName.substring(lastDot+1);
					//중복파일 이름 수정 
					uploadFile = new File(profPath, prof_name+"_"+idx++ +"."+prof_exe);
				}
				//경로에 파일 업로드 실행
				try {
					mem_prof.transferTo(uploadFile);
				}catch(Exception e) {
					System.out.println("멤버 프로필 사진 업로드 에러 발생");
					e.printStackTrace();
				}
				//변경된 파일명을 저장
				uploadMemprofname = uploadFile.getName();
			}
		}
///////////////////////////////// DB 작업 시작		
		vo.setMem_prof(uploadMemprofname);
		int insertCnt = service.insertMember(vo);
		
		if(insertCnt>0) {
			mav.setViewName("redirect:login");
		}else {
			//업로드 파일 삭제하기
			File del = new File(profPath, uploadMemprofname);
			del.delete();
			mav.setViewName("member/historyBack");
		}
		return mav;
	}
// 아이디 중복확인
	@RequestMapping(value="/idOverlapCheck", method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String idOverlapCheck(String userid) {
		String result = "";
		String checkId = service.idDoubleCheck(userid);
		
		if(userid.equals(checkId)) {
			result = "N"; //사용불가능
		}else {
			result = "Y"; //사용가능
		}
		return result;
	}
	// 아이디 중복확인
	@RequestMapping(value="/nickOverlapCheck", method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String nickOverlapCheck(String mem_nick) {
		String result = "";
		String checkId = service.nickNameDoubleCheck(mem_nick);
			
		if(mem_nick.equals(checkId)) {
			result = "N"; //사용불가능
		}else {
			result = "Y"; //사용가능
		}
		return result;
	}
	
// 셀러회원가입
	@RequestMapping("/joinSeller")
	public String joinSeller() {
		return "member/joinSeller";
	}
}
