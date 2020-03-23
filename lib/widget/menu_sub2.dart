

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kritproduct/utility/my_style.dart';
import 'package:kritproduct/utility/normal_dialog.dart';
import 'package:kritproduct/widget/account_list.dart';
import 'package:kritproduct/widget/display_data.dart';



class Menusub2 extends StatefulWidget {
  @override
  _Menusub2State createState() => _Menusub2State();
}

class _Menusub2State extends State<Menusub2> {
  //Field ประกาศตัวแปร
  String name, user, password, rePassword;
  String idciticent, telephone, email;

  //Method กำหนดรูปคน และกำหนดค่าสี

  Widget mySizebox3() {
    return SizedBox(
      width: 10.0,
      height: 20.0,
    );
  }

  Widget mySpacce3() {
    return SizedBox(
      width: 10.0,
      height: 5.0,
    );
  }

  Widget mySpacce4() {
    return SizedBox(
      width: 30.0,
      height: 5.0,
    );
  }

  Widget show3Logo() {
    return Container(
      height: 40.0,
      child: Image.asset('images/logo12.png'),
    );
  }

  //Title Bar นำไปใส่ไว้ใน Appbar
  Widget showSTitle() {
    return Text(
      'Marketing For Agent / ตัวแทน',
      style: TextStyle(
        fontFamily: 'RobotoMono', //Raleway
        fontSize: 18.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().colorWhite,
      ),
    );
  }

  Widget menuClients() {
    return OutlineButton(
        onPressed: funMenulist,
        child: Stack(
          children: <Widget>[
            Align(alignment: Alignment.centerLeft, child: Icon(Icons.people)),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Account Listing / จำนวนลูกค้า            ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16.0,
                    color: MyStyle().blue900,
                  ),
                ))
          ],
        ),
        highlightedBorderColor: Colors.orange,
        color: Colors.green,
        borderSide: new BorderSide(color: MyStyle().colorGrey4),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)));
  }

  Widget menuClients2() {
    return OutlineButton(
        onPressed: homeMenulist,
        child: Stack(
          children: <Widget>[
            Align(alignment: Alignment.centerLeft, child: Icon(Icons.people)),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Account By Fund / แยกลูกค้าตามกองทุน  ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16.0,
                    color: MyStyle().blue900,
                  ),
                ))
          ],
        ),
        highlightedBorderColor: Colors.orange,
        color: Colors.green,
        borderSide: new BorderSide(color: MyStyle().colorGrey4),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)));
  }

 Widget menuClients3() {
    return OutlineButton(
        onPressed: () {},
        child: Stack(
          children: <Widget>[
            Align(alignment: Alignment.centerLeft, child: Icon(Icons.people)),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Account By Year / แยกลูกค้าตามปี        ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16.0,
                    color: MyStyle().blue900,
                  ),
                ))
          ],
        ),
        highlightedBorderColor: Colors.orange,
        color: Colors.green,
        borderSide: new BorderSide(color: MyStyle().colorGrey4),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)));
  }

  Widget menuClients4() {
    return OutlineButton(
        onPressed: homeMenulist,
        child: Stack(
          children: <Widget>[
            Align(alignment: Alignment.centerLeft, child: Icon(Icons.people)),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "New Open Account / รายการลูกค้าเปิดบัญชีใหม่",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16.0,
                    color: MyStyle().blue900,
                  ),
                ))
          ],
        ),
        highlightedBorderColor: Colors.orange,
        color: Colors.green,
        borderSide: new BorderSide(color: MyStyle().colorGrey4),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)));
  }

 
  Future<void> funMenulist() async  {
            
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext buildContext) {
              return FunLists();
            });
                Navigator.of(context).push(materialPageRoute);
       

  }


 
  Future<void> homeMenulist() async  {
            
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext buildContext) {
              return HomePage();
            });
                Navigator.of(context).push(materialPageRoute);
       

  }

 
  
  
  
    //กำหนดค่าตัวแปร เพื่อให้แจ้ง Message ออกมา
    Widget registerButton() {
      return IconButton(
        tooltip: 'UpLoad To Server',
        icon: Icon(Icons.save_alt),
        onPressed: () {
          print(
              'name =$name, user =$user, password =$password, rePassword =$rePassword');
          if (name == null ||
              name.isEmpty ||
              user == null ||
              user.isEmpty ||
              password == null ||
              password.isEmpty ||
              rePassword == null ||
              rePassword.isEmpty) {
            normalDialog(context, 'ท่านกรอกไม่ครบ', 'โปรดตรวจสอบใหม่อีกครั้ง');
          } else if (password == rePassword) {
            registerThread();
          } else {
            normalDialog(context, 'Password Not Math',
                'Pleese Type Password Math Re Password');
          }
        },
      );
    }
  
    //Call API เป็น PHP กำหนดค่าต้องใส่ $นำมา
    Future<void> registerThread() async {
      String url = 'https://www.androidthai.in.th/feb13/addUserKrit.php?isAdd=true&Name=$name&User=$user&Password=$password';
      try {
        Response response = await Dio().get(url);
        print('reponse =$response');
        if (response.toString() == 'true') {
          Navigator.of(context).pop();
        } else {
          normalDialog(context, 'ลงทะเบียนไม่สำเร็จ', 'ลองใหม่อีกครั้ง');
        }
      } catch (e) {}
    }
  
    //จะห่างข้างละ 30.0
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            mySpacce3(),
            show3Logo(),
            menuClients(),
            menuClients2(),
            menuClients3(),
            menuClients4(),
          ],
        ),
        appBar: AppBar(
          title: showSTitle(),
          actions: <Widget>[registerButton()],
          backgroundColor: MyStyle().colorGrey8,
        ), //ดึงมาจาก Mystype ใส่รูป Icon เป็นก้อนเมฆ
      );
    }
  }
  
  class Album {
}
