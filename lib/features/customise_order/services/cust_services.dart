import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:frunishop/constants/error_handling.dart';
import 'package:frunishop/constants/global_variables.dart';
import 'package:frunishop/constants/utills.dart';
import 'package:frunishop/models/cust_product.dart';
import 'package:frunishop/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CustServices {
  void placeOrder({
    required BuildContext context,
    required String name,
    required String description,
    required String fabric,
    required double quantity,
    required String wood,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      final cloudinary = CloudinaryPublic('doqkfqqzh', 'reg978xv');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }
      CustProduct customized_product = CustProduct(
        name: name,
        description: description,
        fabric: fabric,
        quantity: quantity,
        wood: wood,
        images: imageUrls,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/place-order'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: customized_product.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Order Successfully Created');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
