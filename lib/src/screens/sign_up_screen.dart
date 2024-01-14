import 'package:flutter/material.dart';
import 'package:swe_reler/src/user.dart';
import 'package:swe_reler/src/widgets/info_dialog.dart';
import 'package:swe_reler/src/widgets/input.dart';
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

        Expanded(
          flex: 4,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 428),
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

  bool _agreedWithTherms = false;
  bool _emptyNameError = false;
  bool _emptyEmailError = false;
  bool _invalidEmailError = false;
  bool _emptyPasswordError = false;
  bool _invalidPasswordError = false;
  bool _unmatchingPasswordsError = false;
  bool _didNotAgreeWithThermsError = false;

  Future<void> _submit() async {
    setState(() {
      _emptyNameError = _nameController.text.isEmpty;
      _emptyEmailError = _emailController.text.isEmpty;
      _emptyPasswordError = _passwordController.text.isEmpty;
      _invalidPasswordError = _passwordController.text.length < 6;
      _unmatchingPasswordsError = _passwordController.text
          != _repeatPasswordController.text;
      _didNotAgreeWithThermsError = ! _agreedWithTherms;
    });

    final errorStates = [_emptyNameError, _emptyEmailError, _invalidEmailError,
      _emptyPasswordError, _invalidPasswordError, _unmatchingPasswordsError,
      _didNotAgreeWithThermsError];

    if (errorStates.any((error) => error)) { return; }

    try {
      await AppUser.signUpWithEmail(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text
      );

      // After the sign up is succeeded, we want to remove the previous screens
      // from the navigation history and put the user dash screen.
      if (! context.mounted) { return; }
      Navigator.of(context).pushNamedAndRemoveUntil('/dash', (route) => false);
    }

    on InvalidEmail { setState(() => _invalidEmailError = true); }
    on UsedEmail { _showEmailAlreadyInUseWarning(); }
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Input(
        title: 'nome',
        controller: _nameController,
        errorMessage: _emptyNameError ? 'O nome é obrigatório.' : null,
        errorDismisser: () => setState(() => _emptyNameError = false),
      ),
      const SizedBox(height: 24),

      Input(
        title: 'e-mail',
        controller: _emailController,
        errorMessage: _emailErrorMessage,
        errorDismisser: () => setState(() {
          _emptyEmailError = false;
          _invalidEmailError = false;
        }),
      ),
      const SizedBox(height: 36),

      Input(
        title: 'crie uma senha',
        controller: _passwordController,
        sensitive: true,
        errorMessage: _passwordErrorMessage,
        errorDismisser: () => setState(() {
          _emptyPasswordError = false;
          _invalidPasswordError = false;
        }),
      ),
      const SizedBox(height: 24),

      Input(
        title: 'confirme sua senha',
        controller: _repeatPasswordController,
        sensitive: true,
        errorMessage: _unmatchingPasswordsError
            ? 'As senhas digitadas não batem!'
            : null,
        errorDismisser: () => setState(() => _unmatchingPasswordsError = false),
      ),
      const SizedBox(height: 36),

      CheckboxListTile(
        value: _agreedWithTherms,
        controlAffinity: ListTileControlAffinity.leading,
        title: const Text('Li e concordo com os termos de uso.'),
        onChanged: (value) => setState(() {
          _agreedWithTherms = value!;
          _didNotAgreeWithThermsError = false;
        }),
        isError: _didNotAgreeWithThermsError,
        subtitle: _didNotAgreeWithThermsError ? _checkboxErrorSubtitle : null,
      ),
      const SizedBox(height: 36),

      ElevatedButton(
          onPressed: _submit,
          child: const Text('cadastre-se')
      ),
      const SizedBox(height: 24),
    ],
  );

  Widget get _checkboxErrorSubtitle => Text(
    'Você deve concordar com os termos para continuar.',
    style: TextStyle(
        color: Theme.of(context).colorScheme.error,
        fontSize: 12
    ),
  );

  String? get _emailErrorMessage {
    if (_emptyEmailError) { return 'O e-mail é obrigatório.'; }
    if (_invalidEmailError) { return 'Este endereço de e-mail é inválido!'; }
    return null;
  }

  String? get _passwordErrorMessage {
    if (_emptyPasswordError) { return 'Você deve fornecer uma senha.'; }
    if (_invalidPasswordError) {
      return 'A senha deve possuir mais de 5 caracteres!';
    }
    return null;
  }

  Future<void> _showEmailAlreadyInUseWarning() => showDialog(
      context: context,
      builder: (context) => const InfoDialog(
        title: 'E-mail em uso',
        text: 'Este endereço de e-mail já está sendo utilizado por outro '
            'usuário. Experimente fazer login ou escolher outro e-mail.',
      )
  );
}
