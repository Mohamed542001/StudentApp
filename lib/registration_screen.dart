
import 'package:facedetectionattandanceapp/database/database.dart';
import 'package:facedetectionattandanceapp/home_page.dart';
import 'package:facedetectionattandanceapp/models/user_model.dart';
import 'package:facedetectionattandanceapp/widgets/app_button.dart';
import 'package:facedetectionattandanceapp/widgets/app_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
   RegistrationScreen({

     required this.destination,
     required this.user,
     required this.password,
     required this.phone,
     required this.ticketNumber,
     required this.modelData,
     required this.address,
     Key? key}) : super(key: key);
   String user;
   String password;
   String address;
   String phone;
   String ticketNumber;
   String destination;
   List modelData;

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController fromController = TextEditingController(text: '');

  final TextEditingController toController = TextEditingController(text: '');

   String selectedStatus = 'Ordinary';

   List status = ["Ordinary", "Medium", "First Class",];
   String oneWay = 'Yes';

   List oneWayList = ["Yes", "No"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Reservation"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("From : ",style: TextStyle(fontSize: 19,color: Colors.blue),),
              ),
              AppTextField(
                controller: fromController,
                labelText: "Enter Your Current City",
              )  ,
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("To : ",style: TextStyle(fontSize: 19,color: Colors.blue),),
              ),
              AppTextField(

                controller: toController,
                labelText: "Enter Your Destination",
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("Ticket Type : ",style: TextStyle(fontSize: 19,color: Colors.blue),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    //hint:'',
                    dropdownColor: Colors.white,
                    icon: Padding(
                      padding: EdgeInsetsDirectional.only(start: 30),
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                    value: selectedStatus,
                    onChanged: (newValue) {
                      setState(() {
                        selectedStatus = newValue!;
                      });
                    },
                    items:
                    status.map<DropdownMenuItem<String>>((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(
                          valueItem,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("One-way Ticket : ",style: TextStyle(fontSize: 19,color: Colors.blue),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    //hint:'',
                    dropdownColor: Colors.white,
                    icon: Padding(
                      padding: EdgeInsetsDirectional.only(start: 30),
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                    value: oneWay,
                    onChanged: (newValue) {
                      setState(() {
                        oneWay = newValue!;
                      });
                    },
                    items:
                    oneWayList.map<DropdownMenuItem<String>>((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(
                          valueItem,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              AppButton(
                text: 'Continue Registration',
                onPressed: () async {
                  DatabaseHelper _databaseHelper = DatabaseHelper.instance;
                  print(fromController.text);
                  print(oneWay);
                  print(selectedStatus);
                  print(oneWay);
                  print(widget.user);
                  print(widget.modelData);
                  print(widget.phone);
                  User userToSave = User(
                    from: fromController.text,
                    oneWay: oneWay,
                    ticketType: selectedStatus,
                    user: widget.user,
                    password: widget.password,
                    address: widget.address,
                    phone: widget.phone,
                    destination: toController.text,
                    ticketNumber: widget.ticketNumber,
                    modelData: widget.modelData,
                  );
                  await _databaseHelper.insert(userToSave);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                },
                icon: Icon(
                  Icons.person_add,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
