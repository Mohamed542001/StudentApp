import 'dart:io';
import 'dart:math';
import 'package:facedetectionattandanceapp/home_page.dart';
import 'package:facedetectionattandanceapp/widgets/app_button.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
   Profile(this.username, { Key? key, required this.imagePath,
     required this.destination, required this.ticketNumber,
   required this.phone,required this.address,
   required this.oneWay,required this.ticketType,
   required this.from,
   }) : super(key: key);
  final String username;
  final String address;
  final String phone;
  final String ticketNumber;
  final String destination;
  final String imagePath;
  final String from;
  final String oneWay;
  final String ticketType;
   int hallNumber = 0;
   int randomNumber = 0;
   getRandomTicket(){
     Random random = new Random();
     Random random1 = new Random();
      randomNumber = random.nextInt(17);
      hallNumber = random.nextInt(5);
   }
   List tickets = [1254125,546561,155146,3213543,1546553,4543354,346834,354355,243543,
   13543545,3543555,1212121,54354354,45433543,3543778,22215122,001254621,5526448888];
  List hallNum = [1,2,3,4,5,6];

  @override
  Widget build(BuildContext context) {
    getRandomTicket();
    return Scaffold(
      backgroundColor: Color(0XFFC7FFBE),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(imagePath)),
                      ),
                    ),
                    margin: EdgeInsets.all(20),
                    width: 100,
                    height: 100,
                    // child: Transform(
                    //     alignment: Alignment.center,
                    //     child: FittedBox(
                    //       fit: BoxFit.cover,
                    //       child: Image.file(File(imagePath)),
                    //     ),
                    //     transform: Matrix4.rotationY(mirror)),
                  ),
                  Expanded(
                    child: Text(
                      'Hi ' + username + '!',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFFFEFFC1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Passenger Data:",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Age : " + phone,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Address: " + address,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Ticket Number: " + tickets[hallNumber].toString(),
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "From City: " + from,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Destination: " + destination,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "One-Way: " + oneWay,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Ticket Type: " + ticketType,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Hall Number: " + hallNum[hallNumber].toString(),
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: AppButton(
                  text: "LOG OUT",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  color: Color(0xFFFF6161),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
