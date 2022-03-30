package com.example.demo;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.ServiceLoader;

import org.springframework.boot.cli.command.CommandFactory;
import org.springframework.boot.cli.command.CommandRunner;
import org.springframework.boot.cli.command.core.HelpCommand;
import org.springframework.boot.cli.command.core.HintCommand;
import org.springframework.boot.cli.command.core.VersionCommand;
import org.springframework.util.SystemPropertyUtils;

public class SpringBootCLITest {

	public static void main(String[] args) {
		/*
		 * args = new String[1]; args[0] =
		 * "init --dependencies = web,thymeleaf MavenApplication.zip"; args[1] =
		 * "--dependencies = web,thymeleaf MavenApplication.zip";
		 */
		//System.setProperty("java.awt.headless", Boolean.toString(true));
		System.out.println("Args ===> "+ args);
		for(String arg:args) {
			System.out.println(arg);
		}
		CommandRunner runner = new CommandRunner("spring");
		//runner.addCommand(command);
		//ClassUtils.overrideThreadContextClassLoader(createExtendedClassLoader(runner));
		runner.addCommand(new HelpCommand(runner));
		addServiceLoaderCommands(runner);
		//runner.addCommand(new ShellCommand());
		//runner.addCommand(new HintCommand(runner));
		runner.setOptionCommands(HelpCommand.class, VersionCommand.class);
		//runner.setHiddenCommands(HintCommand.class);
		runner.addCommand(new HintCommand(runner));
		int exitCode = runner.runAndHandleErrors(args);
		if (exitCode != 0) {
			// If successful, leave it to run in case it's a server app
			System.exit(exitCode);
		}
	
	}
	
	private static void addServiceLoaderCommands(CommandRunner runner) {
		ServiceLoader<CommandFactory> factories = ServiceLoader.load(CommandFactory.class);
		for (CommandFactory factory : factories) {
			runner.addCommands(factory.getCommands());
		}
	}

	private static URLClassLoader createExtendedClassLoader(CommandRunner runner) {
		return new URLClassLoader(getExtensionURLs(), runner.getClass().getClassLoader());
	}

	private static URL[] getExtensionURLs() {
		List<URL> urls = new ArrayList<>();
		String home = SystemPropertyUtils.resolvePlaceholders("${spring.home:${SPRING_HOME:.}}");
		File extDirectory = new File(new File(home, "lib"), "ext");
		if (extDirectory.isDirectory()) {
			for (File file : extDirectory.listFiles()) {
				if (file.getName().endsWith(".jar")) {
					try {
						urls.add(file.toURI().toURL());
					}
					catch (MalformedURLException ex) {
						throw new IllegalStateException(ex);
					}
				}
			}
		}
		return urls.toArray(new URL[0]);
	}

}
