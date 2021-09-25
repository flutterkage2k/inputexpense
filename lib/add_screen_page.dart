import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddScreenPage extends StatefulWidget {
  const AddScreenPage({Key? key}) : super(key: key);

  @override
  _AddScreenPageState createState() => _AddScreenPageState();
}

class _AddScreenPageState extends State<AddScreenPage> {
  final _formKey = GlobalKey<FormState>();

  DateTime _date = DateTime.now();

  final TextEditingController _dateController = TextEditingController();

  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');

  _handleDatePicker() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2021),
      lastDate: DateTime(2100),
    );
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormatter.format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        style: const TextStyle(fontSize: 18.0),
                        decoration: InputDecoration(
                            labelText: 'input',
                            labelStyle: const TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: _dateController,
                        style: const TextStyle(fontSize: 18.0),
                        onTap: _handleDatePicker,
                        decoration: InputDecoration(
                          labelText: 'Date',
                          labelStyle: const TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
