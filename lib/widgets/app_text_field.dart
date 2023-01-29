import 'package:flutter/cupertino.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) handler;
  final bool isShowWarning;
  final int maxLength;

  const AppTextField({
    super.key,
    required this.controller,
    required this.handler,
    required this.isShowWarning,
    required this.maxLength,
  });

  Widget? get _warningIcon {
    if (isShowWarning) {
      return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Image.asset('assets/images/icon-warning-48.png', scale: 1.5),
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      onChanged: handler,
      autocorrect: false,
      autofocus: true,
      placeholder: 'Введите текст на английском',
      padding: const EdgeInsets.all(20.0),
      maxLength: maxLength,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CupertinoColors.extraLightBackgroundGray,
      ),
      suffix: _warningIcon,
    );
  }
}
