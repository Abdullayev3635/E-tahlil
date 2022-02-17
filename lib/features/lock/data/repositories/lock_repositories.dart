import 'package:etahlil/di/dependency_injection.dart';
import 'package:etahlil/features/lock/data/datasources/lock_local_datasources.dart';
import 'package:etahlil/features/lock/domain/repositories/i_lock_repositories.dart';

class PassRepository implements IPassRepository {
  final PassLocalDataSource _passLocalDataSource = di.get();

  @override
  Future<String> setCompile() async {
    return _passLocalDataSource.setCompile();
  }
}
