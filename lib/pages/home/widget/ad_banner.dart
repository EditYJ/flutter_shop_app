import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ADBanner extends StatelessWidget {
  final Map adBannerData;
  ADBanner({Key key, this.adBannerData}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      adBannerData['PICTURE_ADDRESS'],
    );
  }
}
