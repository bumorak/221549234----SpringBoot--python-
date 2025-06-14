package com.cl.dao;

import com.cl.entity.MinsuyudingEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.MinsuyudingView;


/**
 * 民宿预订
 * 
 * @author 
 * @email 
 * @date 2024-02-21 23:26:47
 */
public interface MinsuyudingDao extends BaseMapper<MinsuyudingEntity> {
	
	List<MinsuyudingView> selectListView(@Param("ew") Wrapper<MinsuyudingEntity> wrapper);

	List<MinsuyudingView> selectListView(Pagination page,@Param("ew") Wrapper<MinsuyudingEntity> wrapper);
	
	MinsuyudingView selectView(@Param("ew") Wrapper<MinsuyudingEntity> wrapper);
	

}
