import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class LoginFunction {
  static const String apiUrl = 'http://10.0.2.2:5000/';

  static Future<Map<String, dynamic>> loginWithStrava() async {
    const String stravaAuthUrl = '$apiUrl/strava/login';

    try {
      final response = await http.get(Uri.parse(stravaAuthUrl));

      if (response.statusCode == 200) {
        String authUrl = response.body;
        return {'success': true, 'authUrl': authUrl};
      } else {
        return {
          'success': false,
          'error': 'Failed to initiate Strava authentication'
        };
      }
    } catch (error) {
      return {'success': false, 'error': 'Network error: $error'};
    }
  }

  static Future<Map<String, dynamic>> handleStravaCallback(String code) async {
    const String stravaCallbackUrl = '$apiUrl/strava/callback';

    try {
      final response =
          await http.get(Uri.parse('$stravaCallbackUrl?code=$code'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData.containsKey('access_token')) {
          return {'success': true, 'userDetails': responseData};
        } else {
          return {
            'success': false,
            'error': 'Failed to authenticate with Strava'
          };
        }
      } else {
        return {
          'success': false,
          'error': 'Failed to complete Strava authentication'
        };
      }
    } catch (error) {
      return {'success': false, 'error': 'Network error: $error'};
    }
  }

  static Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: true, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}
