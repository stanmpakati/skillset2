import 'package:flutter/material.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;
import 'package:skillset/core/services/auth_service.dart';

class HomeTemp extends StatefulWidget {
  @override
  _HomeTempState createState() => _HomeTempState();
}

class _HomeTempState extends State<HomeTemp> {
  String atSign;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            hint: Text('\tPick an @sign'),
            icon: Icon(
              Icons.keyboard_arrow_down,
            ),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(fontSize: 20.0, color: Colors.black87),
            underline: Container(
              height: 2,
              color: Colors.deepOrange,
            ),
            onChanged: (String newValue) {
              setState(() {
                atSign = newValue;
              });
            },
            value: atSign != null ? atSign : null,
            items: at_demo_data.allAtsigns
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: FlatButton(
              child: Text('Login'),
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () => AuthService().login(atSign),
            ),
          )
        ],
      ),
    );
  }
}
