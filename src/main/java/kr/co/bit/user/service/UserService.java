package kr.co.bit.user.service;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.user.vo.UserVO;

public interface UserService {

	HouseVO houseDetail(int no);
	
	public UserVO login(UserVO uvo);
	public Boolean idCheck(String id);
	public void register(UserVO uvo);

}
