import 'package:commerce_20250828/screen/home/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeWidgets {
  static Widget shortcut({required List<String> iconList}){
    return GridView.count(crossAxisCount: 4,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children:List.generate(iconList.length, (index){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
          }, style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            maximumSize: Size(70, 70),
            padding: EdgeInsets.all(16),
            elevation: 0,
            backgroundColor: Colors.yellow,
            foregroundColor: Colors.purple,
          ),
            child: Image.asset(iconList[index],fit: BoxFit.cover),),
        ],
      );
    }),
    );
  }
  
  static Widget subTitle(String title){
    return Row(
      children: [
        SizedBox(width: 16,),
        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
      ],
    );
  }

  static Widget productHorizontal(List<ProductModel> dataList){
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        var productModel = dataList[index];
      return SizedBox(
        width: 150,
        child: Column(children: [
          Image.asset(productModel.image, height: 150,width: double.infinity,)

        ],),
      );
    },);
  }



}