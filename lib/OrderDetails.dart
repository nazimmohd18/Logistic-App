import 'package:flutter/material.dart';
import 'Utils/Colors.dart';
import 'package:firebase_database/firebase_database.dart';

class OrderDetails extends StatefulWidget {
  // const OrderDetails({Key? key}) : super(key: key);
  final int ? index;
  OrderDetails({this.index});

  @override
  _OrderDetailsState createState() => _OrderDetailsState(index);
}

class _OrderDetailsState extends State<OrderDetails> {
  final fb = FirebaseDatabase.instance;
  final int ? index;
  _OrderDetailsState(this.index);

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
    print(index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        title: Text('Order Description'),

        centerTitle: true,
      ),
      body: Container(
        color: card.withOpacity(.5),
        width: deviceWidth,
        height: deviceHeight,

        child: FutureBuilder(
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
                :
          SingleChildScrollView( padding: EdgeInsets.all(deviceWidth* .05),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order Number", style: TextStyle(color: appbar,fontSize: 20, fontWeight: FontWeight.w600),),
                    Text(jsonData[index]["Order Number"], style: TextStyle(color: appbar,fontSize: 20, fontWeight: FontWeight.w600),)

                  ],
                ),
                Divider(
                  color: appbar,
                  thickness: 1.5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order Info",style: TextStyle(color: appbar,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text(jsonData[index]["Order Description"],style: TextStyle(color: appbar,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],),
                Divider(
                  color: card,
                  thickness: 1.5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order Weight",style: TextStyle(color: appbar,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text(jsonData[index]["Weight of Order"],style: TextStyle(color: appbar,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],),
                Divider(
                  color: card,
                  thickness: 1.5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Quantity",style: TextStyle(color: appbar,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text(jsonData[index]["Quantity"].toString(),style: TextStyle(color: appbar,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],),
                Divider(
                  color: card,
                  thickness: 1.5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pickup Date",style: TextStyle(color: appbar,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text("10/01/21",style: TextStyle(color: appbar,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],),
                Divider(
                  color: card,
                  thickness: 1.5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pickup Address",style: TextStyle(color: appbar,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text(jsonData[index]["Pickup Address Line 1"],style: TextStyle(color: appbar,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],),
                Divider(
                  color: card,
                  thickness: 1.5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pickup Postal Code",style: TextStyle(color: appbar,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text(jsonData[index]["Pickup Postal Code"],style: TextStyle(color: appbar,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],),
                Divider(
                  color: card,
                  thickness: 1.5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery Date",style: TextStyle(color: appbar,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text(jsonData[index]["Delivery Date"],style: TextStyle(color: appbar,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],),
                Divider(
                  color: card,
                  thickness: 1.5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery Address",style: TextStyle(color: appbar,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text(jsonData[index]["Delivery Address Line 1"],style: TextStyle(color: appbar,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],),
                Divider(
                  color: card,
                  thickness: 1.5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery Postal Code",style: TextStyle(color: appbar,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text(jsonData[index]["Delivery Postal Code"].toString(),style: TextStyle(color: appbar,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],),
                Divider(
                  color: card,
                  thickness: 1.5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Customer First Name",style: TextStyle(color: appbar,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text(jsonData[index]["Customer First Name"],style: TextStyle(color: appbar,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],),
                Divider(
                  color: card,
                  thickness: 1.5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Customer Last Name",style: TextStyle(color: appbar,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text(jsonData[index]["Customer Last Name"],style: TextStyle(color: appbar,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],),
                Divider(
                  color: card,
                  thickness: 1.5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Customer Email",style: TextStyle(color: appbar,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text(jsonData[index]["Customer Email"],style: TextStyle(color: appbar,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],),
                Divider(
                  color: card,
                  thickness: 1.5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Customer Phone Number",style: TextStyle(color: appbar,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text(jsonData[index]["Customer Phone Number"].toString(),style: TextStyle(color: appbar,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],),
                Divider(
                  color: card,
                  thickness: 1.5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Customer Company",style: TextStyle(color: appbar,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text("Company 1",style: TextStyle(color: appbar,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],),
                Divider(
                  color: card,
                  thickness: 1.5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Merchant Name",style: TextStyle(color: appbar,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text(jsonData[index]["Merchant Name"],style: TextStyle(color: appbar,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],),
                Divider(
                  color: card,
                  thickness: 1.5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Approval Status",style: TextStyle(color: appbar,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text("Approved",style: TextStyle(color: appbar,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],),
                Divider(
                  color: card,
                  thickness: 1.5,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
