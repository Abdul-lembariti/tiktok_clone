import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_btn.dart';

void main() {
  group('Form btn Test', () {
    testWidgets('Enabled State', (WidgetTester tester) async {
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: FormButton(
          disabled: false,
          text: 'Text',
        ),
      ));
      // expect(find.text('next'), findsOneWidget);
      expect(
        tester
            .firstWidget<AnimatedDefaultTextStyle>(
                find.byType(AnimatedDefaultTextStyle))
            .style
            .color,
        Colors.white,
      );
    });

    testWidgets("Disabled State DarkMode", (WidgetTester tester) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(platformBrightness: Brightness.dark),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: FormButton(
              disabled: true,
              text: 'text',
            ),
          ),
        ),
      );
      expect(
        (tester
                .firstWidget<AnimatedContainer>(find.byType(AnimatedContainer))
                .decoration as BoxDecoration)
            .color,
        Colors.grey.shade800,
      );
    });
    testWidgets("Disabled State Light Mode", (WidgetTester tester) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(platformBrightness: Brightness.light),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: FormButton(
              disabled: true,
              text: 'text',
            ),
          ),
        ),
      );
      expect(
        (tester
                .firstWidget<AnimatedContainer>(find.byType(AnimatedContainer))
                .decoration as BoxDecoration)
            .color,
        Colors.grey.shade300,
      );
    });
  });
}
