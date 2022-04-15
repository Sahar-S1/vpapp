import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:vpapp/models/directus.dart';
import 'package:vpapp/services/auth.dart';

class UserProfileDialog extends StatelessWidget with GetItMixin {
  final DirectusUser user;

  UserProfileDialog({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    var theme = Theme.of(context);
    var auth = get<AuthService>();

    return SingleChildScrollView(
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Profile',
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(
                  height: 80,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: CircleAvatar(
                      backgroundImage:
                          CachedNetworkImageProvider(user.avatarUrl),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                FormBuilder(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'fistName',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          filled: true,
                          labelText: 'First Name',
                        ),
                        initialValue: user.firstName,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        name: 'lastName',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          filled: true,
                          labelText: 'Last Name',
                        ),
                        initialValue: user.lastName,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Email: ${user.email}',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          _formKey.currentState?.save();
                          if (_formKey.currentState?.validate() ?? false) {
                            // String firstName = _formKey.currentState!.value['firstName'];
                            // String lastName = _formKey.currentState!.value['lastName'];
                            // Update firstName and lastName
                          }
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Center(
                            child: Text(
                              'Update',
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                MaterialButton(
                  child: const Text('Logout'),
                  onPressed: () {
                    auth.logout();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
