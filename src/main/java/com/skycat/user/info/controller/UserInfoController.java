package com.skycat.user.info.controller;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageInfo;
import com.skycat.base.entity.ResultObject;
import com.skycat.user.info.entity.User;
import com.skycat.user.info.entity.UserPageCondition;
import com.skycat.user.info.service.UserService;
import com.skycat.user.info.util.MD5Utils;
import com.skycat.user.info.util.MailUtil;
import com.skycat.utils.FileUploadUtil;

@Controller
@RequestMapping("user")
public class UserInfoController {
	
	@Autowired
	UserService userService;
	@RequestMapping("/toLogin")
	public String toLogin(){
		return "front/Login";
	}
	
	@RequestMapping("collect")
	public String toCollect(){
		return "front/Member_Collect";
	}
	/**
	 * 登录后台校验
	 * @return
	 */
	@RequestMapping("/doLogin")
	public String doLogin(User user,HttpSession session,ModelMap model){
		User userInDB = userService.selectByPwdName(user);
		if (userInDB!=null) {
			session.setAttribute("user", userInDB);
			session.setMaxInactiveInterval(60*60);
			return "redirect:/Index";
		}    
			model.put("msg","用户不存在! 请检查您的登录信息是否有误！");
			return "front/Login";
	}
	@RequestMapping("/exits")
	public String toExits(HttpSession session) {
		session.removeAttribute("user");//清除用户
		return "redirect:/Index";
	}
	@RequestMapping("/toRegist")
	public String toRegister(){
		return "front/Regist";
	}
	/**
	 *注册用户数据
	 */
	@RequestMapping("/doRegist")
	public String doRegister(User user,String ucode,ModelMap model,HttpSession session,RedirectAttributes attr){
		//获取注册页面生成的验证码
		String vcode = (String) session.getAttribute("vcode");
		if (vcode.equals(ucode)) {
			int i = userService.insertSelective(user);
			if (i==1) {
				attr.addFlashAttribute("user",user);
				return "redirect:/user/toLogin";
			}
		} else {
			model.put("msg", "验证码错误！");
			return "front/Regist";
		}
		model.put("msg", "注册失败，请重新注册！");
		return "front/Regist";
	}
	
	@RequestMapping("/toFindPwd")
	public String toFindPwd() {
		return "front/Find_Pwd";
	}
	
