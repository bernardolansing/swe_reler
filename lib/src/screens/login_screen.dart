import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:swe_reler/src/widgets/input.dart';

class LoginScreen extends StatelessWidget {
  final _linkTapRecognizer = TapGestureRecognizer()
    ..onTap = () {}; // TODO: redirect to sign up screen.

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      children: [
        Expanded(child: Column(
          children: [
            const Spacer(),

            Text('login', style: Theme.of(context).textTheme.headlineLarge),

            const SizedBox(height: 16),

            ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: const _LoginForm()
            ),

            const SizedBox(height: 36),

            ElevatedButton(
                onPressed: () {},
                child: const Text('login')
            ),

            const SizedBox(height: 36),

            ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: const Row(
                    children: [
                      Expanded(child: Divider()),
                      SizedBox(width: 16),
                      Text('OU'),
                      SizedBox(width: 16),
                      Expanded(child: Divider()),
                    ]
                )
            ),

            const SizedBox(height: 36),

            RichText(
              text: TextSpan(
                  children: [
                    const TextSpan(
                        text: 'não possui conta? ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        )
                    ),
                    TextSpan(
                        text: 'Cadastre-se.',
                        recognizer: _linkTapRecognizer,
                        style: const TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600
                        )
                    )
                  ]
              ),
            ),

            const Spacer(),
          ],
        )),

        const Image(image: AssetImage('assets/login/woman-reading.png'))
      ],
    ),
  );
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Input(title: 'email', controller: _emailController, autoFocus: true),

      const SizedBox(height: 24),

      Input(title: 'senha', controller: _passwordController, sensitive: true),
    ],
  );
}
