package com.codesquad.sidedish08.message;

public class AuthMessages {

  public static final String LOGIN = "Github 로그인";
  public static final String CALLBACK = "Github CallBack";

  public static final String AUTHORIZE_URL = "https://github.com/login/oauth/authorize";
  public static final String ACCESS_TOKEN_URL = "https://github.com/login/oauth/access_token";
  public static final String USER_EMAIL_URL = "https://api.github.com/user/emails";

  public static final String CLIENT_ID = "31ae5169a7dc37e19605";
  public static final String CLIENT_SECRET = "43debfbf5b584d5a0c7b58d215c5462a29ecd5e1";

  public static final String SALT = "sidedish08SecreatKey";
  public static final Long EXPIRED_TIME = 1000L * 60L * 30L;
}
