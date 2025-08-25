class SignInModel {
  String? token;
  bool? isSuccess;
  String? message;

  SignInModel({this.token, this.isSuccess, this.message});

  SignInModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isSuccess = json['isSuccess'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    return data;
  }
}