package com.mvc;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = { "com.mvc" })
public class AppConfig {

	@Bean
	EntityManagerFactory entityManagerFactory() {
		return Persistence.createEntityManagerFactory("abc");
	}

}
