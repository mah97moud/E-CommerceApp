class LoginModel {
  static Map loginData;
  LoginModel(Map data) {
    loginData = data;
  }

  static getError() => loginData['error'];
  static getErrorDescription() => loginData['error_description'];
  static getErrorMessage() => loginData['message'];
  static getTokenType() => loginData['token_type'];
  static getExpiresIn() => loginData['expires_in'];
  static getAccessToken() => loginData['access_token'];
  static getRefreshToken() => loginData['refresh_token'];
}
