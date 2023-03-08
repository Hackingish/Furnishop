import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:frunishop/common/widgets/custom_button.dart';
import 'package:frunishop/common/widgets/custom_textfield.dart';
import 'package:frunishop/constants/global_variables.dart';
import 'package:frunishop/constants/utills.dart';
import 'package:frunishop/features/customise_order/services/cust_services.dart';

class CustomisedProduct extends StatefulWidget {
  const CustomisedProduct({super.key});

  @override
  State<CustomisedProduct> createState() => _CustomisedProductState();
}

class _CustomisedProductState extends State<CustomisedProduct> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController materialController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final CustServices custServices = CustServices();
  String wood = 'Maple Wood';
  List<File> images = [];
  final _customisedProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    descriptionController.dispose();
    quantityController.dispose();
  }

  List<String> woodCategories = [
    'Maple Wood',
    'Teak Wood',
    'Bearch Wood',
    'Lamp',
    'Chair',
  ];
  void placeOrder() {
    if (_customisedProductFormKey.currentState!.validate() &&
        images.isNotEmpty) {
      custServices.placeOrder(
        context: context,
        name: productNameController.text,
        description: descriptionController.text,
        fabric: materialController.text,
        quantity: double.parse(quantityController.text),
        wood: wood,
        images: images,
      );
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Customise Your Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Select Your Design',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: productNameController,
                  hintText: 'Enter The Product Type',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: descriptionController,
                  hintText: 'Describe Your Product Dimension',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: materialController,
                  hintText: 'Fabric Type',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: quantityController,
                  hintText: 'Quantity',
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: wood,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: woodCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        wood = newVal!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  text: 'Place Order',
                  onTap: placeOrder,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
