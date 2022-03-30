package com.example.demo;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.apache.commons.io.FileUtils;

public class ReplaceFileContent {

	public static void main(String[] args) throws IOException {
		
		String in = "This is my text.\n\nAnd here is a new line";
		System.out.println(in);

		String out = in.replaceAll("[\\t\\n\\r]+"," ");
		System.out.println(out);
		
	    Map<String,String> variableMap = fillMap();
		Path path = Paths.get("./sample-pom");
		Stream<String> lines;
		try {
			lines = Files.lines(path,Charset.forName("UTF-8"));
			List<String> replacedLines = lines.map(line -> replaceTag(line,variableMap))
                    .collect(Collectors.toList());
			Files.write(Paths.get("./modified-sample-pom"), replacedLines, Charset.forName("UTF-8"));
			lines.close();
			System.out.println("Find and replace done");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//String content = Files.readString(Paths.get("./maven-dependencies"), StandardCharsets.US_ASCII);
	}
	
	public static Map<String,String> fillMap() throws IOException {
		File file = new File("./maven-dependencies");
	    String content =  FileUtils.readFileToString(file, StandardCharsets.UTF_8);
	    content = content.replaceAll("[\n]+","\t\t\n");
	    System.out.println(content);
		Map<String,String> map = new HashMap<String,String>();
		map.put("</dependencies>", content+"\t\t\t</dependencies>");
		return map;
	}
	private static String replaceTag(String str, Map<String,String> map) {
		for (Map.Entry<String, String> entry : map.entrySet()) {
			if (str.contains(entry.getKey())) {
				str = str.replace(entry.getKey(), entry.getValue());
			}
		}
		return str;
	}

}
