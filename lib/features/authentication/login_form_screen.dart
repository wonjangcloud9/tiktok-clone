import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class LoginFormScreen extends StatelessWidget {
  const LoginFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                ),
              ),
              Gaps.v16,
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                ),
              ),
              Gaps.v28,
              const FormButton(
                disable: false,
                text: "Login",
              )
            ],
          ),
        ),
      ),
    );
  }
}
