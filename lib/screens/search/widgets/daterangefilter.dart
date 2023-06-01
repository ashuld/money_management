import 'package:flutter/material.dart';
import 'package:money_management/constants/color.dart';
import 'package:money_management/constants/parsedate.dart';

DateTime? first;
DateTime? second;

class WidgetDateRangePicker extends StatefulWidget {
  const WidgetDateRangePicker({super.key});

  @override
  State<WidgetDateRangePicker> createState() => _WidgetDateRangePickerState();
}

class _WidgetDateRangePickerState extends State<WidgetDateRangePicker> {
  DateTime? _startDate;
  DateTime? _endDate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () async {
              final date = await showDatePicker(
                  context: context,
                  initialDate: _startDate ?? DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now());
              if (date == null) {
                return;
              } else {
                setState(() {
                  _startDate = date;
                });
                first = _startDate;
              }
            },
            child: Text(
                _startDate == null ? 'Start Date' : parseDate(_startDate!))),
        TextButton(
            onPressed: () async {
              DateTime? date = await showDatePicker(
                  context: context,
                  initialDate:
                      _startDate != null ? _startDate! : DateTime.now(),
                  firstDate: _startDate != null ? _startDate! : DateTime.now(),
                  lastDate: DateTime.now());
              if (date != null) {
                setState(() {
                  _endDate = date;
                });
                second = _endDate;
              }
            },
            child: Text(_endDate == null ? 'End Date' : parseDate(_endDate!))),
            const SizedBox(
              width: 7,
            ),
        const Icon(
          Icons.check,
          color: prColor,
        )
      ],
    );
  }
}
