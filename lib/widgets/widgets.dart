import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:money_management/db/constants/color.dart';

Widget customBox({var height, var width}) {
  return SizedBox(
    height: height ?? 0.0,
    width: width ?? 0.0,
  );
}

Widget box10() {
  return const SizedBox(height: 10);
}

Widget box15() {
  return const SizedBox(height: 15);
}

Widget box20() {
  return const SizedBox(height: 20);
}

Widget box30() {
  return const SizedBox(height: 30);
}

Widget customText(
    {String? data, Color? color, var size, FontWeight? thickness}) {
  return Text(
    data!,
    style: TextStyle(
        color: color ?? Colors.black,
        fontSize: size ?? 15.0,
        fontWeight: thickness ?? FontWeight.w400),
  );
}

Widget secText400({data, size}) {
  return Text(
    data,
    style: TextStyle(color: secColor, fontSize: size ?? 15.0, fontWeight: def),
  );
}

Widget secText500({data, size}) {
  return Text(
    data,
    style:
        TextStyle(color: secColor, fontSize: size ?? 15.0, fontWeight: th500),
  );
}

Widget secText600({data, size}) {
  return Text(
    data,
    style:
        TextStyle(color: secColor, fontSize: size ?? 15.0, fontWeight: th600),
  );
}

Widget prText400({data, size}) {
  return Text(
    data,
    style: TextStyle(color: prColor, fontSize: size ?? 15.0, fontWeight: def),
  );
}

Widget prText500({data, size}) {
  return Text(
    data,
    style: TextStyle(color: prColor, fontSize: size ?? 15.0, fontWeight: th500),
  );
}

Widget prText600({data, size}) {
  return Text(
    data,
    style: TextStyle(color: prColor, fontSize: size ?? 15.0, fontWeight: th600),
  );
}

Widget customIcon({IconData? icon, Color? color, var size}) {
  return Icon(
    icon,
    color: color,
    size: size,
  );
}

Widget secIcon({icon, size}) {
  return Icon(
    icon,
    color: secColor,
    size: size,
  );
}

Widget prIcon({icon, size}) {
  return Icon(
    icon,
    color: prColor,
    size: size,
  );
}

OutlineInputBorder unselectedBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(width: 2, color: unselected));
}

OutlineInputBorder selectedBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(width: 2, color: prColor));
}

void showToast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      fontSize: 16,
      textColor: secColor,
      timeInSecForIosWeb: 2);
}

void showSnackBarr(BuildContext context, content) {
  var snackbar = SnackBar(
      backgroundColor: Colors.black,
      content: secText400(data: content));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
