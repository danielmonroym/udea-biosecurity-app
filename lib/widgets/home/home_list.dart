import 'package:flutter/material.dart';
import 'package:udea_biosecurity_app/models/models.dart';
import 'package:udea_biosecurity_app/widgets/home/home_widgets.dart';

class HomeList extends StatelessWidget {
  final int listLength;
  final ScrollController scrollController;
  final List<Places> listOfPlaces;
  const HomeList(
      {Key? key,
      required this.listLength,
      required this.scrollController,
      required this.listOfPlaces})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(12),
      controller: this.scrollController,
      itemCount: this.listLength,
      itemBuilder: (BuildContext context, int index) {
        Places place = listOfPlaces[index];
        return Center(
          child: HomeCard(place: place),
        );
      },
    );
  }
}
