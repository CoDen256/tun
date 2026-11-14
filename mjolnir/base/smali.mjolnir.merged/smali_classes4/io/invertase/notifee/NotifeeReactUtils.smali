.class Lio/invertase/notifee/NotifeeReactUtils;
.super Ljava/lang/Object;
.source "NotifeeReactUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;
    }
.end annotation


# static fields
.field private static final headlessTasks:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;",
            ">;"
        }
    .end annotation
.end field

.field private static final headlessTasksListener:Lcom/facebook/react/jstasks/HeadlessJsTaskEventListener;


# direct methods
.method static bridge synthetic -$$Nest$sfgetheadlessTasks()Landroid/util/SparseArray;
    .locals 1

    sget-object v0, Lio/invertase/notifee/NotifeeReactUtils;->headlessTasks:Landroid/util/SparseArray;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 35
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lio/invertase/notifee/NotifeeReactUtils;->headlessTasks:Landroid/util/SparseArray;

    .line 36
    new-instance v0, Lio/invertase/notifee/NotifeeReactUtils$1;

    invoke-direct {v0}, Lio/invertase/notifee/NotifeeReactUtils$1;-><init>()V

    sput-object v0, Lio/invertase/notifee/NotifeeReactUtils;->headlessTasksListener:Lcom/facebook/react/jstasks/HeadlessJsTaskEventListener;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static clearRunningHeadlessTasks()V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    sget-object v1, Lio/invertase/notifee/NotifeeReactUtils;->headlessTasks:Landroid/util/SparseArray;

    .line 136
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 137
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;

    .line 138
    invoke-interface {v2}, Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;->call()V

    .line 139
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->remove(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static getReactContext()Lcom/facebook/react/bridge/ReactContext;
    .locals 1

    .line 110
    invoke-static {}, Lapp/notifee/core/EventSubscriber;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/ReactApplication;

    invoke-interface {v0}, Lcom/facebook/react/ReactApplication;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object v0

    .line 111
    invoke-virtual {v0}, Lcom/facebook/react/ReactNativeHost;->getReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;

    move-result-object v0

    .line 112
    invoke-virtual {v0}, Lcom/facebook/react/ReactInstanceManager;->getCurrentReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    return-object v0
.end method

.method static hideNotificationDrawer()V
    .locals 5

    .line 229
    invoke-static {}, Lapp/notifee/core/EventSubscriber;->getContext()Landroid/content/Context;

    move-result-object v0

    :try_start_0
    const-string v1, "statusbar"

    .line 233
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "android.app.StatusBarManager"

    .line 234
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "collapsePanels"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    .line 236
    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x1

    .line 237
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v2, v3, [Ljava/lang/Object;

    .line 238
    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "HIDE_NOTIF_DRAWER"

    const-string v2, ""

    .line 240
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method private static initializeReactContext(Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;)V
    .locals 2

    .line 117
    invoke-static {}, Lapp/notifee/core/EventSubscriber;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/ReactApplication;

    invoke-interface {v0}, Lcom/facebook/react/ReactApplication;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object v0

    .line 119
    invoke-virtual {v0}, Lcom/facebook/react/ReactNativeHost;->getReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;

    move-result-object v0

    .line 121
    new-instance v1, Lio/invertase/notifee/NotifeeReactUtils$2;

    invoke-direct {v1, v0, p0}, Lio/invertase/notifee/NotifeeReactUtils$2;-><init>(Lcom/facebook/react/ReactInstanceManager;Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;)V

    invoke-virtual {v0, v1}, Lcom/facebook/react/ReactInstanceManager;->addReactInstanceEventListener(Lcom/facebook/react/ReactInstanceEventListener;)V

    .line 130
    invoke-virtual {v0}, Lcom/facebook/react/ReactInstanceManager;->hasStartedCreatingInitialContext()Z

    move-result p0

    if-nez p0, :cond_0

    .line 131
    invoke-virtual {v0}, Lcom/facebook/react/ReactInstanceManager;->createReactContextInBackground()V

    :cond_0
    return-void
.end method

.method static isAppInForeground()Z
    .locals 7

    .line 199
    invoke-static {}, Lapp/notifee/core/EventSubscriber;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "activity"

    .line 202
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return v2

    .line 206
    :cond_0
    invoke-virtual {v1}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v1

    if-nez v1, :cond_1

    return v2

    .line 209
    :cond_1
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 210
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 211
    iget v5, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    const/16 v6, 0x64

    if-ne v5, v6, :cond_2

    iget-object v4, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    .line 212
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/4 v1, 0x1

    .line 216
    :try_start_0
    check-cast v0, Lcom/facebook/react/bridge/ReactContext;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 221
    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReactContext;->getLifecycleState()Lcom/facebook/react/common/LifecycleState;

    move-result-object v0

    sget-object v3, Lcom/facebook/react/common/LifecycleState;->RESUMED:Lcom/facebook/react/common/LifecycleState;

    if-ne v0, v3, :cond_3

    move v2, v1

    :cond_3
    return v2

    :catch_0
    return v1

    :cond_4
    return v2
.end method

.method static synthetic lambda$startHeadlessTask$0(Lcom/facebook/react/jstasks/HeadlessJsTaskContext;Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;)V
    .locals 2

    sget-object v0, Lio/invertase/notifee/NotifeeReactUtils;->headlessTasks:Landroid/util/SparseArray;

    .line 163
    monitor-enter v0

    .line 164
    :try_start_0
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lio/invertase/notifee/NotifeeReactUtils;->headlessTasksListener:Lcom/facebook/react/jstasks/HeadlessJsTaskEventListener;

    .line 165
    invoke-virtual {p0, v1}, Lcom/facebook/react/jstasks/HeadlessJsTaskContext;->removeTaskEventListener(Lcom/facebook/react/jstasks/HeadlessJsTaskEventListener;)V

    .line 167
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_1

    .line 169
    invoke-interface {p1}, Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;->call()V

    :cond_1
    return-void

    :catchall_0
    move-exception p0

    .line 167
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method static synthetic lambda$startHeadlessTask$1(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;JLio/invertase/notifee/NotifeeReactUtils$GenericCallback;)V
    .locals 8

    .line 150
    invoke-static {}, Lio/invertase/notifee/NotifeeReactUtils;->getReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/react/jstasks/HeadlessJsTaskContext;->getInstance(Lcom/facebook/react/bridge/ReactContext;)Lcom/facebook/react/jstasks/HeadlessJsTaskContext;

    move-result-object v0

    .line 151
    new-instance v7, Lcom/facebook/react/jstasks/HeadlessJsTaskConfig;

    const/4 v6, 0x1

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-wide v4, p2

    invoke-direct/range {v1 .. v6}, Lcom/facebook/react/jstasks/HeadlessJsTaskConfig;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;JZ)V

    sget-object p0, Lio/invertase/notifee/NotifeeReactUtils;->headlessTasks:Landroid/util/SparseArray;

    .line 154
    monitor-enter p0

    .line 155
    :try_start_0
    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    move-result p1

    if-nez p1, :cond_0

    sget-object p1, Lio/invertase/notifee/NotifeeReactUtils;->headlessTasksListener:Lcom/facebook/react/jstasks/HeadlessJsTaskEventListener;

    .line 156
    invoke-virtual {v0, p1}, Lcom/facebook/react/jstasks/HeadlessJsTaskContext;->addTaskEventListener(Lcom/facebook/react/jstasks/HeadlessJsTaskEventListener;)V

    .line 158
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    invoke-virtual {v0, v7}, Lcom/facebook/react/jstasks/HeadlessJsTaskContext;->startTask(Lcom/facebook/react/jstasks/HeadlessJsTaskConfig;)I

    move-result p1

    new-instance p2, Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda1;

    invoke-direct {p2, v0, p4}, Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda1;-><init>(Lcom/facebook/react/jstasks/HeadlessJsTaskContext;Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;)V

    .line 160
    invoke-virtual {p0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void

    :catchall_0
    move-exception p1

    .line 158
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method static promiseBooleanResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/lang/Boolean;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 80
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 82
    :cond_0
    invoke-interface {p0, p2}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method static promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 102
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 104
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method static promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Landroid/os/Bundle;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 56
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    .line 58
    invoke-static {p2}, Lcom/facebook/react/bridge/Arguments;->fromBundle(Landroid/os/Bundle;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 60
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method static promiseResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/Promise;",
            "Ljava/lang/Exception;",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 67
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 69
    :cond_0
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object p1

    .line 70
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    .line 71
    invoke-static {v0}, Lcom/facebook/react/bridge/Arguments;->fromBundle(Landroid/os/Bundle;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/WritableArray;->pushMap(Lcom/facebook/react/bridge/ReadableMap;)V

    goto :goto_0

    .line 73
    :cond_1
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    :goto_1
    return-void
.end method

.method static promiseStringListResolver(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/Promise;",
            "Ljava/lang/Exception;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 89
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 91
    :cond_0
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object p1

    .line 92
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 93
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/WritableArray;->pushString(Ljava/lang/String;)V

    goto :goto_0

    .line 95
    :cond_1
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    :goto_1
    return-void
.end method

.method static sendEvent(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V
    .locals 2

    .line 183
    :try_start_0
    invoke-static {}, Lio/invertase/notifee/NotifeeReactUtils;->getReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 185
    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReactContext;->hasActiveCatalystInstance()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 189
    :cond_0
    const-class v1, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;

    .line 190
    invoke-virtual {v0, v1}, Lcom/facebook/react/bridge/ReactContext;->getJSModule(Ljava/lang/Class;)Lcom/facebook/react/bridge/JavaScriptModule;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;

    .line 191
    invoke-interface {v0, p0, p1}, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;->emit(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception p0

    const-string p1, "SEND_EVENT"

    const-string v0, ""

    .line 194
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return-void
.end method

.method static startHeadlessTask(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;JLio/invertase/notifee/NotifeeReactUtils$GenericCallback;)V
    .locals 7

    .line 148
    new-instance v6, Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda0;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    move-wide v3, p2

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;JLio/invertase/notifee/NotifeeReactUtils$GenericCallback;)V

    .line 174
    invoke-static {}, Lio/invertase/notifee/NotifeeReactUtils;->getReactContext()Lcom/facebook/react/bridge/ReactContext;

    move-result-object p0

    if-nez p0, :cond_0

    .line 175
    invoke-static {v6}, Lio/invertase/notifee/NotifeeReactUtils;->initializeReactContext(Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;)V

    goto :goto_0

    .line 177
    :cond_0
    invoke-interface {v6}, Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;->call()V

    :goto_0
    return-void
.end method
