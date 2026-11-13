.class public Lio/invertase/firebase/messaging/ReactNativeFirebaseMessagingSerializer;
.super Ljava/lang/Object;
.source "ReactNativeFirebaseMessagingSerializer.java"


# static fields
.field private static final EVENT_MESSAGES_DELETED:Ljava/lang/String; = "messaging_message_deleted"

.field private static final EVENT_MESSAGE_RECEIVED:Ljava/lang/String; = "messaging_message_received"

.field private static final EVENT_MESSAGE_SEND_ERROR:Ljava/lang/String; = "messaging_message_send_error"

.field private static final EVENT_MESSAGE_SENT:Ljava/lang/String; = "messaging_message_sent"

.field private static final EVENT_NEW_TOKEN:Ljava/lang/String; = "messaging_token_refresh"

.field private static final EVENT_NOTIFICATION_OPENED:Ljava/lang/String; = "messaging_notification_opened"

.field private static final KEY_COLLAPSE_KEY:Ljava/lang/String; = "collapseKey"

.field private static final KEY_DATA:Ljava/lang/String; = "data"

.field private static final KEY_ERROR:Ljava/lang/String; = "error"

.field private static final KEY_FROM:Ljava/lang/String; = "from"

.field private static final KEY_MESSAGE_ID:Ljava/lang/String; = "messageId"

.field private static final KEY_MESSAGE_TYPE:Ljava/lang/String; = "messageType"

.field private static final KEY_SENT_TIME:Ljava/lang/String; = "sentTime"

.field private static final KEY_TO:Ljava/lang/String; = "to"

.field private static final KEY_TOKEN:Ljava/lang/String; = "token"

