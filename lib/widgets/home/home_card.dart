import 'package:flutter/material.dart';
import 'package:udea_biosecurity_app/models/Places.dart';

class HomeCard extends StatelessWidget {
  final Places place;

  const HomeCard({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15), primary: Color(0xff2E6347));
    return Card(
      shadowColor: Color(0xff2E6347),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: Column(
        children: [
          ClipRRect(
            key: Key("img-container"),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0)),
            child: FadeInImage(
                height: 225,
                width: 375,
                fit: BoxFit.fill,
                key: Key("img"),
                image: NetworkImage(place.imgUrl),
                placeholder: AssetImage('lib/assets/loading_gif.gif')),
          ),
          SizedBox(height: 30),
          ListTile(
              key: Key("text-list"),
              leading: Icon(
                Icons.add_business_sharp,
                color: Color(0xff2E6347),
                size: 40,
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Center(child: Text(place.namePlace)),
              ),
              subtitle: Container(
                child: Column(
                  children: [
                    Text("Ubicación: ${place.address}"),
                    Text("Telefono: ${place.phone}"),
                    Text(
                        "Horario disponible: ${place.checkIn} - ${place.checkOut}")
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.pushNamed(context, 'place-details',
                        arguments: place.idPlace);
                  },
                  child: Text('Reservar')),
            ]),
          )
        ],
      ),
    );
  }
}
