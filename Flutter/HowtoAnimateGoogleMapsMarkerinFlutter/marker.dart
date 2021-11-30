import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:async';

setUpMarker() async {
    const currentLocationCamera = LatLng(37.42796133580664, -122.085749655962);

    final pickupMarker = Marker(
      markerId: MarkerId("${currentLocationCamera.latitude}"),
      position: LatLng(
          currentLocationCamera.latitude, currentLocationCamera.longitude),
      icon: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'asset/icons/ic_car_top_view.png', 70)),
    );
  }

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
}