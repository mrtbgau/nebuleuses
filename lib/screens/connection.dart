import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nebuleuses/features/user_auth/firebase_auth_services.dart';
import 'package:nebuleuses/screens/text_container.dart';
import 'package:nebuleuses/widgets/background_image.dart';
import 'package:nebuleuses/widgets/button.dart';
import 'package:nebuleuses/widgets/text_input.dart';
import 'package:nebuleuses/widgets/screen_title.dart';

class Connection extends StatefulWidget {
  const Connection({super.key});

  @override
  State<Connection> createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {
  bool isSigning = false;
  final FirebaseAuthService auth = FirebaseAuthService();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController usernameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundImage(),
          Column(children: [
            Container(
              height: 81,
              margin: const EdgeInsets.only(top: 183, bottom: 50),
              child: const Center(
                child: ScreenTitle(title: 'CONNEXION'),
              ),
            ),
            TextContainer(
                height: 38,
                margin: 30,
                child: TextInput(
                  placeholder: 'Mon identifiant',
                  isPassword: false,
                  controller: usernameController,
                )),
            const SizedBox(
              height: 50,
            ),
            TextContainer(
                height: 38,
                margin: 30,
                child: TextInput(
                    placeholder: 'Mot de passe',
                    isPassword: true,
                    controller: pwdController)),
            const SizedBox(
              height: 75,
            ),
            TextContainer(
                height: 54,
                margin: 30,
                child: Button(
                  fontSize: 40,
                  label: 'SE CONNECTER',
                  onTap: signIn,
                )),
          ]),
        ],
      ),
    );
  }

  void signIn() async {
    setState(() {
      isSigning = true;
    });

    String username = usernameController.text;
    String pwd = pwdController.text;

    User? user = await auth.signIn(username, pwd);

    setState(() {
      isSigning = false;
    });

    if (user != null) {
      Fluttertoast.showToast(
          msg: "Vous êtes connecté",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Identifiant ou mot de passe incorrect",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
