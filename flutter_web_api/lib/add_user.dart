import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_web_api/model.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:http/http.dart' as http;

import 'api_handler.dart';

class AddUser extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AddUserState();

}

class _AddUserState extends State<AddUser> {

  final _formKey = GlobalKey<FormBuilderState>();
  ApiHandler apiHandler = ApiHandler();
  late http.Response response;

  void addUser() async {
    if(_formKey.currentState!.saveAndValidate()){
      final data = _formKey.currentState!.value;
      final user = User(userId: 0, name: data['name'], address: data['address']);
      await apiHandler.addUser(user: user);
    }

    if(!mounted)
      return;

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        onPressed: addUser,
        padding: const EdgeInsets.all(20),
        child: const Text('Add'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'name',
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  name: 'address',
                  decoration: const InputDecoration(labelText: 'Address'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                )
              ],
            )
        ),
      ),
    );
  }
}