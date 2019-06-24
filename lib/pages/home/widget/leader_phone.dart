import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

/// 店长电话部分
class LeaderPhone extends StatelessWidget {
  final Map leaderPhoneData;
  LeaderPhone({Key key, this.leaderPhoneData}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _lunchUrl(leaderPhoneData['leaderPhone']);
      },
      child: Image.network(
        leaderPhoneData['leaderImage'],
      ),
    );
  }

  _lunchUrl(String urlData) async{
    String url = 'tel:'+urlData;
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }
}