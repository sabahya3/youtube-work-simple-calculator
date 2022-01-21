import 'package:calc/constants/constants.dart';
import 'package:calc/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  String exp='';
  String history='';
  double num1=0;
  double num2=0;
  String op='';

void numClick(String btnTxt){
if(btnTxt=='Ac'){
 setState(() {
     exp='';
   history='';
 });
   num1=0;
   num2=0;

}else if(btnTxt=='C'){
  setState(() {
    exp='';
  });
}
else if(btnTxt=='+'||btnTxt=='-'||btnTxt=='/'||btnTxt=='x'||btnTxt=='%'){
op=btnTxt;
num1=double.parse(exp);

setState(() {
  exp='';
history=num1.toString();
history+=btnTxt;

});


}
else if(btnTxt=='.'){
  if(exp.contains('.')){}
  else {
setState(() {
      exp+=btnTxt;
});
  }

}
else if(btnTxt=='='){
  num2=double.parse(exp);
  history+=exp;

 switch(op) { 
     case '+':{
       exp=(num1+num2).toString();
     }
     break;
          case 'x':{
       exp=(num1*num2).toString();
     }
     break;
          case '-':{
       exp=(num1-num2).toString();
     }
     break;
          case '%':{
       exp=(num1%num2).toString();
     }
     break;
               case '/':{
      num2==0?exp='unvalid operation ': exp=(num1/num2).toString();
     }
     break;

     default : break;

     
  
}  
setState(() {
 
});

  }




else{
setState(() {
    exp+=btnTxt;
});
}


}



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(centerTitle: true,title: const Text("calculator"),),body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children:  [
        Container(margin: Constants.txtMargin,alignment:Constants.txtAlinment,child: Text(history,style:Constants.style1,)),
       const Divider(color: Colors.grey,thickness: 5,),
        Container(margin:Constants.txtMargin ,alignment: Constants.txtAlinment,child: Text(exp,style:Constants.style1 ,)),
        Row(children: [
          CustumButton(btnColor: Colors.blue, btnTxt: "Ac",callBack: numClick,),
               CustumButton(btnColor: Colors.yellow, btnTxt: "C",callBack: numClick,),
                    CustumButton(btnColor: Colors.teal, btnTxt: "%",callBack: numClick,),
                         CustumButton(btnColor: Colors.red, btnTxt: "/",callBack: numClick,),
        
        
        ],),
              Row(children: [
          CustumButton(btnColor: Colors.blue, btnTxt: "7",callBack: numClick,),
               CustumButton(btnColor: Colors.yellow, btnTxt: "8",callBack: numClick,),
                    CustumButton(btnColor: Colors.teal, btnTxt: "9",callBack: numClick,),
                         CustumButton(btnColor: Colors.red, btnTxt: "x",callBack: numClick,),
                         
                         
        
        
        ],),

                   Row(children: [
          CustumButton(btnColor: Colors.blue, btnTxt: "4",callBack: numClick,),
               CustumButton(btnColor: Colors.yellow, btnTxt: "5",callBack: numClick,),
                    CustumButton(btnColor: Colors.teal, btnTxt: "6",callBack: numClick,),
                         CustumButton(btnColor: Colors.red, btnTxt: "-",callBack: numClick,),]),
                                     Row(children: [
          CustumButton(btnColor: Colors.blue, btnTxt: "1",callBack: numClick,),
               CustumButton(btnColor: Colors.yellow, btnTxt: "2",callBack: numClick,),
                    CustumButton(btnColor: Colors.teal, btnTxt: "3",callBack: numClick,),
                         CustumButton(btnColor: Colors.red, btnTxt: "+",callBack: numClick,),]),

                                                              Row(children: [
          CustumButton(btnColor: Colors.blue, btnTxt: "0",callBack: numClick,flex: 2,),
               CustumButton(btnColor: Colors.yellow, btnTxt: ".",callBack: numClick,),
                    CustumButton(btnColor: Colors.teal, btnTxt: "=",callBack: numClick,),
                        ]),

                         
        
      ],
    ),);
  }
}