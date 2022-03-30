package com.example.demo;

import java.io.IOException;
import java.nio.file.Files;

public class TempDirTest {

	public static void main(String[] args) throws IOException {
		String tmpdir = Files.createTempDirectory("tmpDirPrefixTest").toFile().getAbsolutePath();
		String tmpDirsLocation = System.getProperty("java.io.tmpdir");
		System.out.println("tmpdir ::: "+ tmpdir);
		System.out.println("tmpDirsLocation ::: "+ tmpDirsLocation);
	}

}
