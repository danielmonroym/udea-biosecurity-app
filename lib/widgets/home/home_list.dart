import 'package:flutter/material.dart';
import 'package:udea_biosecurity_app/widgets/home/home_widgets.dart';

class HomeList extends StatelessWidget {
  final Future getFirstPage;
  final int listLength;
  final ScrollController scrollController;
  final List<int> listOfNumbers;
  const HomeList(
      {Key? key,
      required this.getFirstPage,
      required this.listLength,
      required this.scrollController,
      required this.listOfNumbers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => getFirstPage,
      child: ListView.builder(
        padding: EdgeInsets.all(10),
        controller: this.scrollController,
        itemCount: this.listLength,
        itemBuilder: (BuildContext context, int index) {
          final imagen = listOfNumbers[index];
          print(listOfNumbers);
          return Center(
            child: HomeCard(imagen: imagen),
          );
        },
      ),
    );
  }
}
