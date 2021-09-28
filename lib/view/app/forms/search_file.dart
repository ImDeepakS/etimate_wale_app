import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchLocationFile extends StatefulWidget {
  const SearchLocationFile({Key? key}) : super(key: key);

  @override
  _SearchLocationFileState createState() => _SearchLocationFileState();
}

class _SearchLocationFileState extends State<SearchLocationFile> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: white,
      //   title: TextFormField(
      //     decoration: InputDecoration(
      //       border: InputBorder.none,
      //       hintText: "Search your model",
      //       hintStyle: GoogleFonts.poppins(
      //         fontWeight: FontWeight.w500,
      //         fontSize: 14,
      //         color: dimGrey,
      //       ),
      //     ),
      //   ),
      //   leading: Icon(
      //     Icons.search,
      //     color: dimGrey,
      //   ),
      // ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
      ),
    );
  }
}
