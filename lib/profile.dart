import 'dart:io';
import 'package:facedetectionattandanceapp/home_page.dart';
import 'package:facedetectionattandanceapp/widgets/app_button.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
   Profile(this.username, { Key? key, required this.imagePath,
     required this.destination, required this.ticketNumber,
   required this.phone,required this.address}) : super(key: key);
  final String username;
  final String address;
  final String phone;
  final String ticketNumber;
  final String destination;
  final String imagePath;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFC7FFBE),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 50,),
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
                    Icon(
                      Icons.warning_amber_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                            "Ticket Number: " + ticketNumber,
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

                  ],
                ),
              ),
              Spacer(),
              AppButton(
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
