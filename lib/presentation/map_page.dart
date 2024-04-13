import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/unit.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  late List<Unit> units;
  final Map<String, Marker> _markers = {};

  final LatLng _center = const LatLng(39.71069, -95.88367);

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    units = await getUnits();

    setState(() {
      _markers.clear();
      for (final unit in units) {
        final marker = Marker(
          markerId: MarkerId(unit.name!),
          position: LatLng(unit.lat!, unit.long!),
          infoWindow: InfoWindow(
            title: unit.name,
            snippet: unit.base,
          ),
        );
        _markers[unit.name!] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AFRC Units'),
        elevation: 2,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 4.0,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }

  Future<List<Unit>> getUnits() async {
    ResourceRepository repository = SqliteResourceRepository();

    units = await repository.getUnits();
    return units;
  }
}
