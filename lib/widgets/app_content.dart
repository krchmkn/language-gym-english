import 'package:flutter/cupertino.dart';
import 'package:language_gym_english/widgets/app_text.dart';
import 'package:language_gym_english/widgets/app_text_field.dart';

class AppContent extends StatelessWidget {
  final Map suggestedTextObj;
  final TextEditingController controller;
  final Function textFieldHandler;

  const AppContent({
    super.key,
    required this.suggestedTextObj,
    required this.controller,
    required this.textFieldHandler,
  });

  @override
  Widget build(BuildContext context) {
    const double spacing = 40.0;

    return Padding(
      padding: const EdgeInsets.all(spacing),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppText(data: suggestedTextObj),
            const SizedBox(height: spacing),
            AppTextField(
              controller: controller,
              handler: (value) {
                textFieldHandler(value, context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
