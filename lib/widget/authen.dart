import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kritproduct/utility/models/user_model.dart';
import 'package:kritproduct/utility/my_style.dart';
import 'package:kritproduct/utility/normal_dialog.dart';
import 'package:kritproduct/widget/main_menu.dart';
import 'package:kritproduct/widget/register.dart';
// import 'package:kritproduct/widget/funtype.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

//เวลาสร้าง Library ใหม่ ต้องมา Import ไว้ด้านบนด้วย เพื่อต้องการเรียกใช้งาน
//สร้าง Authen Ctrl Z = เรียกคืนตั้งแต่ตัน

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  //Field

  String user, password;

  //Method ให้แสดงส่วนด้านล่าง โดยการเอา ให้แสดง Keyborad()
  Widget userForm() {
    return Container(
      width: 230.0,
      height: 40.0,
      child: TextField(
        onChanged: (value) {
          user = value.trim();
        },
        decoration: InputDecoration(
          icon: Icon(Icons.person,
          size: 40,
          color: MyStyle().b1,),
          enabledBorder: OutlineInputBorder(
            
            borderSide: BorderSide(
              color: MyStyle().colorGrey8,
            ),
          ),
          hintStyle: TextStyle(
              backgroundColor: MyStyle().colorWhite,
              fontSize: 10.0,
              color: MyStyle().colorGrey4),
          hintText: 'User :',
        ),
      ),
    );
  }

  //สร้าง PasswordForm
  Widget passwordForm() {
    return Container(
      width: 230.0,
      height: 40.0,
      child: TextField(
        obscureText: true,
        onChanged: (value) {
          password = value.trim();
        },
        decoration: InputDecoration(
          icon: Icon(Icons.lock_open,
          size: 40,
          color: MyStyle().b1,),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyStyle().colorGrey8,
            ),
          ),
          hintStyle: TextStyle(fontSize: 10.0, color: MyStyle().colorGrey4),
          hintText: 'Password :',
        ),
      ),
    );
  }

  //Method ให้แสดงส่วนด้านล่าง โดยการเอา แสดง Logo()
  Widget showLogo() {
    return Container(
      height: 80.0,
      child: Image.asset('images/logo12.png'),
    );
  }

  //กำหนดสีต่าง ๆ และสร้าง Function เพื่อ Call MyStyle() ที่กำหนด

  Widget showAppName() {
    return Text(
      'Wealth Republic Mutual Fund Brokerage Securities Co.,Ltd. ',
      style: TextStyle(
        fontFamily: 'RobotoMono',
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().b1,
      ),
    );
  }

  Widget showThaiName() {
    return Text(
      'บริษัทหลักทรัพย์นายหน้าซื้อขายหน่วยลงทุน เวลท์ รีพับบลิค จำกัด',
      style: TextStyle(
        fontFamily: 'RobotoMono',
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().b1,
      ),
    );
  }

  Widget showTelephone() {
    return Text(
      'หมายเลขโทรศัพท์ 02 266 6697-8',
      style: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().b1,
      ),
    );
  }

  Widget showsAppName() {
    return Text(
      'SmartFund Link V 1.8+',
      style: TextStyle(

        fontFamily: 'RobotoMono',
        fontSize: 26.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().colorWhite,
      ),
    );
  }

  // สร้างปุ่ม Login และเปลี่ยนสีปุม ตัวหนังสือ

  Widget signInButton() {
    return RaisedButton(
      color: MyStyle().colorGrey7,
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if (user == null ||
            user.isEmpty ||
            password == null ||
            password.isEmpty) {
          normalDialog(context, 'มีช่องว่าง', 'กรุณา กรอกทุกช่อง สิ คะ');
        } else {
          checkAuthen();
        }
      },
    );
  }

  Widget singUp2Button() {
    return RaisedButton(
      color: MyStyle().colorGrey7,
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You Click SignUp');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext buildContext) {
          return Register();
        });
        Navigator.of(context).push(materialPageRoute);
        {
          checkAuthen();
        }
      },
    );
  }

  //ตรวจสอบค่า และประกาศตัวแปรชื่อ checkAuthen จาก API ก่อนไว้ใช่หรือไม่

  Future<void> checkAuthen() async {
     //String url = 'http://115.31.144.228/api/getUserWhereUserKrit.php?isAdd=true&User=$user'; //ไม่ต้องใส่ Port หาไม่พบ
    //'https://wr.wealthrepublic.co.th:3009/api/wr/summaryGroupByFundType'
    String url ='https://www.androidthai.in.th/feb13/getUserWhereUserKrit.php?isAdd=true&User=$user';
    try {
      Response response = await Dio().get(url);
      print('reponse =$response');
      if (response.toString() == 'null') {
        normalDialog(context, 'User False', 'No $user in my Database');
      } else {
        // ถอนรหัสออกมาเป็น ภาษาไทย จาก json
        var result = json.decode(response.data);
        print('result = $result');
        for (var map in result) {
          print('map = $map');
          UserModel userModel = UserModel.fromMap(map);

          if (password == userModel.password) {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext buildContext) {
              return Menus(
                userModel: userModel,
              );
            });
            Navigator.of(context).push(materialPageRoute);
          } else {
            normalDialog(
                context, 'Password False', 'Try Agains Password False');
          }
        }
      }
    } catch (e) {}
  }

  // สร้างปุ่ม ลงทะเบียน ก่อน
  Widget singUpButton() {
    return OutlineButton(
      borderSide: BorderSide(color: MyStyle().text2Color),
      child: Text(
        'Sign Up',
        style: TextStyle(color: MyStyle().colorGrey9),
      ),
      onPressed: () {
        print('You Click SignUp');

        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext buildContext) {
          return Register();
        });
        Navigator.of(context).push(materialPageRoute); //การทำ Route หน้าถัดไป
      },
    );
  }

  //ต้องการขายช่องห่าง และความสูงของ ปุ่ม
  Widget mySizebox() {
    return SizedBox(
      width: 10.0,
      height: 20.0,
    );
  }

  Widget spacebox() {
    return SizedBox(
      width: 10.0,
      height: 10.0,
    );
  }

  //ประกาศ ปุ่มเพื่อทำการ Login center ให้อยู่ตรงกลาง

  Widget showButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        signInButton(),
        mySizebox(),
        singUp2Button(),
      ],
    );
  }


 
 webApi() async {
    const url = 'http://wealthrepublic.co.th';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // iOS
      const url = 'http://wealthrepublic.co.th';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }


 webopenMap() async {
    // Android
    const url = 'geo:52.32,4.917';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // iOS
      const url = 'https://maps.apple.com/?ll=52.32,4.917';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }


  //สร้าง Password ต้องกำหนด ด้านล่างนี้ด้วยทุกครั้ง
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().colorGrey8,
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'เข้าสู่ Website ของบริษัท',
          onPressed: webApi,
        ),
        title: showsAppName(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'ค้นหา',
            onPressed: webopenMap,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[Colors.white, MyStyle().colorWhite],
            radius: 1.0,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // showsAppName(),
              //MainActivity(),
              showLogo(),
              spacebox(),

              showThaiName(),
              showAppName(),
              //showTelephone(),
              spacebox(),
              spacebox(),
              spacebox(),
              userForm(),
              spacebox(),
              passwordForm(),
              mySizebox(),
              showButton(),
              spacebox(),
              spacebox(),
              spacebox(),
              spacebox(),
              spacebox(),
              spacebox(),
              spacebox(),
              spacebox(),
            ],
          ),
        ),
      ),
    );
  }
}
