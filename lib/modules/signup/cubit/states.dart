abstract class SignupSts {}

class InitSignupSt extends SignupSts {}

class LoadingSignupSt extends SignupSts {}

class SuccessSignupSt extends SignupSts {}

class ErrorSignupSt extends SignupSts {
  ErrorSignupSt(String error) {
    print(error.toString());
  }
}
