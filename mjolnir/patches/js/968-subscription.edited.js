function _interopRequireWildcard(obj, nodeInterop) {
    if ("function" == typeof WeakMap) var cacheBabel = new WeakMap(),
        cacheNode = new WeakMap();
    return function (obj, nodeInterop) {
        if (!nodeInterop && obj && obj.__esModule) return obj;
        var desc,
            hasPropertyDescriptor,
            newObj = {
                __proto__: null,
                default: obj
            };
        if (null === obj || "object" != typeof obj && "function" != typeof obj) return newObj;
        if (desc = nodeInterop ? cacheNode : cacheBabel) {
            if (desc.has(obj)) return desc.get(obj);
            desc.set(obj, newObj);
        }
        for (var key in obj) "default" !== key && {}.hasOwnProperty.call(obj, key) && ((hasPropertyDescriptor = (desc = Object.defineProperty) && Object.getOwnPropertyDescriptor(obj, key)) && (hasPropertyDescriptor.get || hasPropertyDescriptor.set) ? desc(newObj, key, hasPropertyDescriptor) : newObj[key] = obj[key]);
        return newObj;
    }(obj, nodeInterop);
}

__d(function (g, _r, _i, a, m, _e, d) {
    Object.defineProperty(_e, "__esModule", {
        value: !0
    }), _e.default = void 0;
    var e = _interopRequireWildcard(_r(d[0]));
    var s = {
        visible_popup_preview: !0,
        visited_study_cards: !1,
        passed_onboarding: !1,
        language_level: null,
        card_frequency: null,
        total_cards: [],
        decks_info: [],
        game_decks: [],
        last_deck_pulled: -1,
        last_day_pulled: 0,
        study_day: 1,
        study_start: "ND",
        study_end: "ND",
        today_tip: 0,
        last_tip_day: null,
        last_injection_day: null,
        current_session: [],
        current_id: 0,
        current_to_graduate: 0,
        prev_session: [],
        prev_id: 0,
        prev_to_graduate: 0,
        first_card_archived: !0,
        new_counter: 0,
        reviewed_counter: 0,
        completed_counter: 0,
        prev_new_counter: 0,
        prev_reviewed_counter: 0,
        prev_completed_counter: 0,
        completed_sessions: 0,
        paywall_visible: !1,
        app_opened_counter: 0,
        last_opened_date: "ND",
        cards_purchased: !1,
        subscription_purchased: null,
        todays_injections: 0,
        max_free_app_opened_counter: 7,
        max_free_completed_sessions: 5
    };
    _e.default = function () {
        var _ = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : s,
            t = arguments.length > 1 ? arguments[1] : void 0;
        switch (t.type) {
            case e.VISIBLE_POPUP_PREVIEW:
                return Object.assign({}, _, {
                    visible_popup_preview: t.payload
                });
            case e.VISITED_STUDY_CARDS:
                return Object.assign({}, _, {
                    visited_study_cards: t.payload
                });
            case e.PASSED_INITIAL_ONBOARDING:
                return Object.assign({}, _, {
                    passed_onboarding: t.payload
                });
            case e.SET_TOTAL_CARDS:
                return Object.assign({}, _, {
                    total_cards: t.payload
                });
            case e.SET_DECKS_INFO:
                return Object.assign({}, _, {
                    decks_info: t.payload
                });
            case e.SET_DECKS:
                return Object.assign({}, _, {
                    game_decks: t.payload
                });
            case e.SET_LAST_DECK_PULLED:
                return Object.assign({}, _, {
                    last_deck_pulled: t.payload
                });
            case e.SET_LAST_DAY_PULLED:
                return Object.assign({}, _, {
                    last_day_pulled: t.payload
                });
            case e.SET_STUDY_DAY:
                return Object.assign({}, _, {
                    study_day: t.payload
                });
            case e.SET_STUDY_START:
                return Object.assign({}, _, {
                    study_start: t.payload
                });
            case e.SET_STUDY_END:
                return Object.assign({}, _, {
                    study_end: t.payload
                });
            case e.SET_TODAY_TIP:
                return Object.assign({}, _, {
                    today_tip: t.payload
                });
            case e.SET_LAST_TIP_DAY:
                return Object.assign({}, _, {
                    last_tip_day: t.payload
                });
            case e.SET_LAST_INJECTION_DAY:
                return Object.assign({}, _, {
                    last_injection_day: t.payload
                });
            case e.SET_LEVEL:
                return Object.assign({}, _, {
                    language_level: t.payload
                });
            case e.SET_FREQUENCY:
                return Object.assign({}, _, {
                    card_frequency: t.payload
                });
            case e.SET_CURRENT_SESSION:
                return Object.assign({}, _, {
                    current_session: t.payload
                });
            case e.SET_CURRENT_ID:
                return Object.assign({}, _, {
                    current_id: t.payload
                });
            case e.SET_CURRENT_TO_GRADUATE:
                return Object.assign({}, _, {
                    current_to_graduate: t.payload
                });
            case e.SET_PREV_SESSION:
                return Object.assign({}, _, {
                    prev_session: t.payload
                });
            case e.SET_PREV_ID:
                return Object.assign({}, _, {
                    prev_id: t.payload
                });
            case e.SET_PREV_TO_GRADUATE:
                return Object.assign({}, _, {
                    prev_to_graduate: t.payload
                });
            case e.SET_FIRST_CARD_ARCHIVED:
                return Object.assign({}, _, {
                    first_card_archived: t.payload
                });
            case e.SET_NEW_COUNTER:
                return Object.assign({}, _, {
                    new_counter: t.payload
                });
            case e.SET_REVIEWED_COUNTER:
                return Object.assign({}, _, {
                    reviewed_counter: t.payload
                });
            case e.SET_COMPLETED_COUNTER:
                return Object.assign({}, _, {
                    completed_counter: t.payload
                });
            case e.SET_PREV_NEW_COUNTER:
                return Object.assign({}, _, {
                    prev_new_counter: t.payload
                });
            case e.SET_PREV_REVIEWED_COUNTER:
                return Object.assign({}, _, {
                    prev_reviewed_counter: t.payload
                });
            case e.SET_PREV_COMPLETED_COUNTER:
                return Object.assign({}, _, {
                    prev_completed_counter: t.payload
                });
            case e.SET_COMPLETED_SESSIONS:
                return Object.assign({}, _, {
                    completed_sessions: t.payload
                });
            case e.SET_PAYWALL_VISIBLE:
                return Object.assign({}, _, {
                    paywall_visible: false,
                    cards_purchased: true,
                    subscription_purchased: "Yearly, renews on 27/07/2040"
                });
            case e.SET_APP_OPENED_COUNTER:
                return Object.assign({}, _, {
                    app_opened_counter: t.payload
                });
            case e.SET_LAST_OPENED_DATE:
                return Object.assign({}, _, {
                    last_opened_date: t.payload
                });
            case e.SET_CARDS_PURCHASED:
                return Object.assign({}, _, {
                    cards_purchased: t.payload
                });
            case e.SET_SUBSCRIPTION_PURCHASED:
                return Object.assign({}, _, {
                    cards_purchased: !0,
                    subscription_purchased: t.payload
                });
            case e.SET_TODAYS_INJECTIONS:
                return Object.assign({}, _, {
                    todays_injections: t.payload
                });
            case e.LOGOUT:
                return Object.assign({}, s);
            default:
                return _;
        }
    };
}, 968, [966]);