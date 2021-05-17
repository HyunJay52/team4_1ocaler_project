package com.team4.localer.controller;

import java.io.File;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.team4.localer.service.MemberService;
import com.team4.localer.service.MyInfoService;
import com.team4.localer.vo.MemberVO;
import com.team4.localer.vo.SellerVO;

@Controller
public class MemberController {
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	@Inject
	MemberService service;
	@Inject
	MyInfoService myinfoService;
	
	@Inject
	JavaMailSenderImpl mailSender; //메일보내기 객체 생성 
	
	@RequestMapping("/login")
	public String loginFrm() {
		return "member/login";
	}
// 로그인	
	@RequestMapping(value="/loginConfrim", method=RequestMethod.POST)
	@Transactional(rollbackFor = {Exception.class, RuntimeException.class})
	public String loginConfirm(String userid, String userpwd, String stay, HttpSession ses, HttpServletResponse res) {
		String goPage = "";
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		
		try {
			TransactionStatus status = transactionManager.getTransaction(def);
			
			MemberVO logVO = service.memLogin(userid, userpwd);
			
			if(logVO.getMem_name()!=null && !logVO.getMem_name().equals("")) {
				if(stay!=null && stay.equals("stay")) {
					Cookie logCookie = new Cookie("logCookie", logVO.getUserid());
					logCookie.setMaxAge(60*60*24*180);
					logCookie.setPath("/");
					res.addCookie(logCookie);
					ses.setMaxInactiveInterval(60*60*24*180);
				}else {
					ses.setMaxInactiveInterval(60*60);
				}
				ses.setAttribute("logId", logVO.getUserid());
				ses.setAttribute("logName", logVO.getMem_name());
				ses.setAttribute("logType", logVO.getMem_type());
				ses.setAttribute("logLoc_gu", logVO.getLoc_gu());
				ses.setAttribute("logProf", logVO.getMem_prof());
				
				service.logCount(logVO.getUserid(), logVO.getLoc_gu());
				
				goPage = "home";
			}else {
				goPage = "member/login";
			}
			
			transactionManager.commit(status);
			
			return goPage;
		}catch (NullPointerException nullpoint) {
			nullpoint.printStackTrace();
			return "member/login";
		}
	}	
// 로그아웃
	@RequestMapping("/logOut")
	public String logOut(HttpServletRequest req, HttpServletResponse res) {
		//쿠키 삭제
		Cookie[] cookies = req.getCookies();
		if(cookies!=null) {
			for(Cookie cookie:cookies) {
				String delCookie = cookie.getValue();
				if(cookie.getValue().equals((String)req.getSession().getAttribute("logId"))) {
					cookie.setMaxAge(0); //쿠키기간 삭제
					cookie.setPath("/");
					delCookie = null;
					res.addCookie(cookie);
				}
			}
		}
		req.getSession().invalidate(); //쿠키삭제하고 세션 삭제해야함
		
		return "home";
	}
//아이디 비밀번호 찾기
	@RequestMapping("/searchIdnPwd")
	public String searchIdnPwd(MemberVO vo) {
		return "member/searchIdnPwd";
	}
	@RequestMapping(value="/searchId", method=RequestMethod.POST)
	public String searchId(MemberVO vo) {
		String returnView = "";
		System.out.println("아이디 찾기 > "+vo.getMem_name()+", "+vo.getMem_email());
		
		String subject = "1ocaler - 아이디 찾기 결과입니다.";
		String content = "";
		
		try {
			String returnUserid = service.searchId(vo);
			if(returnUserid!=null) {
				MimeMessage msg = mailSender.createMimeMessage();
				MimeMessageHelper msgHelper = new MimeMessageHelper(msg, true, "UTF-8");
				msgHelper.setFrom("blueangel728@naver.com"); //보내는 사람
				msgHelper.setTo(vo.getMem_email()); //받는 사람
				msgHelper.setSubject(subject); //제목
				
				content = "찾으신 아이디 : "+returnUserid;
				
				msgHelper.setText("text/html;charset=UTF-8", content);
				mailSender.send(msg); //메일전송
				
				returnView = "member/login";
			}else {
				returnView = "member/historyBack";
			}
		}catch(Exception e) {
			System.out.println("아이디 찾기 에러");
			e.printStackTrace();
			returnView = "member/historyBack";
		}
		return returnView;
	}
	
