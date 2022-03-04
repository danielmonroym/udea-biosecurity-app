import 'package:flutter/material.dart';
import 'package:udea_biosecurity_app/models/models.dart';
import 'package:udea_biosecurity_app/widgets/home/home_widgets.dart';

class HomeList extends StatelessWidget {
  final getFirstPage;
  final int listLength;
  final ScrollController scrollController;
  final List<int> listOfNumbers;
  final List<Places> listOfPlaces;
  const HomeList(
      {Key? key,
      required this.getFirstPage,
      required this.listLength,
      required this.scrollController,
      required this.listOfNumbers,
      required this.listOfPlaces})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(12),
      controller: this.scrollController,
      itemCount: this.listLength,
      itemBuilder: (BuildContext context, int index) {
        final imagen = listOfNumbers[index];
        Places place = listOfPlaces[index];
        print(listOfPlaces[index].idPlace);
        return Center(
          child: HomeCard(imagen: imagen, place: place),
        );
      },
    );
  }
}
