import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:own_projeccts/bloc/auth_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

Future<dynamic> modelBottomSheet(BuildContext context, AuthBloc authBloc) {
  return showModalBottomSheet(
    backgroundColor: Colors.blue,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text(
            "Image from Camera",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          trailing: const Icon(
            Icons.camera,
            color: Colors.white,
            size: 30,
          ),
          onTap: () async {
            await authBloc.pickImage(imageSource: ImageSource.camera);
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text(
            "Image from Gallery",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          trailing: const Icon(
            Icons.photo,
            color: Colors.white,
            size: 30,
          ),
          onTap: () async {
            await authBloc.pickImage(imageSource: ImageSource.gallery);
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

Future<void> makeUrlRequest({required String url}) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw 'Could not launch $url';
  }
}
