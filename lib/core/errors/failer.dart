abstract class failer {
  String massage;

  failer(this.massage);
}

class serverfailererror extends failer{
  serverfailererror(super.massage);
}
