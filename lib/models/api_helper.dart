import 'dart:io';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/utils/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiClient {
  //api 주소
  final String baseUrl;
  ApiClient({required this.baseUrl});

  //get 방식 서버에서 데이터를 가져올 때
  Future<Map<String, dynamic>> get(String params) async {
    //받아야 하는 값의 요청 메서드를 url로 받는 것 string 형식으로 받으므로 형태 맞춰서 보내줄 것
    final response = await http.get(
      Uri.parse(baseUrl + params),
      headers: {'Authorization': 'Bearer '},
    );
    return _parseResponse(response);
  }

  //post 방식 서버에 데이터를 전달할 때
  Future<Map<String, dynamic>> post(String url, dynamic data) async {
    final response = await http.post(
      Uri.parse(baseUrl + url),
      body: json.encode(data),
      headers: {"Content-Type": "application/json"},
    );
    return _parseResponse(response);
  }

  //응답 데이터 처리
  Map<String, dynamic> _parseResponse(http.Response response) {
    final parsed = json.decode(response.body);
    return parsed;
  }
}

// 액세스 토큰 필요함
class ApiClientAuth {
  //api 주소
  final String baseUrlAuth;

  //생성자
  ApiClientAuth({
    required this.baseUrlAuth,
  });

  //get 방식 서버에서 데이터를 가져올 때
  Future<Map<String, dynamic>> get(String params) async {
    //받아야 하는 값의 요청 메서드를 url로 받는 것 string 형식으로 받으므로 형태 맞춰서 보내줄 것
    final response = await http.get(
      Uri.parse(baseUrlAuth + params),
      headers: {
        'Authorization': 'Bearer ' + await lodeAccessToken(),
      },
    );

    //액세스 토큰이 만료로 떨어지면
    if (_parseResponse(response)['message'] == '토큰만료') {
      print('액세스 토큰 만료입니다 ');
      print(_parseResponse(response));

      //리프레쉬 토큰으로 재발급 요청
      final reToken = await reTokenGet();

      print('리프레쉬 결과입니다 ');
      print(reToken);
      print('리프레쉬 결과입니다 ');

      //리프레쉬 토큰까지 만료된 경우
      if (reToken['message'] == 'invalid_grant') {
        print('리프레쉬 만료입니다!! 토큰만료 반환!');
        //로그인 화면으로 보내는 로직 구현 필요
        return reToken;
      }

      //리프레쉬 토큰으로 얻은 값 다시 저장
      saveData('accessToken', reToken['access_token']);
      saveData('refreshToken', reToken['refresh_token']);

      print('리프레쉬로 받은 토큰 업데이트');

      final refreshedResponse = await TokenGet();

      print('리프레쉬 토큰으로 재발급 받은 액세스 토큰으로 재요청!');
      print(refreshedResponse);

      return refreshedResponse; // 재요청한 응답 반환
    }
    return _parseResponse(response);
  }

  //post 방식 서버에 데이터를 전달할 때
  Future<Map<String, dynamic>> post(String url, dynamic data) async {
    final response = await http.post(
      Uri.parse(baseUrlAuth + url),
      body: json.encode(data),
      headers: {
        "Content-Type": 'application/json',
        'Authorization': 'Bearer ' + await lodeAccessToken()
      },
    );

    if (_parseResponse(response)['message'] == '토큰만료') {
      print('액세스 토큰 만료입니다 ');
      print(_parseResponse(response));

      //리프레쉬 토큰으로 재발급 요청
      final reToken = await reTokenGet();

      print('리프레쉬 결과입니다 ');
      print(reToken);
      print('리프레쉬 결과입니다 ');

      //리프레쉬 토큰까지 만료된 경우
      if (reToken['message'] == 'invalid_grant') {
        print('리프레쉬 만료입니다!! 토큰만료 반환!');
        //로그인 화면으로 보내는 로직 구현 필요
        return reToken;
      }

      //리프레쉬 토큰으로 얻은 값 다시 저장
      saveData('accessToken', reToken['access_token']);
      saveData('refreshToken', reToken['refresh_token']);

      print('리프레쉬로 받은 토큰 업데이트');

      final refreshedResponse = await TokenGet();

      print('리프레쉬 토큰으로 재발급 받은 액세스 토큰으로 재요청!');
      print(refreshedResponse);

      return refreshedResponse; // 재요청한 응답 반환
    }
    return _parseResponse(response);
  }

