import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../service/service_method.dart';
import 'widget/swiper_diy.dart';
import 'widget/top_navigator.dart';
import 'widget/ad_banner.dart';
import 'widget/leader_phone.dart';
import 'widget/goods_recommend.dart';
import 'widget/floor_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getHomePageHotGoods().then((val)=>print(val));
    print('主页初始化');
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
      ),
    );
  }

  /// 主页布局
  Widget _homeLayout(BuildContext context, AsyncSnapshot snapshot) {
    var data = json.decode(snapshot.data.toString());
    List<Map> swiperDataList = (data['data']['slides'] as List).cast();
    List<Map> topNavigatorDataList = (data['data']['category'] as List).cast();
    Map adBannerData = data['data']['advertesPicture'];
    Map leaderPhoneData = data['data']['shopInfo'];
    List<Map> goodsRecommendData = (data['data']['recommend'] as List).cast();
    String floor1Title =data['data']['floor1Pic']['PICTURE_ADDRESS'];//楼层1的标题图片
    String floor2Title =data['data']['floor2Pic']['PICTURE_ADDRESS'];//楼层2的标题图片
    String floor3Title =data['data']['floor3Pic']['PICTURE_ADDRESS'];//楼层3的标题图片
    List<Map> floor1 = (data['data']['floor1'] as List).cast(); //楼层1商品和图片
    List<Map> floor2 = (data['data']['floor2'] as List).cast(); //楼层2商品和图片
    List<Map> floor3 = (data['data']['floor3'] as List).cast(); //楼层3商品和图片

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SwiperDiy(swiperData: swiperDataList), // 轮播图
          TopNavigator(navigatorData: topNavigatorDataList), // 上部导航
          ADBanner(adBannerData: adBannerData), // 广告栏
          LeaderPhone(leaderPhoneData: leaderPhoneData),  //  店长电话
          GoodsRecommend(goodsRecommendData: goodsRecommendData), //  推荐区
          FloorWidget(titlePicAddress: floor1Title, floorContentData: floor1,), //楼层1
          FloorWidget(titlePicAddress: floor2Title, floorContentData: floor2,), //楼层2
          FloorWidget(titlePicAddress: floor3Title, floorContentData: floor3,), //楼层3
        ],
      ),
    );
  }
}
