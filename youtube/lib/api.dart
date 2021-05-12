import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model.dart/video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyAMlzihxEYCpj7PEh1XRvsSpCrSi_5UnJI";
const ID_CHANEL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.https(
        "www.googleapis.com", //authority,
        "/youtube/v3/search/", //unencodedPath

        {
          "key": CHAVE_YOUTUBE_API,
          "channelId": ID_CHANEL,
          "part": "snippet",
          "order": "date",
          "type": "video",
          "q": "pesquisa"
        }));

    Map<String, dynamic> dadosJson = json.decode(response.body);
    List<Video> videos = dadosJson["itens"].map<Video>((map) {
      return Video.fromJson(map);
      // return Video.converterJson(map);
    }).toList();
    return videos;
  }
}
