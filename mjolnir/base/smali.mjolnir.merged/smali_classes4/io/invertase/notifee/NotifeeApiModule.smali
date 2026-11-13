.class public Lio/invertase/notifee/NotifeeApiModule;
.super Lcom/facebook/react/bridge/ReactContextBaseJavaModule;
.source "NotifeeApiModule.java"


# static fields
.field private static final NOTIFICATION_TYPE_ALL:I = 0x0

.field private static final NOTIFICATION_TYPE_DISPLAYED:I = 0x1

.field private static final NOTIFICATION_TYPE_TRIGGER:I = 0x2


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-void
.end method

.method public static getMainComponent(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 31
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    invoke-virtual {v0, p0}, Lapp/notifee/core/Notifee;->getMainComponent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$cancelAllNotifications$0(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Void;)V
    .locals 0

    .line 43
    invoke-static {p0, p1}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic lambda$cancelAllNotificationsWithIds$3(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Void;)V
    .locals 0

    .line 74
    invoke-static {p0, p1}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic lambda$cancelDisplayedNotifications$1(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Void;)V
    .locals 0

    .line 51
    invoke-static {p0, p1}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic lambda$cancelTriggerNotifications$2(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Void;)V
    .locals 0

    .line 58
    invoke-static {p0, p1}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic lambda$createChannel$7(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Void;)V
    .locals 0

    .line 104
    invoke-static {p0, p1}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic lambda$createChannelGroup$9(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Void;)V
    .locals 0

    .line 123
    invoke-static {p0, p1}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic lambda$createChannelGroups$10(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Void;)V
    .locals 0

    .line 136
    invoke-static {p0, p1}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic lambda$createChannels$8(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Void;)V
    .locals 0

    .line 115
    invoke-static {p0, p1}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic lambda$createTriggerNotification$14(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Void;)V
    .locals 0

    .line 166
    invoke-static {p0, p1}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic lambda$deleteChannel$11(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Void;)V
    .locals 0

    .line 142
    invoke-static {p0, p1}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic lambda$deleteChannelGroup$12(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Void;)V
    .locals 0

    .line 148
    invoke-static {p0, p1}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic lambda$displayNotification$13(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Void;)V
    .locals 0

    .line 156
    invoke-static {p0, p1}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic lambda$getChannel$16(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Landroid/os/Bundle;)V
    .locals 0

    .line 180
    invoke-static {p0, p1, p2}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Landroid/os/Bundle;)V

    return-void
.end method

.method static synthetic lambda$getChannelGroup$18(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Landroid/os/Bundle;)V
    .locals 0

    .line 194
    invoke-static {p0, p1, p2}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Landroid/os/Bundle;)V

    return-void
.end method

.method static synthetic lambda$getChannelGroups$17(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/util/List;)V
    .locals 0

    .line 187
    invoke-static {p0, p1, p2}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/util/List;)V

    return-void
.end method

.method static synthetic lambda$getChannels$15(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/util/List;)V
    .locals 0

    .line 173
    invoke-static {p0, p1, p2}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/util/List;)V

    return-void
.end method

.method static synthetic lambda$getDisplayedNotifications$4(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/util/List;)V
    .locals 0

    .line 81
    invoke-static {p0, p1, p2}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/util/List;)V

    return-void
.end method

.method static synthetic lambda$getInitialNotification$21(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Landroid/os/Bundle;)V
    .locals 0

    .line 216
    invoke-static {p0, p1, p2}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Landroid/os/Bundle;)V

    return-void
.end method

.method static synthetic lambda$getPowerManagerInfo$25(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Landroid/os/Bundle;)V
    .locals 0

    .line 246
    invoke-static {p0, p1, p2}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Landroid/os/Bundle;)V

    return-void
.end method

.method static synthetic lambda$getTriggerNotificationIds$6(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/util/List;)V
    .locals 0

    .line 96
    invoke-static {p0, p1, p2}, Lio/invertase/notifee/NotifeeReactUtils;->promiseStringListResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/util/List;)V

    return-void
