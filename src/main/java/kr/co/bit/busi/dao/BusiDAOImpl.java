package kr.co.bit.busi.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BusiDAOImpl implements BusiDAO{

	@Autowired
	private SqlSessionTemplate template;
	
	
}
