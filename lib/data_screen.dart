import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataScreen extends StatefulWidget {
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  String _email = '';
  String _firstName = '';
  String _lastName = '';
  String _cityName = '';
  String _postalCode = '';
  int _uniqueNumber = 0;
  String _deviceToken = '';

  @override
  void initState() {
    super.initState();
    _getDataFromSharedPreferences();
  }

  Future<void> _getDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = prefs.getString('email') ?? '';
      _firstName = prefs.getString('first_name') ?? '';
      _lastName = prefs.getString('last_name') ?? '';
      _cityName = prefs.getString('city_name') ?? '';
      _postalCode = prefs.getString('postal_code') ?? '';
      _uniqueNumber = prefs.getInt('unique_number') ?? 0;
      _deviceToken = prefs.getString('device_id') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const  Text(
                    'Email:',
                    style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' $_email',
                    style:const  TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const  Text(
                    'First Name: ',
                    style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' $_firstName',
                    style:const  TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const  Text(
                    'Last Name:',
                    style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' $_lastName',
                    style:const  TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const  Text(
                  'City Name:',
                  style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),
                ),
                Text(
                  ' $_cityName',
                  style:const  TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),
                ),
              ],
                        ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const  Text(
                    'Postal Code:',
                    style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' $_postalCode',
                    style:const  TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const  Text(
                    'Unique Number:',
                    style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' $_uniqueNumber',
                    style:const  TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const  Text(
                    'Device  Token:',
                    style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' $_deviceToken',
                    style:const  TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
