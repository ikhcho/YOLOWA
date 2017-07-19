package JUnitTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.user.dao.UserDAO;
import kr.co.bit.user.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("classpath:config/**/*.xml")
public class JUnitTestMain {

	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;
	
	@Autowired
	private UserDAO udao;
	
	@Autowired
	private UserService uservice;
	
	@Test
	public void 테스트() throws Exception {
		
		//HouseVO house = SqlSessionTemplate.selectOne("user.houseDetail", 1);
		//HouseVO house = udao.houseDetail(1);
		HouseVO house = uservice.houseDetail(1);
		
		//HouseVO house = (HouseVO)request.getAttribute("houseVO");
		
		System.out.println(house);
	}
}
