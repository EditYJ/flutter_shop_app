import 'package:flutter/material.dart';
import '../../service/service_method.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder(
        future: getHomePageContent(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Text(snapshot.data);
          }else{
            return Center(
              child: Text("加载中。。。"),
            );
          }
        },
      )
    );
  }

}
