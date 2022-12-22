import 'package:chat_app_firebase/components/rounded_button.dart';
import 'package:chat_app_firebase/constants.dart';
import 'package:chat_app_firebase/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final _auth=FirebaseAuth.instance;
  late String email;
  late String passward;
  bool loading=false;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =AnimationController(
        duration: const Duration(seconds: 5),
        vsync: this);
    controller.forward();
    controller.addListener(() {
      setState(() {
      });
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
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
                onChanged: (value) {
                 email=value;
                },
                decoration: kTextfieldDecoration.copyWith(hintText: "Enter your "
                    " email"),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
                onChanged: (value) {
                 passward=value;
                },
                decoration: kTextfieldDecoration.copyWith(hintText: "Enter your"
                    " passward"),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                loading: loading,
                title: "Log in",
                colour: Colors.lightBlueAccent,
                onpressed: () async{
                  setState(() {
                    loading=true;
                  });
                  try{
                    final user=  await _auth.signInWithEmailAndPassword(email:
                    email, password:passward);
                    if(user!=null){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen()));
                    }
                    setState(() {
                      loading=false;
                    });
                  }
                  catch(e){
                    print(e);
                  }

                },
              ),
            ],
          ),
        ),
    );
  }
}
