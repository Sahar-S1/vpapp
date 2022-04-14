import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class NewDiscussionForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final _titleKey = 'title';
  final _descriptionKey = 'description';

  final Future<void> Function(String title, String description) onSubmit;

  NewDiscussionForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'New Discussion',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            FormBuilderTextField(
              name: _titleKey,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                filled: true,
                labelText: 'Title',
              ),
              validator: FormBuilderValidators.required(context),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20),
            FormBuilderTextField(
              name: _descriptionKey,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                filled: true,
                labelText: 'Description',
              ),
              minLines: 5,
              maxLines: null,
              expands: false,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () async {
                _formKey.currentState?.save();
                if (_formKey.currentState?.validate() ?? false) {
                  String title = _formKey.currentState!.value[_titleKey];
                  String description =
                      _formKey.currentState!.value[_descriptionKey] ?? '';
                  await onSubmit(title, description);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Text(
                    'Submit',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
