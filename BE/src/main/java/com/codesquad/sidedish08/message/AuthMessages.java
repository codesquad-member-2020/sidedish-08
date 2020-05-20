package com.codesquad.sidedish08.message;

public class AuthMessages {

  public static final String LOGIN = "Github 로그인";
  public static final String CALLBACK = "Github CallBack";

  public static final String AUTHORIZE_URL = "https://github.com/login/oauth/authorize";
  public static final String ACCESS_TOKEN_URL = "https://github.com/login/oauth/access_token";
  public static final String USER_EMAIL_URL = "https://api.github.com/user/emails";
  public static final String REDIRECT_TO_INDEX_URL = "http://localhost:3000";
//  public static final String REDIRECT_TO_INDEX_URL = "http://13.125.127.249/sidedish08/index.html";

  public static final Long EXPIRED_TIME = 1000L * 60L * 30L;
}
