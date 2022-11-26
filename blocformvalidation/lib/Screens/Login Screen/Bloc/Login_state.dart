abstract class LoginState{}

class LoginInitialState extends LoginState{}

class LoginValidState extends LoginState{}

class LoginErrorState extends LoginState{
  final String error;
  LoginErrorState({required this.error});
}

class LoginLoadingState extends LoginState{}