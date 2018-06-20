package com.skycat.good.comment.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.skycat.base.service.AbstractBaseServiceImpl;
import com.skycat.good.comment.dao.GoodCommentMapper;
import com.skycat.good.comment.entity.GoodComment;

@Service
public class GoodCommnetServiceImpl extends AbstractBaseServiceImpl< GoodComment> implements GoodCommentService  {
	@Autowired
	GoodCommentMapper  goodCommentMapper;
	
	@Override
	public PageInfo<GoodComment> selectGoodCommentbyGoodId(Integer id, Integer pageNum, Integer pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum,pageSize);
		List<GoodComment> list = goodCommentMapper.selectGoodCommentbyGoodId(id);
		return new PageInfo<>(list, 5);
	}

	@Override
	public int insertGoodComment(GoodComment goodComment, List<String> fileNames) {
		// TODO Auto-generated method stub
		goodComment.setComTime(new Date());
		System.out.println("filenames"+fileNames);
		goodComment.setImg1(fileNames.get(0)==null?null:"comment/"+fileNames.get(0));
		goodComment.setImg2(fileNames.get(1)==null?null:"comment/"+fileNames.get(1));
		goodComment.setImg3(fileNames.get(2)==null?null:"comment/"+fileNames.get(2));
		goodComment.setImg4(fileNames.get(3)==null?null:"comment/"+fileNames.get(3));
		
		return goodCommentMapper.insertSelective(goodComment);
	}

}
