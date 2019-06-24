import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 楼层布局
class FloorWidget extends StatelessWidget {
  final String titlePicAddress;
  final List<Map> floorContentData;
  FloorWidget({Key key, this.titlePicAddress, this.floorContentData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        _floorTitle(),
        _floorContent(),
      ],
    );
  }

  Widget _floorTitle() {
    return Container(
      child: Image.network(titlePicAddress),
    );
  }

  Widget _floorContent() {
    return Column(
      children: <Widget>[
        _firstFloorContent(),
        _secondFloorContent(),
      ],
    );
  }

  Widget _firstFloorContent() {
    return Row(
      children: <Widget>[
        _itemContent(floorContentData[0]),
        Column(
          children: <Widget>[
            _itemContent(floorContentData[1]),
            _itemContent(floorContentData[2]),
          ],
        ),
      ],
    );
  }

  Widget _secondFloorContent() {
    return Row(
      children: <Widget>[
        _itemContent(floorContentData[3]),
        _itemContent(floorContentData[4]),
      ],
    );
  }

  Widget _itemContent(Map goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {},
        child: Image.network(goods['image']),
      ),
    );
  }
}
