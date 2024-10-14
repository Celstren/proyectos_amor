
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class AppDropDownOption {
  final int id;
  final String value;
  final bool isSelected;

  AppDropDownOption({
    required this.id,
    this.value = '',
    this.isSelected = false,
  });

  @override
  bool operator ==(Object other) =>
      other is AppDropDownOption && other.id == id && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

class AppDropDown extends StatefulWidget {
  final List<AppDropDownOption> options;
  final AppDropDownOption? optionSelected;
  final Function(AppDropDownOption?) onChanged;
  final String hint;
  final String errorText;
  final bool enabled;
  final Color color;
  final Color disabledColor;
  final double fontSize;
  final Color? borderColor;
  const AppDropDown({
    super.key,
    required this.options,
    this.errorText = '',
    this.optionSelected,
    required this.onChanged,
    required this.hint,
    this.enabled = true,
    this.color = ColorsConstant.neutralWhite,
    this.disabledColor = ColorsConstant.text100,
    this.fontSize = 16,
    this.borderColor,
  })  : assert(options.length != 0, 'Options must have at least one element');

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  AppDropDownOption? optionSelected;

  @override
  void initState() {
    super.initState();
    optionSelected = widget.optionSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(SizeConstants.md),
          decoration: BoxDecoration(
            color: widget.enabled ? widget.color : widget.disabledColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.borderColor ?? ColorsConstant.text100,
            ),
          ),
          child: Listener(
            onPointerDown: (_) => FocusScope.of(context).unfocus(),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<AppDropDownOption>(
                items: widget.options
                    .map((element) => DropdownMenuItem<
                    AppDropDownOption>(
                    enabled: widget.enabled,
                    value: element,
                    child: Builder(
                      builder: (BuildContext context) {
                        final isDropDown =
                            context.findAncestorStateOfType<
                                _AppDropDownState>() ==
                                null;
                        if (!isDropDown) {
                          return Container(
                            color: ColorsConstant.neutralWhite,
                            alignment: Alignment.centerLeft,
                            child: AppText.normal(
                              element.value,
                              fontColor: ColorsConstant.skyBlue950,
                              fontSize: widget.fontSize,
                            ),
                          );
                        } else {
                          var selected = element == optionSelected;
                          return Container(
                            color: selected
                                ? ColorsConstant.skyBlue400
                                : ColorsConstant.neutralWhite,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                AppText.normal(
                                  element.value,
                                  fontColor: selected
                                      ? ColorsConstant.neutralWhite
                                      : ColorsConstant.skyBlue950,
                                  fontSize: widget.fontSize,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    )))
                    .toList(),
                isDense: true,
                isExpanded: true,
                dropdownColor: ColorsConstant.neutralWhite,
                icon: const AppIcon.chevronDownIcon(
                  color: ColorsConstant.text400,
                  size: 20,
                ),
                hint: Container(
                  color: ColorsConstant.neutralWhite,
                  alignment: Alignment.centerLeft,
                  child: AppText.normal(
                    widget.hint,
                    fontColor: ColorsConstant.text400,
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    optionSelected = value;
                    widget.onChanged(value);
                  });
                },
                value: optionSelected,
              ),
            ),
          ),
        ),
      ],
    );
  }
}