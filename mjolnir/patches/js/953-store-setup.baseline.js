__d(function (g, r, i, a, m, e, d) {
  var t = r(d[0]);
  Object.defineProperty(e, "__esModule", {
    value: !0
  }), e.persistor = e.default = void 0;
  var l = r(d[1]),
    u = r(d[2]),
    o = t(r(d[3])),
    s = t(r(d[4])),
    f = t(r(d[5])),
    p = t(r(d[6])),
    c = r(d[7]),
    n = {
      key: "primary",
      storage: t(r(d[8])).default,
      stateReconciler: p.default
    },
    v = (0, o.default)(),
    y = (0, l.createStore)((0, c.persistReducer)(n, s.default), (0, l.applyMiddleware)(v, u.logger));
  v.run(f.default);
  e.persistor = (0, c.persistStore)(y), e.default = y;
}, 953, [1, 954, 956, 957, 964, 969, 973, 974, 985]);
