package com.example.demo;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.ClassPathResource;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class FileOperation {

	public static void main(String[] args) throws JsonParseException, JsonMappingException, IOException {
		String absolutePath = new File(".").getAbsolutePath();

		JsonPojo jsonPojo = new ObjectMapper().readValue(new ClassPathResource("config.json").getFile(),
				JsonPojo.class);
		System.out.println("jsonPojo --> "+ jsonPojo);


		System.out.println();
		File dest = new File(absolutePath+"//src//main//java//com//example//demo//entity");
		File source = new File(absolutePath+"//target//generated-sources//test");
		try {
			FileUtils.copyDirectory(source, dest);
		} catch (IOException e) {
			e.printStackTrace();
		}

		File dir = new File(dest.getAbsolutePath());
		File[] directoryListing = dir.listFiles();
		if (directoryListing != null) {
			for (File child : directoryListing) {
				List<String> lines = Files.lines(child.toPath()).map(line -> {
					if(line.equals("package test;")){
						return "package com.example.demo.entity;";
					} else {
						return line;
					}
				}).collect(Collectors.toList()); 
				Files.write(Paths.get(dest.getAbsolutePath()+"/"+child.getName()), lines);
			}
		}
		
		
	}

}
