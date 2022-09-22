abstract class DietStates {}

class initialDietStates extends DietStates {}

class LoginSuccefully extends DietStates {}

class LoginError extends DietStates {
  final String error;

  LoginError(this.error);
}
