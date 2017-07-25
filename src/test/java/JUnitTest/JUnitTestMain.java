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
import kr.co.bit.admin.vo.HouseBlindVO;
import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.detail.dao.DetailDAO;
import kr.co.bit.detail.service.DetailService;
import kr.co.bit.user.dao.UserDAO;
import kr.co.bit.user.service.UserService;
import kr.co.bit.user.vo.UserVO;

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
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
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
		
		//List<ApproveVO> list = aservice.getApproveList("보류");
		
		/*UserVO user = new UserVO();
		user.setType("B");
		List<UserVO> list = sqlSessionTemplate.selectList("testSQL", user);*/
		
		/*HouseBlindVO hbVO = new HouseBlindVO();
		hbVO.setHouseNo(1);
		//hbVO.setUserNo(1);
		List<HouseBlindVO> hbList = sqlSessionTemplate.selectList("countHouseBlind", hbVO);
		*/
		
		ApproveVO aVO = new ApproveVO();
		aVO.setApproveState("승인");
		//aVO.setUserNo(11);
		System.out.println(aVO.getUserNo());
		List<ApproveVO> aList = sqlSessionTemplate.selectList("getApprove", aVO);
		
		
		//System.out.println(hbVO.getUserNo());
		//System.out.println(hbList);
		
		System.out.println(aList);
	}
}
