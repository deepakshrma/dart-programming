import 'dart:mirrors';

const _symbols = {"map": #map, "forEacc": #forEach, "filter": #where, "where": #where};
_execute(method, type, fn) {
  var mirror = reflect(type);
  return mirror.invoke(_symbols[method], [fn]).reflectee;
}

_reverse(String method, Function fn, [List data]) {
  if (data == null)
    return R.curry((_) {
      return _execute(method, _, fn);
    }, 1);
  else
    return _execute(method, data, fn);
}

class R {
  static curry(Function func, int argsLength) {
    fn(all) => Function.apply(func, all);
    partial(arg, {all}) {
      if (all == null) all = [];
      all = all..add(arg);
      return (all.length == argsLength)
          ? fn(all)
          : (arg) => partial(arg, all: all);
    }

    return partial;
  }
  static map(Function fn, [List data]) {
    return _reverse('map', fn, data);
  }
  static filter(Function fn, [List data]) {
    return _reverse('filter', fn, data);
  }
}
