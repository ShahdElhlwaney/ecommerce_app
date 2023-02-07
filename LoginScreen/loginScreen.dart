import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../GeneralComponents/ButtonComponent.dart';
import '../GeneralComponents/TextComponent.dart';
import '../GeneralComponents/imageComponent.dart';
import 'Cubit/cubit.dart';
import 'Cubit/states.dart';
import 'package:fluttertoast/fluttertoast.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  bool _passwordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ShopLoginCubit(),
    child: BlocConsumer<ShopLoginCubit, ShoppingLoginStates>(
          listener: (context, state) {
            if (state is ShoppingLoginLoading) {
              CircularProgressIndicator();
            }
            else if (state is ShoppingLoginSuccess) {
              if (state.shopLoginModel.status == true) {
                Fluttertoast.showToast(
                    msg: state.shopLoginModel.message!,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 20.0
                );
                Navigator.pushNamed(context, 'AllScreens',arguments: state.shopLoginModel.data!.token);
                print(state.shopLoginModel.data!.token);
              }
              else {
                Fluttertoast.showToast(
                    msg: state.shopLoginModel.message!,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 20.0
                );
              }
            }
          },
          builder: (context, state) {
            return Scaffold(
                body: Form(
                  key: formKey,
                  child: ListView(
                      children: [
                        Stack(
                          children: [
                            ImageComponent(
                              imageText: 'lib/images/OrangeCarrot2.png',
                              left: 202,
                              top: 88,),
                            ImageComponent(
                                imageText: 'lib/images/orangeCarrot1.png',
                                left: 179,
                                top: 101,
                                width: 37.72)
                          ],
                        ),
                        TextComponent(text: 'Loging',
                          left: 20,
                          top: 0,
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,),
                        SizedBox(height: 10,),
                        TextComponent(text: 'Enter your emails and password',
                          left: 20,
                          top: 0,
                          fontSize: 20,),
                        SizedBox(height: 35,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: TextFormField(
                            controller: emailController,
                            onChanged: (value) {
                              email = value;
                            },
                            validator: (value) {
                              if (email == null) {
                                return "* required";
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'email',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 35)
                            ),
                            style: TextStyle(
                                color: Colors.black, fontSize: 20),),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: TextFormField(
                                controller: passwordController,
                                onChanged: (value) {
                                  password = value;
                                },
                                validator: (data) {
                                  if (data!.isEmpty) {
                                    return "* Required";
                                  }
                                },
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    }, icon: Icon(_passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                    border: OutlineInputBorder(),
                                    hintText: ' Password',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 35)
                                ),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20))),
                        SizedBox(height: 10,),
                        TextComponent(text: 'Forgot Password?',
                          left: 249,
                          fontWeight: FontWeight.bold,),
                        Button(text: 'Log in', top: 0,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ShopLoginCubit.get(context).useLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                        ),
                        Row(children: [
                          TextComponent(text: ' Don’t have an account?',
                            top: 0,
                            left: 90,
                            color: Colors.black,
                            fontSize: 17,),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'SignupScreen');
                              },
                              child: TextComponent(text: ' Singup',
                                top: 0,
                                left: 0,
                                color: Color(0xff53B175),
                                fontSize: 17,
                              )
                          )
                        ]
                        ),
                      ]
                  ),
                )
            );
          },
        )
    );
  }
}