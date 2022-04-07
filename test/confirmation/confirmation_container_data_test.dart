import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:udea_biosecurity_app/widgets/confirmation/confirmation_container_data.dart';

import 'mocks/invitation_mock.dart';

void main() {
  testWidgets('confirmation user data test', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    final ButtonStyle mockedStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15), primary: Color(0xff2E6347));
    final mockedFormatter = new DateFormat('yyyy-MM-dd HH:mm');
    final mockedInvitation = new InvitationMock();
    await tester.pumpWidget(MaterialApp(
      home: ConfirmationContainerData(
        formatter: mockedFormatter,
        style: mockedStyle,
        succesfulInvitationData: mockedInvitation,
      ),
    ));

    expect(find.textContaining("123@gmail.com"), findsOneWidget);
    expect(find.textContaining("mock"), findsOneWidget);
  });

  testWidgets('confirmation place data test', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    final ButtonStyle mockedStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15), primary: Color(0xff2E6347));
    final mockedFormatter = new DateFormat('yyyy-MM-dd HH:mm');
    final mockedInvitation = new InvitationMock();
    await tester.pumpWidget(MaterialApp(
      home: ConfirmationContainerData(
        formatter: mockedFormatter,
        style: mockedStyle,
        succesfulInvitationData: mockedInvitation,
      ),
    ));

    expect(find.textContaining("Test Address"), findsOneWidget);
    expect(find.textContaining("Test Place"), findsOneWidget);
    expect(find.textContaining("Test Phone"), findsOneWidget);
  });

  testWidgets('confirmation invitation data test', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    final ButtonStyle mockedStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15), primary: Color(0xff2E6347));
    final mockedFormatter = new DateFormat('yyyy-MM-dd HH:mm');
    final mockedInvitation = new InvitationMock();
    await tester.pumpWidget(MaterialApp(
      home: ConfirmationContainerData(
        formatter: mockedFormatter,
        style: mockedStyle,
        succesfulInvitationData: mockedInvitation,
      ),
    ));

    expect(find.textContaining("2022-04-06 17:30"), findsOneWidget);
    expect(find.textContaining("2022-04-06 18:30"), findsOneWidget);
  });
}
