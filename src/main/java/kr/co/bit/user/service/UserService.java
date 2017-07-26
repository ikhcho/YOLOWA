package kr.co.bit.user.service;

import java.util.List;
import java.util.Map;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.reservation.vo.MyResVO;
import kr.co.bit.user.vo.HomeListVO;
import kr.co.bit.user.vo.UserVO;

public interface UserService {

	public UserVO login(UserVO uvo);
	public Boolean idCheck(String id);
	public void register(UserVO uvo);
	HouseVO houseDetail(int no);
	public List<HomeListVO> houseList();
	public UserVO selectById(String id);
	void updateUser(UserVO uvo);
	// 찜목록 조회서비스
	List<HouseVO> getZzimHouseList(int no);
	public Boolean selectZzim(Map<String,Integer> map);
	public void insertZzim(Map<String,Integer> map);
	public void deleteZzim(Map<String,Integer> map);
	public List<MyResVO> myResList(int no);
}
