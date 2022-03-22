import 'package:Habitaly/blocs/habits/bloc/habits_bloc.dart';
import 'package:Habitaly/models/habit.dart';
import 'package:Habitaly/utilities/appearence.dart';
import 'package:Habitaly/widgets/add_edit/category_dropdown.dart';
import 'package:Habitaly/widgets/add_edit/custom_text_field.dart';
import 'package:Habitaly/widgets/add_edit/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:Habitaly/widgets/general/back_appbar.dart';
import 'package:Habitaly/widgets/general/background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditHabitScreen extends StatefulWidget {
  final bool isEditing;
  final Habit habit;

  AddEditHabitScreen({Key key, @required this.isEditing, this.habit})
      : super(key: key);

  static Route<dynamic> route(bool isEditing, {Habit habit}) {
    return MaterialPageRoute(
      builder: (context) => AddEditHabitScreen(
        isEditing: isEditing,
        habit: habit,
      ),
    );
  }

  @override
  _AddEditHabitScreenState createState() => _AddEditHabitScreenState();
}

class _AddEditHabitScreenState extends State<AddEditHabitScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool get isEditing => widget.isEditing;

  String _title;
  String _description;
  String _category = 'Category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        child: BackAppBar(),
        preferredSize: Size.fromHeight(70.0),
      ),
      body: CustomPaint(
        painter: BackgroundPainter(
          bigCircle: Appearance.BACKGROUND_CIRCLE_COLOR,
        ),
        child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                constraints: BoxConstraints(),
                height: 500,
                decoration: BoxDecoration(
                  color: Appearance.PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 5.0,
                      spreadRadius: 3.0,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(
                        flex: 2,
                      ),
                      const Text(
                        "New Habit",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      CustomFormTextField(
                        initialValue: isEditing ? widget.habit.title : '',
                        hintText: 'Title*',
                        maxLines: 1,
                        validator: (String value) =>
                            value.trim().isEmpty ? 'Enter a valid title' : null,
                        onSaved: (value) => _title = value,
                      ),
                      const Spacer(),
                      CustomFormTextField(
                        initialValue: isEditing ? widget.habit.description : '',
                        hintText: 'Description',
                        autoFocus: false,
                        maxLines: 3,
                        maxLength: 100,
                        validator: (_) {},
                        onSaved: (value) => _description = value,
                      ),
                      const Spacer(),
                      CategoryDropdown(
                        onChange: (newValue) {
                          setState(() {
                            _category = newValue;
                          });
                        },
                        validator: (value) => value == 'Category'
                            ? 'Choose a valid category'
                            : null,
                        onSaved: (value) => _category = value,
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      SubmitFormButton(
                        vertialPaddingPercent: 0.035,
                        text: isEditing ? 'UPDATE' : 'CREATE',
                        callback: _submit,
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      BlocProvider.of<HabitsBloc>(context).add(AddHabit(
        title: _title,
        description: _description,
        category: _category,
      ));

      Navigator.of(context).pop();
    }
  }
}