.field private static final KEY_TTL:Ljava/lang/String; = "ttl"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static messageSendErrorToEvent(Ljava/lang/String;Ljava/lang/Exception;)Lio/invertase/firebase/common/ReactNativeFirebaseEvent;
    .locals 2

    .line 43
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "messageId"

    .line 44
    invoke-interface {v0, v1, p0}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "error"

    .line 45
    invoke-static {p1}, Lio/invertase/firebase/common/SharedUtils;->getExceptionMap(Ljava/lang/Exception;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    .line 46
    new-instance p0, Lio/invertase/firebase/common/ReactNativeFirebaseEvent;

    const-string p1, "messaging_message_send_error"

    invoke-direct {p0, p1, v0}, Lio/invertase/firebase/common/ReactNativeFirebaseEvent;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-object p0
.end method

.method public static messageSentToEvent(Ljava/lang/String;)Lio/invertase/firebase/common/ReactNativeFirebaseEvent;
    .locals 2

    .line 36
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "messageId"

    .line 37
    invoke-interface {v0, v1, p0}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    new-instance p0, Lio/invertase/firebase/common/ReactNativeFirebaseEvent;

    const-string v1, "messaging_message_sent"

    invoke-direct {p0, v1, v0}, Lio/invertase/firebase/common/ReactNativeFirebaseEvent;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-object p0
.end method

.method public static messagesDeletedToEvent()Lio/invertase/firebase/common/ReactNativeFirebaseEvent;
    .locals 3

    .line 32
    new-instance v0, Lio/invertase/firebase/common/ReactNativeFirebaseEvent;

    const-string v1, "messaging_message_deleted"

    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lio/invertase/firebase/common/ReactNativeFirebaseEvent;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-object v0
.end method

.method public static newTokenToTokenEvent(Ljava/lang/String;)Lio/invertase/firebase/common/ReactNativeFirebaseEvent;
    .locals 2

    .line 63
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "token"

    .line 64
    invoke-interface {v0, v1, p0}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    new-instance p0, Lio/invertase/firebase/common/ReactNativeFirebaseEvent;

    const-string v1, "messaging_token_refresh"

    invoke-direct {p0, v1, v0}, Lio/invertase/firebase/common/ReactNativeFirebaseEvent;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-object p0
.end method

.method static remoteMessageFromReadableMap(Lcom/facebook/react/bridge/ReadableMap;)Lcom/google/firebase/messaging/RemoteMessage;
    .locals 4

    .line 191
    new-instance v0, Lcom/google/firebase/messaging/RemoteMessage$Builder;

    const-string v1, "to"

    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/firebase/messaging/RemoteMessage$Builder;-><init>(Ljava/lang/String;)V

    const-string v1, "ttl"

    .line 193
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 194
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/messaging/RemoteMessage$Builder;->setTtl(I)Lcom/google/firebase/messaging/RemoteMessage$Builder;

    :cond_0
    const-string v1, "messageId"

    .line 197
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 198
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/messaging/RemoteMessage$Builder;->setMessageId(Ljava/lang/String;)Lcom/google/firebase/messaging/RemoteMessage$Builder;

    :cond_1
    const-string v1, "messageType"

    .line 201
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 202
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/messaging/RemoteMessage$Builder;->setMessageType(Ljava/lang/String;)Lcom/google/firebase/messaging/RemoteMessage$Builder;

    :cond_2
    const-string v1, "collapseKey"

    .line 205
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 206
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/messaging/RemoteMessage$Builder;->setCollapseKey(Ljava/lang/String;)Lcom/google/firebase/messaging/RemoteMessage$Builder;

    :cond_3
    const-string v1, "data"

    .line 209
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 210
    invoke-interface {p0, v1}, Lcom/facebook/react/bridge/ReadableMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object p0

    .line 211
    invoke-interface {p0}, Lcom/facebook/react/bridge/ReadableMap;->keySetIterator()Lcom/facebook/react/bridge/ReadableMapKeySetIterator;

    move-result-object v1

    .line 213
    :goto_0
    invoke-interface {v1}, Lcom/facebook/react/bridge/ReadableMapKeySetIterator;->hasNextKey()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 214
    invoke-interface {v1}, Lcom/facebook/react/bridge/ReadableMapKeySetIterator;->nextKey()Ljava/lang/String;

    move-result-object v2

    .line 215
    invoke-interface {p0, v2}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/google/firebase/messaging/RemoteMessage$Builder;->addData(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/messaging/RemoteMessage$Builder;

    goto :goto_0

    .line 219
    :cond_4
    invoke-virtual {v0}, Lcom/google/firebase/messaging/RemoteMessage$Builder;->build()Lcom/google/firebase/messaging/RemoteMessage;

    move-result-object p0

    return-object p0
.end method

.method public static remoteMessageMapToEvent(Lcom/facebook/react/bridge/WritableMap;Ljava/lang/Boolean;)Lio/invertase/firebase/common/ReactNativeFirebaseEvent;
    .locals 1

    .line 58
    new-instance v0, Lio/invertase/firebase/common/ReactNativeFirebaseEvent;

    .line 59
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "messaging_notification_opened"

    goto :goto_0

    :cond_0
    const-string p1, "messaging_message_received"

    :goto_0
    invoke-direct {v0, p1, p0}, Lio/invertase/firebase/common/ReactNativeFirebaseEvent;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-object v0
.end method

.method static remoteMessageNotificationToWritableMap(Lcom/google/firebase/messaging/RemoteMessage$Notification;)Lcom/facebook/react/bridge/WritableMap;
    .locals 4

    .line 113
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 114
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    .line 116
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getTitle()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    const-string v2, "title"

    .line 117
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    :cond_0
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getTitleLocalizationKey()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    const-string v2, "titleLocKey"

    .line 121
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getTitleLocalizationKey()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    :cond_1
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getTitleLocalizationArgs()[Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 126
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getTitleLocalizationArgs()[Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/react/bridge/Arguments;->fromJavaArgs([Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableNativeArray;

    move-result-object v2

    const-string v3, "titleLocArgs"

    .line 125
    invoke-interface {v0, v3, v2}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    .line 129
    :cond_2
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getBody()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    const-string v2, "body"

    .line 130
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getBody()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    :cond_3
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getBodyLocalizationKey()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4

    const-string v2, "bodyLocKey"

    .line 134
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getBodyLocalizationKey()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    :cond_4
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getBodyLocalizationArgs()[Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 139
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getBodyLocalizationArgs()[Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/react/bridge/Arguments;->fromJavaArgs([Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableNativeArray;

    move-result-object v2

    const-string v3, "bodyLocArgs"

    .line 138
    invoke-interface {v0, v3, v2}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    .line 142
    :cond_5
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getChannelId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    const-string v2, "channelId"

    .line 143
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getChannelId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    :cond_6
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getClickAction()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_7

    const-string v2, "clickAction"

    .line 147
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getClickAction()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    :cond_7
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getColor()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_8

    const-string v2, "color"

    .line 151
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getColor()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    :cond_8
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getIcon()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_9

    const-string v2, "smallIcon"

    .line 155
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getIcon()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    :cond_9
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getImageUrl()Landroid/net/Uri;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 159
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getImageUrl()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "imageUrl"

    invoke-interface {v1, v3, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    :cond_a
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getLink()Landroid/net/Uri;

    move-result-object v2

    if-eqz v2, :cond_b

    .line 163
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getLink()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "link"

    invoke-interface {v1, v3, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    :cond_b
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getNotificationCount()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_c

    .line 167
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getNotificationCount()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const-string v3, "count"

    invoke-interface {v1, v3, v2}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    .line 170
    :cond_c
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getNotificationPriority()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_d

    .line 171
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getNotificationPriority()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const-string v3, "priority"

    invoke-interface {v1, v3, v2}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    .line 174
    :cond_d
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getSound()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_e

    const-string v2, "sound"

    .line 175
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getSound()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    :cond_e
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getTicker()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_f

    const-string v2, "ticker"

    .line 179
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getTicker()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    :cond_f
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getVisibility()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_10

    .line 183
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage$Notification;->getVisibility()Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const-string v2, "visibility"

    invoke-interface {v1, v2, p0}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    :cond_10
    const-string p0, "android"

    .line 186
    invoke-interface {v0, p0, v1}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    return-object v0
.end method

.method public static remoteMessageToEvent(Lcom/google/firebase/messaging/RemoteMessage;Ljava/lang/Boolean;)Lio/invertase/firebase/common/ReactNativeFirebaseEvent;
    .locals 1

    .line 51
    new-instance v0, Lio/invertase/firebase/common/ReactNativeFirebaseEvent;

    .line 52
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "messaging_notification_opened"

    goto :goto_0

    :cond_0
    const-string p1, "messaging_message_received"

    .line 53
    :goto_0
    invoke-static {p0}, Lio/invertase/firebase/messaging/ReactNativeFirebaseMessagingSerializer;->remoteMessageToWritableMap(Lcom/google/firebase/messaging/RemoteMessage;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p0

    invoke-direct {v0, p1, p0}, Lio/invertase/firebase/common/ReactNativeFirebaseEvent;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-object v0
.end method

.method static remoteMessageToWritableMap(Lcom/google/firebase/messaging/RemoteMessage;)Lcom/facebook/react/bridge/WritableMap;
    .locals 5

    .line 69
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 70
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    .line 72
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage;->getCollapseKey()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    const-string v2, "collapseKey"

    .line 73
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage;->getCollapseKey()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    :cond_0
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage;->getFrom()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    const-string v2, "from"

    .line 77
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage;->getFrom()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    :cond_1
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage;->getTo()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    const-string v2, "to"

    .line 81
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage;->getTo()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    :cond_2
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage;->getMessageId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    const-string v2, "messageId"

    .line 85
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage;->getMessageId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    :cond_3
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage;->getMessageType()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4

    const-string v2, "messageType"

    .line 89
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage;->getMessageType()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    :cond_4
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage;->getData()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    if-lez v2, :cond_5

    .line 93
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage;->getData()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    .line 94
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 95
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1, v4, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    const-string v2, "data"

    .line 99
    invoke-interface {v0, v2, v1}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    .line 100
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage;->getTtl()I

    move-result v1

    int-to-double v1, v1

    const-string v3, "ttl"

    invoke-interface {v0, v3, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 101
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage;->getSentTime()J

    move-result-wide v1

    long-to-double v1, v1

    const-string v3, "sentTime"

    invoke-interface {v0, v3, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 103
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage;->getNotification()Lcom/google/firebase/messaging/RemoteMessage$Notification;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 105
    invoke-virtual {p0}, Lcom/google/firebase/messaging/RemoteMessage;->getNotification()Lcom/google/firebase/messaging/RemoteMessage$Notification;

    move-result-object p0

    invoke-static {p0}, Lio/invertase/firebase/messaging/ReactNativeFirebaseMessagingSerializer;->remoteMessageNotificationToWritableMap(Lcom/google/firebase/messaging/RemoteMessage$Notification;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p0

    const-string v1, "notification"

    .line 104
    invoke-interface {v0, v1, p0}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    :cond_6
    return-object v0
.end method
