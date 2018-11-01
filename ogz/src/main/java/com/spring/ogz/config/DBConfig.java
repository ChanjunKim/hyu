package com.spring.ogz.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

/**
 1. java config 는 @Configuration애노테이션이 붙어 있는 클래스
 2. EnableTransactionManagement는  트랜잭션과 관련된 설정을 자동으로 한다.
 */

@Configuration
@EnableTransactionManagement
public class DBConfig implements TransactionManagementConfigurer{
	private String driverClassName = "org.mariadb.jdbc.Driver";
	private String url = "jdbc:mariadb://localhost:3306/testdb?useUnicode=true&characterEncoding=utf8";
	private String username = "root";
	private String password = "root00";

	/**
	 * 커넥션 풀과 관련된 Bean을 생성한다.
	 * @return
	 */
	@Bean
	public DataSource dataSource(){
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName(driverClassName);
		dataSource.setUrl(url);
		dataSource.setUsername(username);
		dataSource.setPassword(password);
		
		return dataSource;
	}

	/**
	 * 트랜잭션 관리자를 생성한다.
	 * @return
	 */
	@Bean
	public PlatformTransactionManager transactionManager(){
		return new DataSourceTransactionManager(dataSource());
	}
	
	@Override
	public PlatformTransactionManager annotationDrivenTransactionManager() {
		return transactionManager();
	}
}
