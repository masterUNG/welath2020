import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kritproduct/utility/my_style.dart';
import 'package:kritproduct/utility/normal_dialog.dart';
//import 'package:kritproduct/widget/update_icons.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Field ประกาศตัวแปร
  String name, user, password, rePassword ;
  String idciticent, telephone, email;

  //Method กำหนดรูปคน และกำหนดค่าสี
  Widget nameForm() {
    //ประกาศตัวแปร เป็นสี
    Color color = Colors.blueGrey.shade700;
    return TextField(
      onChanged: (String string) {
        name = string.trim();
      },
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          helperStyle: TextStyle(color: color,
          fontFamily: 'Raleway',
          fontSize: 15.0),
          helperText: 'กรุณาป้อนชื่อและนามสกุลให้ครบ',
          labelStyle: TextStyle(color: color,
          fontFamily: 'RobotoMono',
          fontSize: 16.0),
          labelText: 'ชื่อ-นามสกุล / Name:',
          icon: Icon(
            Icons.person,
            size: 30.0,
            color: color,
          )),
    );
  }
  


  Widget show3Logo() {
    return Container(
      height: 60.0,
      child: Image.asset('images/logowr.png'),
    );
  }



  //Title Bar นำไปใส่ไว้ใน Appbar
  Widget showSTitle() {
     return Text('Register To Sign In',
      style: TextStyle(
        fontFamily: 'RobotoMono',
        fontSize: 25.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().colorWhite,),
    );
  }



  Widget emailForm() {
    //ประกาศตัวแปร เป็นสี
    Color color = Colors.blueGrey;
    return TextField(
      onChanged: (String string) {
        user = string.trim();
      },
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          helperStyle: TextStyle(color: color,
          fontFamily: 'Raleway',
          fontSize: 15.0),
          helperText: 'กรุณาป้อนชื่อเข้าใช้งาน เป็นภาษาอังกฤษ หรือตัวเลขได้',
          labelStyle: TextStyle(color: color,
          fontFamily: 'RobotoMono',
          fontSize: 16.0,),
          labelText: 'ชื่อเข้าใช้ระบบงาน / Userlogin',
          icon: Icon(
            Icons.person_add,
            size: 30.0,
            color: color,
          )),
    );
  }



   Widget telephonForm() {
    //ประกาศตัวแปร เป็นสี
    Color color = Colors.blueGrey;
    return TextField(
      onChanged: (String string) {
        telephone = string.trim();
      },
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          helperStyle: TextStyle(color: color,
          fontFamily: 'Raleway',
          fontSize: 15.0,),
          helperText: 'กรุณาป้อนหมายเลขโทรศัพท์ ไม่ต้องใส่ขีด',
          labelStyle: TextStyle(color: color,
          fontFamily: 'RobotoMono',
          fontSize: 16.0),
          labelText: 'โทรศัพท์ / Telephone :',
          icon: Icon(
            Icons.phone_android,
            size: 36.0,
            color: color,
            
          )),
    );
  }

  Widget passwordForm() {
    //ประกาศตัวแปร เป็นสี
    Color color = Colors.blueGrey;
    return TextField(
      obscureText: true,
      onChanged: (String string) {
        password = string.trim();
      },
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          helperStyle: TextStyle(color: color,
          fontFamily: 'Raleway',
          fontSize: 15.0,),
          helperText: 'กรุณาใส่รหัส อย่างน้อย 6 ตัว ตัวหนังสือและตัวเลข',
          labelStyle: TextStyle(color: color,
          fontFamily: 'RobotoMono',
          fontSize: 16.0,),
          labelText: 'รหัสผ่าน / Password:',
          icon: Icon(
            Icons.vpn_key,
            size: 30.0,
            color: color,
          )),
    );
  }

  Widget rePasswordForm() {
    //ประกาศตัวแปร เป็นสี
    Color color = Colors.blueGrey;
    return TextField(
      obscureText: true,
      onChanged: (String string) {
        rePassword = string.trim(); //ตัดช่องว่างออก
      },
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          helperStyle: TextStyle(color: color,
          fontFamily: 'Raleway',
          fontSize: 15.0,),
          helperText: 'กรุณาใส่รหัสผ่านให้ตรงกับที่ผ่านมา',
          labelStyle: TextStyle(color: MyStyle().colorGrey8,
          fontFamily: 'RobotoMono',
          fontSize: 16.0,
          ),
          labelText: 'กรุณาใส่รหัสผ่านอีกครั้ง / Re-Password',
          icon: Icon(
            Icons.lock_open,
            size: 30.0,
            color:  MyStyle().c4,
          )),
    );
  }

  //กำหนดค่าตัวแปร เพื่อให้แจ้ง Message ออกมา
  Widget registerButton() {
    return IconButton(
      tooltip: 'UpLoad To Server',

      icon: Icon(Icons.cloud_upload),
    
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
            rePassword.isEmpty
           
            ) {
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
    //String url = 'http://115.31.144.228:80/api/addUserKrit.php?isAdd=true&Name=$name&User=$user&Password=$password';
    String url = 'https://www.androidthai.in.th/feb13/addUserKrit.php?isAdd=true&Name=$name&User=$user&Password=$password';
        //http://localhost:8081/wr/addUserKrit.php
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
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          show3Logo(), 
          nameForm(),
          emailForm(),
          telephonForm(),
          passwordForm(),
          rePasswordForm(),
        ],
      ),
      backgroundColor: MyStyle().colorWhite,
      appBar: AppBar(
        title: showSTitle(),
        actions: <Widget>[registerButton()],
        backgroundColor: MyStyle().colorGrey7,
        
      ), //ดึงมาจาก Mystype ใส่รูป Icon เป็นก้อนเมฆ
    );
  }
}
