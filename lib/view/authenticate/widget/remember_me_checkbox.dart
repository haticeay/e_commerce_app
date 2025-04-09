import 'package:flutter/material.dart';
import 'package:heraninda/core/constants/app_color.dart';

class RememberMeCheckbox extends StatefulWidget {
  final ValueChanged<bool?>? onChanged;
  final bool value;

  const RememberMeCheckbox({
    super.key,
    this.onChanged,
    this.value = false,
  });

  @override
  State<RememberMeCheckbox> createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.value;
  }

  @override
  void didUpdateWidget(covariant RememberMeCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _isChecked = widget.value;
    }
  }

  void _onCheckboxChanged(bool? newValue) {
    setState(() {
      _isChecked = newValue ?? false;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(newValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          checkColor: AppColor.primaryColor,
          activeColor: AppColor.lightPrimaryColor,
          value: _isChecked,
          onChanged: _onCheckboxChanged,
        ),
        const Text('Remember Me'),
      ],
    );
  }
}