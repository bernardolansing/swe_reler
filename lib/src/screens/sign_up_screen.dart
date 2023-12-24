import 'package:flutter/material.dart';
import 'package:swe_reler/src/widgets/or_divider.dart';
import 'package:swe_reler/src/widgets/text_with_link_portion.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/signup/folded-book-bath.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft
              ),
            ),
          ),
        ),

        const Spacer(),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 428),
          child: Expanded(
            flex: 4,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(64),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'cadastre-se',
                      style: Theme.of(context).textTheme.headlineLarge
                  ),

                  const SizedBox(height: 24),

                  const _SignUpForm(),

                  const OrDivider(),

                  const SizedBox(height: 24),

                  TextWithLinkPortion(
                      nonLinkPortion: 'já possui conta?',
                      linkPortion: 'Faça login.',
                      onTap: () => Navigator.of(context).pushNamed('/login')
                  )
                ],
              ),
            ),
          ),
        ),

        const Spacer(),
      ],
    ),
  );
}

class _SignUpForm extends StatefulWidget {
  const _SignUpForm();

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Column();
}
