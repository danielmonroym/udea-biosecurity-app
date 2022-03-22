import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:network_image_mock/network_image_mock.dart';
import 'package:udea_biosecurity_app/widgets/details/details_widgets.dart';

import 'package:udea_biosecurity_app/widgets/home/home_widgets.dart';

import '../mocks/places_mock.dart';

void main() {
  final MockPlaces mockedPlaces = MockPlaces();
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 15), primary: Color(0xff2E6347));

  testWidgets('details card img test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await mockNetworkImagesFor(() => tester.pumpWidget(MaterialApp(
          home: DetailsCard(
            place: mockedPlaces,
            style: style,
          ),
        )));

    expect(find.byKey(Key("details-img")), findsOneWidget);
  });

  testWidgets('home car text list test', (WidgetTester tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(MaterialApp(
          home: DetailsCard(place: mockedPlaces, style: style),
        )));
    expect(find.byKey(Key("back-button")), findsOneWidget);
    expect(find.byKey(Key("book-button")), findsOneWidget);
  });
}
