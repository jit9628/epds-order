package com.epds.epdsorder;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jdbc.core.JdbcTemplate;
@SpringBootApplication
@EnableAutoConfiguration
public class EpdsorderApplication {
	public static void main(String[] args) {
//		JdbcTemplate jdbcTemplate = new JdbcTemplate();
//		System.out.println(jdbcTemplate);
		SpringApplication.run(EpdsorderApplication.class, args);
	}

}
