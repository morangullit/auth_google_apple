import 'package:auth_app/services/google_signin_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Auth - Google - Apple'),
            actions: [
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.rightFromBracket,
                ),
                onPressed: () {
                  GoogleSignInService.signOut();
                },
              )
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    splashColor: Colors.transparent,
                    minWidth: double.infinity,
                    height: 40,
                    color: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        Text(
                          '   Sing in with Google',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        )
                      ],
                    ),
                    onPressed: () {
                      GoogleSignInService.signInWithGoogle();
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
