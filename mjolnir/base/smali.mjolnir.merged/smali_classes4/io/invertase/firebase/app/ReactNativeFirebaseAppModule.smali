.class public Lio/invertase/firebase/app/ReactNativeFirebaseAppModule;
.super Lio/invertase/firebase/common/ReactNativeFirebaseModule;
.source "ReactNativeFirebaseAppModule.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "App"


# direct methods
.method constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 1

    const-string v0, "App"

    .line 42
    invoke-direct {p0, p1, v0}, Lio/invertase/firebase/common/ReactNativeFirebaseModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public addListener(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    return-void
.end method

.method public deleteApp(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 68
    invoke-static {p1}, Lcom/google/firebase/FirebaseApp;->getInstance(Ljava/lang/String;)Lcom/google/firebase/FirebaseApp;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 71
    invoke-virtual {p1}, Lcom/google/firebase/FirebaseApp;->delete()V

    :cond_0
    const/4 p1, 0x0

    .line 74
    invoke-interface {p2, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public eventsAddListener(Ljava/lang/String;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 100
    invoke-static {}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->getSharedInstance()Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;

    move-result-object v0

    .line 101
    invoke-virtual {v0, p1}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->addListener(Ljava/lang/String;)V

    return-void
.end method

.method public eventsGetListeners(Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 85
    invoke-static {}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->getSharedInstance()Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;

    move-result-object v0

    .line 86
    invoke-virtual {v0}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->getListenersMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public eventsNotifyReady(Ljava/lang/Boolean;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 79
    invoke-static {}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->getSharedInstance()Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;

    move-result-object v0

    .line 80
    invoke-virtual {v0, p1}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->notifyJsReady(Ljava/lang/Boolean;)V

    return-void
.end method

.method public eventsPing(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 91
    invoke-static {}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->getSharedInstance()Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;

    move-result-object v0

    .line 92
    new-instance v1, Lio/invertase/firebase/common/ReactNativeFirebaseEvent;

    .line 94
    invoke-static {p2}, Lio/invertase/firebase/common/RCTConvertFirebase;->readableMapToWritableMap(Lcom/facebook/react/bridge/ReadableMap;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Lio/invertase/firebase/common/ReactNativeFirebaseEvent;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    .line 92
    invoke-virtual {v0, v1}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->sendEvent(Lio/invertase/firebase/interfaces/NativeEvent;)V

    .line 95
    invoke-static {p2}, Lio/invertase/firebase/common/RCTConvertFirebase;->readableMapToWritableMap(Lcom/facebook/react/bridge/ReadableMap;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    invoke-interface {p3, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public eventsRemoveListener(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 106
    invoke-static {}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->getSharedInstance()Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;

    move-result-object v0

    .line 107
    invoke-virtual {v0, p1, p2}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->removeListener(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public getConstants()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 158
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 159
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 160
    invoke-virtual {p0}, Lio/invertase/firebase/app/ReactNativeFirebaseAppModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v2

    invoke-static {v2}, Lcom/google/firebase/FirebaseApp;->getApps(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    .line 162
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/FirebaseApp;

    .line 163
    invoke-static {v3}, Lio/invertase/firebase/common/RCTConvertFirebase;->firebaseAppToMap(Lcom/google/firebase/FirebaseApp;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const-string v2, "NATIVE_FIREBASE_APPS"

    .line 166
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    invoke-static {}, Lio/invertase/firebase/common/ReactNativeFirebaseJSON;->getSharedInstance()Lio/invertase/firebase/common/ReactNativeFirebaseJSON;

    move-result-object v1

    invoke-virtual {v1}, Lio/invertase/firebase/common/ReactNativeFirebaseJSON;->getRawJSON()Ljava/lang/String;

    move-result-object v1

    const-string v2, "FIREBASE_RAW_JSON"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public initialize()V
    .locals 2

    .line 47
    invoke-super {p0}, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->initialize()V

    .line 48
    invoke-static {}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->getSharedInstance()Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;

    move-result-object v0

    invoke-virtual {p0}, Lio/invertase/firebase/app/ReactNativeFirebaseAppModule;->getContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->attachReactContext(Lcom/facebook/react/bridge/ReactContext;)V

    return-void
.end method

.method public initializeApp(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 54
    invoke-virtual {p0}, Lio/invertase/firebase/app/ReactNativeFirebaseAppModule;->getContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lio/invertase/firebase/common/RCTConvertFirebase;->readableMapToFirebaseApp(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Landroid/content/Context;)Lcom/google/firebase/FirebaseApp;

    move-result-object p1

    .line 56
    invoke-static {p1}, Lio/invertase/firebase/common/RCTConvertFirebase;->firebaseAppToWritableMap(Lcom/google/firebase/FirebaseApp;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    .line 57
    invoke-interface {p3, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public jsonGetAll(Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 129
    invoke-static {}, Lio/invertase/firebase/common/ReactNativeFirebaseJSON;->getSharedInstance()Lio/invertase/firebase/common/ReactNativeFirebaseJSON;

    move-result-object v0

    invoke-virtual {v0}, Lio/invertase/firebase/common/ReactNativeFirebaseJSON;->getAll()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public metaGetAll(Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 123
    invoke-static {}, Lio/invertase/firebase/common/ReactNativeFirebaseMeta;->getSharedInstance()Lio/invertase/firebase/common/ReactNativeFirebaseMeta;

    move-result-object v0

    invoke-virtual {v0}, Lio/invertase/firebase/common/ReactNativeFirebaseMeta;->getAll()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public preferencesClearAll(Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 152
    invoke-static {}, Lio/invertase/firebase/common/ReactNativeFirebasePreferences;->getSharedInstance()Lio/invertase/firebase/common/ReactNativeFirebasePreferences;

    move-result-object v0

    invoke-virtual {v0}, Lio/invertase/firebase/common/ReactNativeFirebasePreferences;->clearAll()V

    const/4 v0, 0x0

    .line 153
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public preferencesGetAll(Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 147
    invoke-static {}, Lio/invertase/firebase/common/ReactNativeFirebasePreferences;->getSharedInstance()Lio/invertase/firebase/common/ReactNativeFirebasePreferences;

    move-result-object v0

    invoke-virtual {v0}, Lio/invertase/firebase/common/ReactNativeFirebasePreferences;->getAll()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public preferencesSetBool(Ljava/lang/String;ZLcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 135
    invoke-static {}, Lio/invertase/firebase/common/ReactNativeFirebasePreferences;->getSharedInstance()Lio/invertase/firebase/common/ReactNativeFirebasePreferences;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lio/invertase/firebase/common/ReactNativeFirebasePreferences;->setBooleanValue(Ljava/lang/String;Z)V

    const/4 p1, 0x0

    .line 136
    invoke-interface {p3, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public preferencesSetString(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 141
    invoke-static {}, Lio/invertase/firebase/common/ReactNativeFirebasePreferences;->getSharedInstance()Lio/invertase/firebase/common/ReactNativeFirebasePreferences;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lio/invertase/firebase/common/ReactNativeFirebasePreferences;->setStringValue(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 142
    invoke-interface {p3, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public removeListeners(Ljava/lang/Integer;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    return-void
.end method

.method public setAutomaticDataCollectionEnabled(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 62
    invoke-static {p1}, Lcom/google/firebase/FirebaseApp;->getInstance(Ljava/lang/String;)Lcom/google/firebase/FirebaseApp;

    move-result-object p1

    .line 63
    invoke-virtual {p1, p2}, Lcom/google/firebase/FirebaseApp;->setDataCollectionDefaultEnabled(Ljava/lang/Boolean;)V

    return-void
.end method
