import 'package:apiapp/create.dart';
import 'package:apiapp/model/productModel.dart';
import 'package:apiapp/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<productsData>?>(
            future: apiService.getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Get.snackbar("Error", "There is an error");
                });
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: snapshot.data!.map((product) {

                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
          
                            Text(
                              product.title ?? 'Product Title',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.categories!.type.toString()),
                                Container(
                                  width: 200,
                                  height: 200,
                                  child: Image.network(product.categories!.image.toString(),fit: BoxFit.cover,),
                                )
                              ],
                            ),
                            
                            // CircleAvatar(
                            //   backgroundImage: ,
                            //   radius: 22,
                            //   child: ClipRRect(
                            //     borderRadius: BorderRadius.circular(10),
                            //     child: Image.network(product.categories!.image.toString())),
                            // ),
                            SizedBox(height: 10),
                            product.images != null && product.images!.isNotEmpty
                                ? GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, // Change based on your layout needs
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                    itemCount: product.images!.length,
                                    itemBuilder: (context, imageIndex) {
                                      return Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black
                                          ),
                                          borderRadius: BorderRadius.circular(12)
                                        ),
                                        child: Column(
                                          children: [ 
                                            Container(
                                              width: 180,
                                              height: 130,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(12),
                                                child: Image.network(
                                                  product.images![imageIndex].url ?? '',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text("Shoes"),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                : Center(child: Text("No images available")),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                );
              }
              return Center(child: Text("No data available"));
            },
          ),
        ),
      ),
    );
  }
}
