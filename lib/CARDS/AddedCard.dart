// ignore_for_file: file_names, prefer_const_constructors

import 'package:best_quotes_project/main.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  
  Function deleteItem;
  int index;
  Quot item;
  Cards(
      {
      required this.deleteItem,
      required this.index,
      required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 10,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Color.fromARGB(255, 57, 66, 251),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              item.textContant, // to  write text contant
              style: TextStyle(
                color: Colors.white,
                fontSize: 27,
              ),
              textDirection: TextDirection.rtl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      //deleteItem(index);
                      deleteItem(item);
                    },
                    icon: Icon(
                      Icons.delete_rounded,
                      size: 26,
                      color: Colors.red[100],
                    )),
                Text(
                  item.authour, // to  write author
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
