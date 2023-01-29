import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:language_gym_english/main.dart' as app;
import 'package:language_gym_english/widgets/app_progress_indicator.dart';
import 'package:language_gym_english/widgets/app_text.dart';
import 'package:language_gym_english/widgets/app_text_field.dart';
import 'package:language_gym_english/widgets/app_success_message.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App renders elements', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    final Finder progressIndicator = find.byType(AppProgressIndicator);
    final Finder appText = find.byType(AppText);
    final Finder textField = find.byType(AppTextField);

    expect(find.byType(Image), findsOneWidget);
    expect(progressIndicator, findsOneWidget);
    expect(appText, findsOneWidget);
    expect(textField, findsOneWidget);

    await tester.tap(textField);
    await tester.enterText(textField, 'test');
    await tester.pumpAndSettle();

    expect(find.byType(AppSuccessMessage), findsNothing);
  });
}
