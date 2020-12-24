class FunctionListModel {
  List<FunctionModel> functionModel;

  FunctionListModel({this.functionModel});

  FunctionListModel.fromJson(Map<String, dynamic> json) {
    if (json['functionModel'] != null) {
      functionModel = new List<FunctionModel>();
      json['functionModel'].forEach((v) {
        functionModel.add(new FunctionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.functionModel != null) {
      data['functionModel'] =
          this.functionModel.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FunctionModel {
  int id;
  String iconName;
  String iconColor;
  String title;
  String url;
  bool isSelected;

  FunctionModel(
      {this.id,
      this.iconName,
      this.iconColor,
      this.title,
      this.url,
      this.isSelected});

  FunctionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iconName = json['iconName'];
    iconColor = json['iconColor'];
    title = json['title'];
    url = json['url'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['iconName'] = this.iconName;
    data['iconColor'] = this.iconColor;
    data['title'] = this.title;
    data['url'] = this.url;
    data['isSelected'] = this.isSelected;
    return data;
  }
}
