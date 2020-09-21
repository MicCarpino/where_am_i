import 'dart:io';

String mockFile(String name) => File('test/mocks/$name').readAsStringSync();