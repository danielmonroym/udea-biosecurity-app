import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udea_biosecurity_app/providers/home_provider.dart';
import 'package:udea_biosecurity_app/screens/home/home_list.dart';
import 'package:udea_biosecurity_app/screens/home/home_loading.dart';

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

    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.addItems();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchListData(homeProvider);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2E6347),
        ),
        body: Stack(
          children: [
            HomeList(
                getFirstPage: homeProvider.getListData(),
                listLength: homeProvider.numbersList.length,
                scrollController: _scrollController,
                listOfNumbers: homeProvider.numbersList),
            HomeLoading(isLoading: homeProvider.isLoading)
          ],
        ));
  }

  Future fetchListData(HomeProvider homeProvider) async {
    final duration = new Duration(seconds: 2);
    return new Timer(duration, () => httpResponse(homeProvider));
  }

  void httpResponse(HomeProvider homeProvider) {
    homeProvider.isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    homeProvider.addItems();
  }
}
