import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.imagen,
  }) : super(key: key);

  final int imagen;

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
              leading: Icon(Icons.photo_album, color: Colors.blue),
              title: Text('titulo'),
              subtitle: Text(
                  'soy del verde soy feliz, sdvsf, solo verde pa soy del verde soy feliz, sdvsf, solo verde pa')),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(onPressed: null, child: Text('Cancelar')),
            TextButton(onPressed: null, child: Text('OK')),
          ])
        ],
      ),
    );
  }
}
