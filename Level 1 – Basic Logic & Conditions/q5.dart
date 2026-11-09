import 'dart:io';

void main(){
  //////////////////////////////////////////////////////////////////////////
  ///Largest Number
  /////////////////////////////////////////////////////////////////////////
  double maxNum=0;
  double ?num;
  int count=0;
  while(count!=3){
    print("Please Enter a Number");
    String input=stdin.readLineSync()??"".trim();
    num=double.tryParse(input);
    while(num==null){
      print("Please Enter A Valid Number ");
      input=stdin.readLineSync()??"".trim();
      num=double.tryParse(input);
    }
    if(num>=maxNum){
      maxNum=num;;
    }
    count++;
  }
  print(maxNum);
}