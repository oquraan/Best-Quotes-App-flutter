// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:best_quotes_project/CARDS/AddedCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: BestQuotes(),
    );
  }
}

class BestQuotes extends StatefulWidget {
  const BestQuotes({super.key});

  @override
  State<BestQuotes> createState() => _BestQuotesState();
}

class Quot {
  String textContant;
  String authour;
  Quot({required this.textContant, required this.authour});
}

Quot q1 = Quot(textContant: "يا مرحباااااااا", authour: "عمر عصام القرعان ");
Quot q2 = Quot(textContant: "احم  شحم رز ولحم ", authour: "عمر عصام القرعان ");
Quot q3 = Quot(
    textContant: "{ وَذَكِّرْ فَإِنَّ الذِّكْرَى تَنْفَعُ الْمُؤْمِنِينَ }",
    authour: "لقرآن الكريم ");

List<Quot> memberList = [q1, q2, q3];

//int index=memberList.indexOf();

class _BestQuotesState extends State<BestQuotes> {
  final yourText = TextEditingController();
  final yourName = TextEditingController();
  deleteItem(int value) {
    setState(() {
      memberList.removeAt(value);
    });
  }

  AddCard() {
    setState(() {
      Quot q4 =
          Quot(textContant: yourText.text, authour: yourName.text);
      memberList.add(q4);
    });
  }

  deleteItem1(Quot value) {
    setState(() {
      memberList.remove(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextField(
                          controller: yourText,
                          maxLength: 50,
                          decoration: InputDecoration(
                            hintText: "Add new quot :",
                          ),
                        ),
                        TextField(
                          controller: yourName,
                          maxLength: 50,
                          decoration: InputDecoration(
                            hintText: "Add Author :",
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            AddCard();
                            Navigator.pop(context);
                          },
                          child: Text("ADD", style: TextStyle(fontSize: 22)),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        backgroundColor: Colors.blue[500],
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 57, 121),
        title: Text(
          "Best Quotes ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...memberList
                .map((e) => Cards(
                      deleteItem: deleteItem1,
                      index: memberList
                          .indexOf(e), // to know what is index you want deleted
                      item:
                          e, // anthor way to delete item from list  using DATA TYPE Qout
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
