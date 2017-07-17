package kr.co.bit.user.dao;

import kr.co.bit.user.vo.UserVO;

public interface UserDAO {

	public UserVO login(UserVO uvo);
	public UserVO idCheck(String id);
	public void register(UserVO uvo);
}
