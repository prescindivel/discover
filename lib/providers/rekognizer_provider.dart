import 'package:googleapis/vision/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

class RekognizerProvider {
  RekognizerProvider(this.client);

  AutoRefreshingAuthClient client;
  List<WebEntity> _webEntities;

  detectWeb(String image) async {
    final VisionApi vision = VisionApi(client);
    final ImagesResourceApi api = vision.images;

    BatchAnnotateImagesResponse response =
        await api.annotate(BatchAnnotateImagesRequest.fromJson({
      "requests": [
        {
          "image": {"content": image},
          "features": [
            {"type": "WEB_DETECTION"}
          ]
        }
      ]
    }));

    response.responses.forEach((data) {
      WebDetection webDetection = data.webDetection;
      _webEntities = webDetection.webEntities;
    });

    return _webEntities;
  }
}
