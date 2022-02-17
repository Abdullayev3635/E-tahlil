abstract class IPassLocalDataSource{
  Future<String> setCompile();
}

class PassLocalDataSource implements IPassLocalDataSource{

  String pass = "0000";
  @override
  Future<String> setCompile() {
    return Future.value(pass);
  }

}