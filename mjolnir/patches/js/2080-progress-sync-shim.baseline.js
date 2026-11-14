__d(function (g, _r, _i, a, m, _e, d) {
  var e = _r(d[0]);
  Object.defineProperty(_e, "__esModule", {
    value: !0
  }), _e.default = void 0;
  var t = e(_r(d[1])),
    r = e(_r(d[2])),
    n = e(_r(d[3])),
    s = e(_r(d[4])),
    l = function (e, t) {
      if ("function" == typeof WeakMap) var r = new WeakMap(),
        n = new WeakMap();
      return function (e, t) {
        if (!t && e && e.__esModule) return e;
        var s,
          l,
          i = {
            __proto__: null,
            default: e
          };
        if (null === e || "object" != typeof e && "function" != typeof e) return i;
        if (s = t ? n : r) {
          if (s.has(e)) return s.get(e);
          s.set(e, i);
        }
        for (var o in e) "default" !== o && {}.hasOwnProperty.call(e, o) && ((l = (s = Object.defineProperty) && Object.getOwnPropertyDescriptor(e, o)) && (l.get || l.set) ? s(i, o, l) : i[o] = e[o]);
        return i;
      }(e, t);
    }(_r(d[5])),
    i = (e(_r(d[6])), e(_r(d[7])), e(_r(d[8]))),
    o = ["N", "E", "X"],
    u = ["N", "E", "X"];
  var c,
    f,
    p,
    v,
    y,
    h,
    C,
    D = {
      userDataCollection: (0, s.default)().collection("userData"),
      initUserData: (C = (0, n.default)(function* () {
        var e;
        try {
          var t;
          yield null == (t = (0, l.default)().currentUser) ? void 0 : t.getIdToken();
        } catch (e) {}
        var r = yield this.userDataCollection.doc(null == (e = (0, l.default)().currentUser) ? void 0 : e.uid).get();
        if (r.exists) ;else {
          var n = S();
          n.firstSessionsCompleted.push(new Date()), yield r.ref.set(n);
        }
      }), function () {
        return C.apply(this, arguments);
      }),
      updateUserData: (h = (0, n.default)(function* (e, t, n, s, i, u, c, f, p, v, y, h) {
        var C;
        try {
          var D;
          yield null == (D = (0, l.default)().currentUser) ? void 0 : D.getIdToken();
        } catch (e) {}
        var S = yield this.userDataCollection.doc(null == (C = (0, l.default)().currentUser) ? void 0 : C.uid).get();
        if (S.exists) {
          if (0 == S.data().completedSessions && 0 == c) return;
          yield S.ref.update({
            totalCards: e.map(function (e) {
              return e.N, e.E, e.X, (0, r.default)(e, o);
            }),
            gameDecks: t,
            lastDeckPulled: n,
            restDays: s,
            dailyCards: i,
            reminderSetting: u,
            completedSessions: c,
            decksStatus: f,
            selectedApproach: p,
            hasSeenMjolnirWay: v,
            acquisitionSource: y,
            marketingSurveySeen: h,
            archivedCards: e.filter(function (e) {
              return 1 == e.Park;
            }).length,
            inProgressCards: e.filter(function (e) {
              return !e.Park;
            }).length
          });
        }
      }), function (e, t, r, n, s, l, i, o, u, c, f, p) {
        return h.apply(this, arguments);
      }),
      updateSessionUserData: (y = (0, n.default)(function* (e, t, n, s) {
        var i;
        try {
          var o;
          yield null == (o = (0, l.default)().currentUser) ? void 0 : o.getIdToken();
        } catch (e) {}
        var c = yield this.userDataCollection.doc(null == (i = (0, l.default)().currentUser) ? void 0 : i.uid).get();
        if (c.exists) {
          var f = c.data();
          f.accountCreationDate && f.firstSessionsCompleted && f.firstSessionsCompleted.length < 7 ? f.firstSessionsCompleted.push(new Date()) : (f.accountCreationDate = null, f.firstSessionsCompleted = null), f.archivedCards || (f.archivedCards = 0), f.inProgressCards || (f.inProgressCards = 0);
          var p = 0;
          if (f.accountCreationDate) {
            var v = new Date(),
              y = new Date(f.accountCreationDate.toDate()),
              h = new Date(v.getFullYear(), v.getMonth(), v.getDate()),
              C = new Date(y.getFullYear(), y.getMonth(), y.getDate()),
              D = Math.abs(h - C),
              S = n / (Math.floor(D / 864e5) + 1);
            p = Math.min(S, 1), p = Math.round(100 * p) / 100;
          }
          try {
            yield c.ref.update({
              totalCards: e.map(function (e) {
                return e.N, e.E, e.X, (0, r.default)(e, u);
              }),
              lastDeckPulled: t,
              completedSessions: n,
              decksStatus: s,
              archivedCards: e.filter(function (e) {
                return 1 == e.Park;
              }).length,
              inProgressCards: e.filter(function (e) {
                return !e.Park;
              }).length,
              firstSessionsCompleted: f.firstSessionsCompleted,
              consistencyRate: p,
              lastCompletedSession: new Date()
            });
          } catch (e) {
            console.log("******************************** FIRESTORE ERROR ********************************"), console.log(e);
          }
        }
      }), function (e, t, r, n) {
        return y.apply(this, arguments);
      }),
      updateSetting: (v = (0, n.default)(function* (e, r) {
        try {
          var n;
          yield null == (n = (0, l.default)().currentUser) ? void 0 : n.getIdToken();
        } catch (e) {}
        if ((0, l.default)().currentUser) {
          var s,
            i = yield this.userDataCollection.doc(null == (s = (0, l.default)().currentUser) ? void 0 : s.uid).get();
          if (i.exists) {
            if (0 == i.data().completedSessions) return;
            yield i.ref.update((0, t.default)({}, e, r));
          }
        }
      }), function (e, t) {
        return v.apply(this, arguments);
      }),
      addSurveyAnswers: (p = (0, n.default)(function* (e) {
        try {
          var t;
          yield null == (t = (0, l.default)().currentUser) ? void 0 : t.getIdToken();
        } catch (e) {}
        if ((0, l.default)().currentUser) {
          var r,
            n = yield this.userDataCollection.doc(null == (r = (0, l.default)().currentUser) ? void 0 : r.uid).get();
          if (n.exists) {
            var s = n.data();
            for (ans of e) s.surveyAnswers.push(ans);
            n.ref.update({
              surveyAnswers: s.surveyAnswers
            });
          }
        }
      }), function (e) {
        return p.apply(this, arguments);
      }),
      getUserData: (f = (0, n.default)(function* () {
        var e;
        try {
          var t;
          yield null == (t = (0, l.default)().currentUser) ? void 0 : t.getIdToken();
        } catch (e) {}
        var r = yield this.userDataCollection.doc(null == (e = (0, l.default)().currentUser) ? void 0 : e.uid).get();
        if (!r.exists) return console.log("*************************************** FIRESTORE ***************************************"), console.log("document not found"), S();
        try {
          var n = r.data();
          return "string" == typeof n.totalCards && (n.totalCards = JSON.parse(i.default.decompressFromBase64(n.totalCards))), n;
        } catch (e) {
          console.log("*************************************** FIRESTORE ***************************************"), console.log(e);
        }
      }), function () {
        return f.apply(this, arguments);
      }),
      deleteUserData: (c = (0, n.default)(function* (e) {
        var t, r;
        try {
          var n;
          yield null == (n = (0, l.default)().currentUser) ? void 0 : n.getIdToken();
        } catch (e) {}
        var s = null == (t = (0, l.default)().currentUser) ? void 0 : t.uid,
          i = yield this.userDataCollection.doc(null == (r = (0, l.default)().currentUser) ? void 0 : r.uid).get();
        i.exists && (yield i.ref.delete());
        var o = l.firebase.functions().httpsCallable('deleteUser');
        yield o({
          uid: s
        });
      }), function (e) {
        return c.apply(this, arguments);
      })
    },
    S = function () {
      return {
        completedSessions: 0,
        totalCards: [],
        gameDecks: [],
        lastDeckPulled: -1,
        restDays: [],
        dailyCards: 15,
        reminderSetting: [{
          days: ["Mo", "Tu", "We", "Th", "Fr"],
          hour: "08",
          minute: "00"
        }, {
          days: ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"],
          hour: "16",
          minute: "30"
        }],
        decksStatus: [],
        selectedApproach: [],
        hasSeenMjolnirWay: {
          firstPage: !1,
          lastPage: !1
        },
        surveyAnswers: [],
        accountCreationDate: new Date(),
        archivedCards: 0,
        inProgressCards: 0,
        hasSeenPaywall: !1,
        firstSessionsCompleted: [],
        lastCompletedSession: new Date(),
        acquisitionSource: null,
        marketingSurveySeen: !1
      };
    };
  _e.default = D;
}, 2080, [1, 99, 232, 68, 2081, 1220, 2105, 2109, 1409]);