	@RequestMapping(value="/searchPwd", method=RequestMethod.POST)
	@ResponseBody
	public String searchPwd(MemberVO vo, HttpSession ses) {
		ses.removeAttribute("verifyNum");
		String returnVal = "";
		
		UUID random = UUID.randomUUID(); //랜덤번호
		String uuid = random.toString();
		
		String verifyNum = uuid.substring(0, 7);
		
		String subject = "1ocaler - 비밀번호 찾기 인증번호입니다";
		String content = "";
		
		try {
			String returnPwd = service.searchPwd(vo);
			if(returnPwd!=null) {
				MimeMessage msg = mailSender.createMimeMessage();
				MimeMessageHelper msgHelper = new MimeMessageHelper(msg, true, "UTF-8");
				msgHelper.setFrom("addict520@naver.com"); //보내는 사람
				msgHelper.setTo(vo.getMem_email()); //받는 사람
				msgHelper.setSubject(subject); //제목
				
				content = "인증코드 ? "+verifyNum;
				
				msgHelper.setText("text/html;charset=UTF-8", content);
				mailSender.send(msg); //메일전송
				
				//인증코드 저장
				ses.setAttribute("verifyNum", verifyNum);
				
				returnVal = "Y";
			}else {
				returnVal = "N";
			}
		}catch(Exception e) {
			System.out.println("아이디 찾기 에러");
			e.printStackTrace();
			returnVal = "N";
		}
		return returnVal;
	}
	
	@RequestMapping(value= "/verifiedNumCheck", method=RequestMethod.POST)
	@ResponseBody
	public String verifyNumHolder(String verifyNum, MemberVO vo, HttpServletRequest req, HttpSession ses) {
		String returnVal = "";
		
		String verifyHolder = req.getParameter("verifiedNum"); //입력한 인증번호
		String verifyKeptNum = (String)ses.getAttribute("verifyNum"); //저장한 인증번호
		
		try {
			if(verifyHolder.equals(verifyKeptNum)) {
				String findUserpwd = service.searchPwd(vo);
				
				MimeMessage msg = mailSender.createMimeMessage();
				MimeMessageHelper msgHelper = new MimeMessageHelper(msg, true, "UTF-8");
				
				msgHelper.setFrom("blueangel728@naver.com"); //보내는 사람
				msgHelper.setTo(vo.getMem_email()); //받는 사람
				
				msgHelper.setSubject("1ocaler - 찾으신 비밀번호 입니다."); //제목
				
				msgHelper.setText("text/html;charset=UTF-8", "찾으신 비밀번호 : "+findUserpwd);
				mailSender.send(msg); //메일전송
				
				returnVal = "Y";
			}else {
				returnVal = "N";
			}
		}catch(Exception e) {
			System.out.println("아이디 찾기 에러");
			e.printStackTrace();
			returnVal = "N";
		}
		return returnVal;
	}
	
// 일반회원가입	
	@RequestMapping("/joinMember")
	public String joinMember(HttpSession ses) {
		String reStr = "";
		if(ses.getAttribute("logId")!=null) {
			reStr = "home";
		}else {
			reStr = "member/joinMember";
		}
		return reStr;
	}
	@RequestMapping(value="/memJoinOk", method = RequestMethod.POST) //profFile : 인풋 파일과 이름 다르게 해준다음에 넣어줘야함
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class}) 
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
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		
		try {
			int insertCnt = service.insertMember(vo);
			int insertB = service.insertEventbonus(vo.getUserid());
			
			if(insertCnt>0) {
				//정상구현되면 commit 발생
				transactionManager.commit(status);
				mav.setViewName("redirect:login");
			}else {
				//업로드 파일 삭제하기
				File del = new File(profPath, uploadMemprofname);
				del.delete();
				mav.setViewName("member/historyBack");
			}
		}catch (Exception e) {
			System.out.println("회원가입 에러 발생 > "+e.getMessage());
			mav.setViewName("member/historyBack");
		}
		return mav;
	}
