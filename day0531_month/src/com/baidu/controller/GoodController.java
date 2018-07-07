


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
* @version ����ʱ�䣺2018��5��31�� ����8:41:54
* ���˵����
* ����:�б�ȫѡ��ȫ��ѡ����Ʒ��⣬��Ʒ���⣬�鿴��Ʒ����¼���鿴��Ʒ�����¼
*/
@Controller
public class GoodController {
	//���Կ��
	@RequestMapping("test")
	@ResponseBody
	public String  test(){
		return "success";
	}
	
	/**
	 * ʵ����ӳ������
	 * 
	 */
	@Autowired
	private GoodMapper mapper;
	
	
	/**
	 * ��ȡ��Ʒ���б���
	 */
	@RequestMapping("list")
	public String getGoodList(Model model){
		
		List<Good> list=mapper.getGoodList();
		
		model.addAttribute("list", list);
		return "list";
	}
	
	/**
	 * ��ת����Ʒ���ҳ��
	 */
	@RequestMapping("toadd")
	public String toadd(){
		return "add";
	}
	
	/**
	 * ����id��ѯ�����Ϣ
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
	 * ����id��ѯ�����Ϣ
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
	 * ��Ʒ���
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
	 * ��ת����Ʒ����ҳ��
	 */
	@RequestMapping("toOut")
	public String toOut(){
		return "out";
	}
	
	/**
	 * ��Ʒ����
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
	 * �鿴����¼����תҳ��
	 */
	@RequestMapping("checkIn")
	public String checkIn(){
		return "checkIn";
	}
	
	/**
	 * �鿴�����¼����תҳ��
	 */
	@RequestMapping("checkOut")
	public String checkOut(){
		return "checkOut";
	}
	
	
}
