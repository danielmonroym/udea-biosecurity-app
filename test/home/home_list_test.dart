import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:network_image_mock/network_image_mock.dart';
import 'package:udea_biosecurity_app/models/models.dart';

import 'package:udea_biosecurity_app/widgets/home/home_widgets.dart';

import 'mocks/places_mock.dart';

void main() {
  final MockPlaces mockedPlaces = MockPlaces();
  final List<Places> mockedPlacesList = [];
  mockedPlacesList.add(mockedPlaces);
  ScrollController _scrollController = ScrollController();
  testWidgets('home  page test', (WidgetTester tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(MaterialApp(
          home: HomeList(
            listLength: mockedPlacesList.length,
            listOfPlaces: mockedPlacesList,
            scrollController: _scrollController,
          ),
        )));

    expect(find.byKey(Key("img-container")), findsOneWidget);
    expect(find.byKey(Key("img")), findsOneWidget);
  });

  testWidgets('home car text list test', (WidgetTester tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(MaterialApp(
          home: HomeCard(
            place: mockedPlaces,
          ),
        )));
    expect(find.byKey(Key("text-list")), findsOneWidget);
    expect(find.textContaining('Ubicación'), findsOneWidget);
    expect(find.textContaining('Telefono'), findsOneWidget);
    expect(find.textContaining('Horario disponible'), findsOneWidget);
  });
}
