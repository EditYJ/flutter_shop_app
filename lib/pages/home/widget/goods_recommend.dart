import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 商品推荐，横向列表布局
class GoodsRecommend extends StatelessWidget{
  final List<Map> goodsRecommendData;
  GoodsRecommend({Key key, this.goodsRecommendData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _recommendTitle(),
          _recommendList(),
        ],
      ),
    );
  }

  /// 推荐标题
  Widget _recommendTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5)),
      ),
      child: Text(
        '推荐商品',
        style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: ScreenUtil().setSp(30)),
      ),
    );
  }

  /// 推荐列表
  Widget _recommendList() {
    return Container(
        height: ScreenUtil().setHeight(370),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: goodsRecommendData.length,
          itemBuilder: (context, index) {
            return _listItem(context, goodsRecommendData[index]);
          },
        ));
  }

  /// 推荐列表项
  Widget _listItem(BuildContext context, Map itemData) {
    String _image = itemData['image'];
    String _goodsName = itemData['goodsName'];
    String _mallPrice = itemData['mallPrice'].toString();
    String _price = itemData['price'].toString();
    return InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(8.0),
          height: ScreenUtil().setHeight(330),
          width: ScreenUtil().setWidth(250),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(left: BorderSide(width: 0.5, color: Colors.black12)),
          ),
          child: Column(
            children: <Widget>[
              Image.network(_image),
              Container(height: 5.0),
              _goodsTitle(_goodsName),
              Container(height: 2.0),
              _goodsPrice(_mallPrice, _price)
            ],
          ),
        ));
  }

  /// 商品标题
  Widget _goodsTitle(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      height: ScreenUtil().setWidth(70.0),
      decoration: BoxDecoration(),
      child: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// 商品价格
  Widget _goodsPrice(mallPrice, price) {
    return Row(
      children: <Widget>[
        Text(
          mallPrice,
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: ScreenUtil().setSp(30),
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(width: 2.0),
        Text(
          price,
          style: TextStyle(
              color: Colors.black26, decoration: TextDecoration.lineThrough),
        ),
      ],
    );
  }
}
