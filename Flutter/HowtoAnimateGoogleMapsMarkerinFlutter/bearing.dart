final List<Marker> _markers = <Marker>[];

double getBearing(LatLng begin, LatLng end) {
  double lat = (begin.latitude - end.latitude).abs();
  double lng = (begin.longitude - end.longitude).abs();

  if (begin.latitude < end.latitude && begin.longitude < end.longitude) {
    return degrees(atan(lng / lat));
  } else if (begin.latitude >= end.latitude && begin.longitude < end.longitude) {
    return (90 - degrees(atan(lng / lat))) + 90;
  } else if (begin.latitude >= end.latitude && begin.longitude >= end.longitude) {
    return degrees(atan(lng / lat)) + 180;
  } else if (begin.latitude < end.latitude && begin.longitude >= end.longitude) {
    return (90 - degrees(atan(lng / lat))) + 270;
  }
  return -1;
}

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
  mapMarkerSink.add(markers);

}