package com.laptrinhjavaweb.Utils;

import java.io.BufferedReader;
import java.io.IOException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class HttpUtils {
	
	private static HttpUtils httpUtils;
	private String resultJson;
	
	public static HttpUtils getIntance() {
		if(httpUtils == null) {
			httpUtils = new HttpUtils();
		}
		return httpUtils;
	}
	
	public HttpUtils convertJsontoString(BufferedReader reader) {
		StringBuilder sb = new StringBuilder();
		String line;
		try {
			while((line = reader.readLine()) != null) {
				sb.append(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		this.resultJson = sb.toString();
		return httpUtils;
	}
	
	public <T> T toModel(Class<T> tclass){
		try {
			return new ObjectMapper().readValue(resultJson, tclass);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	} 
}
