package com.example.demo;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.io.Writer;
import java.lang.reflect.Method;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ServiceLoader;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.persistence.Entity;

import org.apache.commons.io.FileUtils;
import org.reflections.Reflections;
import org.reflections.scanners.MethodAnnotationsScanner;
import org.springframework.boot.cli.command.CommandFactory;
import org.springframework.boot.cli.command.CommandRunner;
import org.springframework.boot.cli.command.core.HelpCommand;
import org.springframework.boot.cli.command.core.HintCommand;
import org.springframework.boot.cli.command.core.VersionCommand;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.repository.init.ResourceReader;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import freemarker.cache.StringTemplateLoader;
import freemarker.ext.beans.BeansWrapper;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

public class CodeGeneratorLayerPackage {

	private static String javaBasePath = "";
	private static String absolutePath = "";
	static JsonPojo jsonPojo = null;
	
	/*repositories : com.example.demo.repository
	services: com.example.demo.service
	controllers: com.example.demo.controller*/

	public static void main(String[] args) throws JsonParseException, JsonMappingException, IOException, TemplateException {

		jsonPojo = new ObjectMapper().readValue(new ClassPathResource("config.json").getFile(),
				JsonPojo.class);
		absolutePath = new File("./"+jsonPojo.getArtifactId()+"/").getAbsolutePath();
		javaBasePath = absolutePath+"/src/main/java/";
		
		jsonPojo.setPackageName(jsonPojo.getPackageName()+"."+jsonPojo.getArtifactId().replaceAll("[^A-Za-z0-9]",""));
		createSpringBootApp();
		unzipSpringApp();
		addMavenDependencies();
		addAppProperties();

		Set<Class<?>> entityClasses = getEntityClasses(absolutePath);
		copyEntity("entity");
		/*
		 * File dest = new
		 * File(absolutePath+"//src//main//java//com//example//demo//entity"); File
		 * source = new File(absolutePath+"//target//generated-sources//test"); try {
		 * FileUtils.copyDirectory(source, dest); } catch (IOException e) {
		 * e.printStackTrace(); }
		 */

		for(Class<?> entity: entityClasses) {
			jsonPojo.setEntityClass(entity.getSimpleName());
			jsonPojo.setPrimaryKeyClass(getPrimaryKeyClass(entity));
			generateClass("repository.ftl", "repository" );
			generateClass("service.ftl", "service" );
			//generateClass(entity,"service.ftl", "service/impl" );

			if(jsonPojo.isDtoLayerEnabled())
			{
				initializeDtoObject(entity);
				generateCommonClass("crudcontroller.ftl","common", "CrudController.java");
				generateClass("controllerdto.ftl","controller");
				generateClass("dto.ftl","controller/dto", "DTO");
				//generateClass("mapper.ftl","service/mapper","Mapper");
			}else {
				generateClass("controller.ftl","controller");
			}
		}
	}

	private static void addAppProperties() throws IOException {
		String filename= absolutePath+"/src/main/resources/application.properties";
		String content = readContentFromFile("./template/application-properties-template");
	    FileWriter fw = new FileWriter(filename,true); //the true will append the new data
	    fw.write(content+"\n");//appends the string to the file
	    fw.close();
	}

	private static void addMavenDependencies() throws IOException {

		Map<String,String> variableMap = fillMap();
		replaceContentAndSaveFile(absolutePath+"/pom.xml", variableMap);
	}

