// This is the list of radio button in project

class RadioButtonList {
  static final List<RadioButtonModel> data = [
    RadioButtonModel(label: "Male", width:70.0 ),
    RadioButtonModel(label: "FeMale", width:87.0 ),
  ];
}

class RadioButtonModel {
  RadioButtonModel({
    required this.label,
    required this.width,
  });

  final String label;
  final double width;
}
