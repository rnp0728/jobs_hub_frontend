import 'package:flutter/material.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/widgets/custom_inkwell.dart';
import 'package:jobs_hub/widgets/custom_text_form_field.dart';

class EditableStringList extends StatefulWidget {
  final String label;
  final bool enabled;
  final List<String> stringList;
  final void Function(List<String> list) updateListInState;
  final String? Function(String? value) validator;
  final String? Function(String? value) saveValidator;

  const EditableStringList({
    super.key,
    required this.label,
    required this.stringList,
    required this.updateListInState,
    required this.validator,
    required this.saveValidator,
    this.enabled = true,
  });

  @override
  State<EditableStringList> createState() => _EditableStringListState();
}

class _EditableStringListState extends State<EditableStringList> {
  List<String> list = [];
  String value = '';

  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    list = widget.stringList;
  }

  void addString(String val) {
    if (widget.enabled == false) {
      return;
    }
    list.add(val);
    setState(() {});
    widget.updateListInState(list);
    controller.clear();
  }

  void removeString(String val) {
    if (widget.enabled == false) {
      return;
    }
    list.remove(val);
    setState(() {});
    widget.updateListInState(list);
  }

  void onAdd() {
    if (widget.enabled == false) {
      return;
    }
    addString(value);
    // controller.clear();
  }

  Widget _buildAddButton() {
    return MyInkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onAdd,
      builder: (hover) {
        return AnimatedContainer(
          width: 75,
          height: 32,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: !hover ? Colors.white : Color(kOrange.value),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Color(kOrange.value), width: 1.6),
          ),
          child: Center(
            child: Text(
              'Add',
              style: TextStyle(
                fontSize: 16,
                color: !hover ? Color(kOrange.value) : Color(kOrange.green),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            CustomTextFormField(
              controller: controller,
              padding: const EdgeInsets.fromLTRB(14, 8, 90, 8),
              initialValue: null,
              label: widget.label,
              enabled: widget.enabled,
              validator: widget.saveValidator,
              onChanged: (value) {
                this.value = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _buildAddButton(),
            ),
          ],
        ),
        Builder(
          builder: (context) {
            if (list.isEmpty) {
              return const SizedBox.shrink();
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  for (String val in list)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        children: [
                          Text(
                            '• ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(kOrange.value),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              val,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color(kOrange.value),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              removeString(val);
                            },
                            child: const Icon(
                              Icons.close,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}

class EditableStringLists extends StatefulWidget {
  final String label;
  final bool enabled;
  final List<dynamic> stringList;
  final void Function(List<dynamic> list) updateListInState;
  final String? Function(String? value) validator;
  final String? Function(String? value) saveValidator;

  const EditableStringLists({
    super.key,
    required this.label,
    required this.stringList,
    required this.updateListInState,
    required this.validator,
    required this.saveValidator,
    this.enabled = true,
  });

  @override
  State<EditableStringLists> createState() => _EditableStringListsState();
}

class _EditableStringListsState extends State<EditableStringLists> {
  List<dynamic> list = [];
  String value = '';

  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    list = widget.stringList;
  }

  void addString(String val) {
    if (widget.enabled == false) {
      return;
    }
    list.add(val);
    setState(() {});
    widget.updateListInState(list);
    controller.clear();
  }

  void removeString(String val) {
    if (widget.enabled == false) {
      return;
    }
    list.remove(val);
    setState(() {});
    widget.updateListInState(list);
  }

  void onAdd() {
    if (widget.enabled == false) {
      return;
    }
    addString(value);
  }

  Widget _buildAddButton() {
    return MyInkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onAdd,
      builder: (hover) {
        return AnimatedContainer(
          width: 75,
          height: 32,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: !hover ? Colors.cyan : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.cyan, width: 1.6),
          ),
          child: Center(
            child: Text(
              'Add',
              style: TextStyle(
                fontSize: 16,
                color: !hover ? Color(kOrange.value) : Colors.cyan,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            CustomTextFormField(
              controller: controller,
              padding: const EdgeInsets.fromLTRB(14, 8, 90, 8),
              initialValue: null,
              label: 'List of Lab Tests',
              validator: widget.saveValidator,
              onChanged: (value) {
                this.value = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _buildAddButton(),
            ),
          ],
        ),
        Builder(
          builder: (context) {
            if (list.isEmpty) {
              return const SizedBox.shrink();
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  for (String val in list)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        children: [
                          Text(
                            '• ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(kOrange.value),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              val,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color(kOrange.value),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              removeString(val);
                            },
                            child: const Icon(
                              Icons.close,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
