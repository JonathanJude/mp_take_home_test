import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mp_take_home_test/common/utils/extensions/ext.dart';

import 'widgets/list_of_variants_button.dart';
import 'widgets/map_buttons_overlay.dart';
import 'widgets/map_markers.dart';
import 'widgets/search_bar.dart';

class MapView extends StatefulWidget {
  const MapView({super.key, this.darkMapStyle});
  final String? darkMapStyle;

  @override
  State<MapView> createState() => MapSampleState();
}

class MapSampleState extends State<MapView>
    with SingleTickerProviderStateMixin {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late AnimationController _animationController;
  bool _isExpanded = true;
  String? _darkMapStyle;
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 13,
  );
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    _loadMapStyles();
    });
    _animationController = AnimationController(
        vsync: this, duration: 700.ms, reverseDuration: 500.ms);
    _animationController.addStatusListener((listener) {
      if (listener == AnimationStatus.dismissed) {
        _setExpandedFalse();
      } else {
        _setExpandedTrue();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future _loadMapStyles() async {
    _darkMapStyle = await rootBundle.loadString('assets/map_styles/dark.json');
  }

  void _setExpandedFalse() {
    if (mounted) {
      setState(() {
        _isExpanded = false;
      });
    }
  }

  void _setExpandedTrue() {
    if (mounted) {
      setState(() {
        _isExpanded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // map
          GoogleMap(
            mapType: MapType.normal,
            style: widget.darkMapStyle ?? _darkMapStyle,
            compassEnabled: false,
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              setState(() {
                //
              });
            },
          ),

          const ListOfVariantsButton(),

          // left icons in column
          Positioned(
            left: 30,
            bottom: context.h(0.11),
            child: MapButtonsOverlay(
              animationController: _animationController,
            ),
          ),

          // search bar
          const SearchBarWidget(),

          //markers
          MapMarkers(
            isExpanded: _isExpanded,
          )
        ],
      ),
    );
  }
}
