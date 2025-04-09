import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heraninda/core/constants/app_color.dart';
import 'package:heraninda/core/constants/app_text_style.dart';

class OTPInputField extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onCompleted;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextAlign textAlign;

  const OTPInputField({
    super.key,
    this.length = 6,
    this.onCompleted,
    this.style,
    this.hintStyle,
    this.textAlign = TextAlign.center,
  });

  @override
  State<OTPInputField> createState() => _OTPInputFieldState();
}

class _OTPInputFieldState extends State<OTPInputField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;
  late List<String> _otpCodeList;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _otpCodeList = List.generate(widget.length, (_) => '');
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onTextChanged(String value, int index) {
    if (value.isNotEmpty) {
      final newValue = value[0]; // Sadece ilk karakter alınır
      if (index >= 0 && index < widget.length) {
        setState(() {
          _otpCodeList[index] = newValue;
          _controllers[index].value = TextEditingValue(
            text: newValue,
            selection: TextSelection.collapsed(offset: newValue.length),
          );
        });

        // Otomatik sonraki kutuya geç
        if (index < widget.length - 1) {
          FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
        }

        // Hepsi doluysa callback çağır
        if (!_otpCodeList.contains('') && widget.onCompleted != null) {
          widget.onCompleted!(_otpCodeList.join());
        }
      }
    } else {
      // Geri silme durumunda
      if (index >= 0 && index < widget.length) {
        setState(() {
          _otpCodeList[index] = '';
        });
        if (index > 0) {
          FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        widget.length,
        (index) => SizedBox(
          width: 50.0,
          height: 60.0,
          child: TextFormField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: widget.textAlign,
            style: AppTextStyle.instrumentSansMedium(context).copyWith(
              color: AppColor.primaryColor,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.filledColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              hintStyle: widget.hintStyle ?? const TextStyle(color: Colors.grey),
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) => _onTextChanged(value, index),
          ),
        ),
      ),
    );
  }
}
