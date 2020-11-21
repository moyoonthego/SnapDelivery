import 'dart:async';

import 'package:flutter/material.dart';
import '../constants.dart' as Constants;

// this button will slide out to reveal a second button underneath any item
// holded by the user in a group - delete or swipe away to delete
class SlideOutDelete extends StatefulWidget {
  SlideOutDelete(
      {@required this.listWidgets,
      @required this.deleteActivity,
      @required this.undoActivity});

  final VoidCallback deleteActivity;
  final VoidCallback undoActivity;
  final List<Widget> listWidgets;

  // this will yield hidden props if needed
  static _SlideOutState of(BuildContext context) =>
      context.findAncestorStateOfType();

  @override
  _SlideOutState createState() => new _SlideOutState(
      listWidgets: listWidgets,
      key: key.toString(),
      deleteActivity: deleteActivity,
      undoActivity: undoActivity);
}

class _SlideOutState extends State<SlideOutDelete>
    with SingleTickerProviderStateMixin {
  _SlideOutState(
      {@required this.listWidgets,
      @required this.key,
      this.deleteActivity,
      this.undoActivity});

  final VoidCallback deleteActivity;
  final VoidCallback undoActivity;
  List<Widget> listWidgets;
  final String key;
  GlobalKey<AnimatedListState> _key = GlobalKey();
  Widget lastdeleted = null;
  int _index;

  AnimationController ac;
  Animation<Offset> of;

  @override
  void dispose() {
    ac.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    ac = AnimationController(
      vsync: this,
      lowerBound: 0.8,
      upperBound: 1,
      duration: Duration(milliseconds: 900),
    );

    of = Tween<Offset>(begin: Offset(-30, 0.0), end: Offset.zero).animate(ac);
  }

  void animate() {
    ac.forward();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedList(
      key: _key,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      initialItemCount: listWidgets.length,
      itemBuilder: (context, index, animation) {
        return Dismissible(
          onDismissed: (deletedirection) {
            setState(() {
              _index = index;
              lastdeleted = ([]..addAll(listWidgets))[index];
              deleteActivity();
              listWidgets.removeAt(index);
              _key.currentState.removeItem(index, (_, __) => Container());
            });
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Item deleted..."),
                action: SnackBarAction(
                    label: "UNDO",
                    onPressed: () {
                      setState(() {
                        //To undo deletion
                        listWidgets.insert(_index, lastdeleted);
                        _key.currentState.insertItem(_index);
                      });
                      undoActivity();
                    })));
          },
          child: Align(alignment: Alignment.center, child: listWidgets[index]),
          key: Key("${index}"),
          background: Container(
            width: width - width * 3 / 20,
            decoration: BoxDecoration(
              color: Constants.RED,
              //borderRadius: BorderRadius.circular(15.0),
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                  child: Constants.DELETE_ICON),
            ),
          ),
        );
      },
    );
  }
}
