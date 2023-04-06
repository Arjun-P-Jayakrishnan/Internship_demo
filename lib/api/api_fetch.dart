import 'dart:convert';

import 'package:http/http.dart' as http;


















class ApiFetch{

  Map<String,String> requestHeaders={
    'Content-type':'application/json',
    'Accept':'application/json',
    'X-Requested-With':'X',
  };

  Map<String,String> requestHeadersGet={
    'Content-type':'application/json',
    'Accept':'application/json',
  };


  Future getRegistered(String name,String email,String gender,String practice_from_month,String practice_from_year) async{

    try {
          Uri _url=Uri.parse("http://199.192.26.248:8000/sap/opu/odata/sap/ZCDS_TEST_REGISTER_CDS/ZCDS_TEST_REGISTER");
          dynamic response=await http.post(_url,body: jsonEncode({
            name: name,
            email: email,
            gender: gender,
            practice_from_month: practice_from_month,
            practice_from_year: practice_from_year,
          }
          ),
          headers:requestHeaders,
          );
          print("the respons is ${jsonDecode(response)}");

          return response;
    } catch (e) {
     print(e.toString());
     return null;
    }


  }

  Future getFromAPI(String guid) async{

    try {
          Uri _url=Uri.parse("http://199.192.26.248:8000/sap/opu/odata/sap/ZCDS_TEST_REGISTER_CDS/ZCDS_TEST_REGISTER(guid'$guid')");
          dynamic response=await http.get(_url,
              headers: requestHeadersGet);
              print("the data is $response");

          return response;
    }
    catch (e) {

      print(e.toString());
      return null;
    }


    }


}