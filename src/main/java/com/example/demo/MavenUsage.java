package com.example.demo;

import java.io.File;
import java.io.PrintStream;
import java.util.Collections;

import org.apache.maven.cli.MavenCli;
import org.apache.maven.shared.invoker.DefaultInvocationRequest;
import org.apache.maven.shared.invoker.DefaultInvoker;
import org.apache.maven.shared.invoker.InvocationRequest;
import org.apache.maven.shared.invoker.MavenInvocationException;

public class MavenUsage {

	public static void main(String[] args) {
		//executeMavenInstall();
		System.out.println(new File(".").getAbsolutePath());

        MavenCli cli = new MavenCli();
        PrintStream sysErr = System.out;
        int status = cli.doMain(new String[]{"generate-sources"}, ".", System.out, sysErr);
        System.out.println("************** status ***************** " + status);
        if(status != 0)
        {
        	
        }
	}
	
	public static void executeMavenInstall() {
        InvocationRequest request = new DefaultInvocationRequest();
        request.setPomFile(new File("./pom.xml"));
        request.setGoals(Collections.singletonList("generate-sources"));

        DefaultInvoker invoker = new DefaultInvoker();
        invoker.setMavenHome(new File("/usr/share/maven"));
        try {
            invoker.execute(request);
        } catch (MavenInvocationException e) {
            e.printStackTrace();
        }
    }

}
