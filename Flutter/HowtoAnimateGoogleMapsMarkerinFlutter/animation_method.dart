animateCar(
  double fromLat, //Starting latitude
  double fromLong, //Starting longitude
  double toLat, //Ending latitude
  double toLong, //Ending longitude
  StreamSink<List<Marker>> mapMarkerSink, //Stream build of map to update the UI
  TickerProvider provider,//Ticker provider of the widget. This is used for animation
  GoogleMapController controller, //Google map controller of our widget
) async {
  
  var carMarker = Marker(
      markerId: const MarkerId("driverMarker"),
      position: LatLng(fromLat, fromLong),
      icon: BitmapDescriptor.fromBytes(await getBytesFromAsset('asset/icons/ic_car_top_view.png', 60)),
      anchor: const Offset(0.5, 0.5),
      flat: true,
      draggable: false);
}