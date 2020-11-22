import 'dart:io';
import 'package:app/shared-assets/components/buttons/Snap_button.dart';
import 'package:app/shared-assets/components/buttons/Snap_button_back.dart';
import 'package:app/shared-assets/components/inputs/styled_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

class EditAccountPage extends StatelessWidget {
  EditAccountPage({Key key}) : super(key: key);

  void checkstatus(TextEditingController tc) {
    if (tc.text == null || tc.text == "") {
      AlertDialog(
        title: Text("Incorrect value given. Please try again..."),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    TextEditingController firstname = new TextEditingController();

    Widget totalview = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // This block is for the header content of the page
        Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: SnapBackButton(
                        onclick: () => {Navigator.pop(context)})),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 20, 20),
                    child: Text(
                      "Edit Account",
                      style: Constants.NORMAL_TEXT_BLACK,
                    )),
              ],
            )),
        // Changing first name
        Container(
          child: StyledTextField(
              hint: "First Name",
              controller: firstname,
              icon: Icon(
                Icons.person,
                color: Constants.DARKGRAY,
              )),
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        ),
        // Changing last name
        Container(
          child: StyledTextField(
              hint: "Last Name",
              icon: Icon(
                Icons.person,
                color: Constants.DARKGRAY,
              )),
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        ),
        // Changing phone
        Container(
          child: StyledTextField(
              hint: "Phone Number",
              keyboardType: TextInputType.phone,
              icon: Icon(
                Icons.person,
                color: Constants.DARKGRAY,
              )),
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        ),
        // Submit to save
        Container(
          child: SnapButton(
            buttonText: "Save Account",
            onclick: () {
              checkstatus(firstname);
            },
          ),
          padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
        ),
      ],
    );

    return Scaffold(body: SingleChildScrollView(child: totalview));
  }
}
