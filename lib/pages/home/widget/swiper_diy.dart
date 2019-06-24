import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// home页上部轮播banner
class SwiperDiy extends StatelessWidget {
  final List<Map> swiperData;

  SwiperDiy({Key key, this.swiperData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(310),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemCount: swiperData.length,
        itemBuilder: (context, index) {
          return Image.network(
            swiperData[index]['image'],
            fit: BoxFit.fill,
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
        viewportFraction: 0.9,
        scale: 0.95,
      ),
    );
  }
}
