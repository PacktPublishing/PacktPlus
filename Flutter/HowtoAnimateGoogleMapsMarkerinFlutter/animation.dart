Animation<double>? _animation;
final List<Marker> _markers = <Marker>[];

animateCar(
  double fromLat, //Starting latitude
  double fromLong, //Starting longitude
  double toLat, //Ending latitude
  double toLong, //Ending longitude
  StreamSink<List<Marker>> mapMarkerSink, //Stream build of map to update the UI
  TickerProvider provider,//Ticker provider of the widget. This is used for animation
  GoogleMapController controller, //Google map controller of our widget
) async {
  
  final double bearing = getBearing(LatLng(fromLat, fromLong), LatLng(toLat, toLong));
  _markers.clear();

  var carMarker = Marker(
      markerId: const MarkerId("driverMarker"),
      position: LatLng(fromLat, fromLong),
      icon: BitmapDescriptor.fromBytes(await getBytesFromAsset('asset/icons/ic_car_top_view.png', 60)),
      anchor: const Offset(0.5, 0.5),
      flat: true,
      rotation: bearing,
      draggable: false);
  
  //Adding initial marker to the start location.
  _markers.add(carMarker);
  mapMarkerSink.add(_markers);

  final animationController = AnimationController(
    duration: const Duration(seconds: 5),//Animation duration of marker
    vsync: provider,//From the widget
  );

  Tween<double> tween = Tween(begin: 0, end: 1);

  _animation = tween.animate(animationController)
    ..addListener(() async {
    
    //We are calculating new latitude and logitude for our marker
    final v = _animation!.value;
    double lng = v * toLong + (1 - v) * fromLong;
    double lat = v * toLat + (1 - v) * fromLat;
    LatLng newPos = LatLng(lat, lng);
    
    //Removing old marker if present in the marker array
    if (_markers.contains(carMarker)) _markers.remove(carMarker);

    //New marker location
    carMarker = Marker(
          markerId: const MarkerId("driverMarker"),
          position: newPos,
          icon: BitmapDescriptor.fromBytes(await getBytesFromAsset('asset/icons/ic_car_top_view.png, 50)),
          anchor: const Offset(0.5, 0.5),
          flat: true,
          rotation: bearing,
          draggable: false);

     //Adding new marker to our list and updating the google map UI.
     _markers.add(carMarker);
     mapMarkerSink.add(_markers);

     //Moving the google camera to the new animated location.
     controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: newPos, zoom: 15.5)));
    });
    
    //Starting the animation
    animationController.forward();
}