import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.bit.busi.vo.RoomVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:config/**/*.xml"})
public class temp {
	@Autowired
	private DataSource ds;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Test
	public void 방번호테스트() throws Exception{
		//Connection conn = ds.getConnection();
		//System.out.println("connection : " + conn);
		//System.out.println("SqlSession : " + sqlSession) ;
		List<RoomVO> list = sqlSession.selectList("busi.selectOneHouse", 1);	//select("busi.selectOneHouse", 1);
		for(RoomVO vo : list){
			System.out.println(vo);
		}
	}
}
