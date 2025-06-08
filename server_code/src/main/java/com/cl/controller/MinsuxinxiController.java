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

import com.cl.entity.MinsuxinxiEntity;
import com.cl.entity.view.MinsuxinxiView;

import com.cl.service.MinsuxinxiService;
import com.cl.service.TokenService;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import com.cl.utils.EncryptUtil;
import com.cl.utils.MPUtil;
import com.cl.utils.CommonUtil;
import java.io.IOException;
import com.cl.service.StoreupService;
import com.cl.entity.StoreupEntity;

/**
 * 民宿信息
 * 后端接口
 * @author 
 * @email 
 * @date 2024-02-21 23:26:47
 */
@RestController
@RequestMapping("/minsuxinxi")
public class MinsuxinxiController {
    @Autowired
    private MinsuxinxiService minsuxinxiService;

    @Autowired
    private StoreupService storeupService;


    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,MinsuxinxiEntity minsuxinxi,
		HttpServletRequest request){
        EntityWrapper<MinsuxinxiEntity> ew = new EntityWrapper<MinsuxinxiEntity>();

		PageUtils page = minsuxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, minsuxinxi), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,MinsuxinxiEntity minsuxinxi, 
		HttpServletRequest request){
        EntityWrapper<MinsuxinxiEntity> ew = new EntityWrapper<MinsuxinxiEntity>();

		PageUtils page = minsuxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, minsuxinxi), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( MinsuxinxiEntity minsuxinxi){
       	EntityWrapper<MinsuxinxiEntity> ew = new EntityWrapper<MinsuxinxiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( minsuxinxi, "minsuxinxi")); 
        return R.ok().put("data", minsuxinxiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(MinsuxinxiEntity minsuxinxi){
        EntityWrapper< MinsuxinxiEntity> ew = new EntityWrapper< MinsuxinxiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( minsuxinxi, "minsuxinxi")); 
		MinsuxinxiView minsuxinxiView =  minsuxinxiService.selectView(ew);
		return R.ok("查询民宿信息成功").put("data", minsuxinxiView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        MinsuxinxiEntity minsuxinxi = minsuxinxiService.selectById(id);
		minsuxinxi = minsuxinxiService.selectView(new EntityWrapper<MinsuxinxiEntity>().eq("id", id));
        return R.ok().put("data", minsuxinxi);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        MinsuxinxiEntity minsuxinxi = minsuxinxiService.selectById(id);
		minsuxinxi = minsuxinxiService.selectView(new EntityWrapper<MinsuxinxiEntity>().eq("id", id));
        return R.ok().put("data", minsuxinxi);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody MinsuxinxiEntity minsuxinxi, HttpServletRequest request){
    	minsuxinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(minsuxinxi);
        minsuxinxiService.insert(minsuxinxi);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody MinsuxinxiEntity minsuxinxi, HttpServletRequest request){
    	minsuxinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(minsuxinxi);
        minsuxinxiService.insert(minsuxinxi);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody MinsuxinxiEntity minsuxinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(minsuxinxi);
        minsuxinxiService.updateById(minsuxinxi);//全部更新
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        minsuxinxiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	








}
