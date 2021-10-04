
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  Dio dio=Get.find();

  Controller(){
    print("Creating new Base Controller");
  }
}