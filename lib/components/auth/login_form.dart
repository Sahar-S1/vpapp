import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';
import 'package:vpapp/pages/home.dart';
import 'package:vpapp/services/auth.dart';

class LoginForm extends StatefulWidget with GetItStatefulWidgetMixin {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with GetItStateMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailKey = 'email';
  final _passwordKey = 'password';

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          FormBuilderTextField(
            name: _emailKey,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              filled: true,
              labelText: 'Email',
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.email(context),
            ]),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          FormBuilderTextField(
            name: _passwordKey,
            obscureText: _obscureText,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => setState(() => _obscureText = !_obscureText),
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              filled: true,
              labelText: 'Password',
              errorMaxLines: 2,
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.minLength(context, 8),
              FormBuilderValidators.match(
                context,
                '(?=.*[a-z])',
                errorText:
                    'This field should contain at least one lowercase character',
              ),
              FormBuilderValidators.match(
                context,
                '(?=.*[A-Z])',
                errorText:
                    'This field should contain at least one uppercase character',
              ),
              FormBuilderValidators.match(
                context,
                '(?=.*[0-9])',
                errorText: 'This field should contain at least one digit',
              ),
              FormBuilderValidators.match(
                context,
                '(?=.*[@\$!%*?&#])',
                errorText:
                    'This field should contain at least one special character',
              ),
            ]),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              _formKey.currentState?.save();
              if (_formKey.currentState?.validate() ?? false) {
                String email = _formKey.currentState!.value[_emailKey];
                String password = _formKey.currentState!.value[_passwordKey];
                get<AuthService>().login(email, password);
              }
              context.goNamed(HomePage.routeName);
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Text(
                  'Login',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text('Forgot password? Contact admin'),
        ],
      ),
    );
  }
}
