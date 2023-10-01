import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home : NinjaCard(),

));

class NinjaCard extends StatefulWidget {
  const NinjaCard({super.key});

  @override
  State<NinjaCard> createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {


  int ninjaLevel = 0;


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[900],

      appBar : AppBar(
        title: Text('Ninja ID Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,

 
      ),
     
      persistentFooterButtons: <Widget>[
        ElevatedButton(
          style : ElevatedButton.styleFrom(backgroundColor: Colors.grey[800],minimumSize: Size(50.0, 50.0),  ),
          
          onPressed: () {
          setState(() {
            ninjaLevel--;
          });
        }, child: Text ('-',style:TextStyle(fontSize: 30, color: Colors.grey[600],)), ),
        ElevatedButton(
          style : ElevatedButton.styleFrom(backgroundColor: Colors.grey[800],minimumSize: Size(50.0, 50.0),  ),
          
          onPressed: () {
          setState(() {
            ninjaLevel++;
          });
        }, child: Text ('+',style:TextStyle(fontSize: 30, color: Colors.grey[600],)), ),
        
      ],
      body : Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/pain.png'),
                radius: 60.0,
            
              ),
            ),
            Divider(
              height: 90.0,

            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,

              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Nagato Uzumaki',
              style: TextStyle(
                color: Colors.amber[200],
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(height: 30.0,),
            Text(
              'CURRENT NINJA LEVEL',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,

              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              '$ninjaLevel',
              style: TextStyle(
                color: Colors.amber[200],
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(height: 30.0,),

            Row(children: [
              Icon(
                Icons.email,
                color: Colors.grey[400],
              ),
              SizedBox(width:15.0),

              Text(
                'vedu8051@gmail.com',
                style: TextStyle(
                  color : const Color.fromARGB(255, 26, 213, 213),
                  letterSpacing: 1.0,
                  fontSize: 15.0,

                )

                )
            ],)
          ],
          )
      )
    );
  }
}

