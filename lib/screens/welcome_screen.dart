import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:twaddlechat/components/rounded_button.dart';
import 'package:twaddlechat/screens/login_screen.dart';
import 'package:twaddlechat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController controller;

  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );

    //animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = ColorTween(begin: Color(0xFF000C66), end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [animation.value, Color(0xFF80DEEA)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('images/interface.png'),
                        height: 50.0,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    ColorizeAnimatedTextKit(
                      text: ["Twaddle"],
                      textStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 40.0,
                          fontFamily: "Horizon",
                          fontWeight: FontWeight.w900),
                      colors: [
                        Colors.purple,
                        Colors.blue,
                        Colors.green,
                        Colors.red,
                      ],
                      textAlign: TextAlign.start,
                      alignment: AlignmentDirectional
                          .topStart, // or Alignment.topLeft,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    RotateAnimatedTextKit(
                      text: ["REGISTER", "LOGIN", "CHAT"],
                      textStyle: TextStyle(
                        fontSize: 25.0,
                        fontFamily: "Horizon",
                        color: Colors.black54,
                        letterSpacing: 0.5,
                      ),
                      textAlign: TextAlign.start,
                      alignment: AlignmentDirectional.topCenter,
                      duration: Duration(seconds: 2),
                      isRepeatingAnimation: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.0,
                ),
                RoundedButton(
                  color: Colors.blueAccent,
                  buttonTitle: 'Log In',
                  onPress: () {
                    Navigator.pushNamed(
                      context,
                      LoginScreen.id,
                    );
                  },
                ),
                RoundedButton(
                  color: Colors.green,
                  buttonTitle: 'Register',
                  onPress: () {
                    Navigator.pushNamed(
                      context,
                      RegistrationScreen.id,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
