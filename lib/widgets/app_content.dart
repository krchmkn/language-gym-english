import 'package:flutter/cupertino.dart';
import 'package:language_gym_english/widgets/app_text.dart';
import 'package:language_gym_english/widgets/app_text_field.dart';

class AppContent extends StatelessWidget {
  final Map suggestedTextObj;
  final TextEditingController controller;
  final Function textFieldHandler;
  final int textFieldMaxLength;
  final bool isShowTextFieldWarning;

  const AppContent({
    super.key,
    required this.suggestedTextObj,
    required this.controller,
    required this.textFieldHandler,
    required this.textFieldMaxLength,
    required this.isShowTextFieldWarning,
  });

  @override
  Widget build(BuildContext context) {
    const double spacing = 30.0;

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 700),
        padding: const EdgeInsets.all(spacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppText(data: suggestedTextObj),
            const SizedBox(height: spacing),
            AppTextField(
              controller: controller,
              handler: (value) {
                textFieldHandler(value, context);
              },
              isShowWarning: isShowTextFieldWarning,
              maxLength: textFieldMaxLength,
            ),
          ],
        ),
      ),
    );
  }
}
