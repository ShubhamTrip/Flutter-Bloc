
import 'package:blocformvalidation/Screens/Login%20Screen/Bloc/Login_event.dart';
import 'package:blocformvalidation/Screens/Login%20Screen/Bloc/Login_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc() : super(LoginInitialState()){

    on<LoginTextChangedEvent>((event, emit){

      if(EmailValidator.validate(event.usernameValue)==false){
        emit(LoginErrorState(error: "Please enter a valid username."));
      }
      else if(event.passwordValue.length<8){
        emit(LoginErrorState(error: "Please enter a valid password."));
      }

      else{
        emit(LoginValidState());
      }

    });
    on<LoginSubmittedEvent>((event, emit) => null);

  }
}