import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String kakaoMapKey = '20267c4e137d23bb0ebbe48f6c68438f';

class KakaoMapPage extends StatelessWidget {
  // KakaoMapView mapView = KakaoMapView(
  //   width: 380.w,
  //   height: 400.h,
  //   kakaoMapKey: kakaoMapKey,
  //   lat: 33.450701,
  //   lng: 126.570667,
  //   showMapTypeControl: true,
  //   showZoomControl: true,
  //   markerImageURL: 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
  //   onTapMarker: (message) {
  //     //event callback when the marker is tapped
  //   },
  // );

//  var _mapController;

  KakaoMapPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          KakaoMapView(
            width: 380.w,
            height: 400.h,
            kakaoMapKey: kakaoMapKey,
            lat: 33.450701,
            lng: 126.570667,
            showMapTypeControl: true,
            showZoomControl: true,
            markerImageURL: 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
            onTapMarker: (message) {
              //event callback when the marker is tapped
            },
          ),
          // KakaoMapView(
          // width: context.width,
          // height: 400,
          // kakaoMapKey: kakaoMapKey,
          // lat: 33.450701,
          // lng: 126.570667,
          // showMapTypeControl: true,
          // showZoomControl: true,
          // markerImageURL: 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
          // onTapMarker: (message) {
          //   //event callback when the marker is tapped
          // }),
          ElevatedButton(
            onPressed: (){
//              Get.toNamed("/KakaoMapPage2");
            },
            // onPressed: () async{
            //   await _openKakaoMapScreen(context);
            //   //Get.toNamed("/KakaoMapPage2");
            // },

            child: Text("지도"),
          ),
        ],
      ),
    );
  }
}

class KakaoMapPage2 extends StatefulWidget {
  KakaoMapPage2({Key? key}) : super(key: key);

  @override
  State<KakaoMapPage2> createState() => _KakaoMapPage2State();
}

class _KakaoMapPage2State extends State<KakaoMapPage2> {
  String url = "null";
  KakaoMapUtil utils = KakaoMapUtil();

  void initState() {
    final tempUrl = utils.getMapScreenURL(31.000000, 176.570667, name: 'Kakao 본사');
    tempUrl.then((value) {
      setState(() {
        url = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ElevatedButton(
          onPressed: (){
            print("여기까진 오케이");
          },
          child: Text("현위치 찍기"),
        ),
      ),
      body: url.compareTo("null") == 0 ? Text("Wait...") : KakaoMapScreen(url: url),

    );
  }
}