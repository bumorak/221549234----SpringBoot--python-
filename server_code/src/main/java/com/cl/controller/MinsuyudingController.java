package com.cl.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.cl.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.cl.annotation.IgnoreAuth;

import com.cl.entity.MinsuyudingEntity;
import com.cl.entity.view.MinsuyudingView;

import com.cl.service.MinsuyudingService;
import com.cl.service.TokenService;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import com.cl.utils.EncryptUtil;
import com.cl.utils.MPUtil;
import com.cl.utils.CommonUtil;
import java.io.IOException;

/**
 * 民宿预订
 * 后端接口
 * @author 
 * @email 
 * @date 2024-02-21 23:26:47
 */
@RestController
@RequestMapping("/minsuyuding")
public class MinsuyudingController {
    @Autowired
    private MinsuyudingService minsuyudingService;



    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,MinsuyudingEntity minsuyuding,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yonghu")) {
			minsuyuding.setYonghuzhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<MinsuyudingEntity> ew = new EntityWrapper<MinsuyudingEntity>();

		PageUtils page = minsuyudingService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, minsuyuding), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,MinsuyudingEntity minsuyuding, 
		HttpServletRequest request){
        EntityWrapper<MinsuyudingEntity> ew = new EntityWrapper<MinsuyudingEntity>();

		PageUtils page = minsuyudingService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, minsuyuding), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( MinsuyudingEntity minsuyuding){
       	EntityWrapper<MinsuyudingEntity> ew = new EntityWrapper<MinsuyudingEntity>();
      	ew.allEq(MPUtil.allEQMapPre( minsuyuding, "minsuyuding")); 
        return R.ok().put("data", minsuyudingService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(MinsuyudingEntity minsuyuding){
        EntityWrapper< MinsuyudingEntity> ew = new EntityWrapper< MinsuyudingEntity>();
 		ew.allEq(MPUtil.allEQMapPre( minsuyuding, "minsuyuding")); 
		MinsuyudingView minsuyudingView =  minsuyudingService.selectView(ew);
		return R.ok("查询民宿预订成功").put("data", minsuyudingView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        MinsuyudingEntity minsuyuding = minsuyudingService.selectById(id);
		minsuyuding = minsuyudingService.selectView(new EntityWrapper<MinsuyudingEntity>().eq("id", id));
        return R.ok().put("data", minsuyuding);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        MinsuyudingEntity minsuyuding = minsuyudingService.selectById(id);
		minsuyuding = minsuyudingService.selectView(new EntityWrapper<MinsuyudingEntity>().eq("id", id));
        return R.ok().put("data", minsuyuding);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody MinsuyudingEntity minsuyuding, HttpServletRequest request){
    	minsuyuding.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(minsuyuding);
        minsuyudingService.insert(minsuyuding);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody MinsuyudingEntity minsuyuding, HttpServletRequest request){
    	minsuyuding.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(minsuyuding);
        minsuyudingService.insert(minsuyuding);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody MinsuyudingEntity minsuyuding, HttpServletRequest request){
        //ValidatorUtils.validateEntity(minsuyuding);
        minsuyudingService.updateById(minsuyuding);//全部更新
        return R.ok();
    }

    /**
     * 审核
     */
    @RequestMapping("/shBatch")
    @Transactional
    public R update(@RequestBody Long[] ids, @RequestParam String sfsh, @RequestParam String shhf){
        List<MinsuyudingEntity> list = new ArrayList<MinsuyudingEntity>();
        for(Long id : ids) {
            MinsuyudingEntity minsuyuding = minsuyudingService.selectById(id);
            minsuyuding.setSfsh(sfsh);
            minsuyuding.setShhf(shhf);
            list.add(minsuyuding);
        }
        minsuyudingService.updateBatchById(list);
        return R.ok();
    }


    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        minsuyudingService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	








}
