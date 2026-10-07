import 'package:flutter_test/flutter_test.dart';
import 'package:memory_sonoro/main.dart';

void main() {
  testWidgets('apre la Fattoria dalla home', (tester) async {
    await tester.pumpWidget(const MemorySonoroApp());
    expect(find.text('Memory Sonoro'), findsOneWidget);
    expect(find.text('La fattoria'), findsOneWidget);

    await tester.tap(find.text('La fattoria'));
    await tester.pumpAndSettle();

    expect(find.text('🐄 La fattoria'), findsOneWidget);
    expect(find.text('Coppie: 0/6'), findsOneWidget);
    expect(find.text('Mosse: 0'), findsOneWidget);
  });
}
