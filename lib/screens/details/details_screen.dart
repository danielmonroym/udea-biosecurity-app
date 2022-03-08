import 'package:flutter/material.dart';
import 'package:udea_biosecurity_app/widgets/ui/ui_widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15));

    return Scaffold(
        appBar: AppBar(backgroundColor: Color(0xff2E6347)),
        drawer: UiDrawer(),
        body: Container(
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              shadowColor: Color(0xff2E6347),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0)),
                    child: FadeInImage(
                        image:
                            NetworkImage('https://picsum.photos/id/1/800/600'),
                        placeholder: AssetImage('lib/assets/loading_gif.gif')),
                  ),
                  SizedBox(height: 30),
                  ListTile(
                      leading: Icon(Icons.photo_album, color: Colors.blue),
                      title: Text('titulo'),
                      subtitle: Text(
                          'soy del verde soy feliz, sdvsf, solo verde pa soy del verde soy feliz, sdvsf, solo verde pa')),
                  SizedBox(height: 30),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ElevatedButton(
                      style: style,
                      onPressed: null,
                      child: const Text('Disabled'),
                    ),
                    const SizedBox(height: 30, width: 10),
                    ElevatedButton(
                      style: style,
                      onPressed: () {},
                      child: const Text('Enabled'),
                    ),
                  ])
                ],
              ),
            ),
          ),
        ));
  }
}
