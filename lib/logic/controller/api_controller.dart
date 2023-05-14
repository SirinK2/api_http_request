import 'package:api_http_request/logic/service/api_service.dart';
import 'package:api_http_request/model/local_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiController extends GetxController{
  final apiService = ApiService();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  refreshData(){
   getAllData();
    update();
  }

  clearController(){
    titleController.clear();
    descriptionController.clear();
  }

  Future<List<ToDoModel>> getAllData() async {
    return await apiService.getAllData();
  }

  postData(ToDoModel model)async{
    await apiService.postData(model);
  }

  updateData(ToDoModel model)async{
    await apiService.updateData(model);
  }
  deleteData(String id)async{
    await apiService.deleteData(id);
  }




}