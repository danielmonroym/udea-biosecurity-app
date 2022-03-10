import 'package:flutter/material.dart';
import 'package:udea_biosecurity_app/models/models.dart';

class DetailsList extends StatelessWidget {
  const DetailsList({
    Key? key,
    required this.place,
  }) : super(key: key);

  final Places place;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(Icons.book_online, color: Color(0xff2E6347), size: 40),
        title: Center(child: Text('Espacio a reservar: ${place.namePlace}')),
        subtitle: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Ubicación: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(place.address),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Capacidad total: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(place.capacity.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Capacidad actual: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(place.actualCapacity.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Horario disponible: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("${place.checkIn} - ${place.checkOut}")
                    ],
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
          ),
        ));
  }
}
