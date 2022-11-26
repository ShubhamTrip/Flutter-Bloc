import 'package:blocformvalidation/Screens/Login%20Screen/Bloc/Login_Bloc.dart';
import 'package:blocformvalidation/Screens/Login%20Screen/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 200,),
          Text("Welcome",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w700,color: Colors.blueGrey[700]),),
          const SizedBox(height: 400,),
          SizedBox(width: 250,height: 50,child: ElevatedButton(onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>BlocProvider(create: (context)=>LoginBloc(),
            child: LoginScreen(),)));
          },
              child: Text("Sign In")),),
          const SizedBox(height: 10,),
          SizedBox(width: 250,height: 50,child: ElevatedButton(onPressed: (){},
              child: Text("Register")),)
        ],
      ),
    );
  }
}
