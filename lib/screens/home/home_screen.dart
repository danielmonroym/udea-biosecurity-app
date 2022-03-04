import 'dart:async';

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
  List<int> _numbersList = [];
  int _lastItem = 0;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();

    _addItems();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchListData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final places = Provider.of<SitesProvider>(context).places;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2E6347),
        ),
        drawer: UiDrawer(),
        body: Stack(
          children: [
            places.length == 0
                ? Center(
                    child: CircularProgressIndicator(color: Color(0xff2E6347)))
                : HomeList(
                    getFirstPage: getListData,
                    listLength: places.length,
                    scrollController: _scrollController,
                    listOfNumbers: _numbersList,
                    listOfPlaces: places,
                  ),
          ],
        ));
  }

  Future fetchListData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHTTP);
  }

  void _addItems() {
    for (int i = 1; i < 10; i++) {
      setState(() {
        _lastItem++;
        _numbersList.add(_lastItem);
      });
    }
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _addItems();
  }

  Future getListData() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _numbersList.clear();
      _lastItem++;
      _addItems();
    });

    return Future.delayed(duration);
  }
}
