import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udea_biosecurity_app/providers/sites_provider.dart';
import 'package:udea_biosecurity_app/widgets/home/home_widgets.dart';
import 'package:udea_biosecurity_app/widgets/ui/ui_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final places = Provider.of<SitesProvider>(context).places;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2E6347),
        ),
        drawer: UiDrawer(
          key: Key("home-drawer"),
        ),
        body: Stack(
          children: [
            places.length == 0
                ? Center(
                    child: CircularProgressIndicator(
                        key: Key("home-progress-indicator"),
                        color: Color(0xff2E6347)))
                : HomeList(
                    key: Key("home-list"),
                    listLength: places.length,
                    scrollController: _scrollController,
                    listOfPlaces: places,
                  ),
          ],
        ));
  }
}
