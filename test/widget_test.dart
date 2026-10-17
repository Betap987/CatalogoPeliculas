import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_56/main.dart';

void main() {
  testWidgets('la aplicación muestra el catálogo', (tester) async {
    await tester.pumpWidget(const CatalogoPeliculasApp());

    expect(find.text('Catálogo de Películas'), findsOneWidget);
  });
}