  //post 방식 서버에 데이터를 전달할 때 (폼 데이터)
  Future<Map<String, dynamic>> postFormData(
      String url, dynamic data, List<String> imagePath) async {
    int icnt = 0;
    final request = http.MultipartRequest('POST', Uri.parse(baseUrlAuth));
    // , File imageFile
    print('postfile:::${Uri.parse(baseUrlAuth)}');
    // 커스텀 헤더 추가
    request.headers['Authorization'] = 'Bearer ' + await lodeAccessToken();

    // JSON 데이터를 문자열로 변환하여 필드로 추가
    request.fields.addAll(data);
    print('images::::${imagePath}');

    //이미지 파일 추가
    for (String imagePaths in imagePath) {
      request.files.clear(); //파일 비우기
      print('image:::$imagePaths===$icnt');
      if (icnt > 10) break;
      request.files
          .add(await http.MultipartFile.fromPath('fileup', imagePaths));
      icnt++;
    }
    print('::::::::::::::::::::aa');

    final response = await request.send();

    print('::::::::::::::::::::');
    final body = await response.stream.bytesToString();
    final convertedResponse = http.Response(body, response.statusCode);

    if (_parseResponse(convertedResponse)['message'] == '토큰만료') {
      print('액세스 토큰 만료입니다 ');
      print(_parseResponse(convertedResponse));

      //리프레쉬 토큰으로 재발급 요청
      final reToken = await reTokenGet();

      print('리프레쉬 결과입니다 ');
      print(reToken);
      print('리프레쉬 결과입니다 ');

      //리프레쉬 토큰까지 만료된 경우
      if (reToken['message'] == 'invalid_grant') {
        print('리프레쉬 만료입니다!! 토큰만료 반환!');
        //로그인 화면으로 보내는 로직 구현 필요
        return reToken;
      }

      //리프레쉬 토큰으로 얻은 값 다시 저장
      saveData('accessToken', reToken['access_token']);
      saveData('refreshToken', reToken['refresh_token']);

      print('리프레쉬로 받은 토큰 업데이트');

      final refreshedResponse = await TokenGet();

      print('리프레쉬 토큰으로 재발급 받은 액세스 토큰으로 재요청!');
      print(refreshedResponse);

      return refreshedResponse; // 재요청한 응답 반환
    }
    return _parseResponse(convertedResponse);
  }

  //응답 데이터 처리
  Map<String, dynamic> _parseResponse(http.Response response) {
    final parsed = json.decode(response.body);
    return parsed;
  }

  //스토리지에 저장된 액세스 토큰 불러옴
  Future<String> lodeAccessToken() async {
    final String accessToken;

    accessToken = await loadData('accessToken');

    return accessToken;
  }

  //스토리지에 저장된 리프레쉬 토큰을 불러옴
  Future<String> lodeRefreshToken() async {
    final String refreshToken;
    refreshToken = await loadData('refreshToken');

    return refreshToken;
  }

  Future<Map<String, dynamic>> reTokenGet() async {
    //리프레쉬 토큰으로 액세스 토큰 재발급
    final response = await http.post(
      Uri.parse('https://auth.gooodall.com/oauth/token'),
      body: json.encode(
        {
          'refresh_token': await lodeRefreshToken(),
          'client_secret': 'c62d39d6f1e43c268a04f38c006155d2',
          'client_id': 'gooodall.com',
          'grant_type': 'refresh_token',
        },
      ),
      headers: {"Content-Type": "application/json"},
    );

    return _parseResponse(response);
  }

  //리프레쉬로 재발급 받은 액세스 토큰으로 api 재요청
  Future<Map<String, dynamic>> TokenGet() async {
    final response = await http.get(
      Uri.parse(baseUrlAuth),
      headers: {
        'Authorization': 'Bearer ' + await lodeAccessToken(),
      },
    );

    return _parseResponse(response);
  }
}
