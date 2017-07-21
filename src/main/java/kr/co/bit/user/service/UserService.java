package kr.co.bit.user.service;

import java.util.List;

import kr.co.bit.busi.vo.HouseVO;
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
}
