package com.skycat.good.comment.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.skycat.base.service.BaseService;
import com.skycat.good.comment.entity.GoodComment;


public interface GoodCommentService extends BaseService<GoodComment> {
	 /**
     * 根据商品ID,查询属于该商品的所有评论，评论包括评论文本，评论用户，评论图片
     * @param id
     * @return
     */
    public PageInfo<GoodComment> selectGoodCommentbyGoodId(Integer id,Integer pageNum,Integer pageSize);
    /**
     * 插入商品评论
     * @param goodComment
     * @param fileNames
     * @return
     */
    int insertGoodComment(GoodComment goodComment,List<String> fileNames);
    
}
