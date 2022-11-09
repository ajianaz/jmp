import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:juniormobileprogrammer/app/data/model/user_model.dart';

class DetailController extends GetxController {
  UserModel? user = null;
  RxBool isLoading = RxBool(false);

  //list of markers
  final Set<Marker> markers = new Set();

  // CameraPosition kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  CameraPosition? markerLocation = null;

  setMarker() {
    if (user != null) {
      print("load marker");
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(user!.name.toString()),
        position:
            LatLng(user!.latitude!, user!.longitude!), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: user!.name.toString(),
          // snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markerLocation = CameraPosition(
          bearing: 192.8334901395799,
          target: LatLng(user!.latitude!, user!.longitude!),
          tilt: 59.440717697143555,
          zoom: 19.151926040649414);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
