@override
  void initState() {
    super.initState();
    
    setUpMarker();
  }

setUpMarker() async {
    const currentLocationCamera = LatLng(37.42796133580664, -122.085749655962);

    final pickupMarker = Marker(
      markerId: MarkerId("${currentLocationCamera.latitude}"),
      position: LatLng(
          currentLocationCamera.latitude, currentLocationCamera.longitude),
      icon: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'asset/icons/ic_car_top_view.png', 70)),
    );
  
    //Adding a delay and then showing the marker on screen
    await Future.delayed(const Duration(milliseconds: 500));
  
   _markers.add(pickupMarker);
   _mapMarkerSink.add(_markers);
  }
