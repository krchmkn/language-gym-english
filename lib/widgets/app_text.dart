import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final Map data;

  const AppText({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            data['phrase'],
            style: const TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            data['ru'],
            style: const TextStyle(
              color: CupertinoColors.inactiveGray,
              fontWeight: FontWeight.w300,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
