import 'dart:io';

void main(){
  //////////////////////////////////////////////////////////////////////////////////////
  ///Vowel Checker
  /////////////////////////////////////////////////////////////////////////////////////
  print("Please Enter A Character");
  String char=stdin.readLineSync()??"".toLowerCase().trim();
  
  while(char ==""){
    print("Please Enter A Valid Character");
    char=stdin.readLineSync()??"".toLowerCase().trim();
    
  }
  int num=char.codeUnitAt(0);
  while( !(num >=97 && num<=122)){
    print("Please Enter A Valid Character");
    char=stdin.readLineSync()??"".toLowerCase().trim();
  }
  num=char.codeUnitAt(0);
  List vowelList=["a", "e", "i", "o", "u"];
  if(vowelList.contains(char)){
    print("$char it is a vowel character");
  }
  else{
    print("$char it is a constant character ");
  }

  
}