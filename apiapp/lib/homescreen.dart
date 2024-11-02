import 'package:apiapp/create.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: Text('Read')),
            ElevatedButton(onPressed: (){
              Get.to(CreateScreen());
            }, child: Text('Create')),
            ElevatedButton(onPressed: (){}, child: Text('Delete')),
            ElevatedButton(onPressed: (){}, child: Text('Update')),


          ],
        ),
      ),
    );  
  }
}