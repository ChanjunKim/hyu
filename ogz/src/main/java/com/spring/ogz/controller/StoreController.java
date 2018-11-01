package com.spring.ogz.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.ogz.DTO.ItemDTO;
import com.spring.ogz.DTO.StoreDTO;


@Controller
public class StoreController {
	
	@Autowired
	private com.spring.ogz.DAO.StoreDAO storeDAO;
	
	@Autowired
	private com.spring.ogz.DAO.ItemDAO itemDAO;
	
	@RequestMapping(value = "/showStores.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String showAllStores() {
		ArrayList<StoreDTO> list = storeDAO.getStores();
		String str = null;
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			str = mapper.writeValueAsString(list);
			System.out.println(str);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return str;
	}
	
	@RequestMapping(value = "/showItemForStore.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String findStore(String sId) {
		List<ItemDTO> list = itemDAO.getItemStore(sId);
		String str = null;
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			str = mapper.writeValueAsString(list);
			System.out.println(list.get(0).getLimitTime());
			System.out.println(str);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return str;
	}
	
	
	@RequestMapping(value = "/showMyPlace.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String showMyPlace(double lat, double lng) {
		System.out.println(lat);
		System.out.println(lng);
		String str = null;
		HashMap<String, Object> map = new HashMap<>();
		
		ArrayList<ItemDTO> list = itemDAO.showMyNear(lat, lng);
		map.put("list", list);
		for(int x = 0 ; x < list.size() ; x++) {
			System.out.println(list.get(x).getiName());
		}
		
		ArrayList<ItemDTO> list2 = new ArrayList<>();
		list2.addAll(list);
		int countStore = itemDAO.countStore(list2);
		System.out.println("countStore = " + countStore);
		map.put("cnt", countStore);
		
		for(int x = 0 ; x < list.size() ; x++) {
			System.out.println(list.get(x).getiName());
		}
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			str = mapper.writeValueAsString(map);
			System.out.println("ShowMyPlace = " + str);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return str;
	}

}
