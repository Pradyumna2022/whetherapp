
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class HomePage extends StatefulWidget{
  HomePageState createState()=> HomePageState();
}

class HomePageState extends State<HomePage>{

  void getcurrentposition() async{

    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
      print("permission not given");
    }
    else{
      Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      print("lontitude : "+ currentPosition.longitude.toString());
      print("latitude : "+ currentPosition.latitude.toString());

    }
  }

  TextEditingController whethercontroller = TextEditingController();
  var mydefaultText = "Mention Your Location";

  Widget build(BuildContext context){
    return Scaffold(
        appBar:AppBar(
          title:Text("Whether App"),
          centerTitle:true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(mydefaultText),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  controller: whethercontroller,
                  decoration: InputDecoration(
                      labelText: 'Location',
                      hintText: 'Enter Your Location',
                      enabledBorder: OutlineInputBorder()
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                mydefaultText = whethercontroller.text;
                setState(() {

                });
              }, child: Text("Done")),
              ElevatedButton(onPressed: (){
                getcurrentposition();
              }, child: Text("Get Current Location")),

            ],
          ),
        )
    );
  }
}