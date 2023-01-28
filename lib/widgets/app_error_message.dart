import 'package:flutter/cupertino.dart';

class AppErrorMessage extends StatelessWidget {
  const AppErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Oops... An error occurred.'),
    );
  }
}
