import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';
import 'package:image_picker/image_picker.dart';
import 'package:own_projeccts/bloc/post-bloc.dart';
import 'package:own_projeccts/widget/insta_button.dart';

class PostScreen extends StatelessWidget {
  PostScreen({Key? key, this.imageFile, required this.postBloc})
      : super(key: key);
  final XFile? imageFile;
  final PostBloc postBloc;
  final cropKey = GlobalKey<CropState>();

  String captiion = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                postBloc.postUrl.add(null);
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.redAccent.shade100,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("Cancel"),
              ),
            ),
            const Text("Shape Your Post"),
            GestureDetector(
              onTap: () async {
                await postBloc.cropPost(File(imageFile!.path), context);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.teal.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("Done"),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.black,
              padding: const EdgeInsets.all(20.0),
              child: StreamBuilder<String?>(
                  stream: postBloc.postUrl,
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return Image.network(snapshot.data!);
                    }
                    return Crop(
                      alwaysShowGrid: true,
                      key: cropKey,
                      image: FileImage(File(imageFile!.path)),
                      aspectRatio: 3.5 / 2.5,
                    );
                  }),
            ),
            const SizedBox(
              height: 5,
            ),
            StreamBuilder<String>(
              stream: Stream.fromFuture(postBloc.getLocationName()),
              builder: (context, snapshot) {
                return Row(
                  children: [
                    const Icon(Icons.location_on_outlined),
                    Text(
                      snapshot.data ?? "",
                      style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (cap) {
                  captiion = cap;
                },
                autofocus: true,
                maxLines: 3,
                decoration: InputDecoration(
                    hintText: "Caption here...",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            InstaButton(
                circular: 20,
                width: 100,
                onPressed: () async{
                final isPosted=  await postBloc.uploadPost(caption: captiion);
                if(isPosted){
                  Navigator.pop(context);
                }
                },
                child: const Text("Submit")),
          ],
        ),
      ),
    );
  }
}