.end method

.method static synthetic lambda$getTriggerNotifications$5(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/util/List;)V
    .locals 0

    .line 88
    invoke-static {p0, p1, p2}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/util/List;)V

    return-void
.end method

.method static synthetic lambda$isBatteryOptimizationEnabled$24(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Boolean;)V
    .locals 0

    .line 239
    invoke-static {p0, p1, p2}, Lio/invertase/notifee/NotifeeReactUtils;->promiseBooleanResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Boolean;)V

    return-void
.end method

.method static synthetic lambda$isChannelBlocked$20(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Boolean;)V
    .locals 0

    .line 208
    invoke-static {p0, p1, p2}, Lio/invertase/notifee/NotifeeReactUtils;->promiseBooleanResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Boolean;)V

    return-void
.end method

.method static synthetic lambda$isChannelCreated$19(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Boolean;)V
    .locals 0

    .line 201
    invoke-static {p0, p1, p2}, Lio/invertase/notifee/NotifeeReactUtils;->promiseBooleanResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Boolean;)V

    return-void
.end method

.method static synthetic lambda$openBatteryOptimizationSettings$23(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Void;)V
    .locals 0

    .line 232
    invoke-static {p0, p1}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic lambda$openNotificationSettings$22(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Void;)V
    .locals 0

    .line 225
    invoke-static {p0, p1}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic lambda$openPowerManagerSettings$26(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Void;)V
    .locals 0

    .line 253
    invoke-static {p0, p1}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic lambda$stopForegroundService$27(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Void;)V
    .locals 0

    .line 259
    invoke-static {p0, p1}, Lio/invertase/notifee/NotifeeReactUtils;->promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method


