


package com.baidu.mapper;

import java.util.List;

import com.baidu.entity.Good;

/**
* @author zhengyang
* @version 创建时间：2018年5月31日 上午8:49:40
* 类的说明：
*/
public interface GoodMapper {

	List<Good> getGoodList();

	Good getGoodById(Integer gid);

	void GoodIn(Good good);

	void GoodOut(Good good);

	Good getGoodInById(Integer gid);

	//void updateTableIn(Good good);

}
