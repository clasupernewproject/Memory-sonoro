import 'package:flutter_test/flutter_test.dart';
import 'package:memory_sonoro/main.dart';

void main() {
  testWidgets('mostra il menu e apre la Fattoria', (tester) async {
    await tester.pumpWidget(const MemorySonoroApp());

    expect(find.text('Memory Sonoro'), findsOneWidget);
    expect(find.text('La fattoria'), findsOneWidget);
    expect(find.text('La città'), findsOneWidget);

    await tester.tap(find.text('La fattoria'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byTooltip('Audio'), findsOneWidget);
    expect(find.byTooltip('Ricomincia'), findsOneWidget);
    expect(find.byTooltip('Home'), findsOneWidget);
    expect(find.text('0'), findsNWidgets(2));
  });
}
