import 'package:flutter/material.dart';

class AppResponsive extends StatelessWidget {
  final Widget phone;
  final Widget tablet;
  final Widget desktop;

  const AppResponsive({Key? key, required this.phone, required this.tablet, required this.desktop}) : super(key: key);

  static bool isPhone(BuildContext context) {
    return MediaQuery.of(context).size.width < 900;
  }
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 900 && MediaQuery.of(context).size.width < 1100;
  }
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1100;
  }



  @override
  Widget build(BuildContext context) {
    final Size _size =MediaQuery.of(context).size;
    if(isDesktop(context)){
      return desktop;
    }else if(isTablet(context)){
      return tablet;
    }else{
      return phone;
    }
  }
}


enum LoginAs { none, importer, serverProvider }


enum ShowMessage{ none, show, firstTime }

enum SelectItemSideBar{ dashboard, masterList, history,profile }


double widthScreen({
  required BuildContext context,
}){
  double width=MediaQuery.of(context).size.width;
return width;
}
double heightScreen({
  required BuildContext context,
}){
  double height=MediaQuery.of(context).size.height;
return height;
}

enum SelectFrom{ none, select, firstTime }
enum SelectTo{ none, select, firstTime }
enum SelectService{ none, select, firstTime }
enum SelectIncoterm{ none, select, firstTime }
enum ShipmentDate{ none, select, firstTime }
enum ReceiverDate{ none, select, firstTime }
