abstract class LoginSts {}

class InitLoginSt extends LoginSts {}

class LoadingLoginSt extends LoginSts {}

class SuccessLoginSt extends LoginSts {}

class ErrorLoginSt extends LoginSts {
  ErrorLoginSt(String error);
}

class DioErrorLoginSt extends LoginSts {
  DioErrorLoginSt(String error);
}
