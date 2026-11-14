__d(function (g, r, _i, a, m, e, _d) {
  var n = r(_d[0]);
  Object.defineProperty(e, "__esModule", {
    value: !0
  }), e.default = void 0;
  var t = n(r(_d[1])),
    u = n(r(_d[2])),
    l = n(r(_d[3])),
    o = {
      drawNewCards: function (n, l, o, f, c, s) {
        for (var i = [], d = [], D = []; i.length < l && d.length < n.length;) {
          var C = 0;
          -1 != o && (C = n.indexOf(o) + 1), C == n.length && (C = 0);
          for (var h, v, I = function () {
              var u,
                c = n[C],
                v = 5 * f.filter(function (n) {
                  return n.ID == c;
                })[0].PullCounter;
              h = t.default.find(function (n) {
                return n.ID == c;
              });
              var I = (u = s ? h.Cards.slice(v, v + 5) : h.Cards.filter(function (n) {
                return "N" === n.P;
              }).slice(v, v + 5))[u.length - 1];
              h.Cards[h.Cards.length - 1];
              if (0 == u.length) return d.some(function (n) {
                return n == c;
              }) || d.push(c), o = c, 0;
              for (var P of (f.filter(function (n) {
                return n.ID == c;
              })[0].PullCounter++, u)) i.length < l && (I ? i.push({
                card: P.Card,
                deck: h.Name
              }) : d.some(function (n) {
                return n == c;
              }) || d.push(c));
              return D.some(function (n) {
                return n == c;
              }) || D.push(c), o = c, i.length >= l ? 1 : void 0;
            }; C < n.length && (0 === (v = I()) || 1 !== v); C++);
        }
        for (var P of u.default.getAllCards()) for (var p of i) if (P.ID === p.card.slice(0, 6)) {
          var k = Object.assign({}, P);
          k.language = p.card.substr(p.card.length - 1), k.DECK_ID = p.deck, c.push(k);
        }
        return {
          userDeckTmp: i,
          lastDeckPulled: o,
          decksInfo: f,
          totalCards: c,
          deckPulledToday: D
        };
      },
      undoLastDraw: function (n, u, l, o, f) {
        var c = 0;
        -1 != l && (c = n.indexOf(l)), c == n.length && (c = 0), o.filter(function (u) {
          return u.ID == t.default[n[c]].ID;
        })[0].PullCounter--, l = 0 == c ? n[n.length - 1] : n[c - 1];
        var s = function (n) {
          var t = f.find(function (t) {
              return t.ID == n.card.slice(0, 6) && t.language == n.card.substr(n.length - 1) && t.DECK_ID == n.deck;
            }),
            u = f.indexOf(t);
          f.splice(u, 1);
        };
        for (var i of u) s(i);
        return {
          lastDeckPulled: l,
          decksInfo: o,
          totalCards: f
        };
      },
      getDecksStatus: function (n) {
        return n.map(function (n, t) {
          return {
            ID: n.ID,
            PullCounter: n.PullCounter
          };
        });
      },
      setDecksStatus: function (n, t) {
        n.forEach(function (n) {
          t.find(function (t) {
            return t.ID === n.ID;
          }).PullCounter = n.PullCounter;
        });
      },
      initDecksStatus: function (n, u) {
        for (var l = function (l) {
            var o = n.find(function (n) {
              return n.ID === u[l].ID;
            });
            if (o) o.PullCounter = u[l].PullCounter;else {
              var f = t.default.find(function (n) {
                  return n.ID === u[l].ID;
                }),
                c = Object.assign({}, f);
              c.PullCounter = u[l].PullCounter, n.push(c);
            }
          }, o = 0; o < u.length; o++) l(o);
        return n;
      },
      resetDecksStatus: function () {
        t.default.forEach(function (n) {
          n.PullCounter = 0;
        });
      },
      decompressTotalCards: function (n) {
        return "string" == typeof n ? JSON.parse(l.default.decompressFromBase64(n)) : n;
      }
    };
  e.default = o;
}, 2110, [1, 2111, 2112, 1409]);
