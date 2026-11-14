__d(function (g, _r, _i, a, m, _e, d) {
  var e = _r(d[0]);
  Object.defineProperty(_e, "__esModule", {
    value: !0
  }), _e.default = void 0;
  var t = e(_r(d[1])),
    n = e(_r(d[2])),
    l = w(_r(d[3])),
    i = _r(d[4]),
    s = _r(d[5]),
    r = _r(d[6]),
    o = e(_r(d[7])),
    u = w(_r(d[8])),
    c = _r(d[9]),
    f = e(_r(d[10])),
    h = e(_r(d[11])),
    y = e(_r(d[12])),
    x = e(_r(d[13])),
    p = _r(d[14]),
    j = _r(d[15]),
    b = _r(d[16]),
    v = e(_r(d[17])),
    T = e(_r(d[18])),
    S = _r(d[19]);
  function w(e, t) {
    if ("function" == typeof WeakMap) var n = new WeakMap(),
      l = new WeakMap();
    return (w = function (e, t) {
      if (!t && e && e.__esModule) return e;
      var i,
        s,
        r = {
          __proto__: null,
          default: e
        };
      if (null === e || "object" != typeof e && "function" != typeof e) return r;
      if (i = t ? l : n) {
        if (i.has(e)) return i.get(e);
        i.set(e, r);
      }
      for (var o in e) "default" !== o && {}.hasOwnProperty.call(e, o) && ((s = (i = Object.defineProperty) && Object.getOwnPropertyDescriptor(e, o)) && (s.get || s.set) ? i(r, o, s) : r[o] = e[o]);
      return r;
    })(e, t);
  }
  var k = function (e) {
    return o.default.setType(e), s.StyleSheet.create({
      container: {
        flex: 1,
        overflow: 'visible'
      },
      header: Object.assign({}, u.default.header, {
        marginTop: (0, c.normalize)(14)
      }),
      back: {
        position: 'absolute',
        left: (0, c.normalize)(16),
        top: (0, c.normalize)(16)
      },
      title: Object.assign({}, u.default.secondaryText, {
        color: o.default.getTheme().heading,
        marginLeft: (0, c.normalize)(24)
      }),
      items: {
        paddingVertical: (0, c.normalize)(24)
      },
      item: {
        paddingHorizontal: (0, c.normalize)(24),
        paddingVertical: (0, c.normalize)(8)
      },
      label: Object.assign({}, u.default.headerText, {
        color: o.default.getTheme().heading,
        fontFamily: u.Fonts.poppinsSemiBold,
        alignSelf: 'flex-start'
      }),
      value: Object.assign({}, u.default.headerText, {
        color: o.default.getTheme().heading,
        alignSelf: 'flex-start'
      }),
      btn: {
        width: (0, c.normalize)(240),
        alignSelf: 'center',
        marginBottom: (0, c.normalize)(16)
      }
    });
  };
  _e.default = (0, i.connect)(function (e) {
    return {
      mode: e.settings.theme,
      profile: e.auth.profile,
      completedSessions: e.deckStats.completed_sessions,
      totalCards: e.deckStats.total_cards,
      subscriptionPurchased: e.deckStats.subscription_purchased
    };
  }, function (e) {
    return {
      visitStudyCards: function (t) {
        return e((0, p.visitStudyCards)(t));
      },
      passInitialOnboarding: function (t) {
        return e((0, p.passInitialOnboarding)(t));
      },
      logout: function () {
        return e((0, j.logout)());
      },
      logoutDeck: function () {
        return e((0, p.logoutDeck)());
      },
      logoutSettings: function () {
        return e((0, b.logoutSettings)());
      }
    };
  })(function (e) {
    var i = e.navigation,
      u = e.mode,
      p = e.profile,
      j = e.visitStudyCards,
      b = e.passInitialOnboarding,
      w = e.completedSessions,
      O = e.totalCards,
      P = e.logout,
      z = e.logoutDeck,
      V = (e.logoutSettings, e.subscriptionPurchased),
      _ = k(u),
      C = (0, l.useState)(!1),
      D = (0, n.default)(C, 2),
      A = D[0],
      M = D[1],
      F = (0, l.useState)(!1),
      I = (0, n.default)(F, 2),
      N = I[0],
      W = I[1],
      B = O.filter(function (e) {
        return 1 == e.Park;
      }).length,
      H = O.filter(function (e) {
        return !e.Park;
      }).length;
    return (0, S.jsx)(r.SafeAreaView, {
      style: {
        flex: 1,
        backgroundColor: o.default.getTheme().background
      },
      children: (0, S.jsxs)(s.ScrollView, {
        style: _.container,
        children: [(0, S.jsx)(x.default, {
          isActive: A,
          onClose: function () {
            return M(!1);
          },
          title: 'Are you sure you want to log out?',
          icon: o.default.getTheme().exclamation,
          description: 'Mj\xf8lnir backs up your progress only at the end of a study session.\nSo, if you log out halfway through a session, you could lose some of your progress.',
          buttons: (0, S.jsxs)(S.Fragment, {
            children: [(0, S.jsx)(y.default, {
              title: 'Yes',
              styles: {
                marginRight: (0, c.normalize)(24)
              },
              onPress: function () {
                M(!1), T.default.resetDecksStatus(), setTimeout(function () {
                  return z();
                }, 150), setTimeout(function () {
                  return P();
                }, 150), i.navigate('OnBoarding', {
                  screen: 'Welcome'
                });
              }
            }), (0, S.jsx)(y.default, {
              title: 'No',
              onPress: function () {
                M(!1);
              }
            })]
          })
        }), (0, S.jsx)(x.default, {
          isActive: N,
          onClose: function () {
            return W(!1);
          },
          title: 'Are you sure you want to delete your account?',
          icon: o.default.getTheme().exclamation,
          isDeleteAction: !0,
          description: 'All your data and progress will be deleted forever. This cannot be undone. If you have a Mj\xf8lnir subscription, remember to cancel it through your online store.',
          buttons: (0, S.jsxs)(S.Fragment, {
            children: [(0, S.jsx)(y.default, {
              title: 'Yes',
              styles: {
                marginRight: (0, c.normalize)(24)
              },
              onPress: (0, t.default)(function* () {
                try {
                  yield v.default.deleteUserData(), W(!1), j(!1), b(!1), T.default.resetDecksStatus(), setTimeout(function () {
                    return z();
                  }, 150), setTimeout(function () {
                    return P();
                  }, 200), i.navigate('OnBoarding', {
                    screen: 'Welcome'
                  });
                } catch (e) {
                  s.Alert.alert('Oops!', 'There was a problem deleting your account. Please try again later.');
                }
              })
            }), (0, S.jsx)(y.default, {
              title: 'No',
              onPress: function () {
                W(!1);
              }
            })]
          })
        }), (0, S.jsx)(s.View, {
          style: _.header,
          children: (0, S.jsx)(s.Text, {
            style: _.title,
            children: "My account"
          })
        }), (0, S.jsx)(s.View, {
          style: _.back,
          children: (0, S.jsx)(f.default, {
            onPress: function () {
              return i.navigate('Settings');
            }
          })
        }), (0, S.jsxs)(s.View, {
          style: _.items,
          children: [(0, S.jsxs)(s.View, {
            style: _.item,
            children: [(0, S.jsx)(s.Text, {
              style: _.label,
              children: "Name"
            }), (0, S.jsx)(s.Text, {
              style: _.value,
              children: p && p.displayName
            })]
          }), (0, S.jsxs)(s.View, {
            style: _.item,
            children: [(0, S.jsx)(s.Text, {
              style: _.label,
              children: "User E-mail ID"
            }), (0, S.jsx)(s.Text, {
              style: _.value,
              children: p && p.email
            })]
          }), (0, S.jsxs)(s.View, {
            style: _.item,
            children: [(0, S.jsx)(s.Text, {
              style: _.label,
              children: "Completed sessions"
            }), (0, S.jsx)(s.Text, {
              style: _.value,
              children: w
            })]
          }), (0, S.jsxs)(s.View, {
            style: _.item,
            children: [(0, S.jsx)(s.Text, {
              style: _.label,
              children: "Cards archived"
            }), (0, S.jsx)(s.Text, {
              style: _.value,
              children: B
            })]
          }), (0, S.jsxs)(s.View, {
            style: _.item,
            children: [(0, S.jsx)(s.Text, {
              style: _.label,
              children: "Cards in progress"
            }), (0, S.jsx)(s.Text, {
              style: _.value,
              children: H
            })]
          }), (0, S.jsxs)(s.View, {
            style: _.item,
            children: [(0, S.jsx)(s.Text, {
              style: _.label,
              children: "Subscription status"
            }), (0, S.jsx)(s.Text, {
              style: _.value,
              children: V || 'None'
            })]
          })]
        }), (0, S.jsx)(h.default, {
          title: 'Delete account',
          color: '#FF5050',
          styles: _.btn,
          paddingHorizontal: (0, c.normalize)(16),
          onPress: function () {
            return W(!0);
          }
        })]
      })
    });
  });
}, 2176, [1, 68, 56, 77, 892, 5, 944, 1252, 1406, 1243, 1435, 1407, 2134, 2135, 1408, 1410, 1411, 2080, 2110, 80]);