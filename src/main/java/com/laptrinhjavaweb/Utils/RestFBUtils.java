package com.laptrinhjavaweb.Utils;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.laptrinhjavaweb.Constants.LoginFBConstants;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;
import com.restfb.types.User;

public class RestFBUtils {
	  public static String getToken(final String code) throws ClientProtocolException, IOException {
		    String link = String.format(LoginFBConstants.FB_LINK_GET_TOKEN, LoginFBConstants.FB_APP_ID,
		    		LoginFBConstants.FB_APP_SECRET, LoginFBConstants.FB_REDIRECT_URL, code);
		    String response = Request.Get(link).execute().returnContent().asString();
		    JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
		    String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
		    return accessToken;
		  }
		  
		  public static User getUserInfo(String accessToken) {
		    FacebookClient facebookClient = new DefaultFacebookClient(accessToken, LoginFBConstants.FB_APP_SECRET, Version.LATEST);
		    return facebookClient.fetchObject("me", User.class);
		  }
		  
}
