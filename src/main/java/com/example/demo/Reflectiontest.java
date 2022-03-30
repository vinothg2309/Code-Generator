package com.example.demo;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;

import org.reflections.Reflections;
import org.reflections.scanners.ResourcesScanner;

public class Reflectiontest {

	public static void main(String[] args) throws MalformedURLException {
		//URLClassLoader loader = new URLClassLoader(new URL[] { "file://path/to/jar/or/directory"});
		//Class klass = loader.loadClass("com.test.model.Client");
		
		String absolutePath = new File("/MS-Code-Gen").getAbsolutePath();
		/*final File classes = new File(Paths.get(absolutePath).toString());
		List<URL> listOfURL = new ArrayList<>();
		listOfURL.add(classes.toURI().toURL());
		URLClassLoader loader = new java.net.URLClassLoader(listOfURL.toArray(new URL[0]));
		Reflections reflections1 = new Reflections("com.grouptest.MSCodeGen.entity", loader);
		Set<Class<?>> entityClasses = reflections1.getTypesAnnotatedWith(Entity.class);
		System.out.println("Test --> "+reflections1.getTypesAnnotatedWith(Entity.class));*/
		System.out.println("absolutePath --> "+ absolutePath);
		Reflections reflections = new Reflections(absolutePath, new ResourcesScanner());
		Set<Class<?>> entityClasses = reflections.getTypesAnnotatedWith(Entity.class);
		System.out.println("Test --> "+entityClasses);
		
		Reflections refs = new Reflections("com.grouptest.MSCodeGen.entity",
	            new ResourcesScanner());
		
	}

}
