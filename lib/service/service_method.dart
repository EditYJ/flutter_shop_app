import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/net_api.dart';

/// 获取主页数据
Future getHomePageContent() async {
  try {
    print('开始获取主页数据');
    Response response;
    Dio dio = Dio();
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    response = await dio.post(
        NetApi.HOME_PAGE_CONTEXT,
        queryParameters: formData
    );
    if(response.statusCode == 200){
      return response.data;
    }else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    print('<getHomePageContent>发生异常: ${e.toString()}');
  }
}