	/**
	 * 找回密码方式一：密保找回
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/doFindPwd1")
	public HashMap<String, Object> doFindPwd(String userName,Boolean verify,ModelMap model,RedirectAttributes attr) {
		
		HashMap<String, Object> map = new HashMap<String,Object>();
		System.out.println(userName);
		System.out.println(verify);
		if (!verify) {
			map.put("num", 0);
			map.put("msg", "请按提示进行验证！");
			return map;
		}
		if (userName!=null&&userName!="") {
			User user = userService.selectByUserName(userName);
			System.out.println(user);
			if (user!=null) {
				map.put("userId", user.getUserId());
				map.put("num", 1);
				return map;
			}
			map.put("num", 2);
			map.put("msg", "用户不存在！");
			return map;
		}
		map.put("msg", "信息有误请重新输入!");
		map.put("num", 3);
		return map;
	}
	/**
	 * 找回密码方式一：判断用户是否有密保问题
	 * @return
	 */
	@RequestMapping("/toFindByAnswer")
	public String toFindByAnswer(
			@RequestParam(value="userId",defaultValue="0")Integer userId,
			HttpSession session,ModelMap model) {
		
		User userInfo = userService.selectByPrimaryKey(userId);
		System.out.println(userInfo);
		if (userInfo.getQuestion1()!=null||userInfo.getQuestion2()!=null||userInfo.getQuestion3()!=null) {
			model.put("userInfo", userInfo);
			return "front/Find_By_Answer";
		}
		model.put("msg","请先输入正确信息！");
		return "front/Find_Pwd";
	} 
	/**
	 * 密保找回
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/doFindByAnswer")
	public HashMap<String, Object> doFindByAnswer(
			@RequestParam(value="userId",defaultValue="0")Integer userId,
			ModelMap model,RedirectAttributes attr,HttpServletRequest request,String answer1,String answer2,String answer3){
		HashMap<String, Object> map = new HashMap<String,Object>();
		User userInfo = userService.selectByPrimaryKey(userId);
		int i=0;
		if (answer1!=null) {
			if (answer1.equals(userInfo.getAnswer1())) {
				i++;
			}
		}
		if (answer2!=null) {
			if (answer2.equals(userInfo.getAnswer2())) {
				i++;
			}
		}
		if (answer3!=null) {
			if (answer3.equals(userInfo.getAnswer3())) {
				i++;
			}
		}
		if (i>=2) {
			map.put("result", 1);
			map.put("pwd",userInfo.getUserPassword());
			return map; 
		} else {
			map.put("msg", "您有两个或以上答案错误，请仔细核对填写！");
			map.put("result", 0);
			return map; 
		}
	}
	/**
	 * 用户修改密码
	 * @return
	 */
	@RequestMapping("/toRevisePwd")
	public String toRevisePwd(@RequestParam(value="userId",defaultValue="0")Integer userId,
			ModelMap model) {
		model.put("userId", userId);
		return "back/revise_password";
	}
	/**
	 * 验证邮箱
	 * @return
	 * @throws IOException 
	 * @throws MessagingException 
	 * @throws AddressException 
	 */
	@ResponseBody
	@RequestMapping(value="/doSendMail",method=RequestMethod.GET)
	public HashMap<String, Object> toSendMail(
			@RequestParam(value="userId",defaultValue="0")Integer userId,
			@RequestParam String email,HttpSession session) throws AddressException, MessagingException, IOException {
		HashMap<String, Object> map = new HashMap<String,Object>();
		System.out.println(email);
		System.out.println(userId);
		//User user = userService.selectUserByEmail(email);
		User user=userService.selectByPrimaryKey(userId);
		System.out.println(user);
		if (user!=null) {
			if (user.getEmail().equals(email)) {
				String str = MailUtil.strRandom();
				System.out.println(str);
				session.setAttribute("str",str);
				session.setAttribute("users", user);
				map.put("result", 1);
				MailUtil.sendMail(str,user.getUserName(),user.getEmail());
				return map;
			}
		}
		map.put("result", 0);
		return map;
	}
	/**
	 * 验证邮箱发送的信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/doMailVerify",method=RequestMethod.GET)
	public HashMap<String, Object> toMailVerify(@RequestParam String strMsg,ModelMap model,HttpServletRequest request)  {
		String str=(String) request.getSession().getAttribute("str");
		HashMap<String, Object> map = new HashMap<String,Object>();
		System.out.println(strMsg+"..."+str);
		if (str.equalsIgnoreCase(strMsg)) {
			map.put("result",1);
			request.setAttribute("ver",1);
			return map;
		}
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/doRevisePwd",method=RequestMethod.POST)
	public HashMap<String,Object> doRevisePwd(User user,String newPwd,HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		User users = (User) request.getSession().getAttribute("users");
		String pwd=MD5Utils.getPwd(user.getUserPassword());
		System.out.println(user);
		System.out.println(users);
		if (users==null) {
			map.put("result", -1);
			return map;
		}
		int i=0;
		if (!user.getUserName().equals(users.getUserName())) {
			map.put("result", 3);
			i++;
			return map;
		}
		if (!pwd.equals(users.getUserPassword())) {
			map.put("result", 2);
			i++;
			System.out.println(i);
			return map;
		}
		if (i==0) {
			map.put("result", 1);
			userService.updatePwd(users.getUserId(), newPwd);
			return map;
		}else{
			map.put("result", 0);
			System.out.println(i);
			return map;
		}
	}
	/**
	 * 用户信息查询
	 * @return
	 */
	@RequestMapping("/info")
	public String list(@RequestParam(value="userId",defaultValue="0")Integer userId,ModelMap model) {
		User userInfo = userService.selectByPrimaryKey(userId);
		model.put("userInfo", userInfo);
		return "front/Member_User";
	}
	/**
	 * 用户信息修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/doUserUpdate",method=RequestMethod.POST)
	public HashMap<String,Object> toUserCollect(User user,HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		int i = userService.updateByPrimaryKeySelective(user);
		if (i==1) {
			map.put("result",1);
			return map;
		}
		map.put("result",0);
		return map;
	}
	//@ResponseBody
	@RequestMapping(value="/doPhoto",method=RequestMethod.POST)
	public String AddProduct(
			@RequestParam(value="userId",defaultValue="0")Integer userId,
			@RequestParam("file")MultipartFile file,
			ModelMap model,HttpServletRequest request) {
		 HashMap<String, Object> map = new HashMap<String,Object>();
		   String realPath = request.getServletContext().getRealPath("upload");
		// 得到原始文件名
			String oriname = file.getOriginalFilename();
            User user=new User();
            user.setUserId(userId);
            
			if (oriname != null && !oriname.equals("")) {
				String originalFilename = file.getOriginalFilename();
				// 获取文件类型
				String type = originalFilename.substring(originalFilename.lastIndexOf("."));
				if(!".png".equalsIgnoreCase(type)&&!".jpg".equalsIgnoreCase(type)&&!".jpeg".equalsIgnoreCase(type)){
					System.out.println(type);
					map.put("msg", "图片格式必须是：.jpg,.png,.jpeg");
					return "front/Member_User";
				}   
				// 自定义文件
				String fileName = UUID.randomUUID().toString() + type;
				
				user.setPicture("headpic/"+fileName);
	            int i=userService.updatePicture(user);
	            
				File targetFile = new File(realPath, fileName);
				
				if (!targetFile.exists()) {
					targetFile.mkdirs();
				}
				try {
					file.transferTo(targetFile);
					FileUploadUtil.uploadImage(targetFile, "headpic/"+fileName);
					targetFile.delete();
					
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			return "redirect:/user/info?userId="+userId;

	}
	@RequestMapping("comment")
	public String commentlist() {
		return "front/Member_Comment";
	}

	@RequestMapping("toIndex")
	public String toIndex() {
		return "redirect:/Index";
	}

	/**
	 * 后台：查找全部用户
	 * @return
	 */
	@RequestMapping("find")
	@RequiresRoles("systemManager")
	public String findAll(@RequestParam(value="pageNum",defaultValue="1")String pageNum,@RequestParam(value="pageSize",defaultValue="10")String pageSize,ModelMap map) {
		PageInfo<User> page = userService.selectPage(Integer.valueOf(pageNum), Integer.valueOf(pageSize));
		map.put("page", page);
		return "back/user_list";
	}
	