// 회원정보수정	
	@RequestMapping(value="/myinfoUpdate", method=RequestMethod.POST)
	@Transactional(rollbackFor = {Exception.class, RuntimeException.class})
	public ModelAndView myinfoUpdate(MemberVO vo, HttpServletRequest req, HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		
/////////////////////////////////프로필 사진 재업로드부터 실행
		//기존 프로필 파일
		//String path = req.getSession().getServletContext().getRealPath("/img/mem_prof");
		String path = ses.getServletContext().getRealPath("/img/mem_prof");
		String delMemProf=req.getParameter("getMem_prof");
		
		//새로 업로드 할 파일 
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile updateMemprof = mr.getFile("profFile");
		String editProfFile = "";
		
		try {
			if(updateMemprof!=null) {
				String orgName = updateMemprof.getOriginalFilename(); //원 파일명
				if(orgName!=null && !orgName.equals("")) {
					File updateF = new File(path, orgName);
					int idx = 0;
					while(updateF.exists()) {
						int dot = orgName.lastIndexOf(".");
						String fileName = orgName.substring(0, dot);
						String exeName = orgName.substring(dot+1);
						
						updateF = new File(path, fileName+"_"+ idx++ +"."+exeName);
					}
					
					updateMemprof.transferTo(updateF); //파일업로드 실행
					
					//기존 파일 삭제하기
					if(delMemProf!=null) {
						File delF = new File(path, delMemProf);
						delF.delete();
					}
					
					editProfFile = updateF.getName(); //업로드한 파일이름 담기
				}
			}
			
			vo.setUserid((String)req.getSession().getAttribute("logId"));
			vo.setMem_prof(editProfFile); //업로드 할 파일명 세팅
			
			if(service.updateMember(vo)>0) {
				//비밀번호
				MemberVO backVO = myinfoService.setMyinfo(vo.getUserid());
				mav.addObject("userid", backVO.getUserid());
				mav.addObject("userpwd", backVO.getUserpwd());
				mav.setViewName("redirect:myInfo");
			}else {
				
				mav.setViewName("member/historyBack");
			}
		}catch (Exception e) {
			System.out.println("회원정보 수정 에러 발생 > "+e.getMessage());
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
// 닉네임 중복확인
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
	
// 일반회원 탈퇴
	@RequestMapping("/deletMember")
	@Transactional(rollbackFor = {Exception.class, RuntimeException.class})
	public ModelAndView deletMember(HttpSession ses, HttpServletRequest req, HttpServletResponse res, MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)ses.getAttribute("logId");
		int type = (Integer)ses.getAttribute("logType");
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		
		try {
			TransactionStatus status = transactionManager.getTransaction(def);
			//일반회원 상태변경
			if(service.deleteMember(userid)>0) {
				if(type==2) {
					//셀러 회원이면 상태 변경
					service.updateSellerStatus(userid);
				}
				//탈퇴회원 로그에 기록
				vo.setUserid(userid);
				int result = service.insertDelMember(vo);
				if(result>0) {
					//db에 commit하고 페이지 이동
					transactionManager.commit(status);
					Cookie[] cookies = req.getCookies();
					if(cookies!=null) {
						for(Cookie cookie:cookies) {
							String delCookie = cookie.getValue();
							if(cookie.getValue().equals((String)ses.getAttribute("logId"))) {
								cookie.setMaxAge(0); //쿠키기간 삭제
								cookie.setPath("/");
								delCookie = null;
								res.addCookie(cookie);
							}
						}
					}

					ses.invalidate();

					mav.setViewName("redirect:/");
				}
			}else {
				mav.setViewName("member/historyBack");
			}
		}catch(Exception e) {
			System.out.println("회원탈퇴 트랜젝션 에러 ... "+e.getMessage());
			mav.setViewName("member/historyBack");
		}
		return mav;
	}
	
// 셀러회원가입
	@RequestMapping("/joinSeller")
	public String joinSeller(HttpSession ses) {
		String returnAddr = "";
		
		if((Integer)ses.getAttribute("logType")==2) {
			returnAddr = "home";
		}else {
			returnAddr = "member/joinSeller";
		}
		
		return returnAddr;
	}
// 셀러회원가입 비밀번호 재확인
	@RequestMapping(value="/sellerPwdDoubleCheck", method = RequestMethod.GET, produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String sellerPwdDoubleCheck(String userpwd, HttpSession ses) {
		String result = "";
		String userid = (String)ses.getAttribute("logId");
		String checkPwd = service.sellerPwdDoubleCheck(userid, userpwd);

		if(userpwd.equals(checkPwd)) {
			result = "Y"; //셀러회원가입 진행 가능
		}else {
			result = "N"; //셀러회원가입 진행 불가능
		}
		return result;
	}
//셀러회원가입
	@RequestMapping(value="/sellerJoinOk", method = RequestMethod.POST) //sel_profFile : 인풋 파일과 이름 다르게 해준다음에 넣어줘야함
	@Transactional(rollbackFor = {Exception.class, RuntimeException.class})
	public ModelAndView sellerJoinOk(SellerVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
/////////////////////////////////프로필 사진 업로드부터 실행
		//업로드 파일 경로 찾기
		String profPath = req.getSession().getServletContext().getRealPath("/img/sel_prof");
		
		//첨부파일 받아오기 
		MultipartHttpServletRequest sel_mr = (MultipartHttpServletRequest)req;
		MultipartFile sel_prof = sel_mr.getFile("sel_profFile");
		
		String uploadMemprofname = "";
		
		if(sel_prof!=null) {
			String originName = sel_prof.getOriginalFilename();
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
					sel_prof.transferTo(uploadFile);
				}catch(Exception e) {
					System.out.println("멤버 프로필 사진 업로드 에러 발생");
					e.printStackTrace();
				}
				//변경된 파일명을 저장
				uploadMemprofname = uploadFile.getName();
			}
		}
///////////////////////////////// DB 작업 시작		
		vo.setSel_prof(uploadMemprofname);
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		try {
			TransactionStatus status = transactionManager.getTransaction(def);
			int insertCnt = service.insertSeller(vo);
			service.updateMemStatus(vo.getUserid()); //회원상태 업데이트
			transactionManager.commit(status);
			
			if(insertCnt>0) {
				mav.setViewName("home"); //추후에 셀러페이지로 이동으로 바꾸기
			}else {
				//업로드 파일 삭제하기
				File del = new File(profPath, uploadMemprofname);
				del.delete();
				mav.setViewName("member/historyBack"); //뒤로가기
			}
		}catch(Exception e) {
			System.out.println("셀러회원 트랜젝션 에러 "+e.getMessage());
			mav.setViewName("member/historyBack"); //뒤로가기
		}
		return mav;
	}

