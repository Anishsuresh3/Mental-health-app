import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'ChatBotResponse.dart';

part 'ApiService.g.dart';


@RestApi(baseUrl: 'http://localhost:3000/') // Replace with your actual API endpoint
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/getResponse') // Replace with your actual API endpoint
  Future<ChatBotResponse> fetchData();

  @POST('/processData') // Replace with the appropriate API endpoint for processing the string
  Future<ChatBotResponse> processString(@Body() Map<String, dynamic> data);

}