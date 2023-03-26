import 'package:flutter/material.dart';
import 'package:food_app/widgets/color_widget.dart';
import 'package:food_app/widgets/single_item.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Review cart',
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: Text('Total amount'),
        subtitle: Text('170.00',style: TextStyle(
          color: Colors.green[900],
        ),),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text('Submit'),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: (){

            },
          ),
        ),
      ),
      body:ListView(
        children: [
          SizedBox(height: 10,),
          SingleItem(isBool: true),
          SingleItem(isBool: true),
          SingleItem(isBool: true),
          SingleItem(isBool: true),
          SingleItem(isBool: true),
          SingleItem(isBool: true),
          SingleItem(isBool: true),
          SingleItem(isBool: true),
          SingleItem(isBool: true),
          SingleItem(isBool: true),
          SingleItem(isBool: true),
          SizedBox(height: 10,),
        ],
      ) ,
    );
  }
}
