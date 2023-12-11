import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'loading_dialog.dart';

class LoginAnimation extends StatefulWidget {
  const LoginAnimation({super.key});

  @override
  State<LoginAnimation> createState() => _LoginAnimationState();
}

class _LoginAnimationState extends State<LoginAnimation> {
  StateMachineController? controller;

  SMIInput<bool>? isChecking;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;
  SMIInput<double>? numLook;


  FocusNode emailFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();

  Color buttoncolor = Colors.lightBlueAccent;
  //   Color buttoncolor = Color(0xffB04863);
  Color textcolor = Colors.black;

  @override
  void initState() {
    emailFocusNode.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);
    super.initState();
  }

  @override
  void dispose() {
    emailFocusNode.removeListener(emailFocus);
    passwordFocusNode.removeListener(passwordFocus);
    super.dispose();
  }

  void emailFocus() {
    isChecking?.change(emailFocusNode.hasFocus);
  }

  void passwordFocus() {
    isHandsUp?.change(passwordFocusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: textcolor,
        ),),
        backgroundColor: buttoncolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 250,
                child: RiveAnimation.asset(
                  "assets/login_bear2.riv",
                  stateMachines: ["Login Machine"],
                  onInit: (artboard) {
                    controller = StateMachineController.fromArtboard(
                        artboard, "Login Machine");
                    if (controller == null) ;

                    artboard.addController(controller!);
                    isChecking = controller?.findInput("isChecking");
                    isHandsUp = controller?.findInput("isHandsUp");
                    trigSuccess = controller?.findInput("trigSuccess");
                    trigFail = controller?.findInput("trigFail");
                    numLook = controller?.findInput("numLook");

                  },
                )),
            Container(
              height: 380,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(blurRadius: 20.0, color: Colors.black26
                      //color: Color(0xff4e4e4e12),
                      ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF9F9F9),
                          borderRadius: BorderRadius.circular(14)),
                      child: TextFormField(
                        focusNode: emailFocusNode,
                        controller: emailController,
                        onChanged: (value) {
                          numLook?.change(value.length.toDouble());
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            "Email",
                            style: TextStyle(
                              fontFamily: 'roboto',
                              fontSize: 14,
                              color: const Color(0xff303030).withOpacity(0.4),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: buttoncolor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF9F9F9),
                          borderRadius: BorderRadius.circular(14)),
                      child: TextFormField(
                        focusNode: passwordFocusNode,
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            "Password",
                            style: TextStyle(
                              fontFamily: 'roboto',
                              fontSize: 14,
                              color: const Color(0xff303030).withOpacity(0.4),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: buttoncolor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          " Forget Password? ",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "Click Here!",
                          style: TextStyle(
                            fontSize: 10,
                            color: buttoncolor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    GestureDetector(
                      onTap: ()  async {
                        emailFocusNode.unfocus();
                        passwordFocusNode.unfocus();

                        final email = emailController.text;
                        final password = passwordController.text;

                        showLoadingDialog(context);
                        await Future.delayed(
                          const Duration(milliseconds: 2000),
                        );
                        if (mounted) Navigator.pop(context);

                        if (email == "abc" && password == "123") {
                          trigSuccess?.change(true);
                        } else {
                          trigFail?.change(true);
                        }
                      },
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                          color: buttoncolor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: textcolor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffD6E2EA),
      //backgroundColor: Colors.white,
    );
  }
}
