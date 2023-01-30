import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final Map data;
  final String currentText;

  const AppText({
    super.key,
    required this.data,
    required this.currentText,
  });

  List<TextSpan> get _richText {
    Map phrase = data['phrase'].split('').asMap();
    Map currentTextMap = currentText.toLowerCase().split('').asMap();
    List<TextSpan> result = [];

    textSpanColor(int index, String value) => (currentTextMap.isNotEmpty &&
            currentTextMap.containsKey(index) &&
            value.toLowerCase() == currentTextMap[index])
        ? CupertinoColors.activeBlue
        : CupertinoColors.black;

    phrase.forEach((index, value) {
      result.add(TextSpan(
        text: value,
        style: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          color: textSpanColor(index, value),
        ),
      ));
    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: _richText,
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
