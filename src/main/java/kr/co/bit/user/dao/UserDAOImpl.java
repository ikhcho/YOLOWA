package kr.co.bit.user.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.reservation.vo.MyResVO;
import kr.co.bit.user.vo.HomeListVO;
import kr.co.bit.user.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public UserVO login(UserVO uvo) {
		return template.selectOne("user.login", uvo);
	}

	@Override
	public UserVO idCheck(String id) {
		return template.selectOne("user.idCheck", id);
	}

	@Override
	public void register(UserVO uvo) {
		template.insert("user.register", uvo);
	}
	
	@Override
	public HouseVO houseDetail(int no) {
		return template.selectOne("user.houseDetail", no);
	}

	@Override
	public List<HomeListVO> houseList() {
		// TODO Auto-generated method stub
		return template.selectList("user.houseList");
	}
	
	@Override
	public void updateUser(UserVO uvo) {
		
		template.update("user.updateUser", uvo);
	}
	@Override
	public List<HouseVO> getZzimHouseList(int no) {
		List<HouseVO> zzimList = template.selectList("user.zzimList", no);
		return zzimList;
	}

	@Override
	public HouseVO selectZzim(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return template.selectOne("user.selectZzim", map);
	}

	@Override
	public void insertZzim(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		template.insert("user.insertZzim", map);
	}

	@Override
	public void deleteZzim(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		template.delete("user.deleteZzim", map);
	}

	@Override
	public List<MyResVO> myResList(int no) {
		// TODO Auto-generated method stub
		return template.selectList("user.myResList", no);
	}
	
	

}
