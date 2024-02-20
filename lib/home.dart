import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  XFile? pick;
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(onPressed: ()async{
              ImagePicker picked = ImagePicker();
              pick = await picked.pickImage(source: ImageSource.gallery);
              setState(() {
                image = File(pick!.path);
              });
            }, child: Text('pick')),
            image == null ? Text('no image ') : Image.file(image!)
          ],
        ),
      ),
    );
  }
}