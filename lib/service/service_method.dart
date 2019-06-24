import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/net_api.dart';

Future request(url, {formData}) async{
  try {
    print('开始获取$url数据...');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    response = await dio.post(
        url,
        data: formData
    );
    if(response.statusCode == 200){
      return response.data;
    }else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    print('[service_mode]<$url>发生异常: ${e.toString()}');
  }
}

/// 获取主页数据
Future getHomePageContent() async {
  var formData = {'lon': '115.02932', 'lat': '35.76189'};
  return request(NetApi.HOME_PAGE_CONTEXT, formData: formData);
}

/// 获取火爆专区商品
Future getHomePageHotGoods() async{
  int page = 1;
  return request(NetApi.HOME_PAGE_HOT_GOODS, formData: page);
}