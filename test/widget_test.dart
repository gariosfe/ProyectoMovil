import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:proyectomovil/HomePage.dart';  // Asegúrate de que la importación sea correcta

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Construye la aplicación y dispara un frame.
    await tester.pumpWidget(MyApp());  // No necesitas 'const' si no se usa un constructor constante

    // Verifica que el contador empiece en 0.
    expect(find.text('Counter: 0'), findsOneWidget);  // Verifica que el texto "Counter: 0" esté presente
    expect(find.text('Counter: 1'), findsNothing);  // Asegúrate de que el texto "Counter: 1" no esté presente al principio

    // Toca el ícono '+' y dispara un frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifica que el contador se haya incrementado.
    expect(find.text('Counter: 0'), findsNothing);  // Verifica que el texto "Counter: 0" ya no esté presente
    expect(find.text('Counter: 1'), findsOneWidget);  // Verifica que el texto "Counter: 1" esté presente
  });
}
