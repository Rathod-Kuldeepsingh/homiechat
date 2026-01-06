import 'package:flutter/material.dart';
import 'package:homiechat/data/services/service_locator.dart';
import 'package:homiechat/logic/cubits/auth/auth_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome To HomieChat"),
        actions: [
          InkWell(
            onTap:(){
               getIt<AuthCubit>().signOut();
            },
            child: Icon(Icons.logout),
          )
        ],
      ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Login Succefull",style: Theme.of(context).textTheme.titleLarge,),
        )
      ],
    ),
    );
  }
}