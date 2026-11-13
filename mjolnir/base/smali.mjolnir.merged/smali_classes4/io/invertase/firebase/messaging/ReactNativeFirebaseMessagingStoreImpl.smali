.class public Lio/invertase/firebase/messaging/ReactNativeFirebaseMessagingStoreImpl;
.super Ljava/lang/Object;
.source "ReactNativeFirebaseMessagingStoreImpl.java"

# interfaces
.implements Lio/invertase/firebase/messaging/ReactNativeFirebaseMessagingStore;


# static fields
.field private static final MAX_SIZE_NOTIFICATIONS:I = 0x64

.field private static final S_KEY_ALL_NOTIFICATION_IDS:Ljava/lang/String; = "all_notification_ids"


# instance fields
.field private final DELIMITER:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ","

    iput-object v0, p0, Lio/invertase/firebase/messaging/ReactNativeFirebaseMessagingStoreImpl;->DELIMITER:Ljava/lang/String;

    return-void
.end method

.method private convertToArray(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 93
    new-instance v0, Ljava/util/ArrayList;

    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method private removeRemoteMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 89
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, ""

    invoke-virtual {p2, p1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public clearFirebaseMessage(Ljava/lang/String;)V
    .locals 4

    .line 78
    invoke-static {}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->getSharedInstance()Lio/invertase/firebase/common/UniversalFirebasePreferences;

    move-result-object v0

    .line 79
    invoke-virtual {v0, p1}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v1, ""

    const-string v2, "all_notification_ids"

    .line 81
    invoke-virtual {v0, v2, v1}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->getStringValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 82
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 83
    invoke-direct {p0, p1, v1}, Lio/invertase/firebase/messaging/ReactNativeFirebaseMessagingStoreImpl;->removeRemoteMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 84
    invoke-virtual {v0, v2, p1}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->setStringValue(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public getFirebaseMessage(Ljava/lang/String;)Lcom/google/firebase/messaging/RemoteMessage;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 52
    invoke-virtual {p0, p1}, Lio/invertase/firebase/messaging/ReactNativeFirebaseMessagingStoreImpl;->getFirebaseMessageMap(Ljava/lang/String;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 54
    invoke-static {p1}, Lio/invertase/firebase/messaging/ReactNativeFirebaseMessagingSerializer;->remoteMessageFromReadableMap(Lcom/facebook/react/bridge/ReadableMap;)Lcom/google/firebase/messaging/RemoteMessage;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getFirebaseMessageMap(Ljava/lang/String;)Lcom/facebook/react/bridge/WritableMap;
    .locals 3

    .line 62
    invoke-static {}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->getSharedInstance()Lio/invertase/firebase/common/UniversalFirebasePreferences;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->getStringValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 66
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lio/invertase/firebase/messaging/JsonConvert;->jsonToReact(Lorg/json/JSONObject;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v2, "to"

    .line 67
    invoke-interface {v0, v2, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 70
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :cond_0
    return-object v1
.end method

.method public storeFirebaseMessage(Lcom/google/firebase/messaging/RemoteMessage;)V
    .locals 5

    const-string v0, "all_notification_ids"

    .line 28
    :try_start_0
    invoke-static {p1}, Lio/invertase/firebase/messaging/ReactNativeFirebaseMessagingSerializer;->remoteMessageToWritableMap(Lcom/google/firebase/messaging/RemoteMessage;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    invoke-static {v1}, Lio/invertase/firebase/messaging/JsonConvert;->reactToJSON(Lcom/facebook/react/bridge/ReadableMap;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    .line 30
    invoke-static {}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->getSharedInstance()Lio/invertase/firebase/common/UniversalFirebasePreferences;

    move-result-object v2

    .line 31
    invoke-virtual {p1}, Lcom/google/firebase/messaging/RemoteMessage;->getMessageId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->setStringValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, ""

    .line 33
    invoke-virtual {v2, v0, v1}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->getStringValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 34
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/google/firebase/messaging/RemoteMessage;->getMessageId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 37
    invoke-direct {p0, p1}, Lio/invertase/firebase/messaging/ReactNativeFirebaseMessagingStoreImpl;->convertToArray(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 38
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    const/16 v4, 0x64

    if-le v3, v4, :cond_0

    const/4 v3, 0x0

    .line 39
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 40
    invoke-virtual {v2, v1}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 41
    invoke-direct {p0, v1, p1}, Lio/invertase/firebase/messaging/ReactNativeFirebaseMessagingStoreImpl;->removeRemoteMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 43
    :cond_0
    invoke-virtual {v2, v0, p1}, Lio/invertase/firebase/common/UniversalFirebasePreferences;->setStringValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 45
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :goto_0
    return-void
.end method
