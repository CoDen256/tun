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
    y = (0, l.createStore)((0, c.persistReducer)(n, s.default), (0, l.applyMiddleware)(v, u.createLogger({
      collapsed: true,
      diff: false,
      stateTransformer: function (state) {
        return JSON.stringify(mjolnirCompactCards(state));
      },
      actionTransformer: function (action) {
        return JSON.stringify(mjolnirCompactCards(action));
      }
    })));
  function mjolnirIsCardRecord(value) {
    return !!value && typeof value === "object" && !Array.isArray(value) && Object.prototype.hasOwnProperty.call(value, "D") && Object.prototype.hasOwnProperty.call(value, "ID");
  }
  function mjolnirIsCardRef(value) {
    return !!value && typeof value === "object" && !Array.isArray(value) && Object.prototype.hasOwnProperty.call(value, "Card");
  }
  function mjolnirCardToArray(card) {
    var out = [];
    for (var key in card) {
      if (Object.prototype.hasOwnProperty.call(card, key) && key !== "D") {
        out.push(card[key]);
      }
    }
    return out;
  }
  function mjolnirCompactCards(value) {
    if (Array.isArray(value)) {
      return value.map(mjolnirCompactCards);
    }
    if (value && typeof value === "object") {
      if (mjolnirIsCardRecord(value)) {
        return mjolnirCardToArray(value);
      }
      if (mjolnirIsCardRef(value)) {
        return value.Card;
      }
      var out = {};
      for (var key in value) {
        if (Object.prototype.hasOwnProperty.call(value, key)) {
          out[key] = mjolnirCompactCards(value[key]);
        }
      }
      return out;
    }
    return value;
  }
  v.run(f.default);
  e.persistor = (0, c.persistStore)(y), e.default = y;
}, 953, [1, 954, 956, 957, 964, 969, 973, 974, 985]);
