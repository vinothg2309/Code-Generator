package com.example.demo;

import java.sql.SQLException;

import org.h2.tools.Server;
import org.modelmapper.ModelMapper;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class SpringBootMsCodeGenApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootMsCodeGenApplication.class, args);
	}
	
	@Bean(initMethod = "start", destroyMethod = "stop")
	public Server inMemoryH2DatabaseaServer() throws SQLException {
	    return Server.createTcpServer(
	      "-tcp", "-tcpAllowOthers", "-tcpPort", "9090");
	}
	
	@Bean
	public ModelMapper modelMapper() {
		return new ModelMapper();
	}

}
