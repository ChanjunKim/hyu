package com.spring.ogz.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.spring.ogz.DTO.ItemDTO;
import com.spring.ogz.DTO.StoreDTO;

@Repository
public class StoreDAO {

	private NamedParameterJdbcTemplate jdbc;
	private SimpleJdbcInsert insertAction;

	// BeanPropertyRowMapper는 Role클래스의 프로퍼티를 보고 자동으로 칼럼과 맵핑해주는 RowMapper객체를 생성한다.
	// roleId 프로퍼티는 role_id 칼럼과 맵핑이 된다.
	// 만약 프로퍼티와 칼럼의 규칙이 맞아 떨어지지 않는다면 직접 RowMapper객체를 생성해야 한다.
	// 생성하는 방법은 아래의 rowMapper2를 참고한다.
	private RowMapper<StoreDTO> rowMapper = BeanPropertyRowMapper.newInstance(StoreDTO.class);
	
	public StoreDAO(DataSource dataSource){
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
		this.insertAction = new SimpleJdbcInsert(dataSource)
				.withTableName("STORE"); // ROLE테이블에 INSERT하기 위한 객체를 생성한다.
	}
	
	// Role객체의 내용을 SqlParameterSource로 바꿔서 insert문에서 사용할 수 있도록 한다.
	// 프로퍼티와 칼럼간 규칙이 맞아 떨어져야 한다.
	// 그렇지 않을 경우 직접 Map객체를 생성해서 파라미터로 전달한다.
	//	public int addStore(StoreDTO store){
	//		SqlParameterSource parameters = new BeanPropertySqlParameterSource(store);
	//		return insertAction.execute(parameters);
	//	}
	
	public ArrayList<StoreDTO> getStores(){
		return (ArrayList<StoreDTO>) jdbc.query(StoreSqls.SELECT_ALL, rowMapper);
	}
	
}
