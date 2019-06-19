import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../service/service_method.dart';
import 'widget/swiper_diy.dart';
import 'widget/top_navigator.dart';
import 'widget/ad_banner.dart';
import 'widget/leader_phone.dart';
import 'widget/goods_recommend.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('商城-首页'),
          elevation: 0,
        ),
        body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _homeLayout(context, snapshot);
            } else {
              return Center(
                child: Text("加载中..."),
              );
            }
          },
        ));
  }

//  主页布局
  Widget _homeLayout(BuildContext context, AsyncSnapshot snapshot) {
    var data = json.decode(snapshot.data.toString());
    List<Map> swiperDataList = (data['data']['slides'] as List).cast();
    List<Map> topNavigatorDataList = (data['data']['category'] as List).cast();
    Map adBannerData = data['data']['advertesPicture'];
    Map leaderPhoneData = data['data']['shopInfo'];
    List<Map> goodsRecommendData = (data['data']['recommend'] as List).cast();

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SwiperDiy(swiperData: swiperDataList), // 轮播图
          TopNavigator(navigatorData: topNavigatorDataList), // 上部导航
          ADBanner(adBannerData: adBannerData), // 广告栏
          LeaderPhone(leaderPhoneData: leaderPhoneData),  //  店长电话
          GoodsRecommend(goodsRecommendData: goodsRecommendData), //  推荐区
        ],
    ));
  }
}
