import 'package:flutter/material.dart';
import 'package:udea_biosecurity_app/models/Places.dart';

class HomeCard extends StatelessWidget {
  final Places place;
  final int imagen;
  const HomeCard({
    Key? key,
    required this.imagen,
    required this.place,
  }) : super(key: key);

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
                image: NetworkImage('https://picsum.photos/id/$imagen/800/600'),
                placeholder: AssetImage('lib/assets/loading_gif.gif')),
          ),
          SizedBox(height: 30),
          ListTile(
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
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(onPressed: null, child: Text('Cancelar')),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'place-details');
                },
                child: Text('OK')),
          ])
        ],
      ),
    );
  }
}
