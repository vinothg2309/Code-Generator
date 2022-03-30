package com.example.demo;

import java.lang.reflect.Field;
import java.util.List;

import lombok.Data;

@Data
public class JsonPojo {
	
	private String packageName;	
	private String entityClass;
	private String primaryKeyClass;
	private boolean dtoLayerEnabled;
	private boolean serviceInterfaceEnabled;
	private List<Field> entityFields;
	private String groupId;
	private String artifactId;
	private String dependencies;
	private String javaVersion;
	

}
