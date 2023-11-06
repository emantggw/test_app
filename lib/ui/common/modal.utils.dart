import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

class ModalSheet {
  ModalSheet._();

  static Future<dynamic> showModal(
      {required Widget child,
      required BuildContext context,
      String? title,
      double initHeight = 0.8,
      double maxHeight = 0.8,
      Color modalSheetColor = Colors.white,
      double marignLeft = 0,
      double marignRight = 0,
      double marignBottom = 0,
      double marignTop = 0,
      double topBorderRadius = 16}) async {
    // marignTop ??= MediaQuery.of(context).size.width ;
    return await showFlexibleBottomSheet(
      initHeight: initHeight,
      maxHeight: maxHeight,
      isModal: true,
      isDismissible: true,
      bottomSheetColor: Colors.transparent,
      context: context,
      builder: (ctx, sc, d) => GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          color: Colors.transparent,
          child: SingleChildScrollView(
            controller: sc,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * maxHeight,
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: modalSheetColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(topBorderRadius),
                          topRight: Radius.circular(topBorderRadius))),
                  margin: EdgeInsets.only(
                      top: marignTop,
                      left: marignLeft,
                      right: marignRight,
                      bottom: marignBottom),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
