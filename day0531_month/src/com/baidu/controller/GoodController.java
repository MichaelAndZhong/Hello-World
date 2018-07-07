


package com.baidu.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baidu.entity.Good;
import com.baidu.mapper.GoodMapper;

/**
* @author zhengyang
* @version 创建时间：2018年5月31日 上午8:41:54
* 类的说明：
* 功能:列表，全选，全不选，商品入库，商品出库，查看商品入库记录，查看商品出库记录
*/
@Controller
public class GoodController {
	//测试框架
	@RequestMapping("test")
	@ResponseBody
	public String  test(){
		return "success";
	}
	
	/**
	 * 实例化映射层对象
	 * 
	 */
	@Autowired
	private GoodMapper mapper;
	
	
	/**
	 * 获取商品的列表功能
	 */
	@RequestMapping("list")
	public String getGoodList(Model model){
		
		List<Good> list=mapper.getGoodList();
		
		model.addAttribute("list", list);
		return "list";
	}
	
	/**
	 * 跳转到商品入库页面
	 */
	@RequestMapping("toadd")
	public String toadd(){
		return "add";
	}
	
	/**
	 * 根据id查询库存信息
	 */
	@RequestMapping("getGoodById")
	@ResponseBody
	public HashMap<Object, Object> getGoodById(Integer gid){
		Good good=mapper.getGoodById(gid);
		HashMap<Object,Object> map = new HashMap<>();
		map.put("good", good);
		return map;
	}
	
	/**
	 * 根据id查询库存信息
	 */
	@RequestMapping("getGoodInById")
	@ResponseBody
	public HashMap<Object, Object> getGoodInById(Integer gid){
		Good g=mapper.getGoodInById(gid);
		HashMap<Object,Object> map = new HashMap<>();
		map.put("good", g);
		return map;
	}
	
	/**
	 * 商品入库
	 */
	@RequestMapping("ruku")
	@ResponseBody
	public boolean GoodIn(Good good){
		try {
			mapper.GoodIn(good);
			//mapper.updateTableIn(good);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	
	/**
	 * 跳转到商品出库页面
	 */
	@RequestMapping("toOut")
	public String toOut(){
		return "out";
	}
	
	/**
	 * 商品出库
	 */
	@RequestMapping("chuku")
	@ResponseBody
	public boolean GoodOut(Good good){
		try {
			mapper.GoodOut(good);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	/**
	 * 查看入库记录，跳转页面
	 */
	@RequestMapping("checkIn")
	public String checkIn(){
		return "checkIn";
	}
	
	/**
	 * 查看出库记录，跳转页面
	 */
	@RequestMapping("checkOut")
	public String checkOut(){
		return "checkOut";
	}
	
	
}
