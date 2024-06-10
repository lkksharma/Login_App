import 'package:flutter/material.dart';
import 'post_registration.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(RegisterApp());
}

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(home: RegisterPage(),);
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Registeration Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: RegistrationForm(),
      ),
    );
  }
}

class RegistrationForm extends StatelessWidget{
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> register(String username, String password) async {

    String url = 'http://localhost:8080/insertElement.php';

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        if (response.body == 'success') {
          print('Login successful');
        } else {
          print('Login failed');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(height: 20),
        Image.asset(
          '/Users/ls/RegisterationApp_Flutter/assets/logo.png',
          width: 200,
          height: 200,
        ),
        TextField(
          controller: usernameController,
          decoration: InputDecoration(
            labelText: 'Username',
          ),
        ),
        SizedBox(height: 30),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
          ),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: (){
            //kya karega
            register(usernameController.text, passwordController.text);
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>PostRegistrationPage()),
            );
          },
          child: Text('Register'),
        ),
        Text(
            '©Lakksh Sharma'
        ),
      ],);
  }
}

