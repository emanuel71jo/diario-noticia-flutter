// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noticia_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerNoticias on _ControllerNoticiasBase, Store {
  final _$noticiasAtom = Atom(name: '_ControllerNoticiasBase.noticias');

  @override
  List<Noticia> get noticias {
    _$noticiasAtom.context.enforceReadPolicy(_$noticiasAtom);
    _$noticiasAtom.reportObserved();
    return super.noticias;
  }

  @override
  set noticias(List<Noticia> value) {
    _$noticiasAtom.context.conditionallyRunInAction(() {
      super.noticias = value;
      _$noticiasAtom.reportChanged();
    }, _$noticiasAtom, name: '${_$noticiasAtom.name}_set');
  }

  final _$_searchAtom = Atom(name: '_ControllerNoticiasBase._search');

  @override
  String get _search {
    _$_searchAtom.context.enforceReadPolicy(_$_searchAtom);
    _$_searchAtom.reportObserved();
    return super._search;
  }

  @override
  set _search(String value) {
    _$_searchAtom.context.conditionallyRunInAction(() {
      super._search = value;
      _$_searchAtom.reportChanged();
    }, _$_searchAtom, name: '${_$_searchAtom.name}_set');
  }

  final _$_loadingAtom = Atom(name: '_ControllerNoticiasBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.context.enforceReadPolicy(_$_loadingAtom);
    _$_loadingAtom.reportObserved();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.context.conditionallyRunInAction(() {
      super._loading = value;
      _$_loadingAtom.reportChanged();
    }, _$_loadingAtom, name: '${_$_loadingAtom.name}_set');
  }

  final _$_indexAtom = Atom(name: '_ControllerNoticiasBase._index');

  @override
  int get _index {
    _$_indexAtom.context.enforceReadPolicy(_$_indexAtom);
    _$_indexAtom.reportObserved();
    return super._index;
  }

  @override
  set _index(int value) {
    _$_indexAtom.context.conditionallyRunInAction(() {
      super._index = value;
      _$_indexAtom.reportChanged();
    }, _$_indexAtom, name: '${_$_indexAtom.name}_set');
  }

  final _$pesquisarAsyncAction = AsyncAction('pesquisar');

  @override
  Future pesquisar({String search, int indexCategory}) {
    return _$pesquisarAsyncAction.run(
        () => super.pesquisar(search: search, indexCategory: indexCategory));
  }

  final _$_ControllerNoticiasBaseActionController =
      ActionController(name: '_ControllerNoticiasBase');

  @override
  dynamic setIndex(int value) {
    final _$actionInfo =
        _$_ControllerNoticiasBaseActionController.startAction();
    try {
      return super.setIndex(value);
    } finally {
      _$_ControllerNoticiasBaseActionController.endAction(_$actionInfo);
    }
  }
}
