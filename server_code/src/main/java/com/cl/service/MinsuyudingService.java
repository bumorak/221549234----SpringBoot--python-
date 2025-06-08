package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.utils.PageUtils;
import com.cl.entity.MinsuyudingEntity;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.MinsuyudingView;


/**
 * 民宿预订
 *
 * @author 
 * @email 
 * @date 2024-02-21 23:26:47
 */
public interface MinsuyudingService extends IService<MinsuyudingEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<MinsuyudingView> selectListView(Wrapper<MinsuyudingEntity> wrapper);
   	
   	MinsuyudingView selectView(@Param("ew") Wrapper<MinsuyudingEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<MinsuyudingEntity> wrapper);
   	

}

