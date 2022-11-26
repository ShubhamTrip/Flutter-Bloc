abstract class LoginEvent{}

class LoginTextChangedEvent extends LoginEvent{
   final String usernameValue;
   final String passwordValue;
  LoginTextChangedEvent({ required this.usernameValue, required this.passwordValue});
}
class LoginSubmittedEvent extends LoginEvent{
   final String username;
   final String password;

   LoginSubmittedEvent({required this.username,required this.password});
}