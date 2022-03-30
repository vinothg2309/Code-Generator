package com.example.demo;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;

public class FileReplace {
	
	public static void main(String[] args) throws IOException {
		String absolutePath = new File(".").getAbsolutePath();
		File dest = new File(absolutePath+"//src//main//java//com//example//demo//entity");
		
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
