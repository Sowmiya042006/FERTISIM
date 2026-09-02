import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('FERTISIM welcome screen loads', (tester) async {
    await tester.pumpWidget(const FertiSimApp());

    expect(find.text('FERTISIM'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}