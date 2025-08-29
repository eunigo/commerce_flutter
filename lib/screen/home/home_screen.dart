import 'package:commerce_20250828/screen/home/home_widgets.dart';
import 'package:commerce_20250828/screen/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../asset_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageList = [
    AssetPath.cloth1,
    AssetPath.cloth2,
    AssetPath.cloth3,
    AssetPath.cloth4,
  ];

  List<ProductModel> newProductList = [
    ProductModel(
      AssetPath.productJacketJean,
      "청자켓",
      90000,
      31,
      4.3,
      false
    ),
    ProductModel(
        AssetPath.productManJacket,
        "남자자켓",
        90000,
        31,
        4.3,
        false
    ),
    ProductModel(
        AssetPath.productManStreet,
        "길거리패션",
        90000,
        31,
        4.3,
        false
    ),
    ProductModel(
        AssetPath.productManSuit,
        "수트",
        90000,
        31,
        4.3,
        false
    ),
    ProductModel(
        AssetPath.productBag,
        "패션",
        90000,
        31,
        4.3,
        false
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: PageView(
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
              },
              children: [
                ...List.generate(imageList.length, (index) {
                  return Image.asset(imageList[index], fit: BoxFit.cover);
                }),
              ],
            ),
          ),

          SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(imageList.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 10,
                width: currentIndex == index ? 20 : 10,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentIndex == index
                      ? Colors.grey
                      : Colors.grey.shade300,
                ),
              );
            }),
          ),

          SizedBox(height: 24),

          HomeWidgets.shortcut(iconList: [
            AssetPath.jacket,
            AssetPath.jumper,
            AssetPath.necklace,
            AssetPath.bag,
            AssetPath.cap,
            AssetPath.skirt,
            AssetPath.trousers,
            AssetPath.shirt,
          ]),

          SizedBox(height: 24,),
          HomeWidgets.subTitle("신제품"),
          HomeWidgets.productHorizontal(newProductList),

          /// 이벤트 항목 추가
          /// subTitle 위젯 사용
          /// Image.asset 웨젯 사용
          /// AssetPath event 사용
          SizedBox(height: 24,),
          HomeWidgets.subTitle("이벤트"),
          SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(AssetPath.event, fit: BoxFit.cover)),

        ],
      ),
    );
  }
}

