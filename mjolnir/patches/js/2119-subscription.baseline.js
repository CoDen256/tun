__d(function (g, _r, _i, _a, m, _e, d) {
    var e = _r(d[0]);
    Object.defineProperty(_e, "__esModule", {
        value: !0
    }), _e.default = _e.TopicsToLearn = _e.ExecuteOnlyOnAndroid = void 0;
    var t = e(_r(d[1])),
        n = e(_r(d[2])),
        r = e(_r(d[3])),
        a = w(_r(d[4])),
        o = _r(d[5]),
        i = _r(d[6]),
        l = e(_r(d[7])),
        u = _r(d[8]),
        s = _r(d[9]),
        f = _r(d[10]),
        c = e(_r(d[11])),
        p = e(_r(d[12])),
        h = w(_r(d[13])),
        y = _r(d[14]),
        v = e(_r(d[15])),
        S = e(_r(d[16])),
        D = e(_r(d[17])),
        T = e(_r(d[18])),
        x = _r(d[19]),
        C = e(_r(d[20])),
        I = e(_r(d[21])),
        b = e(_r(d[22])),
        k = w(_r(d[23])),
        O = _r(d[24]);
    function w(e, t) {
        if ("function" == typeof WeakMap) var n = new WeakMap(),
            r = new WeakMap();
        return (w = function (e, t) {
            if (!t && e && e.__esModule) return e;
            var a,
                o,
                i = {
                    __proto__: null,
                    default: e
                };
            if (null === e || "object" != typeof e && "function" != typeof e) return i;
            if (a = t ? r : n) {
                if (a.has(e)) return a.get(e);
                a.set(e, i);
            }
            for (var l in e) "default" !== l && {}.hasOwnProperty.call(e, l) && ((o = (a = Object.defineProperty) && Object.getOwnPropertyDescriptor(e, l)) && (o.get || o.set) ? a(i, l, o) : i[l] = e[l]);
            return i;
        })(e, t);
    }
    var _ = _e.TopicsToLearn = function (e) {
            var o = e.navigation,
                x = e.mode,
                w = e.passInitialOnboarding,
                _ = (e.studyCardVisited, e.setTotalCards),
                P = e.setDecksInfo,
                E = e.totalCards,
                A = e.decksInfo,
                B = e.setDecks,
                V = e.gameDecks,
                F = e.languageLevel,
                R = (e.cardFrequency, e.restDays),
                L = e.lastDeckPulled,
                N = e.lastDayPulled,
                W = e.studyDay,
                H = e.studyStart,
                M = e.studyEnd,
                K = e.setLastDeckPulled,
                G = e.setLastDayPulled,
                X = e.setStudyDay,
                q = e.setStudyStart,
                Y = e.setCurrentSession,
                Z = e.setCurrentId,
                Q = e.currentSession,
                U = e.currentId,
                J = e.setCurrentToGraduate,
                $ = e.currentToGraduate,
                ee = e.setStudyEnd,
                te = e.dailyCards,
                ne = e.completedSessions,
                re = (e.setCompletedSessions, e.paywallVisible),
                ae = e.setPaywallVisible,
                oe = e.appOpenedCounter,
                ie = e.lastOpenedDate,
                le = e.setAppOpenedCounter,
                ue = e.setLastOpenedDate,
                se = e.cardsPurchased,
                de = (e.todaysInjections, e.setTodaysInjections),
                fe = e.subscriptionPurchased,
                ce = e.maxFreeAppOpenedCounter,
                pe = e.maxFreeCompletedSessions,
                ge = (e.marketingSurveySeen, (0, a.useState)([])),
                he = (0, r.default)(ge, 2),
                me = he[0],
                ye = he[1];
            (0, a.useEffect)(function () {
                Ot(), ye(I.default);
            }, [me]);
            var ve = j(x),
                Se = (0, a.useState)(null),
                De = (0, r.default)(Se, 2),
                Te = De[0],
                xe = De[1],
                Ce = (0, a.useState)([]),
                Ie = (0, r.default)(Ce, 2),
                be = Ie[0],
                ke = Ie[1],
                Oe = (0, a.useRef)(),
                we = (0, f.useIsFocused)(),
                je = (0, a.useRef)(),
                ze = (0, a.useRef)(!1),
                Pe = (0, a.useState)(0),
                Ee = (0, r.default)(Pe, 2),
                Ae = Ee[0],
                Be = Ee[1],
                Ve = (0, a.useState)(0),
                Fe = (0, r.default)(Ve, 2),
                Re = Fe[0],
                Le = Fe[1],
                Ne = (0, a.useState)(0),
                We = (0, r.default)(Ne, 2),
                He = We[0],
                Me = We[1],
                Ke = (0, a.useState)(0),
                Ge = (0, r.default)(Ke, 2),
                Xe = Ge[0],
                qe = Ge[1],
                Ye = (0, a.useState)(0),
                Ze = (0, r.default)(Ye, 2),
                Qe = Ze[0],
                Ue = Ze[1],
                Je = (0, a.useState)(0),
                $e = (0, r.default)(Je, 2),
                et = $e[0],
                tt = $e[1],
                nt = (0, a.useState)(0),
                rt = (0, r.default)(nt, 2),
                at = rt[0],
                ot = rt[1],
                it = (0, a.useState)(0),
                lt = (0, r.default)(it, 2),
                ut = lt[0],
                st = lt[1],
                dt = (0, a.useState)(null),
                ft = (0, r.default)(dt, 2),
                ct = ft[0],
                pt = ft[1],
                gt = (0, a.useState)(!1),
                ht = (0, r.default)(gt, 2),
                mt = ht[0],
                yt = ht[1],
                vt = (0, a.useState)(!1),
                St = (0, r.default)(vt, 2),
                Dt = St[0],
                Tt = St[1],
                xt = (0, a.useRef)(void 0).current;
            (0, a.useEffect)(function () {
                return ze.current = !0, function () {
                    ze.current = !1;
                };
            }, []), (0, a.useEffect)(function () {
                if (clearInterval(xt), ze.current && (xt = setInterval(kt, 1e4)), "ND" != ie) {
                    var e = (0, l.default)(ie).subtract(4, 'hours').startOf("day");
                    if ((0, l.default)(new Date()).subtract(4, 'hours').startOf("day").isAfter(e) && (oe++, ie = new Date(), le(oe), ue(ie), oe >= ce && !re && !fe)) return ae(!0), void o.navigate("EndOfTrial");
                }
                return function () {
                    clearInterval(xt);
                };
            }, []), (0, a.useEffect)(function () {
                var e = bt();
                ke(e), e || we || (clearInterval(xt), xt = setInterval(kt, 1e4)), Ot(), ye(I.default);
            }, [we, M]), (0, a.useEffect)(function () {
                var e, t, n;
                w(!0);
                for (var r = [], a = [], o = [], i = [], l = 0; l < I.default.length; l++) {
                    switch (I.default[l].Name.charAt(0)) {
                        case "Z":
                            r.push(I.default[l].ID);
                            break;
                        case "A":
                            a.push(I.default[l].ID);
                            break;
                        case "B":
                            o.push(I.default[l].ID);
                            break;
                        case "C":
                            i.push(I.default[l].ID);
                    }
                }
                if (Be(I.default.findIndex(function (e) {
                    return e.ID == r[0];
                })), Ue(I.default.findIndex(function (e) {
                    return e.ID == r[r.length - 1];
                }) + 1), Le(I.default.findIndex(function (e) {
                    return e.ID == a[0];
                })), tt(I.default.findIndex(function (e) {
                    return e.ID == a[a.length - 1];
                }) + 1), Me(I.default.findIndex(function (e) {
                    return e.ID == o[0];
                })), ot(I.default.findIndex(function (e) {
                    return e.ID == o[o.length - 1];
                }) + 1), qe(I.default.findIndex(function (e) {
                    return e.ID == i[0];
                })), st(I.default.findIndex(function (e) {
                    return e.ID == i[i.length - 1];
                }) + 1), !V || 0 == V.length) switch (F) {
                    case 1:
                        for (var u of r) -1 === V.indexOf(u) && V.push(u);
                        break;
                    case 2:
                        for (var s of (null == (e = Oe.current) || e.scrollTo({
                            y: 150,
                            animated: !0
                        }), a)) -1 === V.indexOf(s) && V.push(s);
                        break;
                    case 3:
                        for (var f of (null == (t = Oe.current) || t.scrollTo({
                            y: 1050,
                            animated: !0
                        }), o)) -1 === V.indexOf(f) && V.push(f);
                        break;
                    case 4:
                        for (var c of (null == (n = Oe.current) || n.scrollTo({
                            y: 1890,
                            animated: !0
                        }), i)) -1 === V.indexOf(c) && V.push(c);
                }
            }, []);
            var Ct = (0, a.useCallback)((0, i.debounce)(function () {
                var e;
                ct && (null == (e = Oe.current) || e.scrollTo({
                    y: ct - 120,
                    animated: !0
                }));
            }, 1e3), [ct]);
            (0, a.useEffect)(function () {
                Ct();
            }, [ct]);
            var It = function () {
                    var e = (0, n.default)(function* (e) {
                        var n = V.indexOf(e);
                        if (n > -1) {
                            var r = (0, t.default)(V);
                            r.splice(n, 1), B(r), yield C.default.updateSetting("gameDecks", r);
                        } else B([].concat((0, t.default)(V), [e])), yield C.default.updateSetting("gameDecks", [].concat((0, t.default)(V), [e]));
                    });
                    return function (t) {
                        return e.apply(this, arguments);
                    };
                }(),
                bt = function () {
                    if ("ND" != H) {
                        var e = (0, l.default)(new Date()).subtract(4, 'hours').startOf("day");
                        if ((0, l.default)(H).subtract(4, 'hours').startOf("day").isAfter(e) && !re && !fe) return ae(!0), o.navigate("EndOfTrial"), !1;
                    }
                    if ("ND" != M) {
                        var t = (0, l.default)(M).subtract(4, 'hours').startOf("day");
                        if (!(0, l.default)(new Date()).subtract(4, 'hours').startOf("day").isAfter(t, "day")) return !1;
                    }
                    return !0;
                },
                kt = function () {
                    var e = bt();
                    ke(e), !e && ze.current || clearInterval(xt);
                },
                Ot = function () {
                    var e = function (e) {
                        var t,
                            n = A.find(function (t) {
                                return t.ID === e.ID;
                            }),
                            r = e.Cards.length,
                            a = 5 * (null != (t = null == n ? void 0 : n.PullCounter) ? t : 0) / r * 100;
                        e.Completion = parseInt(Math.round(100 * a) / 100);
                    };
                    for (var t of I.default) e(t);
                },
                wt = [],
                _t = [],
                jt = (0, a.useRef)(!0),
                zt = (0, a.useRef)(0),
                Pt = (0, l.default)(new Date()).subtract(4, 'hours').startOf("day"),
                Et = (0, l.default)(H).subtract(4, 'hours').startOf("day");
            W = Pt.diff(Et, "days") + 1, isNaN(W) && (W = 1);
            var At = function () {
                "ND" == H && (H = new Date(), q(H), oe++, ie = new Date(), le(oe), ue(ie));
                var e = new Date().getDay();
                0 === e && (e = 7);
                var n = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"][e - 1],
                    r = R.some(function (e) {
                        return e == n;
                    });
                N == W && (jt.current = !1), je.current = N, V.sort(function (e, t) {
                    return e - t;
                });
                var a = function (e) {
                    A.length && A.some(function (t) {
                        return t.ID == e;
                    }) || A.push(I.default.find(function (t) {
                        return t.ID == e;
                    }));
                };
                for (var o of V) a(o);
                var i,
                    s,
                    f,
                    c,
                    p,
                    h,
                    y = !0,
                    v = [];
                if (Q.length > 0) {
                    for (var S = N != W, D = 0; D < Q.length; D++) {
                        var x = E.findIndex(function (e) {
                            return e.ID == Q[D].ID && e.language == Q[D].language && e.DECK_ID == Q[D].DECK_ID;
                        });
                        E[x] = Object.assign({}, Q[D]), Q[D].Postponed && S && (Q.splice(D, 1), D--);
                    }
                    _((0, t.default)(E)), Y(Q);
                }
                if (jt.current) {
                    if (!r) {
                        var C = T.default.drawNewCards(V, te, L, A, E, se);
                        L = C.lastDeckPulled, A = C.decksInfo, E = C.totalCards, v = C.deckPulledToday, de(0), K(L), P((0, t.default)(A)), _((0, t.default)(E));
                    }
                    var k = function (e) {
                        if (Q.some(function (t) {
                            return t.ID == e.ID && t.language == e.language;
                        })) return 1;
                        if (!e.N && !e.E && !e.X) {
                            var t = b.default.getCard(e.ID);
                            t && (e.N = t.N, e.E = t.E, e.X = t.X);
                        }
                        if (e.Stage) {
                            if (!e.Park) {
                                var n = (0, l.default)().subtract(4, 'hours').toDate();
                                if (Bt((0, l.default)(e.Time).subtract(4, 'hours').toDate(), n) <= 0) {
                                    e.Type = "prev", e.Postponed = !1;
                                    var r = b.default.getCard(e.ID);
                                    r && (e.N = r.N, e.E = r.E, e.X = r.X), zt.current++, _t.push(e);
                                }
                            }
                        } else e.Stage = 0, e.Graduated = !1, e.Type = "brand", e.Postponed = !1, e.Time = new Date().getTime(), e.CF = 0, e.AutoParkHit = 0, e.AutoTagHit = 0, e.numberOfReschedulings = 0, zt.current++, _t.push(e);
                    };
                    for (var O of E) k(O);
                } else Q.length > 0 ? (y = !1, wt = (0, t.default)(Q), zt.current = $) : u.Alert.alert("No new cards for today!", "Please ensure that you have selected topics that have flashcards to give you, or that today is not a Rest Day.");
                y && (Q.length > 0 && (_t.push.apply(_t, (0, t.default)(Q)), zt.current += $), s = [], f = (i = _t).filter(function (e) {
                    var t = (0, l.default)(e.Time).subtract(4, 'hours').startOf("day"),
                        n = (0, l.default)().subtract(4, 'hours').startOf("day");
                    return "brand" == e.Type && t.isSame(n, "day");
                }), c = i.filter(function (e) {
                    var t = (0, l.default)(e.Time).subtract(4, 'hours').startOf("day"),
                        n = (0, l.default)().subtract(4, 'hours').startOf("day");
                    return "brand" == e.Type && !t.isSame(n, "day");
                }), p = i.filter(function (e) {
                    return "same" == e.Type;
                }), h = i.filter(function (e) {
                    return "prev" == e.Type;
                }), f.sort(function (e, t) {
                    if ((null == e ? void 0 : e.DECK_ID) !== (null == t ? void 0 : t.DECK_ID)) {
                        var n,
                            r,
                            a,
                            o,
                            i = null == (n = A) || null == n.find ? void 0 : n.find(function (t) {
                                return (null == t ? void 0 : t.Name) == (null == e ? void 0 : e.DECK_ID);
                            }),
                            l = null == (r = A) || null == r.find ? void 0 : r.find(function (e) {
                                return (null == e ? void 0 : e.Name) == (null == t ? void 0 : t.DECK_ID);
                            }),
                            u = null == (a = v) || null == a.find ? void 0 : a.find(function (e) {
                                return e == (null == i ? void 0 : i.ID);
                            }),
                            s = null == (o = v) || null == o.find ? void 0 : o.find(function (e) {
                                return e == (null == l ? void 0 : l.ID);
                            });
                        return v.indexOf(u) - v.indexOf(s);
                    }
                    var f,
                        c,
                        p,
                        h,
                        y,
                        S = null == (f = A) ? void 0 : f.find(function (t) {
                            return (null == t ? void 0 : t.Name) == e.DECK_ID;
                        }),
                        D = e.ID + e.language,
                        T = t.ID + t.language,
                        x = null == S || null == (c = S.Cards) || null == c.find ? void 0 : c.find(function (e) {
                            return (null == e ? void 0 : e.Card) === D;
                        }),
                        C = null == S || null == (p = S.Cards) || null == p.find ? void 0 : p.find(function (e) {
                            return (null == e ? void 0 : e.Card) === T;
                        });
                    return (null == S || null == (h = S.Cards) || null == h.indexOf ? void 0 : h.indexOf(x)) - (null == S || null == (y = S.Cards) || null == y.indexOf ? void 0 : y.indexOf(C));
                }), c.forEach(function (e) {
                    e.Time = new Date().getTime() - 3e5;
                }), p.sort(function (e, t) {
                    return e.Time - t.Time;
                }), h.sort(function (e, t) {
                    return e.Time - t.Time;
                }), s.push.apply(s, (0, t.default)(p)), s.push.apply(s, (0, t.default)(c)), s.push.apply(s, (0, t.default)(f)), s.push.apply(s, (0, t.default)(h)), wt = function (e) {
                    var n = e.filter(function (e) {
                            return "brand" === e.Type;
                        }),
                        r = e.filter(function (e) {
                            return "brand" !== e.Type;
                        }),
                        a = [],
                        o = [],
                        i = I.default.map(function (e) {
                            return e.ID;
                        });
                    i = i.sort(function (e, t) {
                        return e - t;
                    });
                    for (var l = function () {
                        var e = A.find(function (e) {
                            return e.ID == i[u];
                        });
                        if (!e) return 1;
                        o.push(n.filter(function (t) {
                            return t.DECK_ID === e.Name;
                        }));
                    }, u = 0; u < i.length; u++) l();
                    for (var s = !1, f = 0; !s;) {
                        if (o[f].length >= 5) for (var c = o[f].splice(0, 5), p = 0; p < c.length; p++) a.push(c[p]);else if (o[f].length > 0) {
                            var h = o[f].splice(0, o[f].length);
                            for (p = 0; p < h.length; p++) a.push(h[p]);
                        }
                        ++f == o.length && (f = 0);
                        var y = !0;
                        for (u = 0; u < o.length; u++) y = y && 0 === o[u].length;
                        s = y;
                    }
                    return a.push.apply(a, (0, t.default)(r)), a;
                }(wt = s), G(N = W), X(W)), wt.length > 0 && y && (zt.current = wt.length, Q = (0, t.default)(wt), $ = zt.current, Y(Q), Z(0), J($));
            };
            function Bt(e, t) {
                var n = e.getFullYear().toString() + (e.getMonth() + 1).toString().padStart(2, "0") + e.getDate().toString().padStart(2, "0"),
                    r = t.getFullYear().toString() + (t.getMonth() + 1).toString().padStart(2, "0") + t.getDate().toString().padStart(2, "0");
                return parseInt(n) - parseInt(r);
            }
            var Vt = function () {
                    var e = !0,
                        t = function (t) {
                            if (I.default.find(function (e) {
                                return e.ID == t;
                            }).Completion < 100) return e = !1, 1;
                        };
                    for (var n of V) if (t(n)) break;
                    return e;
                },
                Ft = function (e) {
                    var t = e.item,
                        n = (e.index, Te === t.ID),
                        r = V.indexOf(t.ID) > -1;
                    return (0, O.jsxs)(u.View, {
                        style: [h.shadow, ve.topicItem, r && {
                            backgroundColor: p.default.getTheme().titleBackground,
                            shadowColor: "ios" === u.Platform.OS ? "rgba(13, 63, 103, 0.2)" : "rgba(13, 63, 103, 0.7)"
                        }, r && {
                            borderColor: "transparent"
                        }],
                        onLayout: function (e) {
                            if (r) {
                                var t = e.nativeEvent.layout;
                                (null === ct || ct > t.y) && pt(t.y);
                            }
                        },
                        children: [(0, O.jsx)(u.Pressable, {
                            style: ve.toggleCheck,
                            onPress: function () {
                                return It(t.ID);
                            },
                            children: (0, O.jsx)(c.default, {
                                value: r,
                                onValueChange: function () {
                                    return y.isAndroid ? It(t.ID) : null;
                                },
                                style: ve.checkbox,
                                boxType: "square",
                                tintColors: {
                                    true: p.default.getTheme().buttonColor1,
                                    false: p.default.getTheme().checkboxBorder
                                },
                                tintColor: p.default.getTheme().checkboxBorder,
                                onTintColor: p.default.getTheme().buttonColor1,
                                onFillColor: p.default.getTheme().buttonColor1,
                                onCheckColor: "#fff"
                            })
                        }), (0, O.jsxs)(u.TouchableOpacity, {
                            style: {
                                flex: 1
                            },
                            onPress: function () {
                                return e = t.ID, void xe(Te === e ? null : e);
                                var e;
                            },
                            children: [(0, O.jsxs)(u.View, {
                                style: ve.top,
                                children: [(0, O.jsxs)(u.View, {
                                    style: ve.titleWrap,
                                    children: [(0, O.jsx)(u.Text, {
                                        style: [ve.topicTitle, ve.topicItemTitle],
                                        children: t.Title
                                    }), (0, O.jsxs)(u.Text, {
                                        style: [h.default.smallText, ve.cardsText],
                                        children: [t.Completion, "%"]
                                    })]
                                }), (0, O.jsx)(u.View, {
                                    style: ve.arrowIcon,
                                    children: n ? p.default.getTheme().arrowUp : p.default.getTheme().arrowDown
                                })]
                            }), n && (0, O.jsxs)(u.View, {
                                style: {
                                    marginBottom: (0, y.normalize)(16),
                                    marginRight: (0, y.normalize)(48)
                                },
                                children: [(0, O.jsx)(D.default, {
                                    fontSize: 13,
                                    content: "<div>" + t.Description + "</div>"
                                }), (0, O.jsx)(u.Text, {
                                    style: [ve.desc, {
                                        marginTop: (0, y.normalize)(8)
                                    }],
                                    children: t.Counter1
                                }), (0, O.jsx)(u.Text, {
                                    style: [ve.desc, {
                                        fontSize: (0, y.normalize)(10)
                                    }],
                                    children: (0, O.jsx)(D.default, {
                                        fontSize: 13,
                                        content: "<div>" + t.Counter2 + "</div>"
                                    })
                                })]
                            })]
                        })]
                    }, t.ID);
                };
            return (0, O.jsxs)(s.SafeAreaView, {
                style: {
                    flex: 1,
                    backgroundColor: p.default.getTheme().background
                },
                children: [(0, O.jsxs)(u.View, {
                    style: ve.container,
                    children: [(0, O.jsx)(u.View, {
                        style: [h.default.header, {
                            marginTop: (0, y.normalize)(14)
                        }],
                        children: (0, O.jsx)(u.Text, {
                            style: [h.default.secondaryText, {
                                color: p.default.getTheme().heading,
                                marginLeft: (0, y.normalize)(16)
                            }],
                            children: "Choose your topics"
                        })
                    }), (0, O.jsx)(u.View, {
                        style: (h.default.subheader, ve.menu),
                        children: (0, O.jsx)(v.default, {
                            onPress: function () {
                                return o.navigate("Settings");
                            }
                        })
                    }), (0, O.jsxs)(u.ScrollView, {
                        ref: Oe,
                        style: ve.listWrap,
                        contentContainerStyle: ve.ListContentContainer,
                        children: [(0, O.jsx)(u.Text, {
                            style: [ve.topicTitle, {
                                alignSelf: "center",
                                marginTop: 24,
                                marginBottom: 18,
                                marginRight: 0
                            }],
                            children: "Zero - Complete beginner"
                        }), me.slice(Ae, Qe).map(function (e) {
                            return Ft({
                                item: e
                            });
                        }), (0, O.jsx)(u.Text, {
                            style: [ve.topicTitle, {
                                alignSelf: "center",
                                marginTop: 24,
                                marginBottom: 18,
                                marginRight: 0
                            }],
                            children: "Beginner - A1 to A2"
                        }), me.slice(Re, et).map(function (e) {
                            return Ft({
                                item: e
                            });
                        }), (0, O.jsx)(u.Text, {
                            style: [ve.topicTitle, {
                                alignSelf: "center",
                                marginTop: 24,
                                marginBottom: 18,
                                marginRight: 0
                            }],
                            children: "Intermediate - A2 to B1"
                        }), me.slice(He, at).map(function (e) {
                            return Ft({
                                item: e
                            });
                        }), (0, O.jsx)(u.Text, {
                            style: [ve.topicTitle, {
                                alignSelf: "center",
                                marginTop: 24,
                                marginBottom: 18,
                                marginRight: 0
                            }],
                            children: "TEASER - Expert - B1 to B2"
                        }), me.slice(Xe, ut).map(function (e) {
                            return Ft({
                                item: e
                            });
                        })]
                    }), Dt && (0, O.jsx)(k.View, {
                        style: [ve.popupWrap, {
                            bottom: (0, y.normalize)(200)
                        }],
                        animation: 'fadeIn',
                        duration: 250,
                        children: (0, O.jsxs)(u.Pressable, {
                            style: ve.popup,
                            onPress: function () {
                                return Tt(!1);
                            },
                            children: [(0, O.jsx)(u.TouchableOpacity, {
                                style: {
                                    position: 'absolute',
                                    top: (0, y.normalize)(4),
                                    right: (0, y.normalize)(16)
                                },
                                onPress: function () {
                                    return Tt(!1);
                                },
                                children: (0, O.jsx)(u.Text, {
                                    style: ve.popupClose,
                                    children: "\xd7"
                                })
                            }), (0, O.jsx)(u.Text, {
                                style: ve.popupText,
                                children: 'You have\ncompleted your\nselected topics.\nSelect new ones\nto keep receiving\nnew flashcards.'
                            })]
                        })
                    }), (0, O.jsx)(u.View, {
                        style: ve.btnWrap,
                        children: (0, O.jsx)(S.default, {
                            title: be ? "Start today's session" : "Done for today",
                            color: p.default.getTheme().buttonColor1,
                            styles: {
                                width: "80%",
                                left: "10%"
                            },
                            disabled: !V.length,
                            onPress: function () {
                                if (be && ne >= pe && !re && !fe && (re = !0, ae(!0)), re) o.navigate("EndOfTrial");else if (be) {
                                    if (Vt() && !mt) return Tt(!0), void yt(!0);
                                    if (At(), 0 == wt.length) return ee(new Date()), void u.Alert.alert("No new cards for today!", "Please ensure that you have selected topics that have flashcards to give you, or that today is not a Rest Day.");
                                    o.navigate(ne > 0 ? "TipOfTheDay" : "StudyCards", {
                                        startingDecks: V,
                                        sessionCards: wt,
                                        toGraduate: zt,
                                        currentId: U,
                                        lDayPull: je.current
                                    });
                                } else o.navigate('FAQ', {
                                    scrollIndex: 3
                                });
                            }
                        })
                    })]
                }), we && "ios" !== u.Platform.OS ? (0, O.jsx)(z, {}) : (0, O.jsx)(O.Fragment, {})]
            });
        },
        j = function (e) {
            return p.default.setType(e), u.StyleSheet.create({
                container: {
                    flex: 1
                },
                menu: {
                    position: "absolute",
                    left: (0, y.normalize)(16),
                    top: (0, y.normalize)(16)
                },
                ListContentContainer: {
                    paddingTop: (0, y.normalize)(20),
                    paddingBottom: (0, y.normalize)(30)
                },
                listWrap: {
                    flex: 1
                },
                topicItem: {
                    flexDirection: "row",
                    borderRadius: (0, y.normalize)(18),
                    marginVertical: (0, y.normalize)(4),
                    marginHorizontal: (0, y.normalize)(16),
                    borderWidth: (0, y.normalize)(1),
                    borderColor: p.default.getTheme().borderColor2,
                    backgroundColor: p.default.getTheme().chooseTopicsBg
                },
                top: {
                    height: (0, y.normalize)(60),
                    flexDirection: "row",
                    alignItems: "center"
                },
                checkbox: {
                    width: (0, y.normalize)(y.isAndroid ? 22 : 18),
                    height: (0, y.normalize)(y.isAndroid ? 22 : 18),
                    marginLeft: (0, y.normalize)(8)
                },
                toggleCheck: {
                    width: (0, y.normalize)(50),
                    height: (0, y.normalize)(60),
                    justifyContent: "center",
                    alignItems: "center"
                },
                emptyCheck: {
                    width: (0, y.normalize)(20),
                    height: (0, y.normalize)(20),
                    borderRadius: (0, y.normalize)(10),
                    margin: (0, y.normalize)(14),
                    marginHorizontal: (0, y.normalize)(15),
                    backgroundColor: p.default.getTheme().borderColorSecondary
                },
                checkIcon: {
                    position: "absolute"
                },
                titleWrap: {
                    flex: 1,
                    flexDirection: "row",
                    justifyContent: "space-between",
                    alignItems: "center",
                    marginTop: (0, y.normalize)(6),
                    paddingVertical: (0, y.normalize)(4)
                },
                cardsText: {
                    width: (0, y.normalize)(34),
                    flexShrink: 0,
                    color: p.default.getTheme().headingAccent,
                    fontFamily: h.Fonts.poppinsSemiBold,
                    textAlign: "right"
                },
                topicTitle: Object.assign({}, h.default.headerText, {
                    alignSelf: "flex-start",
                    marginBottom: (0, y.normalize)(4),
                    fontFamily: h.Fonts.poppinsSemiBold,
                    lineHeight: (0, y.normalize)(20),
                    color: p.default.getTheme().heading,
                    marginRight: (0, y.normalize)(16),
                    textAlign: "left"
                }),
                topicItemTitle: {
                    flex: 1,
                    flexShrink: 1,
                    minWidth: 0,
                    marginRight: (0, y.normalize)(4)
                },
                desc: Object.assign({}, h.default.smallText, {
                    color: p.default.getTheme().heading,
                    textAlign: "left",
                    alignSelf: "flex-start"
                }),
                arrowIcon: {
                    paddingHorizontal: (0, y.normalize)(16)
                },
                btnWrap: {
                    paddingVertical: (0, y.normalize)(12)
                },
                popupWrap: {
                    position: 'absolute',
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: (0, y.normalize)(170),
                    justifyContent: 'center',
                    alignSelf: 'center',
                    zIndex: 999,
                    elevation: 999
                },
                popup: {
                    alignSelf: 'center',
                    backgroundColor: p.default.getTheme().buttonColor1,
                    paddingVertical: (0, y.normalize)(12),
                    paddingHorizontal: (0, y.normalize)(32),
                    borderRadius: (0, y.normalize)(24),
                    justifyContent: 'center'
                },
                popupClose: {
                    fontSize: (0, y.normalize)(26),
                    fontFamily: h.Fonts.poppinsSemiBold,
                    color: '#fff'
                },
                popupText: Object.assign({}, h.default.headerText, {
                    fontSize: (0, y.normalize)(20),
                    fontFamily: h.Fonts.poppinsSemiBold,
                    color: '#fff'
                })
            });
        },
        z = _e.ExecuteOnlyOnAndroid = function () {
            var e = (0, a.useState)(0),
                t = (0, r.default)(e, 2),
                n = t[0],
                o = t[1],
                i = function () {
                    return setTimeout(function () {
                        o(0);
                    }, 2e3), 0 === n ? (o(n + 1), u.ToastAndroid.show("Press Back again to close the app", u.ToastAndroid.SHORT)) : 1 === n && u.BackHandler.exitApp(), !0;
                };
            return (0, a.useEffect)(function () {
                var e = u.BackHandler.addEventListener("hardwareBackPress", i);
                return function () {
                    return e.remove();
                };
            }), (0, O.jsx)(O.Fragment, {});
        };
    _e.default = (0, o.connect)(function (e) {
        return {
            mode: e.settings.theme,
            studyCardVisited: e.deckStats.visited_study_cards,
            totalCards: e.deckStats.total_cards,
            decksInfo: e.deckStats.decks_info,
            gameDecks: e.deckStats.game_decks,
            languageLevel: e.deckStats.language_level,
            cardFrequency: e.deckStats.card_frequency,
            lastDeckPulled: e.deckStats.last_deck_pulled,
            lastDayPulled: e.deckStats.last_day_pulled,
            studyDay: e.deckStats.study_day,
            studyStart: e.deckStats.study_start,
            studyEnd: e.deckStats.study_end,
            restDays: e.settings.rest_days,
            currentSession: e.deckStats.current_session,
            currentId: e.deckStats.current_id,
            currentToGraduate: e.deckStats.current_to_graduate,
            dailyCards: e.settings.daily_cards,
            completedSessions: e.deckStats.completed_sessions,
            paywallVisible: e.deckStats.paywall_visible,
            appOpenedCounter: e.deckStats.app_opened_counter,
            lastOpenedDate: e.deckStats.last_opened_date,
            cardsPurchased: e.deckStats.cards_purchased,
            todaysInjections: e.deckStats.todays_injections,
            subscriptionPurchased: e.deckStats.subscription_purchased,
            maxFreeAppOpenedCounter: e.deckStats.max_free_app_opened_counter,
            maxFreeCompletedSessions: e.deckStats.max_free_completed_sessions,
            marketingSurveySeen: e.settings.marketing_survey_seen
        };
    }, function (e) {
        return {
            passInitialOnboarding: function (t) {
                return e((0, x.passInitialOnboarding)(t));
            },
            setDecks: function (t) {
                return e((0, x.setDecks)(t));
            },
            setTotalCards: function (t) {
                return e((0, x.setTotalCards)(t));
            },
            setDecksInfo: function (t) {
                return e((0, x.setDecksInfo)(t));
            },
            setLastDeckPulled: function (t) {
                return e((0, x.setLastDeckPulled)(t));
            },
            setLastDayPulled: function (t) {
                return e((0, x.setLastDayPulled)(t));
            },
            setStudyDay: function (t) {
                return e((0, x.setStudyDay)(t));
            },
            setStudyStart: function (t) {
                return e((0, x.setStudyStart)(t));
            },
            setCurrentSession: function (t) {
                return e((0, x.setCurrentSession)(t));
            },
            setCurrentId: function (t) {
                return e((0, x.setCurrentId)(t));
            },
            setCurrentToGraduate: function (t) {
                return e((0, x.setCurrentToGraduate)(t));
            },
            setStudyEnd: function (t) {
                return e((0, x.setStudyEnd)(t));
            },
            setCompletedSessions: function (t) {
                return e((0, x.setCompletedSessions)(t));
            },
            setPaywallVisible: function (t) {
                return e((0, x.setPaywallVisible)(t));
            },
            setAppOpenedCounter: function (t) {
                return e((0, x.setAppOpenedCounter)(t));
            },
            setLastOpenedDate: function (t) {
                return e((0, x.setLastOpenedDate)(t));
            },
            setTodaysInjections: function (t) {
                return e((0, x.setTodaysInjections)(t));
            }
        };
    })(_);
}, 2119, [1, 11, 68, 56, 77, 892, 2029, 1219, 5, 944, 990, 2120, 1252, 1406, 1243, 2123, 1407, 1441, 2110, 1408, 2080, 2111, 2112, 1414, 80]);