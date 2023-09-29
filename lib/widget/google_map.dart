import 'package:flutter/material.dart';

class GoogleMap extends StatefulWidget {
  double lat, lng;
  GoogleMap({super.key, required this.lat, required this.lng});

  @override
  State<GoogleMap> createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //border: Border.all(color: Theme.of(context).colorScheme.surface),
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.surface),
      child: const Center(
        child: Text("Google Map API"),
      ),
      /*
      google map api가 유료인 관계로 추후에 적용

      child: GoogleMap(
        mapType: MapType.normal, //지도 유형 설정
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.lat,
            widget.lng,
            ), //카메라 위치(위도, 경도)
          zoom: 15, //확대 정도
          markers: {
          const Marker(markerId: MarkerId("1"), position: placeLatLng),
        },
        */
    );
  }
}
