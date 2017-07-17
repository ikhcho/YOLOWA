import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.bit.busi.vo.HouseVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:config/**/*.xml")
public class temp {

	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;
	
	@Test
	public void 테스트() throws Exception {
		
		HouseVO house = SqlSessionTemplate.selectOne("user.getHouseDetail", 1);
		
		System.out.println(house);
	}
}
