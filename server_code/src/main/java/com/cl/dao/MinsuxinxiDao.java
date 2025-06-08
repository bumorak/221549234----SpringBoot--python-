package com.cl.dao;

import com.cl.entity.MinsuxinxiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.MinsuxinxiView;


/**
 * 民宿信息
 * 
 * @author 
 * @email 
 * @date 2024-02-21 23:26:47
 */
public interface MinsuxinxiDao extends BaseMapper<MinsuxinxiEntity> {
	
	List<MinsuxinxiView> selectListView(@Param("ew") Wrapper<MinsuxinxiEntity> wrapper);

	List<MinsuxinxiView> selectListView(Pagination page,@Param("ew") Wrapper<MinsuxinxiEntity> wrapper);
	
	MinsuxinxiView selectView(@Param("ew") Wrapper<MinsuxinxiEntity> wrapper);
	

}
