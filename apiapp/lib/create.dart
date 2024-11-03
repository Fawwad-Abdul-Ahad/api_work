// import 'package:apiapp/services/api.dart';
// import 'package:flutter/material.dart';

// class CreateScreen extends StatefulWidget {
//   const CreateScreen({super.key});

//   @override
//   State<CreateScreen> createState() => _CreateScreenState();
// }
// TextEditingController nameController = TextEditingController();
// TextEditingController priceController = TextEditingController();
// TextEditingController descController = TextEditingController();
// ApiService apiService = ApiService();
// class _CreateScreenState extends State<CreateScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(onPressed: (){
//         var pData = {
//           'pName': nameController.text,
//           'pPrice': priceController.text,
//           'pDesc' : descController.text,
//         };
//         apiService.createApi(pData);
//       }),
//       body:  Center(
//       child: Column(
//         children: [
//           TextFormField(
//             controller: nameController,
            

//           ),
//           TextFormField(
//             controller: priceController,
//           ),
//           TextFormField(
//             controller: descController,
//           ),


//         ],
  
//       ),
      
//     ),
//     );
//   }
// }