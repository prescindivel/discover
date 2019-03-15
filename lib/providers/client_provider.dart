import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/vision/v1.dart';

class ClientProvider {
  final List<String> _scopes = [VisionApi.CloudVisionScope];
  AutoRefreshingAuthClient _client;

  AutoRefreshingAuthClient get client {
    clientViaServiceAccount(_credentials, _scopes).then((client) {
      _client = client;
    });

    return _client;
  }
}

final _credentials = ServiceAccountCredentials.fromJson(
  {
    "type": "service_account",
    "project_id": "discover-app-1deba",
    "private_key_id": "d85ffac2ab9bb07875f2cb2112a312f67f108e00",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC3lLKgxC9n426Q\noV44JuPbgVcjydOSYAtxLrQQ2VjBWYgr9CUObk2lysEz0CZLWpal9nHY/GULDa8O\n13hvq0M2/DFB0OgXJJlGaBBeVZEfdO7lvIzzSfY1ujJHI5ZpjvVZ5dPmBsUazs9f\n/HqH3ojuzyECJu+P11lYMcFcAXmvwAN+5e9qSeXB64pryZoXiuvxptxdbHlU5buT\n3XBx3KBytUJFmm8z3NGLhNvNhn7YbgQNnMrGjGW/tfMnxZyoCQYag4tzrRgdWS2y\nP0NXbh62MsIzuR9kCHkxrTQ5YxNroP7+CWrlc44CFEYvOEQLJ2T8FAwry587VD+B\nxlRbORNfAgMBAAECggEASQAHwhcRVMnjAv8wFLseO4CkspYEnD21/xVXxCVxfj1I\ngVXt0F27YbSM/DoGqEtHAYrMvcCru2f/FzNGcH1VVo2VVrsoN1+11YH3FFQJR817\nW/6MvAfKsJWwfYpguuv+k3dpOhyyD1VysBQZc2Lh57iUwyLRe0ziecgbQCdUCLbw\nbwtQt7/myeDxgB5iv6XVMKra2dqqEwrW1SY8xZ69R/mRaltNCtMpXiUTZ0L/0zBS\nSHdKtxiN+U3GAr2GRJssKLQtYpAyiZpr1r9uN/xuU8pgncVioMNiuZfhmChj3d/1\nseq6yr0q7+ah8cVEK/rQAdxQtSelBHv3AYTSeootEQKBgQDtTMSJ3K+sv+QGMq8T\nn+GcExPv7IFCte82Vlp6zqL4V+HQtLC6A5+Fzrs7IzEOn176PTzNlRE8NF6vMeBI\nmjLWQeF+SGtD2fTSDgDJrIc96WyqsJcVOrWLG6SS0PQlJHFpxI5uwPwZicUA34za\nyRWmCAndvw+mNypTIO2S4HHWTwKBgQDGDDcKLRtmDgf5dqcQRK69rx38pcDU2kHa\nBTVqSmcic6tYk4seyGAvsZ+9l3bSbe+kszBwBhgHoXmp30b/EkmGRxe5TNtfBjA5\n76onVZ6Um7WW8Yg1Nyjwwho44LwGFQyqUj7kzrlw89oFevp5epU4lWimvGDKi7/+\ncsupTkq98QKBgA+6nuxkbGCO95ZRlbk/R70IprGog4jgdlKrtqOdPsAnUxh6YZxy\n0QgVg+OPmZjWh30ewgD+eH39GqmSLMOjNOtuwnuUYUfGEqw5sWOsw+oeps1JlzoZ\nAh+OXYI9x3EO0VWpaad9szgeIajFKJj36y9uKPlByM/DqFKKRDUQG3uRAoGABgXP\nEq8meycIFQ0HrZX5HmmZ5tn/kDmG8SNhaXcTxddwqYPrIieDzU+AhRp7EZEoTYDp\ngy6cQnclpQXWOeGLfNrinM76iNw+UTS5nvKanPhTQGDd/IhN5WxxsbMb5K91MCTK\nJtkmiInR4oLH5TPWH99jTFbENsSjNRC2otJvsXECgYEAn5o2K6ogICvgUWmjqCKR\nnJGI0uwawfHouTVRx1ESc/1Os4CewsG648/uyUbdxHEFztuuhbCVQnYXMpPkkSdU\nhnGhP6eiQbDs9OFHkPV4WizK6/cHjzirgdrBdhdoGpUTBWDwsbUFyPhAN498sjLD\nLDHItZKwMRiDhcDvYGkPiBc=\n-----END PRIVATE KEY-----\n",
    "client_email":
        "firebase-adminsdk-71k3d@discover-app-1deba.iam.gserviceaccount.com",
    "client_id": "107659506591605685375",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-71k3d%40discover-app-1deba.iam.gserviceaccount.com"
  },
);
