import 'package:flutter/material.dart';
import 'Utils/Colors.dart';
import 'package:get/get.dart';
import 'OrderDetails.dart';
import 'package:firebase_database/firebase_database.dart';


class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final fb = FirebaseDatabase.instance;

  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  String ? dropdownValue;

  var jsonData;
 Future<void> getData() async {
    final ref =  fb.reference();
    await ref.child("").once().then((DataSnapshot data){

  setState(() {
  jsonData =  data.value;
  });
  print(jsonData);
  });
}
Future ? itemList;
  @override
  void initState() {
    itemList = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        title: Text('All Orders'),

        centerTitle: true,
      ),
      floatingActionButton: ElevatedButton(onPressed: (){
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return StatefulBuilder( builder: (context, setState){
                return Container(
                  color: card,
                  padding: EdgeInsets.all(deviceWidth* .05),
                  height: deviceHeight* .35,
                  child: Theme(
                    data: ThemeData(unselectedWidgetColor: white),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Filter By", style: TextStyle(color: white,fontSize: 18,fontWeight: FontWeight.bold),),
                        CheckboxListTile(activeColor: appbar,value: _value1,title: Text('Area Code',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: white),), onChanged: (newValue){
                          setState(() {
                            _value1 = newValue!;
                          });
                        }),
                        CheckboxListTile(activeColor: appbar,value: _value2,title: Text('Pickup Date',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: white),), onChanged: (newValue){
                          setState(() {
                            _value2 = newValue!;
                          });
                        }),
                        CheckboxListTile(activeColor: appbar,value: _value3,title: Text('Delivery Date',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: white),), onChanged: (newValue){
                          setState(() {
                            _value3 = newValue!;
                          });
                        }),
                        CheckboxListTile(activeColor: appbar,value: _value4,title: Text('Merchant Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: white),), onChanged: (newValue){
                          setState(() {
                            _value4 = newValue!;
                          });
                        }),

                      ],
                    ),
                  ),
                );
              }

              );
            });
      },child: Text("Filter",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,),),style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => card),padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(vertical: deviceWidth* .035,horizontal: deviceWidth* .055)),shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))))),
      body: Container(
        color: card.withOpacity(.5),
        width: deviceWidth,
        height: deviceHeight,

        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: deviceWidth * .135,
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: appbar,width: 1.5))),
              padding: EdgeInsets.symmetric(
                  vertical: deviceWidth * .01,
                  horizontal: deviceWidth * .035),
              child: DropdownButton<String>(
                dropdownColor: card,
                hint: Text('Sorted By: ',style: TextStyle(color: appbar,fontWeight: FontWeight.w600),),
                value: dropdownValue,
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down_outlined),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                ),
                underline: Container(
                  color: Colors.transparent,
                ),
                onChanged: ( newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>[
                  'Area Code',
                  'Pickup Date',
                  'Delivery Date',
                  'Merchant Name',

                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: TextStyle(color: appbar,fontWeight: FontWeight.w600),),
                  );
                }).toList(),
              ),
            ),

                FutureBuilder(
                  future: itemList,
                    builder: (ctx, snapshot) => snapshot.connectionState ==
                        ConnectionState.waiting
                        ? Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor: new AlwaysStoppedAnimation<Color>(appbar),
                      ),
                    )
                        : jsonData.length == null
                        ? Center(
                      child: Card(
                        color: appbar,
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          child: Text(
                            'No Order Details Available!',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, color: white),
                          ),
                        ),
                      ),
                    )
                        : Expanded(
                  child: ListView.builder(  padding: EdgeInsets.all(deviceWidth* .025),
    itemCount: jsonData.length,
    itemBuilder: (context, index) {
                    return GestureDetector(onTap: (

                          ){

                        Get.to(()=>OrderDetails(index: index,));
                      },
                        child: Card(margin: EdgeInsets.only(bottom: deviceWidth* .025),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          color: appbar,
                          child: Container(
                            margin: EdgeInsets.all(deviceWidth* .025),
                            color: appbar,
                            width: deviceWidth,
                            height: deviceWidth* .25,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              Container(
                                width: deviceWidth* .225,
                                height: deviceWidth* .225,
                                child: ImageIcon(AssetImage("assets/images/order.png"),color: white,),
                              ),
                                VerticalDivider(thickness: 1.5,color: white,),
                                Container(width: deviceWidth* .6,
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Order No. : ',style: TextStyle(color: white,fontSize: 16,fontWeight: FontWeight.bold,),overflow: TextOverflow.ellipsis,),
                                          Flexible(child: Text(jsonData[index]["Order Number"].toString(),style: TextStyle(color: white,fontSize: 18,fontWeight: FontWeight.bold,),overflow: TextOverflow.ellipsis,)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Delivery Add. : ',style: TextStyle(color: white,fontSize: 16,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis),
                                          Flexible(child: Text(jsonData[index]["Delivery Address Line 1"].toString(),style: TextStyle(color: white,fontSize: 16,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis)),
                                        ],
                                      ),
                                      Flexible(child: Text('Delivery Date: '+ jsonData[index]["Delivery Date"].toString(),style: TextStyle(color: white,fontSize: 16,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  ),
              ),
                ),
          ],
        ),
      ),
    );
  }
}
