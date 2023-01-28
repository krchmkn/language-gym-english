import 'package:flutter/cupertino.dart';

class AppProgressIndicator extends StatelessWidget {
  final int value;

  const AppProgressIndicator({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$value%',
      style: const TextStyle(
        color: CupertinoColors.inactiveGray,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
