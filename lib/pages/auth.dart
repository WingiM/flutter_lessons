import 'package:flutter/material.dart';
import 'package:flutter_lessons/components/authorization_input.dart';
import 'package:flutter_lessons/components/margin.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var iconColor = Theme.of(context).hintColor;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('MonkeyApp',
                      style: TextStyle(color: primaryColor, fontSize: 30)),
                  Image.asset('images/monkey.png'),
                ],
              ),
              const AuthorizationMargin(
                heightScale: 0.05,
              ),
              AuthorizationInput(
                color: primaryColor,
                icon: Icon(Icons.email, color: iconColor),
                labelText: 'Email',
              ),
              const AuthorizationMargin(),
              AuthorizationInput(
                color: primaryColor,
                icon: Icon(Icons.email, color: iconColor),
                labelText: 'Password',
              ),
              const AuthorizationMargin(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(primaryColor),
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/home');
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: Text('test'),
                          );
                        });
                  },
                  child: const Text('Sign in'),
                ),
              ),
              const AuthorizationMargin(),
              InkWell(
                child: Text(
                  "Sign up?",
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
                onTap: () => {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
