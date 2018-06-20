package com.skycat.good.comment.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.skycat.category.entity.Category;
import com.skycat.category.service.CategoryService;
import com.skycat.good.comment.entity.GoodComment;
import com.skycat.good.comment.service.GoodCommentService;
import com.skycat.user.info.entity.User;
import com.skycat.utils.FileUploadUtil;

@Controller
@RequestMapping("/goodComment")
public class CommentController {
	@Autowired
	GoodCommentService goodCommentService;
	@Autowired
	CategoryService categoryService;
	@RequestMapping("/findGoodComment")
	@ResponseBody
	public Map<String,Object> findGoodCommnet(Integer goodId,@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,@RequestParam(value="pageSize",defaultValue="5")Integer pageSize){
		Map<String,Object> map = new HashMap<String,Object>();
		PageInfo<GoodComment> list = goodCommentService.selectGoodCommentbyGoodId(goodId, pageNum, pageSize);
		map.put("currentPage", list);
		System.out.println(pageNum);
		System.out.println(list);
		return map;	
	}
	
	@RequestMapping("/toGoodComment")
	public String toGoodComment(@RequestParam(value="goodId",required=false)Integer goodId ,ModelMap map){
		
		//获取所有类目与分类
		List<Category> categorys = categoryService.selectAllCategory();
		map.put("categorys", categorys);
		map.put("goodId", goodId);
		return "front/UserComment";
	}
	
	
	
	@RequestMapping("/doGoodComment")
	public String doGoodComment(@RequestParam("files") MultipartFile[] files,
			@RequestParam(value = "comGrade", defaultValue = "0") Integer comGrade,
			@RequestParam(value = "comText", defaultValue = "默认好评") String comText, Integer goodId,
			HttpServletRequest request, ModelMap map) {

		// 获取当前用户
		User user = (User) request.getSession().getAttribute("user");
		if (user != null&& goodId != null) {
			Integer userId = user.getUserId();
			//初始化上传个数
			List<String> fileNames = new ArrayList<String>(4);
			for (int i = 0; i < 4; i++) {
				fileNames.add(null);
			}
			int j=0;
			for (MultipartFile file : files) {
				// 得到原始文件名
				String oriname = file.getOriginalFilename();

				if (oriname != null && !oriname.equals("")) {
					String originalFilename = file.getOriginalFilename();
					// 获取文件类型
					String type = originalFilename.substring(originalFilename.lastIndexOf("."));
					boolean flag = checkType(type);
					// 格式不对返回去
					if (!flag) {
						map.put("msg", "图片格式必须是：.jpg,.png,jpeg,.gig");
						map.put("goodId", goodId);
						return "front/UserComment";
					}
					// 自定义文件
					String fileName = UUID.randomUUID().toString() + type;
					fileNames.add(j, fileName);
					j++;
					
					String realPath = request.getServletContext().getRealPath("upload");
					File targetFile = new File(realPath, fileName);
					if (!targetFile.exists()) {
						targetFile.mkdirs();
					}
					try {
						file.transferTo(targetFile);
						FileUploadUtil.uploadImage(targetFile, "comment/"+fileName);
						targetFile.delete();	
					} catch (IllegalStateException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

			}
			GoodComment goodComment = new GoodComment();
			goodComment.setComGrade(comGrade);
			goodComment.setComText(comText);
			goodComment.setUserId(userId);
			goodComment.setGoodId(goodId);
			int i = goodCommentService.insertGoodComment(goodComment, fileNames);
			if(i>0){
				return "redirect:/user/order/list";
			}else{
				map.put("msg", "评论失败，重新评论");
				map.put("goodId", goodId);
			}
		}
		
		return "front/UserComment";
	}

	/**
	 * 上传图片限制格式判断方法
	 * 
	 * @param type
	 * @return
	 */
	public boolean checkType(String type) {

		if (type.equals(".jpg") || type.equals(".png") || type.equals(".jpeg") || type.equals(".gif")) {
			return true;
		}
		return false;
	}
		
		
	
}
