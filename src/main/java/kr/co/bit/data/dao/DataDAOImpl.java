package kr.co.bit.data.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DataDAOImpl implements DataDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	
}
