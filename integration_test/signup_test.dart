import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('signup tests', () {
    testWidgets('signup error null email and null password input test', (WidgetTester tester) async {
      const mockedEmail = "";
      const mockedPassword = "";
      const mockedConformPass = "";

      runApp(ProviderScope(child: MyApp()));

      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(DefaultButton, "Continue"));
      await tester.pumpAndSettle();
      await tester.tap(find.text("Sign Up"));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("sign_up_form_text_input_email")), mockedEmail);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("sign_up_form_text_input_password")), mockedPassword);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("sign_up_form_text_input_conform_pass")), mockedConformPass);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(DefaultButton, "Continue"));
      await tester.pumpAndSettle();
      expect(find.text(kEmailNullError), findsOneWidget);
      expect(find.text(kPassNullError), findsOneWidget);
    });

    testWidgets('signup error invalid email and null password input test', (WidgetTester tester) async {
      const mockedEmail = "admin";
      const mockedPassword = "";
      const mockedConformPass = "";

      runApp(ProviderScope(child: MyApp()));

      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(DefaultButton, "Continue"));
      await tester.pumpAndSettle();
      await tester.tap(find.text("Sign Up"));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("sign_up_form_text_input_email")), mockedEmail);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("sign_up_form_text_input_password")), mockedPassword);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("sign_up_form_text_input_conform_pass")), mockedConformPass);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(DefaultButton, "Continue"));
      await tester.pumpAndSettle();
      expect(find.text(kInvalidEmailError), findsOneWidget);
      expect(find.text(kPassNullError), findsOneWidget);
    });

    testWidgets('signup error valid email and null password input test', (WidgetTester tester) async {
      const mockedEmail = "admin@admin.com";
      const mockedPassword = "";
      const mockedConformPass = "";

      runApp(ProviderScope(child: MyApp()));

      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(DefaultButton, "Continue"));
      await tester.pumpAndSettle();
      await tester.tap(find.text("Sign Up"));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("sign_up_form_text_input_email")), mockedEmail);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("sign_up_form_text_input_password")), mockedPassword);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("sign_up_form_text_input_conform_pass")), mockedConformPass);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(DefaultButton, "Continue"));
      await tester.pumpAndSettle();
      expect(find.text(kPassNullError), findsOneWidget);
    });

    testWidgets('signup error valid email and password too short input test', (WidgetTester tester) async {
      const mockedEmail = "admin@admin.com";
      const mockedPassword = "aaa";
      const mockedConformPass = "";

      runApp(ProviderScope(child: MyApp()));

      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(DefaultButton, "Continue"));
      await tester.pumpAndSettle();
      await tester.tap(find.text("Sign Up"));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("sign_up_form_text_input_email")), mockedEmail);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("sign_up_form_text_input_password")), mockedPassword);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("sign_up_form_text_input_conform_pass")), mockedConformPass);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(DefaultButton, "Continue"));
      await tester.pumpAndSettle();
      expect(find.text(kPassNullError), findsOneWidget);
      expect(find.text(kShortPassError), findsOneWidget);
    });

    testWidgets('signup error valid email and password not matched input test', (WidgetTester tester) async {
      const mockedEmail = "admin@admin.com";
      const mockedPassword = "aaabbbccc";
      const mockedConformPass = "dddeeefff";

      runApp(ProviderScope(child: MyApp()));

      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(DefaultButton, "Continue"));
      await tester.pumpAndSettle();
      await tester.tap(find.text("Sign Up"));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("sign_up_form_text_input_email")), mockedEmail);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("sign_up_form_text_input_password")), mockedPassword);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("sign_up_form_text_input_conform_pass")), mockedConformPass);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(DefaultButton, "Continue"));
      await tester.pumpAndSettle();
      expect(find.text(kMatchPassError), findsOneWidget);
    });
  });
}