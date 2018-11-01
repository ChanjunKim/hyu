package com.spring.ogz.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

/**
 1. java config 는 @Configuration애노테이션이 붙어 있는 클래스
 2. ComponentScan은 특정 패키지 이하에서 컴포넌트를 찾아 Bean으로 등록한다.
 3. Import는 다른 JavaConfig를 포함할때 사용한다.
 */
@Configuration
@ComponentScan(basePackages = {"examples.spring.jdbc.jdbcexam.dao", "examples.spring.jdbc.jdbcexam.service"})
@Import({DBConfig.class})
public class ApplicationConfig {

}
