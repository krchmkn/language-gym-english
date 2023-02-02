import 'package:flutter/cupertino.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) handler;
  final bool isShowWarning;
  final String suggestedText;

  const AppTextField({
    super.key,
    required this.controller,
    required this.handler,
    required this.isShowWarning,
    required this.suggestedText,
  });

  Widget? get _warningIcon {
    return isShowWarning
        ? Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset('assets/images/icon-warning-48.png', scale: 2),
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      onChanged: handler,
      autocorrect: false,
      autofocus: true,
      placeholder: suggestedText,
      padding: const EdgeInsets.all(20.0),
      maxLength: suggestedText.length,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CupertinoColors.extraLightBackgroundGray,
      ),
      prefix: _warningIcon,
      clearButtonMode: OverlayVisibilityMode.editing,
    );
  }
}
