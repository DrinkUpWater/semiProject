package com.kh.common;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class API {
    
    
    public static String getAPI() {
		Properties prop = new Properties();
		String filePath = JDBCTemplate.class.getResource("/api/api.properties").getPath();

		try {
			prop.load(new FileInputStream(filePath));
			return prop.getProperty("api");

		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
		
			e.printStackTrace();
		}

		return null;
	 }
 
}
