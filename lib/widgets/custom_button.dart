import 'package:calc/constants/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustumButton extends StatelessWidget {
   CustumButton({ Key? key,
 @required this.btnColor,
  @required this.btnTxt,
     this.flex,

  @required this.callBack,
   }) : super(key: key);
  Color ? btnColor;
  String ? btnTxt;
  int? flex;
  Function? callBack;

  @override
  Widget build(BuildContext context) {
    return Expanded(
    flex: flex==null?1:flex!,
      child: GestureDetector(
             onTap: (){
        callBack!(btnTxt);
      },
        child: Container(
          width: 70,
          height: 80,
        
          child: Text(btnTxt!,style: Constants.btnTextStyle,),
          margin: const EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),  color: btnColor,),
          
          
        ),
      ),
    );
  }
}