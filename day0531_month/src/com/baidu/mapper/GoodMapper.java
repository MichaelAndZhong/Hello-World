


package com.baidu.mapper;

import java.util.List;

import com.baidu.entity.Good;

/**
* @author zhengyang
* @version ����ʱ�䣺2018��5��31�� ����8:49:40
* ���˵����
*/
public interface GoodMapper {

	List<Good> getGoodList();

	Good getGoodById(Integer gid);

	void GoodIn(Good good);

	void GoodOut(Good good);

	Good getGoodInById(Integer gid);

	//void updateTableIn(Good good);

}
