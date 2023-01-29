import 'package:flutter/cupertino.dart';
import 'package:language_gym_english/api/fetch_phrases.dart';
import 'package:language_gym_english/widgets/app_loading.dart';
import 'package:language_gym_english/widgets/app_content.dart';
import 'package:language_gym_english/widgets/app_error_message.dart';
import 'package:language_gym_english/widgets/app_success_message.dart';
import 'package:language_gym_english/widgets/app_progress_indicator.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => AppHomeScreenState();
}

class AppHomeScreenState extends State<AppHomeScreen> {
  final _controller = TextEditingController();
  late Future<List> _futurePhrases;
  late int _index;
  late List _phrases;
  bool _isShowTextFieldWarning = false;

  @override
  void initState() {
    super.initState();
    _index = 0;
    _phrases = [];
    _futurePhrases = fetchPhrases();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool get _isLastPhrase {
    return _index >= _phrases.length - 1;
  }

  int get _progress {
    if (_phrases.isEmpty) {
      return 0;
    }

    int phrasesLength =
        _phrases.length > 1 ? _phrases.length - 1 : _phrases.length;
    return (_index / phrasesLength * 100.0).toInt();
  }

  Map get _suggestedTextObj {
    return _phrases[_index];
  }

  String get _suggestedText {
    return _suggestedTextObj['phrase'];
  }

  void _nextPhrase() {
    if (_isLastPhrase) {
      setState(() {
        _index = 0;
      });
      return;
    }

    setState(() {
      _index++;
    });
  }

  void _toggleWarning(bool state) {
    setState(() {
      _isShowTextFieldWarning = state;
    });
  }

  void _textFieldHandler(String value, BuildContext context) {
    if (value.toLowerCase().trim() != _suggestedText.toLowerCase()) {
      _toggleWarning(value.length == _suggestedText.length);
      return;
    }

    if (_isLastPhrase) {
      _showAlertDialog(context);
    } else {
      _nextPhrase();
    }

    _controller.clear();
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AppSuccessMessage(
        actionHandler: () {
          Navigator.pop(context);
          _nextPhrase();
        },
      ),
    );
  }

  Widget _contentBuilder(
    BuildContext context,
    AsyncSnapshot<List<dynamic>> snapshot,
  ) {
    if (snapshot.hasError) {
      return const AppErrorMessage();
    }

    if (!snapshot.hasData) {
      return const AppLoading();
    }

    _phrases = snapshot.data!;

    return AppContent(
      suggestedTextObj: _suggestedTextObj,
      controller: _controller,
      textFieldHandler: _textFieldHandler,
      isShowTextFieldWarning: _isShowTextFieldWarning,
      textFieldMaxLength: _suggestedText.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Image.asset('assets/images/icon-text.png', scale: 2.5),
        trailing: AppProgressIndicator(value: _progress),
      ),
      child: FutureBuilder<List>(
        future: _futurePhrases,
        builder: _contentBuilder,
      ),
    );
  }
}
