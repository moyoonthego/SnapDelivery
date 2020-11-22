import 'dart:io';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/styles/constants.dart' as Constants;

class FacebookButton extends StatelessWidget {
  // This is a redesigned Facebook sign in button
  const FacebookButton({this.onclick});

  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // 85% screen width

    return GestureDetector(
        onTap: onclick,
        child: Container(
          width: width,
          height: 74,
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff699efa), Color(0xff3477eb)],
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 14,
                    ),
                    child: Text(
                      "Log in with Facebook",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Euclid Circular B",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 40,
                  top: 16,
                  child: Container(
                      height: 70,
                      width: 70,
                      child: FlareActor.asset(AssetFlare(
                          bundle: rootBundle,
                          name: 'lib/assets/images/facebook.flr')))),
            ],
          ),
        ));
  }
}
