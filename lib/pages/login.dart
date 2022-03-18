import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:vpapp/config.dart';
import 'package:vpapp/pages/home.dart';

class LoginPage extends StatelessWidget {
  static const routeName = 'login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    var theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: AppConfig.logoUrl,
                color: theme.colorScheme.primaryContainer,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return const Center(
                    child: Icon(Icons.error),
                  );
                },
              ),
              const Spacer(),
              FormBuilderTextField(
                name: 'username',
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
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'password',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
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
                    '(?=.*[@\$!%*?&])',
                    errorText:
                        'This field should contain at least one special character',
                  ),
                ]),
                keyboardType: TextInputType.visiblePassword,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  _formKey.currentState?.save();
                  if (_formKey.currentState?.validate() ?? false) {
                    // TODO
                  } else {
                    // TODO
                  }
                  context.goNamed(HomePage.routeName);
                },
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Forgot password? Contact admin'),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
