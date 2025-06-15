// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mercury_flutter/main.dart';

void main() {
  testWidgets('App starts with authentication flow', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that we start with the login page
    expect(find.text('Chào mừng trở lại!'), findsOneWidget);
    expect(find.text('Đăng nhập để tiếp tục với Mercury'), findsOneWidget);

    // Verify login form elements are present
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Mật khẩu'), findsOneWidget);
    expect(find.text('Đăng nhập'), findsOneWidget);
  });

  testWidgets('Navigation to register page works', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Find and tap the register link
    await tester.tap(find.text('Đăng ký ngay'));
    await tester.pumpAndSettle();

    // Verify we're on the register page
    expect(find.text('Tạo tài khoản mới'), findsOneWidget);
    expect(
      find.text('Đăng ký để bắt đầu hành trình với Mercury'),
      findsOneWidget,
    );
  });

  testWidgets('Theme is applied correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Get the MaterialApp widget
    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));

    // Verify that theme is not null and has our custom colors
    expect(materialApp.theme, isNotNull);
    expect(materialApp.darkTheme, isNotNull);
    expect(materialApp.themeMode, ThemeMode.system);

    // Verify app title
    expect(materialApp.title, 'Mercury');
  });
}
