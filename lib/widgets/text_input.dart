import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String placeholder;
  final bool isPassword;
  final TextEditingController controller;
  const TextInput(
      {super.key,
      required this.placeholder,
      required this.isPassword,
      required this.controller});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      obscureText: widget.isPassword == true ? _obscureText : false,
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Veuillez saisir votre ${!widget.isPassword ? 'identifiant' : 'mot de passe'}";
        }
        return null;
      },
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          contentPadding: const EdgeInsets.only(left: 24),
          fillColor: const Color(0xFF112A46),
          filled: true,
          hintText: widget.placeholder,
          hintStyle: const TextStyle(
            fontFamily: "Dongle",
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: widget.isPassword == true
                ? Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText == false ? Colors.blue : Colors.grey,
                  )
                : const Text(""),
          )),
    );
  }
}
