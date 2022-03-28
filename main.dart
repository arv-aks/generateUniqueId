import 'dart:math';

void main(){
  String getUniqueId(){
     final String PUSH_CHARS =
      '-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz';
     int lastPushTime = 0;
    List lastRandChars = [];
    int now = DateTime.now().millisecondsSinceEpoch;
    bool duplicateTime = (now == lastPushTime);
    lastPushTime = now;
    List timeStampChars = List<String>.filled(8, '0');
   for (int i = 7; i >= 0; i--) {
       timeStampChars[i] = PUSH_CHARS[now % 64];
      now = (now/64).floor();
    }
     if (now != 0) {
    print('--------- throw Error');
  }
   String id = timeStampChars.join('');
    if(!duplicateTime){
     for (int i = 0; i < 12; i++){
       lastRandChars.add((Random().nextDouble() * 64).floor());   
     }
  }else {
     int i =0;  
    for (int i = 11; i >= 0 && lastRandChars[i] == 63; i--) {
        lastRandChars[i] = 0;
      }
      lastRandChars[i]++;
    }
    for (int i = 0; i < 12; i++) {
      id += PUSH_CHARS[lastRandChars[i]];
    }
    return id;
  }
  print(getUniqueId() ?? getUniqueId());
}
