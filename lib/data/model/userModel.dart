class UserModel {
  String? userId = "";
  String? userName;
  String? userEmail;
  String? userMobileNumber;
  int? userCreatedAt;
  bool? isOnline = false;
  int? status = 1;

  /// 1-> active, 2-> inActive, 3-> suspended
  String? profilePic = "";
  int? profileStatus = 1;

  /// 1-> public, 2-> friands, 3-> private
  UserModel({
    this.userId,
    required this.userName,
    required this.userMobileNumber,
    required this.userCreatedAt,
    required this.userEmail,
    required this.isOnline,
    required this.status,
    required this.profilePic,
    required this.profileStatus,
  });

  factory UserModel.fromDoc(Map<String, dynamic> document) {
    return UserModel(
      userId: document['userId'],
      userName: document["userName"],
      userMobileNumber: document["userMobileNumber"],
      userCreatedAt: document["userCreatedAt"],
      userEmail: document["userEmail"],
      isOnline: document["isOnline"],
      status: document["status"],
      profilePic: document['profilePic'],
      profileStatus: document['profileStatus'],
    );
  }

  Map<String, dynamic> toDoc() {
    return {
      "userId": userId,
      "userName": userName,
      "userMobileNumber": userMobileNumber,
      "userCreatedAt": userCreatedAt,
      "userEmail": userEmail,
      "isOnline": isOnline,
      "status": status,
      "profilePic": profilePic,
      "profileStatus": profileStatus,
    };
  }
}
