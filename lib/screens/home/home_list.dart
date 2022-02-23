import 'package:flutter/material.dart';

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
        controller: this.scrollController,
        itemCount: this.listLength,
        itemBuilder: (BuildContext context, int index) {
          final imagen = listOfNumbers[index];
          return FadeInImage(
              image: NetworkImage('https://picsum.photos/id/$imagen/800/600'),
              placeholder: AssetImage('lib/assets/loading_gif.gif'));
        },
      ),
    );
  }
}