	private static void replaceContentAndSaveFile(String destFilePath, Map<String, String> variableMap) {
		Path destpath = Paths.get(destFilePath);
		Stream<String> lines;
		try {
			lines = Files.lines(destpath,Charset.forName("UTF-8"));
			List<String> replacedLines = lines.map(line -> replaceTag(line,variableMap))
					.collect(Collectors.toList());
			Files.write(destpath, replacedLines, Charset.forName("UTF-8"));
			lines.close();
			System.out.println("Find and replace done");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static Map<String,String> fillMap() throws IOException {
		String content =  readContentFromFile("./maven-dependencies");
		content = content.replaceAll("[\n]+","\t\t\n");
		System.out.println(content);
		Map<String,String> map = new HashMap<String,String>();
		map.put("</dependencies>", content+"\t</dependencies>");
		return map;
	}
	
	private static String readContentFromFile(String path) throws IOException {
		File file = new File(path);
		return FileUtils.readFileToString(file, StandardCharsets.UTF_8);
	}
	
	private static String replaceTag(String str, Map<String,String> map) {
		for (Map.Entry<String, String> entry : map.entrySet()) {
			if (str.contains(entry.getKey())) {
				str = str.replace(entry.getKey(), entry.getValue());
			}
		}
		return str;
	}

	private static void createSpringBootApp() {
		CommandRunner runner = new CommandRunner("spring");
		runner.addCommand(new HelpCommand(runner));
		addServiceLoaderCommands(runner);
		//runner.addCommand(new ShellCommand());
		//runner.addCommand(new HintCommand(runner));
		runner.setOptionCommands(HelpCommand.class, VersionCommand.class);
		//runner.setHiddenCommands(HintCommand.class);
		runner.addCommand(new HintCommand(runner));
		// init --dependencies=web,thymeleaf -java-version=1.8 --groupId=com.group-test --artifactId=art-test --name=art-test --force
		List<String> list = new ArrayList<>();
		list.add("init");
		list.add(jsonPojo.getDependencies());
		list.add("--groupId="+jsonPojo.getGroupId());
		list.add("--artifactId="+jsonPojo.getArtifactId());
		list.add("--name="+jsonPojo.getArtifactId());
		list.add("--java-version="+jsonPojo.getJavaVersion());
		list.add("--force");
		String[] args = list.toArray(new String[0]);

		for(String arg:args) {
			System.out.println(arg);
		}

		System.out.println("Args ---> "+ args);
		int exitCode = runner.runAndHandleErrors(args); 
		if (exitCode != 0) { 
			// If successful, leave it to run in case it's a server app System.exit(exitCode);
		}
	}

	private static void addServiceLoaderCommands(CommandRunner runner) {
		ServiceLoader<CommandFactory> factories = ServiceLoader.load(CommandFactory.class);
		for (CommandFactory factory : factories) {
			runner.addCommands(factory.getCommands());
		}
	}

	private static void unzipSpringApp() throws IOException {
		String fileZip = "./"+jsonPojo.getArtifactId()+".zip";
		File destDir = new File("./"+jsonPojo.getArtifactId());
		byte[] buffer = new byte[1024];
		ZipInputStream zis = new ZipInputStream(new FileInputStream(fileZip));
		ZipEntry zipEntry = zis.getNextEntry();
		while (zipEntry != null) {
			File newFile = newFile(destDir, zipEntry);
			if (zipEntry.isDirectory()) {
				if (!newFile.isDirectory() && !newFile.mkdirs()) {
					throw new IOException("Failed to create directory " + newFile);
				}
			} else {
				// fix for Windows-created archives
				File parent = newFile.getParentFile();
				if (!parent.isDirectory() && !parent.mkdirs()) {
					throw new IOException("Failed to create directory " + parent);
				}

				// write file content
				FileOutputStream fos = new FileOutputStream(newFile);
				int len;
				while ((len = zis.read(buffer)) > 0) {
					fos.write(buffer, 0, len);
				}
				fos.close();
			}
			zipEntry = zis.getNextEntry();
		}
		zis.closeEntry();
		zis.close();
	}

	public static File newFile(File destinationDir, ZipEntry zipEntry) throws IOException {
		File destFile = new File(destinationDir, zipEntry.getName());

		String destDirPath = destinationDir.getCanonicalPath();
		String destFilePath = destFile.getCanonicalPath();

		if (!destFilePath.startsWith(destDirPath + File.separator)) {
			throw new IOException("Entry is outside of the target dir: " + zipEntry.getName());
		}

		return destFile;
	}

	private static void generateCommonClass(String templateFile,
			String folderName, String className) throws IOException, TemplateException {
		String code = render("./template/"+templateFile, jsonPojo);
		String filepath = javaBasePath+jsonPojo.getPackageName().replaceAll("\\.", "/")+"/"
				+folderName+"/"
				+className;
		System.out.println("filepath : "+ filepath);
		writeFile(code,filepath);
	}

	private static void initializeDtoObject(Class<?> entity) {
		jsonPojo.setEntityFields(Arrays.asList(entity.getDeclaredFields()));
	}

	private static void generateClass(String templateFile,
			String folderName, String... config) 
					throws IOException, TemplateException {
		String classSuffix = StringUtils.capitalize(folderName);
		if(config != null && config.length > 0) {
			classSuffix = config[0];
		}
		String code = render("./template/"+templateFile, jsonPojo);
		String filepath = javaBasePath+jsonPojo.getPackageName().replaceAll("\\.", "/")
				//+"/"+jsonPojo.getEntityClass().toLowerCase()
				+"/"+folderName+"/"
				+jsonPojo.getEntityClass()
				+classSuffix+".java";
		System.out.println("filepath : "+ filepath);
		writeFile(code,filepath);
	}

	private static void copyFiles(String sourcePath, String destinationPath) throws IOException {
		File src = new File(sourcePath);
		File dest = new File(destinationPath);
		FileUtils.copyFile(src, dest);
	}



	private static void generateDtoClasses(Class<?> entity, String templa, String folderName) {

	}

	private static void copyEntity(String folderName) throws IOException {

		String packageName = jsonPojo.getPackageName()+".entity";

		Map<String,String> map = new HashMap<String,String>();
		map.put("com.example.demo.entity", packageName);
		File dir = new File("./src/main/java/com/example/demo/entity");
		File[] directoryListing = dir.listFiles();
		for(File file: directoryListing) {
			String filepath = javaBasePath+jsonPojo.getPackageName().replaceAll("\\.", "/")
					+"/"+folderName+"/"+file.getName();
			String content =  FileUtils.readFileToString(file, StandardCharsets.UTF_8);
			writeFile(content, filepath);
			replaceContentAndSaveFile(filepath, map);
		}
		

		/*String filepath = javaBasePath+jsonPojo.getPackageName().replaceAll("\\.", "/")
				+"/"+folderName+"/"+jsonPojo.getEntityClass()+".java";

		File source = new File("./src/main/java/com/example/demo/entity/"
					+entity.getSimpleName()+".java");
		String packageName = jsonPojo.getPackageName()+".entity;";

		List<String> lines = Files.lines(source.toPath()).map(line -> {
			if(line.equals("package com.example.demo.entity;")){
				return "package "+ packageName;
			} else {
				return line;
			}
		}).collect(Collectors.toList()); 
		Path path = Paths.get(filepath);
		if (!Files.exists(path)) {
            Files.createDirectories(path.getParent());
        }
		Files.write(Paths.get(filepath), lines);*/



		/*String absolutePath = new File(".").getAbsolutePath();
		String filepath = javaBasePath+jsonPojo.getPackageName().replaceAll("\\.", "/")
				+"/"+jsonPojo.getEntityClass()+"/"+folderName+"/"+jsonPojo.getEntityClass()
				+entity.getSimpleName()+".java";
		File dest = new File(absolutePath+"//src//main//java//com//example//demo//entity");

		File dir = new File(dest.getAbsolutePath());
		File[] directoryListing = dir.listFiles();
		String packageName = jsonPojo.getPackageName()+"."+entity.getSimpleName()+".entity;";
		if (directoryListing != null) {
			for (File child : directoryListing) {
				List<String> lines = Files.lines(child.toPath()).map(line -> {
					if(line.equals("package test;")){
						return "package "+packageName;
					} else {
						return line;
					}
				}).collect(Collectors.toList()); 
				Files.write(Paths.get(filepath), lines);
			}
		}*/

	}

	private static void copyEntityNew(Class<?> entity, String folderName) throws IOException {

	}

	private static void createRepository(Class<?> entity) {

	}




	private static void createController(Class<?> entityClass) throws JsonParseException, JsonMappingException, IOException, TemplateException {
		String code = render(absolutePath+"/template/controller.ftl", jsonPojo);
		String filepath = javaBasePath+jsonPojo.getPackageName().replaceAll("\\.", "/")
				+"/"+jsonPojo.getEntityClass()+"/controller/"+jsonPojo.getEntityClass()+"Controller.java";
		System.out.println("filepath : "+ filepath);
		writeFile(code,filepath);
	}

	public static Set<Class<?>> getEntityClasses(String absolutePath) throws MalformedURLException{
		final File classes = new File(Paths.get(absolutePath).toString());
		List<URL> listOfURL = new ArrayList<>();
		listOfURL.add(classes.toURI().toURL());
		URLClassLoader loader = new java.net.URLClassLoader(listOfURL.toArray(new URL[0]));
		Reflections reflections1 = new Reflections("com.example.demo.entity", loader);
		Set<Class<?>> entityClasses = reflections1.getTypesAnnotatedWith(Entity.class);
		System.out.println("Test --> "+reflections1.getTypesAnnotatedWith(Entity.class));
		return entityClasses;
	}


	private static void writeFile(String code, String filepath) throws IOException {

		Path path = Paths.get(filepath);
		if (!Files.exists(path)) {
			Files.createDirectories(path.getParent());
		}
		Files.write(path, code.getBytes());
		System.out.println("path: {}, code: {}"+ path+ code);

	}

	public static String render(String templatePath, Object data) throws IOException, TemplateException {
		Configuration config = new Configuration(Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS);
		StringTemplateLoader templateLoader = new StringTemplateLoader();
		String source;
		try (InputStream is = getResourceAsStream(templatePath);
				BufferedReader buffer = new BufferedReader(new InputStreamReader(is))) {
			source = buffer.lines().collect(Collectors.joining("\n"));
		}
		templateLoader.putTemplate("template", source);
		config.setTemplateLoader(templateLoader);
		config.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		config.setObjectWrapper(new BeansWrapper(Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS));
		config.setWhitespaceStripping(true);

		try (Writer writer = new StringWriter()) {
			Template template = config.getTemplate("template");
			template.process(data, writer);
			return writer.toString();
		}
	}

	public static InputStream getResourceAsStream(String path) throws IOException {
		InputStream classPathResource = ResourceReader.class.getClassLoader().getResourceAsStream(path);
		if (classPathResource != null) {
			return classPathResource;
		}
		InputStream fileResource = new FileInputStream(new File(path));
		return fileResource;
	}

	private static String getPrimaryKeyClass(Class<?> entity) throws MalformedURLException {
		String absolutePath = new File("").getAbsolutePath();
		final File classes = new File(Paths.get(absolutePath, absolutePath+"/target/generated-sources/test").toString());
		List<URL> listOfURL = new ArrayList<>();
		listOfURL.add(classes.toURI().toURL());
		URLClassLoader loader = new java.net.URLClassLoader(listOfURL.toArray(new URL[0]));
		Reflections reflections = new Reflections(entity, loader, new MethodAnnotationsScanner());

		Set<Method> ids = reflections.getMethodsAnnotatedWith(javax.persistence.Id.class);
		if (ids.isEmpty()) {
			ids = reflections.getMethodsAnnotatedWith(javax.persistence.EmbeddedId.class);
			if (ids.isEmpty()) {
				System.out.println("No @Id found for " + entity + " using generic object  \"Object\" ");
				return "Object";
			}
		}
		return ids.stream().findFirst().get().getAnnotatedReturnType().getType().getTypeName();

	}

}
