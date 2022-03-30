package com.example.demo;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;

import org.reflections.Reflections;
import org.reflections.scanners.MethodAnnotationsScanner;
import org.springframework.core.io.ClassPathResource;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class EntityRefelection {

	public static void main(String[] args) throws JsonParseException, JsonMappingException, IOException {

		/*
		 * Reflections reflections = new Reflections("com.example.demo.entity");
		 * Set<Class<?>> classes =
		 * reflections.getTypesAnnotatedWith(javax.persistence.Entity.class);
		 * for(Class<?> cls : classes) {
		 * 
		 * }
		 */
		
		/*Reflections reflections = new Reflections("test");
		Set<Class<?>> classes = reflections.getTypesAnnotatedWith(javax.persistence.Entity.class);
		for(Class<?> cls : classes)
		{
			System.out.println(cls.getName());
		}*/
		JsonPojo jsonPojo = new ObjectMapper().readValue(new ClassPathResource("config.json").getFile(),
				JsonPojo.class);
		System.out.println("jsonPojo --> "+ jsonPojo);
		
		String absolutePath = new File(".").getAbsolutePath();
		System.out.println("absolutePath : "+ absolutePath);
		final File classes = new File(Paths.get(absolutePath, absolutePath+"/target/generated-sources/test").toString());
        List<URL> listOfURL = new ArrayList<>();
        listOfURL.add(classes.toURI().toURL());
        URLClassLoader loader = new java.net.URLClassLoader(listOfURL.toArray(new URL[0]));
		Reflections reflections1 = new Reflections("com.example.demo.entity", loader);
		Set<Class<?>> entityClasses = reflections1.getTypesAnnotatedWith(Entity.class);
		System.out.println("Test --> "+reflections1.getTypesAnnotatedWith(Entity.class));
		for(Class<?> cls : entityClasses)
		{
			System.out.println(cls.getSimpleName());
			
		}
	}
	
	public Set<Class<?>> getEntityClasses(String absolutePath) throws MalformedURLException{
		final File classes = new File(Paths.get(absolutePath, absolutePath+"/target/generated-sources/test").toString());
        List<URL> listOfURL = new ArrayList<>();
        listOfURL.add(classes.toURI().toURL());
        URLClassLoader loader = new java.net.URLClassLoader(listOfURL.toArray(new URL[0]));
		Reflections reflections1 = new Reflections("com.example.demo.entity", loader);
		Set<Class<?>> entityClasses = reflections1.getTypesAnnotatedWith(Entity.class);
		System.out.println("Test --> "+reflections1.getTypesAnnotatedWith(Entity.class));
		return entityClasses;
	}

}
