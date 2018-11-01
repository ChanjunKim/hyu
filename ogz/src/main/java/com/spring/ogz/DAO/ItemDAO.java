package com.spring.ogz.DAO;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.spring.ogz.DTO.ItemDTO;
import com.spring.ogz.DTO.StoreDTO;

@Repository
public class ItemDAO {

	private NamedParameterJdbcTemplate jdbc;
	private SimpleJdbcInsert insertAction;

	private RowMapper<ItemDTO> rowMapper = BeanPropertyRowMapper.newInstance(ItemDTO.class);

	public ItemDAO(DataSource dataSource){
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
		this.insertAction = new SimpleJdbcInsert(dataSource)
				.withTableName("ITEM");
	}
	
	public List<ItemDTO> getItemStore(String sId){
		HashMap<String, Object> map = new HashMap<>();
		map.put("sId", sId);
		List<ItemDTO> list = null;
		try {
			list = jdbc.query(ItemSqls.SELECT_STORE, map, rowMapper);	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<ItemDTO> showMyNear(double lat, double lng){
		HashMap<String, Object> map = new HashMap<>();
		map.put("lat", lat);
		map.put("lng", lng);
		
		return (ArrayList<ItemDTO>) jdbc.query(ItemSqls.SELECT_MYPLACE, map, rowMapper);
	}
	
	public int countStore(ArrayList<ItemDTO> list){

		for (int i = 0; i < list.size() -1; i++) {
            for (int j = 0; j < list.size(); j++) {
            	System.out.println("i = " + i);
            	System.out.println("j = " + j);
                if (i == j) {
                } 
                else if (list.get(j).getsName().equals(list.get(i).getsName())) {
                	list.remove(j);
                }
            }
        }
		
		for (int i = 0; i < list.size(); i++) {
            for (int j = 0; j < list.size(); j++) {
                if (i == j) {
                } 
                else if (list.get(i).getsId().equals(list.get(j).getsId())) {
                	list.remove(j);
                }
            }
        }
		
        for(int x = 0 ; x < list.size() ; x++) {
        	System.out.println("list = " + list.get(x).getsName());
        }
		return list.size();
	}
}
