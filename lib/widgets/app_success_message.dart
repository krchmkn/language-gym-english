import 'package:flutter/cupertino.dart';

class AppSuccessMessage extends StatelessWidget {
  final Function()? actionHandler;

  const AppSuccessMessage({
    super.key,
    required this.actionHandler,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Congratulations'),
      content: const Text('You\'re great! All phrases done!'),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: actionHandler,
          child: const Text('Start again'),
        ),
      ],
    );
  }
}
