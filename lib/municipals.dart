import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class municipal extends StatefulWidget {
  const municipal({Key? key}) : super(key: key);

  @override
  State<municipal> createState() => _municipalState();
}

class _municipalState extends State<municipal> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _ageHasError = false;
  bool _genderHasError = false;

  var genderOptions = ['Male', 'Female', 'Other'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveNavBar(
        backgroundColor: Color(0xff2BD4DA),
        screenWidth: MediaQuery.of(context).size.width,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 53,
              width: 53,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 8, color: Colors.white),
                borderRadius: BorderRadius.circular(100), //<-- SEE HERE
              ),
              child: Image.asset('logo.png'),
            ),
            Container(
                padding: const EdgeInsets.all(9.0),
                child: Text('Sterea for Pets'))
          ],
        ),
        navBarItems: [
          NavBarItem(
            text: "Home",
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
          ),
          NavBarItem(
            text: "Δήμοι",
            onTap: () {
              Navigator.pushNamed(context, "/second");
            },
          ),
        ],
      ),
      body: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  FormBuilder(
                    child:  FormBuilderTextField(
                      name: 'Δήμος',
                      decoration: InputDecoration(
                        labelText: 'Δήμος',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                          },
                        ),
                      ),
                      onChanged: (val) {
                        print(val); // Print the text value write into TextField
                      },
                    ),
                  ),
                  FormBuilder(
                    child:  FormBuilderTextField(
                      name: 'Όνομα εκπροσώπου',
                      decoration: InputDecoration(
                        labelText: 'Όνομα εκπροσώπου ',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                          },
                        ),
                      ),
                      onChanged: (val) {
                        print(val); // Print the text value write into TextField
                      },
                    ),
                  ),
                  FormBuilder(
                    child:  FormBuilderTextField(
                      name: 'Τηλέφωνο Επικοινωνίας',
                      decoration: InputDecoration(
                        labelText: 'Τηλέφωνο Επικοινωνίας',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                          },
                        ),
                      ),
                      onChanged: (val) {
                        print(val); // Print the text value write into TextField
                      },
                    ),
                  ),
                  FormBuilder(
                    child:  FormBuilderTextField(
                      name: 'email',
                      decoration: InputDecoration(
                        labelText: 'email',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                          },
                        ),
                      ),
                      onChanged: (val) {
                        print(val); // Print the text value write into TextField
                      },
                    ),
                  ),
                  FormBuilder(
                    // enabled: false,
                    onChanged: () {
                    },
                    autovalidateMode: AutovalidateMode.disabled,
                    initialValue: const {
                      'movie_rating': 5,
                      'best_language': 'Dart',
                      'age': '13',
                      'gender': 'Male',
                      'languages_filter': ['Dart']
                    },
                    skipDisabled: true,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 15),
                        FormBuilderDateTimePicker(
                          name: 'date',
                          initialEntryMode: DatePickerEntryMode.calendar,
                          initialValue: DateTime.now(),
                          inputType: InputType.both,
                          decoration: InputDecoration(
                            labelText: 'Κλέιστε ραντεβού',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                              },
                            ),
                          ),
                          initialTime: const TimeOfDay(hour: 8, minute: 0),
                          // locale: const Locale.fromSubtags(languageCode: 'fr'),
                        ),
                        FormBuilderDateRangePicker(
                          name: 'date_range',
                          firstDate: DateTime(1970),
                          lastDate: DateTime(2030),
                          format: DateFormat('yyyy-MM-dd'),
                          decoration: InputDecoration(
                            labelText: 'Κλείστε ραντεβού',
                            hintText: 'Hint text',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                              },
                            ),
                          ),
                        ),
                        FormBuilderRangeSlider(
                          name: 'Ενδεικτικό αριθμός τεμαχίων',
                          min: 0.0,
                          max: 100.0,
                          initialValue: const RangeValues(4, 7),
                          divisions: 20,
                          maxValueWidget: (max) => TextButton(
                            onPressed: () {
                            },
                            child: Text(max),
                          ),
                          activeColor: Colors.red,
                          inactiveColor: Colors.pink[100],
                          decoration: const InputDecoration(labelText: 'Ενδεικτικό αριθμός τεμαχίων'),
                        ),


                        FormBuilderSwitch(
                          title: const Text('I Accept the terms and conditions'),
                          name: 'accept_terms_switch',
                          initialValue: true,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                          },
                          // color: Theme.of(context).colorScheme.secondary,
                          child: Text(
                            'Reset',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
