package com.skycat.good.comment.dao;

import java.util.List;

import com.skycat.annotation.MyBatisAnnotation;
import com.skycat.base.dao.BaseMapper;
import com.skycat.good.comment.entity.GoodComment;

@MyBatisAnnotation
public interface GoodCommentMapper extends BaseMapper<GoodComment>{
    int deleteByPrimaryKey(Integer commentId);
    
    int insert(GoodComment record);

    int insertSelective(GoodComment record);

    GoodComment selectByPrimaryKey(Integer commentId);

    int updateByPrimaryKeySelective(GoodComment record);

    int updateByPrimaryKey(GoodComment record);
    
    /**
     * 根据商品ID,查询属于该商品的所有评论，评论包括评论文本，评论用户，评论图片
     * @param id
     * @return
     */
    public List<GoodComment> selectGoodCommentbyGoodId(Integer id);
    
    
    
    
}