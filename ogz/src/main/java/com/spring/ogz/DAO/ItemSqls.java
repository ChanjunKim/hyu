package com.spring.ogz.DAO;

public class ItemSqls {

	public static final String SELECT_STORE = "select itemlist.i_name as i_name, "
			+ "date_format(TIMEDIFF(date_format(item.end_date, '%Y-%m-%d %H:%i'), "
			+ "date_format(now(),'%Y-%m-%d %H:%i')), '%H시간%i분') as limit_time, "
			+ "truncate(itemlist.i_price*itemlist.sale_rate, -2) as sale_price, "
			+ "itemlist.i_price as i_price, s_id, item.end_date "
			+ "from item, itemlist "
			+ "where item.i_name = itemlist.i_name and item.s_id = :sId "
			+ "and now() > DATE_SUB(item.end_date, INTERVAL 3 HOUR) "
			+ "and item.end_date > now()";
	
	public static final String SELECT_MYPLACE = "select i.i_name, end_date, s_name, i.s_id, distance, "
			+ "il.i_price, truncate(il.i_price*(1-il.sale_rate), -2) as sale_price, " + 
			"date_format(TIMEDIFF(date_format(i.end_date, '%Y-%m-%d %H:%i'), date_format(now(),'%Y-%m-%d %H:%i')), '%H시간%i분') as limit_time " + 
			"from (select store.s_name, store.s_id as s_id, truncate((6371*acos(cos(radians(:lat))*cos(radians(lat))*cos(radians(lng)-radians(:lng))+sin(radians(:lat))*sin(radians(lat)))), 2) as distance " + 
			"from store, location " + 
			"where location.s_id = store.s_id " + 
			"having distance <= 0.5 " + 
			"order by distance) " + 
			" sl, item i, itemlist il " + 
			"where sl.s_id = i.s_id and i.i_name = il.i_name and now() between DATE_SUB(i.end_date, INTERVAL 3 HOUR) and i.end_date "
			+ "order by limit_time, distance asc";
}
