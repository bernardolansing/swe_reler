import 'package:flutter/material.dart';
import 'package:swe_reler/src/user.dart';
import 'package:swe_reler/src/widgets/info_dialog.dart';
import 'package:swe_reler/src/widgets/input.dart';
import 'package:swe_reler/src/widgets/or_divider.dart';
import 'package:swe_reler/src/widgets/text_with_link_portion.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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

        SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('login', style: Theme.of(context).textTheme.headlineLarge),

                const SizedBox(height: 16),

                const _LoginForm(),

                const SizedBox(height: 36),

                const OrDivider(),

                const SizedBox(height: 36),

                TextWithLinkPortion(
                    nonLinkPortion: 'não possui conta?',
                    linkPortion: 'Cadastre-se.',
                    onTap: () => Navigator.of(context).pushNamed('/signup')
                ),
              ],
            ),
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

  bool _emptyEmailError = false;
  bool _invalidEmailError = false;
  bool _emptyPasswordError = false;

  Future<void> _submit() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty) {
      setState(() => _emptyEmailError = true);
    }
    if (password.isEmpty) {
      setState(() => _emptyPasswordError = true);
    }
    if (_emptyEmailError || _emptyPasswordError) { return; }

    try {
      await AppUser
          .loginWithEmail(_emailController.text, _passwordController.text);

      // After the login is succeeded, we want to remove the previous screens
      // from the navigation history and put the user dash screen.
      if (! context.mounted) { return; }
      Navigator.of(context).pushNamedAndRemoveUntil('/dash', (route) => false);
    }

    on InvalidEmail { setState(() => _invalidEmailError = true); }
    on WrongCredentials { _showWrongCredentailsDialog(); }
    on DeletedAccount { _showDeletedUserDialog(); }
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Input(
        title: 'email',
        controller: _emailController,
        autoFocus: true,
        errorMessage: _emailErrorMessage,
        errorDismisser: () => setState(() {
          _emptyEmailError = false;
          _invalidEmailError = false;
        }),
      ),
      const SizedBox(height: 24),

      Input(
        title: 'senha',
        controller: _passwordController,
        sensitive: true,
        errorMessage: _passwordErrorMessage,
        errorDismisser: () => setState(() => _emptyPasswordError = false),
      ),
      const SizedBox(height: 36),

      ElevatedButton(
          onPressed: _submit,
          child: const Text('login')
      ),
    ],
  );

  String? get _emailErrorMessage {
    if (_emptyEmailError) {
      return 'Por favor, forneça um endereço de e-mail.';
    }
    if (_invalidEmailError) {
      return 'O endereço de e-mail fornecido é inválido';
    }
    return null;
  }

  String? get _passwordErrorMessage {
    if (_emptyPasswordError) { return 'Por favor, forneça uma senha.'; }
    return null;
  }

  Future<void> _showWrongCredentailsDialog() => showDialog(
      context: context,
      builder: (context) => const InfoDialog(
        title: 'Conta não encontrada',
        text: 'Por favor, verifique o endereço de e-mail e senha digitados ou '
            'crie uma conta.',
      )
  );

  /// Pops up a dialog that tells user that their account has been deleted.
  Future<void> _showDeletedUserDialog() => showDialog(
      context: context,
      builder: (context) => const InfoDialog(
        title: 'Conta eliminada',
        text: 'Esta conta de usuário foi excluída. Por favor, verifique o '
            'endereço de e-mail digitado ou crie outra conta.',
      )
  );
}