//셀러회원정보 조회
	@RequestMapping("/myInfoSeller")
	public String myInfoSeller(HttpSession ses, Model model) {
		String setMapping = "";
		String userid = (String)ses.getAttribute("logId");
		
		if(userid!=null) {
			model.addAttribute("myVO", service.selectSeller(userid));
			setMapping = "myInfo/myInfoSeller";
		}else {
			setMapping = "member/login";
		}
		return setMapping;
	}
//셀러정보 수정하기 myinfoSellerOk	
	@RequestMapping(value="/myinfoSellerOk", method=RequestMethod.POST)
	@Transactional(rollbackFor = {Exception.class, RuntimeException.class})
	public ModelAndView myinfoSellerOk(SellerVO vo, HttpServletRequest req, HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		
/////////////////////////////////프로필 사진 재업로드부터 실행
		//기존 프로필 파일
		//String path = req.getSession().getServletContext().getRealPath("/img/mem_prof");
		String path = ses.getServletContext().getRealPath("/img/mem_prof");
		String delMemProf=req.getParameter("getMem_prof");
		
		//새로 업로드 할 파일 
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile updateMemprof = mr.getFile("profFile");
		String editProfFile = "";
		
		try {
			if(updateMemprof!=null) {
				String orgName = updateMemprof.getOriginalFilename(); //원 파일명
				if(orgName!=null && !orgName.equals("")) {
					File updateF = new File(path, orgName);
					int idx = 0;
					while(updateF.exists()) {
						int dot = orgName.lastIndexOf(".");
						String fileName = orgName.substring(0, dot);
						String exeName = orgName.substring(dot+1);
						
						updateF = new File(path, fileName+"_"+ idx++ +"."+exeName);
					}
					updateMemprof.transferTo(updateF); //파일업로드 실행
					
					//기존 파일 삭제하기
					if(delMemProf!=null) {
						File delF = new File(path, delMemProf);
						delF.delete();
					}
					
					editProfFile = updateF.getName(); //업로드한 파일이름 담기
				}
			}
			
			vo.setUserid((String)req.getSession().getAttribute("logId"));
			vo.setSel_prof(editProfFile); //업로드 할 파일명 세팅
			
			if(service.updateSeller(vo)>0) {
				mav.setViewName("redirect:myInfoSeller");
			}else {
				
				mav.setViewName("member/historyBack");
			}
		}catch (Exception e) {
			System.out.println("회원정보 수정 에러 발생 > "+e.getMessage());
			mav.setViewName("member/historyBack");
		}
		return mav;
	}
}//전체 클래스 끝