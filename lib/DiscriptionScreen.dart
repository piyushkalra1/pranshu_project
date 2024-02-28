
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:pranshu_project/ImagelistModel.dart';
import 'package:http/http.dart'as http;
import 'package:pranshu_project/loader.dart';

class Description extends StatelessWidget {
  final Welcome welcome;
  const Description({required this.welcome});
  _saveNetworkImage() async {
    var response = await Dio().get(welcome.urls!.regular.toString(),
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.download,color: Colors.black45,),
        onPressed: ()async{
          context.showLoader();
        await  _saveNetworkImage();
          context.hideLoader();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Your Image Successfully Saved")));

        },
      ),
      body: Column(
        children: [
          Image.network(welcome.urls!.regular.toString()),
          welcome.description.toString() !="" && welcome.description != null?  Text(welcome.description.toString()):Text("No Description available"),
          Text("No of Likes :- ${welcome.likes.toString()}"),
        ],
      ),
    );
  }
}
