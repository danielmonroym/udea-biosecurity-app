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
              onPressed: () => _showAlert(context, place),
              child: const Text('Reservar'),
            ),
          ])
        ],
      ),
    );
  }

  _showAlert(context, Places place) {
    showDialog(
      context: context,
      builder: (context) {
        return BookAlert(
          place: place,
        );
      },
      barrierDismissible: true,
    );
  }
}

class BookAlert extends StatelessWidget {
  const BookAlert({
    Key? key,
    required this.place,
  }) : super(key: key);

  final Places place;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Text(place.namePlace),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Este es el contenido de la caja de la Alerta'),
          FlutterLogo(
            size: 100.0,
          )
        ],
      ),
      actions: [
        TextButton(
          child: Text('Cancelar'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text('OK'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
