import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udea_biosecurity_app/models/Places.dart';
import 'package:udea_biosecurity_app/providers/site_detail_provider.dart';
import 'package:udea_biosecurity_app/widgets/details/details_widgets.dart';

import 'package:udea_biosecurity_app/widgets/ui/ui_widgets.dart';

class DetailsScreen extends StatefulWidget {
  final String placeId;

  const DetailsScreen({Key? key, required this.placeId}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    final siteDetailprovider =
        Provider.of<SiteDetailProvider>(context, listen: false);
    siteDetailprovider.getPlaceById(widget.placeId);
  }

  @override
  Widget build(BuildContext context) {
    final loadingPlace = Provider.of<SiteDetailProvider>(context).loadingPlace;
    final place = Provider.of<SiteDetailProvider>(context).obtainedPlace;
    print(place);

    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15), primary: Color(0xff2E6347));

    return Scaffold(
        appBar: AppBar(backgroundColor: Color(0xff2E6347)),
        drawer: UiDrawer(),
        body: Container(
          height: 650,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: !loadingPlace && place != null
                ? DetailsCard(place: place, style: style)
                : Center(
                    child: CircularProgressIndicator(color: Color(0xff2E6347))),
          ),
        ));
  }
}
