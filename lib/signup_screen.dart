import 'package:flutter/material.dart';
import 'package:quiz/button_screen.dart';
import 'package:quiz/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/device_info.dart';
import 'data_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _cityNameController = TextEditingController();
  TextEditingController _postalCodeController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool isLoading = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _cityNameController,
                  decoration: InputDecoration(labelText: 'City Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _postalCodeController,
                  decoration: InputDecoration(labelText: 'Postal Code'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your postal code';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
              isLoading == true ? CircularProgressIndicator() : TextButton(
                  onPressed: () {
                    isLoading = true ;
                    setState(() {
                    });
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      Future.delayed(Duration(seconds: 10),(){
                        isLoading = false;
                        _signUp();
                        setState(() {

                        });
                      });
                      // Perform signup process
                    }
                  },
                  child: Text('Sign Up'),
                ),
                TextButton(
                  child: Text('Already have an account? Login'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    // Simulate signup process
    String email = _emailController.text;
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String cityName = _cityNameController.text;
    String postalCode = _postalCodeController.text;
    String password = _passwordController.text;

    // Get device information
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceId = '';

    try {
      if (Theme.of(context).platform == TargetPlatform.android) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.androidId;
      } else if (Theme.of(context).platform == TargetPlatform.iOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      }
    } catch (e) {
      print('Error getting device info: $e');
    }

    // Here you can implement actual signup logic
    // For now, let's just print the data
    print('Signed up with:');
    print('Email: $email');
    print('First Name: $firstName');
    print('Last Name: $lastName');
    print('City Name: $cityName');
    print('Postal Code: $postalCode');
    print('Password: $password');

    // Generate and save unique number
    int uniqueNumber = DateTime.now().millisecondsSinceEpoch;

    // Save data in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('first_name', firstName);
    await prefs.setString('last_name', lastName);
    await prefs.setString('city_name', cityName);
    await prefs.setString('postal_code', postalCode);
    await prefs.setInt('unique_number', uniqueNumber);
    await prefs.setString('device_id', deviceId);
    // Navigate to data screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BottomScreen()),
    );
  }

}
