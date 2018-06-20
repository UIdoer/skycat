package RollImage;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.skycat.base.BaseTest;
import com.skycat.rollimage.dao.RollImageMapper;
import com.skycat.rollimage.entity.RollImage;

public class TestRollImage extends BaseTest{
	@Autowired
	RollImageMapper rollImageMapper;
	
	@Test
	public void testSelectRollImageByStatus(){
		List<RollImage> i = rollImageMapper.selectRollImagesByStatus(0);
		System.out.println(i);
	}
	

}
