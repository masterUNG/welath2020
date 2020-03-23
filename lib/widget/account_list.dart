import 'package:flutter/material.dart';

//import 'package:flutter/material.dart';
import 'package:kritproduct/utility/models/user_model.dart';
import 'package:kritproduct/utility/my_style.dart';

class FunLists extends StatefulWidget {
  //ต้องการส่งค่า
  //final UserModel userModel;
  //FunLists({Key key, this.userModel}) : super(key: key);

  @override
  _FunListstState createState() => _FunListstState();
}

class _FunListstState extends State<FunLists> {
  //Field
  String nameLogin = '';
  UserModel currentModel;
  String name, user, password, rePassword;
  String idfund, fundDresscription;

  //Method
  @override
  void initState() {
    super.initState();
//    currentModel = widget.userModel;
//    nameLogin = currentModel.name;
  }

  Widget showTitle() {
    return Text(
      'Holding Report',
      style: TextStyle(
        fontFamily: 'RobotoMono',
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().colorWhite,
      ),
    );
  }

  Widget showsMutualFund() {
    return Text(
      'กองทุนรวม Mutual Fund',
      style: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 15.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().color7,
      ),
    );
  }

  Widget showsTotalCostValue() {
    return Text(
      'ต้นทุนเงินลงทุน',
      style: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().color1,
      ),
    );
  }

  Widget showsTotalCost2Value() {
    return Text(
      'Total Cost Value',
      style: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().color7,
      ),
    );
  }

  Widget showsTotalcost() {
    return Text(
      'ยอดรวมกองทุนรวม',
      style: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().color1,
      ),
    );
  }

  Widget showsTotal2cost() {
    return Text(
      'Total Mutual Fund',
      style: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().color7,
      ),
    );
  }

  Widget showsTotalMaketValue() {
    return Text(
      'มูลค่าตามราคาตลาด',
      style: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().color1,
      ),
    );
  }

  Widget showsTotal2MaketValue() {
    return Text(
      'Total Market Value',
      style: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().color7,
      ),
    );
  }

  Widget showsTotalUnrealizedGain() {
    return Text(
      'กำไร (ขาดทุน) ที่ยังไม่รับรู้',
      style: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: MyStyle().color1,
      ),
    );
  }

  Widget showsTotal2UnrealizedGain() {
    return Text(
      'Unrealized Gain (Loss)',
      style: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: MyStyle().color7,
      ),
    );
  }


  Widget fundSubForm() {
    //ประกาศตัวแปร เป็นสี
    Color color = Colors.purple;
    return TextField(
      onChanged: (String string) {
        user = string.trim();
      },
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        labelStyle: TextStyle(color: color),
        labelText: 'ยอดรวมกองทุนรวม / Total Mutual Fund',
      ),
    );
  }

  //ต้องการให้อยู่บรรทัดเดียวกัน
  Widget showName() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('$nameLogin'),
      ],
    );
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
        
          showsMutualFund(),
          showsTotalcost(),
          showsTotal2cost(),
          showsTotalCostValue(),
          showsTotalCost2Value(),
          showsTotalMaketValue(),
          showsTotal2MaketValue(),
          showsTotalUnrealizedGain(),
          showsTotal2UnrealizedGain(),
        ],
      ),
      appBar: AppBar(
        actions: <Widget>[showName()],
        title: showTitle(),
        backgroundColor: MyStyle().colorGrey9,
      ),
    );
  }
}
