import 'package:flutter/material.dart';
import 'package:udea_biosecurity_app/models/models.dart';
import 'package:udea_biosecurity_app/widgets/details/details_list.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    Key? key,
    required this.place,
    required this.style,
  }) : super(key: key);

  final Places place;
  final ButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Color(0xff2E6347),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0)),
            child: FadeInImage(
                key: Key("details-img"),
                height: 225,
                width: 375,
                fit: BoxFit.fill,
                image: NetworkImage(place.imgUrl),
                placeholder: AssetImage('lib/assets/loading_gif.gif')),
          ),
          SizedBox(height: 30),
          DetailsList(place: place),
          SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              key: Key("back-button"),
              style: style,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Volver'),
            ),
            const SizedBox(height: 30, width: 10),
            ElevatedButton(
              key: Key("book-button"),
              style: style,
              onPressed: () {},
              child: const Text('Reservar'),
            ),
          ])
        ],
      ),
    );
  }
}
