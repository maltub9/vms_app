import 'package:path_provider/path_provider.dart';
import 'dart:io';

class files
{

  String fileName='';

  files(String _fileName)
  {
    fileName=_fileName;
  }

  void write(String text) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/' + fileName);
  await file.writeAsString(text);
  
}

  void append(String text) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/' + fileName);
  await file.writeAsString(text,mode: FileMode.append);
  
}

Future<String> read() async {
  String text;
  try {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/' + fileName);
    text = await file.readAsString();
  } catch (e) {
    print("Couldn't read file");
  }
  return text;
}

Future<List<String>> readLines() async {
  List<String> lines=new List<String>();
  try {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/' + fileName);
    lines = await file.readAsLines();
  } catch (e) {
    print("Couldn't read file");
  }
  return lines;
}

}