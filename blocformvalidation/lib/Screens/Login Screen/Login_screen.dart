import 'package:blocformvalidation/Screens/Login%20Screen/Bloc/Login_Bloc.dart';
import 'package:blocformvalidation/Screens/Login%20Screen/Bloc/Login_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/Login_state.dart';

class LoginScreen extends StatelessWidget {
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,backgroundColor: Colors.blueGrey,),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(top: 20,left: 80,right: 80),
          children: [
            SizedBox(height: 120,),
            BlocBuilder<LoginBloc,LoginState>(builder: (context,state){
              if(state is LoginErrorState){
                return Text(state.error,style: TextStyle(color: Colors.red));
              }
              else{
                return Container();
              }
            }),
            TextField(decoration: InputDecoration(hintText: "Username"),
            controller: username,
            onChanged: (val){
              BlocProvider.of<LoginBloc>(context).add(LoginTextChangedEvent(usernameValue: username.text, passwordValue: password.text));
            },),
            SizedBox(height: 20,),
            TextField(decoration: InputDecoration(hintText: "Password"),
            controller: password,
            onChanged: (val){
              BlocProvider.of<LoginBloc>(context).add(LoginTextChangedEvent(usernameValue: username.text, passwordValue: password.text));
            },),
            SizedBox(height: 40,),
            BlocBuilder<LoginBloc,LoginState>(builder: (context,state){
              if(state is LoginLoadingState){
                return Center(child: CircularProgressIndicator());
              }
              return CupertinoButton(onPressed: (){
                if(state is LoginValidState){
                    BlocProvider.of<LoginBloc>(context).add(LoginTextChangedEvent(usernameValue: username.text, passwordValue: password.text));
                }
              }, child: Text("Sign In"),
                color: (state is LoginErrorState)? Colors.grey:
                Colors.red,
              );
            })
          ],
        ),
      ),
    );
  }
}
