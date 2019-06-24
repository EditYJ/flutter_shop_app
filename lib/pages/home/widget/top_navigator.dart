import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 上部导航
class TopNavigator extends StatelessWidget {
  final List<Map> navigatorData;
  TopNavigator({Key key, this.navigatorData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (navigatorData.length > 10) {
      navigatorData.removeRange(10, navigatorData.length);
    }
    return GridView.count(
      shrinkWrap: true, // 布局收束选项
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 5,
      padding: EdgeInsets.all(5.0),
      children: navigatorData.map((item) {
        return _gridViewItem(item);
      }).toList(),
    );
  }

  // 每一项布局
  Widget _gridViewItem(item) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(item['image'], height: ScreenUtil().setWidth(90)),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }
}
