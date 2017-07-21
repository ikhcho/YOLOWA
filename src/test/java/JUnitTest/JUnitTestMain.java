package JUnitTest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.bit.admin.service.AdminService;
import kr.co.bit.admin.vo.ApproveVO;
import kr.co.bit.admin.vo.CommentBlindVO;
import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.detail.dao.DetailDAO;
import kr.co.bit.detail.service.DetailService;
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
	private DetailDAO ddao;
	
	@Autowired
	private UserService uservice;
	
	@Autowired
	private DetailService dservice;
	
	@Autowired
	private AdminService aservice;
	
	@Test
	public void 테스트() throws Exception {
		
		//HouseVO house = SqlSessionTemplate.selectOne("user.houseDetail", 1);
		//HouseVO house = udao.houseDetail(1);
		//HouseVO house = uservice.houseDetail(1);
		
		//HouseVO house = dservice.houseDetail(1);
		
		//HouseVO house = (HouseVO)request.getAttribute("houseVO");
		
		//List<CommentBlindVO> commentBlindList = aservice.getCommentBlindList();
		
		//int commentBlindCount = aservice.getCommentBlindCount(1);
		
		//aservice.joinPartner(new ApproveVO(1, "32y"));
		
		//aservice.addCommentBlind(new CommentBlindVO(1, 2));
		
		List<ApproveVO> list = aservice.getApproveList("보류");
		
		System.out.println(list);
	}
}
