
  String durationToString(int minutes) {
    var d = Duration(minutes:minutes);
    List<String> parts = d.toString().split(':');

    String m='';
    String h='';
    if(parts[0].padLeft(2, '0').toString()!='00'){
     h='${parts[0].padLeft(2, '0').toString()}h ';
    }
    if(parts[1].padLeft(2, '0').toString()!='00'){
      m='${parts[1].padLeft(2, '0').toString()}m';
    }
    return '$h$m';
  }
