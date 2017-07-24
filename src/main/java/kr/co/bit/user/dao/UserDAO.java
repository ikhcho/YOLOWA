package kr.co.bit.user.dao;

import java.util.List;
import java.util.Map;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.user.vo.HomeListVO;
import kr.co.bit.user.vo.UserVO;

public interface UserDAO {

	public UserVO login(UserVO uvo);
	public UserVO idCheck(String id);
	public void register(UserVO uvo);
	HouseVO houseDetail(int no);
	public List<HomeListVO> houseList();
	void updateUser(UserVO uvo);
	List<HouseVO> getZzimHouseList(int no);
	public HouseVO selectZzim(Map<String,Integer> map);
	public void insertZzim(Map<String,Integer> map);
	public void deleteZzim(Map<String,Integer> map);
}
