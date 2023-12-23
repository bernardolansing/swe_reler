import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:swe_reler/src/widgets/input.dart';

class LoginScreen extends StatelessWidget {
  final _linkTapRecognizer = TapGestureRecognizer()
    ..onTap = () {}; // TODO: redirect to sign up screen.

  LoginScreen({super.key});

  /// Evaluates the width that the side image will have when shown on the
  /// screen. We have to calculate this because the image takes some time to
  /// load, and if its size isn't specificied it will push the other widgets
  /// on loading, causing an ugly flick effect.
  double _foreseeSideImageWidth(BuildContext context) {
    const assetHeight = 982;
    const assetWidth = 818;
    final displayHeight = MediaQuery.of(context).size.height;

    return assetWidth * (displayHeight / assetHeight);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      children: [
        const Spacer(),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('login', style: Theme.of(context).textTheme.headlineLarge),

              const SizedBox(height: 16),

              const _LoginForm(),

              const SizedBox(height: 36),

              ElevatedButton(
                  onPressed: () {},
                  child: const Text('login')
              ),

              const SizedBox(height: 36),

              const Row(
                  children: [
                    Expanded(child: Divider()),
                    SizedBox(width: 16),
                    Text('OU'),
                    SizedBox(width: 16),
                    Expanded(child: Divider()),
                  ]
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
            ],
          ),
        ),

        const Spacer(),

        Image(
          image: const AssetImage('assets/login/woman-reading.png'),
          width: _foreseeSideImageWidth(context),
        )
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
