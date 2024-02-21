import 'package:flutter_memmer/services/apis.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('test API', () async {
    
    final response = await API.getMemes();
    expect(response.success, true);
  });
}