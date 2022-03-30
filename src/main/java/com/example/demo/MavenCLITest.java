package com.example.demo;

import java.io.File;

import org.apache.maven.cli.MavenCli;

public class MavenCLITest {

	public static void main(String[] args) {
		System.out.println(new File(".").getAbsolutePath());

        MavenCli cli = new MavenCli();
        cli.doMain(new String[]{"clean", "install"}, ".", System.out, System.out);
	}

}