# virtual methods
.method public addListener(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    return-void
.end method

.method public cancelAllNotifications(Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 41
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda8;

    invoke-direct {v1, p1}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda8;-><init>(Lcom/facebook/react/bridge/Promise;)V

    const/4 p1, 0x0

    .line 42
    invoke-virtual {v0, p1, v1}, Lapp/notifee/core/Notifee;->cancelAllNotifications(ILapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public cancelAllNotificationsWithIds(Lcom/facebook/react/bridge/ReadableArray;ILjava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    .line 65
    :goto_0
    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 66
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 69
    :cond_0
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object p1

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda14;

    invoke-direct {v1, p4}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda14;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 70
    invoke-virtual {p1, p2, v0, p3, v1}, Lapp/notifee/core/Notifee;->cancelAllNotificationsWithIds(ILjava/util/List;Ljava/lang/String;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public cancelDisplayedNotifications(Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 48
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda17;

    invoke-direct {v1, p1}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda17;-><init>(Lcom/facebook/react/bridge/Promise;)V

    const/4 p1, 0x1

    .line 49
    invoke-virtual {v0, p1, v1}, Lapp/notifee/core/Notifee;->cancelAllNotifications(ILapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public cancelTriggerNotifications(Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 56
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda20;

    invoke-direct {v1, p1}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda20;-><init>(Lcom/facebook/react/bridge/Promise;)V

    const/4 p1, 0x2

    .line 57
    invoke-virtual {v0, p1, v1}, Lapp/notifee/core/Notifee;->cancelAllNotifications(ILapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public createChannel(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 101
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    .line 103
    invoke-static {p1}, Lcom/facebook/react/bridge/Arguments;->toBundle(Lcom/facebook/react/bridge/ReadableMap;)Landroid/os/Bundle;

    move-result-object p1

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda13;

    invoke-direct {v1, p2}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda13;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 102
    invoke-virtual {v0, p1, v1}, Lapp/notifee/core/Notifee;->createChannel(Landroid/os/Bundle;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public createChannelGroup(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 120
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    .line 122
    invoke-static {p1}, Lcom/facebook/react/bridge/Arguments;->toBundle(Lcom/facebook/react/bridge/ReadableMap;)Landroid/os/Bundle;

    move-result-object p1

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda4;

    invoke-direct {v1, p2}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda4;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 121
    invoke-virtual {v0, p1, v1}, Lapp/notifee/core/Notifee;->createChannelGroup(Landroid/os/Bundle;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public createChannelGroups(Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 128
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    .line 130
    :goto_0
    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 131
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableArray;->getMap(I)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/react/bridge/Arguments;->toBundle(Lcom/facebook/react/bridge/ReadableMap;)Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 134
    :cond_0
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object p1

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda6;

    invoke-direct {v1, p2}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda6;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 135
    invoke-virtual {p1, v0, v1}, Lapp/notifee/core/Notifee;->createChannelGroups(Ljava/util/List;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public createChannels(Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 109
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    .line 110
    :goto_0
    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 111
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableArray;->getMap(I)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/react/bridge/Arguments;->toBundle(Lcom/facebook/react/bridge/ReadableMap;)Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 114
    :cond_0
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object p1

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda22;

    invoke-direct {v1, p2}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda22;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 115
    invoke-virtual {p1, v0, v1}, Lapp/notifee/core/Notifee;->createChannels(Ljava/util/List;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public createTriggerNotification(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 162
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    .line 164
    invoke-static {p1}, Lcom/facebook/react/bridge/Arguments;->toBundle(Lcom/facebook/react/bridge/ReadableMap;)Landroid/os/Bundle;

    move-result-object p1

    .line 165
    invoke-static {p2}, Lcom/facebook/react/bridge/Arguments;->toBundle(Lcom/facebook/react/bridge/ReadableMap;)Landroid/os/Bundle;

    move-result-object p2

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda23;

    invoke-direct {v1, p3}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda23;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 163
    invoke-virtual {v0, p1, p2, v1}, Lapp/notifee/core/Notifee;->createTriggerNotification(Landroid/os/Bundle;Landroid/os/Bundle;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public deleteChannel(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 141
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda19;

    invoke-direct {v1, p2}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda19;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 142
    invoke-virtual {v0, p1, v1}, Lapp/notifee/core/Notifee;->deleteChannel(Ljava/lang/String;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public deleteChannelGroup(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 147
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda27;

    invoke-direct {v1, p2}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda27;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 148
    invoke-virtual {v0, p1, v1}, Lapp/notifee/core/Notifee;->deleteChannelGroup(Ljava/lang/String;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public displayNotification(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 153
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    .line 155
    invoke-static {p1}, Lcom/facebook/react/bridge/Arguments;->toBundle(Lcom/facebook/react/bridge/ReadableMap;)Landroid/os/Bundle;

    move-result-object p1

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda11;

    invoke-direct {v1, p2}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda11;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 154
    invoke-virtual {v0, p1, v1}, Lapp/notifee/core/Notifee;->displayNotification(Landroid/os/Bundle;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public getChannel(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 178
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda15;

    invoke-direct {v1, p2}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda15;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 179
    invoke-virtual {v0, p1, v1}, Lapp/notifee/core/Notifee;->getChannel(Ljava/lang/String;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public getChannelGroup(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 192
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda24;

    invoke-direct {v1, p2}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda24;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 193
    invoke-virtual {v0, p1, v1}, Lapp/notifee/core/Notifee;->getChannel(Ljava/lang/String;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public getChannelGroups(Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 185
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda16;

    invoke-direct {v1, p1}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda16;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 186
    invoke-virtual {v0, v1}, Lapp/notifee/core/Notifee;->getChannelGroups(Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public getChannels(Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 171
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda9;

    invoke-direct {v1, p1}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda9;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 172
    invoke-virtual {v0, v1}, Lapp/notifee/core/Notifee;->getChannels(Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public getConstants()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 285
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 286
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ANDROID_API_LEVEL"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public getDisplayedNotifications(Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 79
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda1;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 80
    invoke-virtual {v0, v1}, Lapp/notifee/core/Notifee;->getDisplayedNotifications(Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public getInitialNotification(Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 213
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    .line 215
    invoke-virtual {p0}, Lio/invertase/notifee/NotifeeApiModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda0;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 214
    invoke-virtual {v0, v1, v2}, Lapp/notifee/core/Notifee;->getInitialNotification(Landroid/app/Activity;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "NotifeeApiModule"

    return-object v0
.end method

.method public getPowerManagerInfo(Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 244
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda21;

    invoke-direct {v1, p1}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda21;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 245
    invoke-virtual {v0, v1}, Lapp/notifee/core/Notifee;->getPowerManagerInfo(Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public getTriggerNotificationIds(Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 93
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda26;

    invoke-direct {v1, p1}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda26;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 94
    invoke-virtual {v0, v1}, Lapp/notifee/core/Notifee;->getTriggerNotificationIds(Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public getTriggerNotifications(Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 86
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda2;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 87
    invoke-virtual {v0, v1}, Lapp/notifee/core/Notifee;->getTriggerNotifications(Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public hideNotificationDrawer()V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 264
    invoke-static {}, Lio/invertase/notifee/NotifeeReactUtils;->hideNotificationDrawer()V

    return-void
.end method

.method public isBatteryOptimizationEnabled(Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 237
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda12;

    invoke-direct {v1, p1}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda12;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 238
    invoke-virtual {v0, v1}, Lapp/notifee/core/Notifee;->isBatteryOptimizationEnabled(Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public isChannelBlocked(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 206
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda7;

    invoke-direct {v1, p2}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda7;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 207
    invoke-virtual {v0, p1, v1}, Lapp/notifee/core/Notifee;->isChannelBlocked(Ljava/lang/String;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public isChannelCreated(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 199
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda3;

    invoke-direct {v1, p2}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda3;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 200
    invoke-virtual {v0, p1, v1}, Lapp/notifee/core/Notifee;->isChannelCreated(Ljava/lang/String;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public onCatalystInstanceDestroy()V
    .locals 0

    .line 36
    invoke-static {}, Lio/invertase/notifee/NotifeeReactUtils;->clearRunningHeadlessTasks()V

    return-void
.end method

.method public openBatteryOptimizationSettings(Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 230
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    .line 232
    invoke-virtual {p0}, Lio/invertase/notifee/NotifeeApiModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda10;

    invoke-direct {v2, p1}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda10;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 231
    invoke-virtual {v0, v1, v2}, Lapp/notifee/core/Notifee;->openBatteryOptimizationSettings(Landroid/app/Activity;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public openNotificationSettings(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 221
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    .line 224
    invoke-virtual {p0}, Lio/invertase/notifee/NotifeeApiModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda25;

    invoke-direct {v2, p2}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda25;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 222
    invoke-virtual {v0, p1, v1, v2}, Lapp/notifee/core/Notifee;->openNotificationSettings(Ljava/lang/String;Landroid/app/Activity;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public openPowerManagerSettings(Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 251
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    .line 253
    invoke-virtual {p0}, Lio/invertase/notifee/NotifeeApiModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda18;

    invoke-direct {v2, p1}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda18;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 252
    invoke-virtual {v0, v1, v2}, Lapp/notifee/core/Notifee;->openPowerManagerSettings(Landroid/app/Activity;Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public removeListeners(Ljava/lang/Integer;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    return-void
.end method

.method public stopForegroundService(Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 258
    invoke-static {}, Lapp/notifee/core/Notifee;->getInstance()Lapp/notifee/core/Notifee;

    move-result-object v0

    new-instance v1, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda5;

    invoke-direct {v1, p1}, Lio/invertase/notifee/NotifeeApiModule$$ExternalSyntheticLambda5;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 259
    invoke-virtual {v0, v1}, Lapp/notifee/core/Notifee;->stopForegroundService(Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method
