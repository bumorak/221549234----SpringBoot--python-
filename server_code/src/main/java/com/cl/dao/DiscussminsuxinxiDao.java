package com.cl.dao;

import com.cl.entity.DiscussminsuxinxiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.DiscussminsuxinxiView;


/**
 * 民宿信息评论表
 * 
 * @author 
 * @email 
 * @date 2024-02-21 23:26:47
 */
public interface DiscussminsuxinxiDao extends BaseMapper<DiscussminsuxinxiEntity> {
	
	List<DiscussminsuxinxiView> selectListView(@Param("ew") Wrapper<DiscussminsuxinxiEntity> wrapper);

	List<DiscussminsuxinxiView> selectListView(Pagination page,@Param("ew") Wrapper<DiscussminsuxinxiEntity> wrapper);
	
	DiscussminsuxinxiView selectView(@Param("ew") Wrapper<DiscussminsuxinxiEntity> wrapper);
	

}
