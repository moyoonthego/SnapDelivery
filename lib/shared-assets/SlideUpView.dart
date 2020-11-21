import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../constants.dart' as Constants;

class SlideUpView extends StatelessWidget {
  // This widget is for a stylized pop up based view
  SlideUpView({this.popupchild, this.child, this.controller, this.title = ""});

  // the body of the popup
  Widget popupchild;
  // the body under the popup
  Widget child;

  String title;

  // our controller for the popup view - MUST use PanelController
  PanelController controller;

  Widget _scrollingList(ScrollController sc) {
    return ListView.builder(
      controller: sc,
      itemCount: 50,
      itemBuilder: (BuildContext context, int i) {
        return Container(
          padding: const EdgeInsets.all(12.0),
          child: Text("$i"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 5;

    return SlidingUpPanel(
        controller: controller,
        margin: const EdgeInsets.fromLTRB(5.0, 12.0, 5.0, 0.0),
        panelBuilder: (ScrollController sc) => _scrollingList(sc),
        panel: Stack(
          children: [
            GestureDetector(
                onTap: () {
                  if (controller.isPanelOpen || controller.isPanelShown) {
                    controller.hide();
                  }
                },
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Icon(
                        Icons.close,
                        color: Constants.DARKGRAY,
                      ),
                    ))),
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      title,
                      style: Constants.NORMAL_TEXT_BLACK,
                    ))),
            Container(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 10), child: popupchild)
          ],
        ),
        borderRadius: BorderRadius.circular(25.0),
        body: child);
  }
}
