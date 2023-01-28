import 'package:flutter/cupertino.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) handler;

  const AppTextField({
    super.key,
    required this.controller,
    required this.handler,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      onChanged: handler,
      autocorrect: false,
      autofocus: true,
      placeholder: 'Enter English phrase',
      padding: const EdgeInsets.all(14.0),
    );
  }
}
