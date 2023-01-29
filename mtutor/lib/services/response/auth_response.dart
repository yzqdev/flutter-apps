import 'dart:convert';

AuthRsp authRspFromJson(String str) => AuthRsp.fromJson(json.decode(str));

String authRspToJson(AuthRsp data) => json.encode(data.toJson());

class AuthRsp {
  AuthRsp({this.userid});

  String? userid;

  factory AuthRsp.fromJson(Map<String, dynamic> json) => AuthRsp(
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
      };
}
