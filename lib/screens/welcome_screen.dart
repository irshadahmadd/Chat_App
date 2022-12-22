import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app_firebase/components/rounded_button.dart';
import 'package:chat_app_firebase/constants.dart';
import 'package:chat_app_firebase/screens/login_screen.dart';
import 'package:chat_app_firebase/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  bool loading=false;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.withOpacity(controller.value),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Flash Chat',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              loading: loading,
              title: "Log in",
              colour: Colors.lightBlueAccent,
              onpressed: () {
                setState(() {
                  loading=true;
                });
                try{
                  Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.leftToRight,
                        duration: const Duration(seconds: 2),
                        child: const LoginScreen(),
                        inheritTheme: true,
                        ctx: context),
                  );
                }
                catch(e){
                  setState(() {
                    loading=false;
                  });
                }


              },
            ),
            RoundedButton(
              loading: loading,
              title: "Register",
              colour: Colors.blueAccent,
              onpressed: () {
                setState(() {
                  loading=true;
                });
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      duration: const Duration(seconds: 2),
                      child: const RegistrationScreen(),
                      inheritTheme: true,
                      ctx: context),
                );
                setState(() {
                  loading=false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
