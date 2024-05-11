import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nebuleuses/services/firebase_auth_services.dart';
import 'package:nebuleuses/router.dart';
import 'package:nebuleuses/utils.dart';
import 'package:nebuleuses/widgets/text_container.dart';
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
  final FirebaseAuthService auth = FirebaseAuthService();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  TextEditingController usernameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundImage(),
          Column(children: [
            Container(
              height: 81,
              margin: const EdgeInsets.only(top: 183, bottom: 50),
              child: const Center(
                child: ScreenTitle(title: 'CONNEXION', fontSize: 64),
              ),
            ),
            Form(
                key: _formKey,
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextInput(
                      placeholder: 'Mon identifiant',
                      isPassword: false,
                      controller: usernameController,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextInput(
                        placeholder: 'Mot de passe',
                        isPassword: true,
                        controller: pwdController),
                  ),
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
                      formKey: _formKey,
                    ),
                  ),
                ])),
          ]),
        ],
      ),
    );
  }

  void signIn() async {
    String username = usernameController.text;
    String pwd = pwdController.text;

    User? user = await auth.signIn(username, pwd);

    if (user != null) {
      showToast("Vous êtes connecté");
      Navigator.pushNamed(context, AppRouter.welcomeScreen);
    } else {
      showToast("Identifiant ou mot de passe incorrect");
    }
  }
}
