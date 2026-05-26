
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/common_functions.dart';
import '../utils/string_constants.dart';
import 'api_repo.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        API_APP_NAME : APPLICATION_NAME,
        API_VERSiON_NO : VERSION_NO,
        API_PLATFORM : "Android",
        API_PERSON_NAME : _nameController.text.toString(),
        API_EMAIL : _emailController.text.toString(),
        API_MOBILE : _mobileController.text.toString(),
        API_MESSAGE : _messageController.text.toString(),
        API_REMARKS : null,
      };

      ApiRepo apiRepo = ApiRepo();
      apiRepo.sendData(data);

      _formKey.currentState!.reset();
      FocusScope.of(context).unfocus();
      
      showSnackBar(title: "SENT", message: "REPORT_TRANSMITTED_SUCCESSFULLY", backgroundColor: terminalWhite, colorText: terminalBlack);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: terminalBlack,
        appBar: buildEnhancedAppBar(
          title: 'SUPPORT',
          content: "OPEN_COMM_LINK"
        ),
        body: Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: terminalWhite, width: 0.5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  feedbackFormField(controller: _nameController, title: "PERSON_ID", validator: (value) => (value == null || value.isEmpty) ? 'FIELD_REQUIRED' : null),
                  feedbackFormField(
                      controller: _emailController,
                      title: "EMAIL_ENDPOINT",
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if (value == null || value.isEmpty) return 'FIELD_REQUIRED';
                        if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) return 'INVALID_ENDPOINT';
                        return null;
                      }
                  ),
                  feedbackFormField(
                    controller: _mobileController,
                    keyboardType: TextInputType.phone,
                    title: "COMMS_ID",
                      validator: (value) => (value == null || value.toString().length != 10) ? 'INVALID_COMMS_ID' : null
                  ),
                  feedbackFormField(
                      controller: _messageController,
                      title: "LOG_MESSAGE",
                      keyboardType: TextInputType.multiline,
                      maxLines: 6,
                      validator: (value) => (value == null || value.isEmpty) ? 'FIELD_REQUIRED' : null
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _submitFeedback,
                    child: const Text('TRANSMIT_REPORT'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget feedbackFormField({ required controller ,title , maxLines ,validator, keyboardType}){
    return Column(
      children: [
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(color: terminalWhite, fontFamily: 'monospace'),
          decoration: InputDecoration(
            labelText: title.toUpperCase(),
            labelStyle: const TextStyle(color: terminalWhite, fontFamily: 'monospace', fontSize: 13, fontWeight: FontWeight.bold),
            border: const OutlineInputBorder(borderSide: BorderSide(color: terminalWhite)),
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: terminalWhite)),
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: terminalWhite, width: 2)),
          ),
          keyboardType: keyboardType,
          validator: validator,
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }
}
