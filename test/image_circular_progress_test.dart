import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_circular_progress/image_circular_progress.dart';

void main() {
  testWidgets('ImageCircularProgress renders with default parameters', (
    WidgetTester tester,
  ) async {
    // Creates a widget with a dummy image (we use a Container to simulate).
    final widget = MaterialApp(
      home: Scaffold(
        body: ImageCircularProgress(
          centerImage: Container(key: Key('center-image')),
        ),
      ),
    );
    await tester.pumpWidget(widget);
    // Checks if the CircularProgressIndicator has been rendered.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    // Checks if the center image has been rendered.
    expect(find.byKey(Key('center-image')), findsOneWidget);
  });
  testWidgets('ImageCircularProgress accepts a value and renders determinate', (
    WidgetTester tester,
  ) async {
    final widget = MaterialApp(
      home: Scaffold(
        body: ImageCircularProgress(value: 0.5, centerImage: Container()),
      ),
    );

    await tester.pumpWidget(widget);

    final CircularProgressIndicator indicator = tester.widget(
      find.byType(CircularProgressIndicator),
    );
    expect(indicator.value, 0.5);
  });

  testWidgets('ImageCircularProgress renders with pulse animation', (
    WidgetTester tester,
  ) async {
    final widget = MaterialApp(
      home: Scaffold(
        body: ImageCircularProgress(
          centerImage: Container(),
          pulseOpacity: true,
        ),
      ),
    );

    await tester.pumpWidget(widget);
    await tester.pump(
      const Duration(seconds: 1),
    ); // Advance the time for animation

    // Confirm that there is still a CircularProgressIndicator and no error occurred
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
