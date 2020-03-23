//import 'package:flutter/material.dart';



// class menUsub extends StatefulWidget {
//   @override
//   _menUsubState createState() => _menUsubState();
// }

// class _menUsubState extends State<menUsub> {
//   //Field ประกาศตัวแปร
//   String name, user, password, rePassword ;
//   String idciticent, eMails;

//   //Method กำหนดรูปคน และกำหนดค่าสี

 
  
//   //Title Bar นำไปใส่ไว้ใน Appbar
//   Widget showSTitle() {
//     return Text('Fund List');
//   }

 
  
// web_open2Web() async {
//     // Android
//     const url = 'https//:m.wealthreplublic.co.th';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       // iOS
//       const url = 'https://m.wealthrepublic.co.th';
//       if (await canLaunch(url)) {
//         await launch(url);
//       } else {
//         throw 'Could not launch $url';
//       }
//     }
//   }




  // //กำหนดค่าตัวแปร เพื่อให้แจ้ง Message ออกมา
  // Widget register2Button() {
  //   return IconButton(
  //     tooltip: 'UpLoad To Server',
  //     icon: Icon(Icons.cloud_upload),
  //     onPressed: () {
  //       print(
  //           'name =$name, user =$user, password =$password, rePassword =$rePassword');
  //       if (name == null ||
  //           name.isEmpty ||
  //           user == null ||
  //           user.isEmpty ||
  //           password == null ||
  //           password.isEmpty ||
  //           rePassword == null ||
  //           rePassword.isEmpty
           
  //           ) {
  //         normalDialog(context, 'ท่านกรอกไม่ครบ', 'โปรดตรวจสอบใหม่อีกครั้ง');
  //       } else if (password == rePassword) {
  //         register2Thread();
  //       } else {
  //         normalDialog(context, 'Password Not Math',
  //             'Pleese Type Password Math Re Password');
  //       }
  //     },
  //   );
  // }

  // //Call API เป็น PHP กำหนดค่าต้องใส่ $นำมา
  // Future<void> register2Thread() async {
  //   String url =
  //       'https://www.androidthai.in.th/feb13/addUserKrit.php?isAdd=true&Name=$name&User=$user&Password=$password';
  //   try {
  //     Response response = await Dio().get(url);
  //     print('reponse =$response');
  //     if (response.toString() == 'true') {
  //       Navigator.of(context).pop();
  //     } else {
  //       normalDialog(context, 'ลงทะเบียนไม่สำเร็จ', 'ลองใหม่อีกครั้ง');
  //     }
  //   } catch (e) {}
  // }

  //จะห่างข้างละ 30.0
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         padding: EdgeInsets.all(30.0),
//         children: <Widget>[
//           //nameForm(),
        
          
//           //passwordForm(),
//           //rePasswordForm(),
//         ],
//       ),
//       appBar: AppBar(
//         title: showSTitle(),
//         actions: <Widget>[register2Button()],
//         backgroundColor: MyStyle().text2Color,
//       ), //ดึงมาจาก Mystype ใส่รูป Icon เป็นก้อนเมฆ
//     );
//   }
// }
