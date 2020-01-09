
import 'package:diario_noticias/api.dart';
import 'package:diario_noticias/noticia.dart';
import 'package:mobx/mobx.dart';
part 'noticia_controller.g.dart';

class ControllerNoticias = _ControllerNoticiasBase with _$ControllerNoticias;

abstract class _ControllerNoticiasBase with Store {

  final api = Api();

  @observable
  List<Noticia> noticias = [];

  @observable
  String _search;

  bool get search => _search == null;

  @observable
  bool _loading = false;

  bool get loading => _loading;

  @observable
  int _index = 0;

  int get getIndex => _index;

  @action
  setIndex(int value){
    _index = value;
    pesquisar(
      indexCategory: _index
    );
  }

  @action
  pesquisar({String search, int indexCategory}) async {
    _loading = true;
    _search = search;
    noticias = await api.search(search: search, indexCategory: indexCategory);
    _index = indexCategory;
    _loading = false;
  }

}