	/**
	 * 待条件的查找用户
	 * @param pageNum
	 * @param pageSize
	 * @param condition 封装的条件对象
	 * @param map
	 * @return
	 */
	@RequestMapping("findByCondition")
	@RequiresRoles("systemManager")
	public String findByCondition(@RequestParam(value="pageNum",defaultValue="1")String pageNum,@RequestParam(value="pageSize",defaultValue="10")String pageSize,UserPageCondition condition,ModelMap map) {
		condition.setPageNum(Integer.valueOf(pageNum));
		condition.setPageSize(Integer.valueOf(pageSize));
		PageInfo<User> page = userService.selectByCondition(condition);
		map.put("page", page);
		map.put("condition", condition);
		return "back/user_list";
	}
	
	/**
	 * 根据id查出用户的所有信息，跳转到修改页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("toModify")
	@RequiresRoles("systemManager")
	public String toModify(String id,ModelMap map) {
		User user = userService.selectByPrimaryKey(Integer.valueOf(id));
		map.put("user", user);
		return "back/edit_user";
	}
	
	@RequestMapping("doModify")
	@RequiresRoles("systemManager")
	@ResponseBody
	public ResultObject doModify(User user) {
		int i = userService.updateByPrimaryKeySelective(user);
		ResultObject ro;
		if(i>0) {
			ro=new ResultObject(user,"success");
		}else {
			ro=new ResultObject(null,"update fail");
		}
		return ro;
	}
	
}
