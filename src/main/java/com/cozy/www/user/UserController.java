package com.cozy.www.user;


import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping(value = "/logout", method = {RequestMethod.GET})
	public String logout(Locale locale, Model model) {				
		return "user/logout";
	}
	
	@RequestMapping(value = "/", method = {RequestMethod.GET})
	public String home(Locale locale, Model model) {				
		return "user/home";
	}
	@RequestMapping(value = "/", method = {RequestMethod.POST})
	public String home2(String uid, HttpServletRequest request, HttpServletRequest response) {
		return "user/home";
	}
	
	@RequestMapping("list")
	public String getUserList(Model model) {
		model.addAttribute("userList", userService.list());
		return "user/userList";
	}
	
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String getloginForm(Model model) {
		return "user/loginForm";
	}
	
	@RequestMapping(value = "loginSuccess", method = RequestMethod.POST)
	public String getloginSuccess(@RequestParam("uid") String uid
            , @RequestParam("upwd") String upwd, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String path = "";
		UserVO vo = new UserVO();
		vo.setUid(uid);
        vo.setUpwd(upwd);
        System.out.println("아이디"+uid);
        System.out.println("비밀번호"+upwd);
        Integer result = userService.login(vo);
        if(result == 1) {
            path = "redirect:/";
            HttpSession session = request.getSession();
            session.setAttribute("uid", uid);
        } else {
            path = "/user/loginForm";
        }
		return path;
		
	}
	
	@RequestMapping(value = "userInputForm", method = RequestMethod.GET)
	public String getjoinForm(UserVO user) {
		return "user/userInputForm";
	}
	
	@RequestMapping(value = "userInsert", method = RequestMethod.POST)
	public String insert(Model model, UserVO vo) {
		model.addAttribute("userInsert", userService.insert(vo));
		return "user/loginForm";
	}
	
	
}
