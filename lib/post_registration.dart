import 'package:flutter/material.dart';

class PostRegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: FinalPage(),
      ),
    );
  }
}

class FinalPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Thank you. You have been registered successfully!',
          style: TextStyle(
              fontSize: 24,
              backgroundColor: Color.fromARGB(26, 21, 27, 193)),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: (){
            // surprise();
          },
          child: Text('Click to login'),
        ),
      ],);
  }
}
