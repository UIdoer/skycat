package com.skycat.good;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageInfo;
import com.skycat.base.BaseTest;
import com.skycat.good.comment.dao.GoodCommentMapper;
import com.skycat.good.comment.entity.GoodComment;
import com.skycat.good.comment.service.GoodCommentService;

public class TestGoodComment extends BaseTest{
	@Autowired
	GoodCommentMapper goodCommentMapper;
	@Autowired
	GoodCommentService goodCommentService;
	
	
	@Test
	public void testSelectGoodCommentbyGoodId(){
		PageInfo<GoodComment> i = goodCommentService.selectGoodCommentbyGoodId(1, 1, 5);
		System.out.println(i);
	}
	
	@Test
	public void testSelectGoodCommentbyGoodId2(){
		GoodComment goodComment = new GoodComment();
		List<String> fileNames = new ArrayList<String>(4);
		
		goodComment.setComGrade(0);
		goodComment.setComText("超级喜欢");
		goodComment.setUserId(2);
		goodComment.setGoodId(1);
		goodComment.setComTime(new Date());
		
		fileNames.add("asdfffffffffb.png");
		fileNames.add("asdffffffffaf.png");
		fileNames.add(null);
		fileNames.add(null);
		
		
		
		
		
		goodComment.setImg1(fileNames.get(0)==null?null:"comment/"+fileNames.get(0));
		goodComment.setImg2(fileNames.get(1)==null?null:"comment/"+fileNames.get(1));
		goodComment.setImg3(fileNames.get(2)==null?null:"comment/"+fileNames.get(2));
		
		
		int i = goodCommentService.insertGoodComment(goodComment, fileNames);
		System.out.println(i);
	}
	
	@Test
	public void testSelectGoodCommentbyGoodId3(){
		GoodComment goodComment = new GoodComment();
		goodComment.setComGrade(0);
		goodComment.setComText("超级喜欢");
		goodComment.setUserId(2);
		goodComment.setGoodId(1);
		goodComment.setComTime(new Date());
		goodComment.setImg1("e806-4c62-9683-da6b3f7986ae.jpg");
		goodComment.setImg2("e886-4c62-9683-da6b3f7986ae.jpg");
		goodComment.setImg3("e846-4c62-9683-da6b3f7986ae.jpg");
		goodComment.setImg4("e816-4c62-9683-da6b3f7986ae.jpg");
		
		int i = goodCommentMapper.insertSelective(goodComment);
		System.out.println(i);
	}
	
	

}
