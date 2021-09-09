import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shop_app/components/custom_dialog.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/main.dart';
import 'package:shop_app/providers/dio_provider.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/sign_up/sign_up_model.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('complete profile tests', () {
    testWidgets('complete profile success test', (WidgetTester tester) async {
      final mockDioProvider = Dio(BaseOptions());
      final dioAdapter = DioAdapter(dio: mockDioProvider);
      const path = '$SERVICE_URL/signup';
      const mockedEmail = "admin@admin.com";
      const mockedPassword = "aaabbbccc";
      const mockedConformPass = "aaabbbccc";

      SignUpModel signUpModel = new SignUpModel(mockedEmail, mockedPassword);

      dioAdapter.onPost(
          path, (server) => server.reply(200, 'Success'),
          data: signUpModel.toJson());

      runApp(ProviderScope(
          overrides: [dioProvider.overrideWithValue(mockDioProvider)],
          child: MyApp()));

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
      expect(find.byType(CompleteProfileScreen), findsOneWidget);

      const mockedFirstName = "makan";
      const mockedLastName = "nasi";
      const mockedPhoneNumber = "0011223344";
      const mockedAddress = "address1";

      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("complete_profile_form_text_input_first_name")), mockedFirstName);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("complete_profile_form_text_input_last_name")), mockedLastName);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("complete_profile_form_text_input_phone_number")), mockedPhoneNumber);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("complete_profile_form_text_input_address")), mockedAddress);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(DefaultButton, "continue"));
      await tester.pumpAndSettle();
      expect(find.byType(CustomDialogBox), findsOneWidget);
      expect(find.text("User created"), findsOneWidget);
    });

    testWidgets('complete profile error null first name input test', (WidgetTester tester) async {
      final mockDioProvider = Dio(BaseOptions());
      final dioAdapter = DioAdapter(dio: mockDioProvider);
      const path = '$SERVICE_URL/signup';
      const mockedEmail = "admin@admin.com";
      const mockedPassword = "aaabbbccc";
      const mockedConformPass = "aaabbbccc";

      SignUpModel signUpModel = new SignUpModel(mockedEmail, mockedPassword);

      dioAdapter.onPost(
          path, (server) => server.reply(200, 'Success'),
          data: signUpModel.toJson());

      runApp(ProviderScope(
          overrides: [dioProvider.overrideWithValue(mockDioProvider)],
          child: MyApp()));

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
      expect(find.byType(CompleteProfileScreen), findsOneWidget);

      const mockedFirstName = "";
      const mockedLastName = "";
      const mockedPhoneNumber = "";
      const mockedAddress = "";

      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("complete_profile_form_text_input_first_name")), mockedFirstName);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("complete_profile_form_text_input_last_name")), mockedLastName);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("complete_profile_form_text_input_phone_number")), mockedPhoneNumber);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("complete_profile_form_text_input_address")), mockedAddress);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(DefaultButton, "continue"));
      await tester.pumpAndSettle();
      expect(find.text(kNameNullError), findsOneWidget);
      expect(find.text(kPhoneNumberNullError), findsOneWidget);
      expect(find.text(kAddressNullError), findsOneWidget);
    });

    testWidgets('complete profile error null phone number input test', (WidgetTester tester) async {
      final mockDioProvider = Dio(BaseOptions());
      final dioAdapter = DioAdapter(dio: mockDioProvider);
      const path = '$SERVICE_URL/signup';
      const mockedEmail = "admin@admin.com";
      const mockedPassword = "aaabbbccc";
      const mockedConformPass = "aaabbbccc";

      SignUpModel signUpModel = new SignUpModel(mockedEmail, mockedPassword);

      dioAdapter.onPost(
          path, (server) => server.reply(200, 'Success'),
          data: signUpModel.toJson());

      runApp(ProviderScope(
          overrides: [dioProvider.overrideWithValue(mockDioProvider)],
          child: MyApp()));

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
      expect(find.byType(CompleteProfileScreen), findsOneWidget);

      const mockedFirstName = "makan";
      const mockedLastName = "nasi";
      const mockedPhoneNumber = "";
      const mockedAddress = "";

      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("complete_profile_form_text_input_first_name")), mockedFirstName);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("complete_profile_form_text_input_last_name")), mockedLastName);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("complete_profile_form_text_input_phone_number")), mockedPhoneNumber);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("complete_profile_form_text_input_address")), mockedAddress);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(DefaultButton, "continue"));
      await tester.pumpAndSettle();
      expect(find.text(kPhoneNumberNullError), findsOneWidget);
      expect(find.text(kAddressNullError), findsOneWidget);
    });

    testWidgets('complete profile error null address input test', (WidgetTester tester) async {
      final mockDioProvider = Dio(BaseOptions());
      final dioAdapter = DioAdapter(dio: mockDioProvider);
      const path = '$SERVICE_URL/signup';
      const mockedEmail = "admin@admin.com";
      const mockedPassword = "aaabbbccc";
      const mockedConformPass = "aaabbbccc";

      SignUpModel signUpModel = new SignUpModel(mockedEmail, mockedPassword);

      dioAdapter.onPost(
          path, (server) => server.reply(200, 'Success'),
          data: signUpModel.toJson());

      runApp(ProviderScope(
          overrides: [dioProvider.overrideWithValue(mockDioProvider)],
          child: MyApp()));

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
      expect(find.byType(CompleteProfileScreen), findsOneWidget);

      const mockedFirstName = "makan";
      const mockedLastName = "nasi";
      const mockedPhoneNumber = "0011223344";
      const mockedAddress = "";

      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("complete_profile_form_text_input_first_name")), mockedFirstName);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("complete_profile_form_text_input_last_name")), mockedLastName);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("complete_profile_form_text_input_phone_number")), mockedPhoneNumber);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("complete_profile_form_text_input_address")), mockedAddress);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(DefaultButton, "continue"));
      await tester.pumpAndSettle();
      expect(find.text(kAddressNullError), findsOneWidget);
    });
  });
}