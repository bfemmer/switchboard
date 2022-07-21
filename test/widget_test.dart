// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:switchboard/main.dart';

void main() {
  testWidgets('Bottom navigation index increment', (WidgetTester tester) async {
    const navBarKey = Key('navBar');

    // Build app and trigger a frame.
    await tester.pumpWidget(const SwitchboardApp());

    // Verify index at zero.
    expect(
        (find.byKey(navBarKey).evaluate().single.widget as BottomNavigationBar)
            .currentIndex,
        0);

    // Tap the 'phone' icon and trigger a frame.
    await tester.tap(find.byKey(const Key('hotlines')));
    await tester.pump();

    // Verify index incremented.
    expect(
        (find.byKey(navBarKey).evaluate().single.widget as BottomNavigationBar)
            .currentIndex,
        1);

    // Tap the 'people' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.people));
    await tester.pump();

    // Verify index incremented.
    expect(
        (find.byKey(navBarKey).evaluate().single.widget as BottomNavigationBar)
            .currentIndex,
        2);

    // Tap the 'home' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();

    // Verify index reset to zero.
    expect(
        (find.byKey(navBarKey).evaluate().single.widget as BottomNavigationBar)
            .currentIndex,
        0);
  });
}
