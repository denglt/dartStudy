import 'package:http/http.dart' as http;
import 'dart:convert';

main(List<String> args) async {
      String url ='https://erisservice.ecologeris.com/ErisExt/viewerservice/GetViewerData.svc/getdata?q=KZqGWdcHVUNHOHWGeHfYxmnsgDPkdLniLfbJKmQa';

    http.Response response = await http.post(
      url,
      headers: null,
      body: null,
      encoding: null,
    );
    //print(response.body);
    var data = json.decode(response.body);
   
    var dataResult = json.decode(data['GetDataResult']);
    print(dataResult);
}
