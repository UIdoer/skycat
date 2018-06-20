package com.skycat.user.address.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.util.StringUtils;
import com.skycat.user.address.dao.UserAddressMapper;
import com.skycat.user.address.entity.UserAddress;
import com.skycat.user.address.service.AddressService;
import com.skycat.user.info.entity.User;

@Controller
@RequestMapping("user/address")
public class AddressController {
	
	@Resource
	UserAddressMapper userAddressMapper;
	
	@Resource
	AddressService addressService;
	
	@RequestMapping("list")
	public String list(HttpSession session,ModelMap model){
		User userInSession = (User) session.getAttribute("user");
		List<UserAddress> address = addressService.selectAllAddressByUserId(userInSession.getUserId());
		model.put("UserAddress", address);
		return "front/Member_Address";
	}
	//判断地址信息的有效性
	public boolean jud(UserAddress userAddress,Map<String,Object> model){
		if(StringUtils.isEmpty(userAddress.getSpecificAddress())){
			model.put("msg", "收货地址不能为空");
			model.put("flag", false);
			return false;
		}
		if(StringUtils.isEmpty(userAddress.getReceiveDetail())){
			model.put("msg", "详细收货地址不能为空");
			model.put("flag", false);
			return false;
		}
		if(StringUtils.isEmpty(userAddress.getReceiveName())){
			model.put("msg", "收货人不能为空");
			model.put("flag", false);
			return false;
		}
		if(StringUtils.isEmpty(userAddress.getReceivePhone())){
			model.put("msg", "手机不能为空");
			model.put("flag", false);
			return false;
		}
		return true;
	}
	/**
	 * @param userAddress 传入的参数
	 * @param address 额外传入 详细地址
	 * @param session 当前会话
	 * @return
	 */
	@RequestMapping("add")
	@ResponseBody
	public Map<String,Object> add(UserAddress userAddress,
			HttpSession session){
		
		Map<String, Object> model = new HashMap<String,Object>();
		boolean jud = jud(userAddress,model);
		//User sessionUser = (User) session.getAttribute("user");
		if(!jud){
			return model;
		}
		
		User userInSession = (User) session.getAttribute("user");
		userAddress.setUserId(userInSession.getUserId());
		int i = addressService.insertAddress(userAddress);
		
		if(i==1){
			model.put("msg", "添加成功!");
			model.put("flag", true);
		}else{
			model.put("msg", "添加失败!");
			model.put("flag", false);
		}
		
		return model;
	}
	
	@RequestMapping("setDefault")
	@ResponseBody
	public Map<String,Object> setDefault(
			@RequestParam("addressId")Integer addressId ,
			HttpSession session){
		User userInSession = (User) session.getAttribute("user");
		HashMap<String, Object> model = new HashMap<String,Object>();
		if(addressId == null ){
			model.put("msg", "请别乱搞!设置默认地址需要你选一个地址!");
			model.put("flag", false);
			return model;
		}
		UserAddress addressInDB = addressService.selectAddressByAddressId(userInSession.getUserId(),addressId);
		if(addressInDB == null ){
			model.put("msg", "别捣乱了!数据库中没有这个地址");
			model.put("flag", false);
			return model;
		}
		int i = addressService.updateSetAddressIsDefault(userInSession.getUserId(), addressId);
		if(i==1){
			model.put("msg","设置默认地址成功！");
			model.put("flag", true);
		}else{
			model.put("msg","设置默认地址失败！");
			model.put("flag", false);
		}
		return model;
	}
	@RequestMapping("delete")
	@ResponseBody
	public Map<String,Object> delete(
			@RequestParam("addressId")Integer addressId ,
			HttpSession session){
		//User sessionUser = (User) session.getAttribute("user");
		HashMap<String, Object> model = new HashMap<String,Object>();
		if(addressId == null ){
			model.put("msg", "请别乱搞!设置默认地址需要你选一个地址!");
			model.put("flag", false);
			return model;
		}
		int i = addressService.deleteByPrimaryKey(addressId);
		if(i == 1 ){
			model.put("msg", "删除成功！");
			model.put("flag", true);
			return model;
		}
		return model;
	}
	@RequestMapping("editor")
	public String toEditor(
			@RequestParam("addressId") Integer addressId,
			HttpSession session,
			ModelMap model){
		list(session, model);
		if(addressId == null){
			model.put("msg", "请点选你要修改的地址");
		    return "front/Member_Address";
		}
		User userInSession = (User) session.getAttribute("user");
		UserAddress address = addressService.selectAddressByAddressId(userInSession.getUserId(), addressId);
		model.put("editor", address);
		return "front/Member_Address_editor";
	}
	@RequestMapping("doEditor")
	public String doEditor(
			UserAddress userAddress,
			HttpSession session,ModelMap model){
		User userInSession = (User) session.getAttribute("user");
		userAddress.setUserId(userInSession.getUserId());
		int i = addressService.editorAddress(userAddress);
		if(i==1){
			model.put("msg", "修改成功!");
		}else{
			model.put("msg", "修改失败!,请联系管理员!");
		}
		return "front/Member_Address";
	}
	@RequestMapping("PopEditor")
	@ResponseBody
	public Map<String,Object> PopEditor(
			@RequestParam("addressId") Integer addressId,
			HttpSession session,
			ModelMap model){
		User userInSession = (User) session.getAttribute("user");
		Map<String, Object> map = new HashMap<String,Object>();
		UserAddress address = addressService.selectAddressByAddressId(userInSession.getUserId(), addressId);
		map.put("address", address);
		return map;
	}
	@RequestMapping("PopDoEditor")
	@ResponseBody
	public Map<String,Object> PopDoEditor(
			UserAddress userAddress,
			HttpSession session,ModelMap model){
		Map<String, Object> map = new HashMap<String,Object>();
		User userInSession = (User) session.getAttribute("user");
		userAddress.setUserId(userInSession.getUserId());
		int i = addressService.editorAddress(userAddress);
		if(i==1){
			map.put("msg", "修改成功!");
			return map;
		}else{
			map.put("msg", "修改失败!,请联系管理员!");
			return map;
		}
	}
}
