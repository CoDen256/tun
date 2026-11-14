.class public Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;
.super Lio/invertase/firebase/common/UniversalFirebaseModule;
.source "UniversalFirebaseAnalyticsModule.java"


# direct methods
.method public static synthetic $r8$lambda$2LMJgBXOOBxGz62W7pzrHf1DgK4(Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;Landroid/os/Bundle;)Ljava/lang/Void;
    .locals 0

    invoke-direct {p0, p1}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->lambda$setUserProperties$5(Landroid/os/Bundle;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$E0Re0NrtcVWSoViIC5afKSnNMyc(Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;Landroid/os/Bundle;)Ljava/lang/Void;
    .locals 0

    invoke-direct {p0, p1}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->lambda$setDefaultEventParameters$7(Landroid/os/Bundle;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$SA100il2cZ6dSv1wmm4FqQz3wkY(Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;Ljava/lang/Boolean;)Ljava/lang/Void;
    .locals 0

    invoke-direct {p0, p1}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->lambda$setAnalyticsCollectionEnabled$1(Ljava/lang/Boolean;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$SynuC8JCX3ew9Vfu4EHTCYHzniQ(Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;)Ljava/lang/Void;
    .locals 0

    invoke-direct {p0}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->lambda$resetAnalyticsData$6()Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$_GiMuRr8EwfRXRYM2ZbgNqwaLcc(Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Void;
    .locals 0

    invoke-direct {p0, p1, p2}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->lambda$setUserProperty$4(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$kcei1cJzDme7Vbs15TJgBXOO25w(Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;J)Ljava/lang/Void;
    .locals 0

    invoke-direct {p0, p1, p2}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->lambda$setSessionTimeoutDuration$2(J)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$yidIZdWOrS0Urd-IVt3NRHpBqhA(Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;Ljava/lang/String;)Ljava/lang/Void;
    .locals 0

    invoke-direct {p0, p1}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->lambda$setUserId$3(Ljava/lang/String;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$zlHTyLf1hWL6yvaIeckI3A3uPI0(Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/Void;
    .locals 0

    invoke-direct {p0, p1, p2}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->lambda$logEvent$0(Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2}, Lio/invertase/firebase/common/UniversalFirebaseModule;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private synthetic lambda$logEvent$0(Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/Void;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 38
    invoke-virtual {p0}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/analytics/FirebaseAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/firebase/analytics/FirebaseAnalytics;->logEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method private synthetic lambda$resetAnalyticsData$6()Ljava/lang/Void;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 96
    invoke-virtual {p0}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/analytics/FirebaseAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/analytics/FirebaseAnalytics;->resetAnalyticsData()V

    const/4 v0, 0x0

    return-object v0
.end method

.method private synthetic lambda$setAnalyticsCollectionEnabled$1(Ljava/lang/Boolean;)Ljava/lang/Void;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 46
    invoke-virtual {p0}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/analytics/FirebaseAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/firebase/analytics/FirebaseAnalytics;->setAnalyticsCollectionEnabled(Z)V

    const/4 p1, 0x0

    return-object p1
.end method

.method private synthetic lambda$setDefaultEventParameters$7(Landroid/os/Bundle;)Ljava/lang/Void;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 104
    invoke-virtual {p0}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/analytics/FirebaseAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firebase/analytics/FirebaseAnalytics;->setDefaultEventParameters(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method private synthetic lambda$setSessionTimeoutDuration$2(J)Ljava/lang/Void;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 54
    invoke-virtual {p0}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/analytics/FirebaseAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/firebase/analytics/FirebaseAnalytics;->setSessionTimeoutDuration(J)V

    const/4 p1, 0x0

    return-object p1
.end method

.method private synthetic lambda$setUserId$3(Ljava/lang/String;)Ljava/lang/Void;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 66
    invoke-virtual {p0}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/analytics/FirebaseAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firebase/analytics/FirebaseAnalytics;->setUserId(Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method private synthetic lambda$setUserProperties$5(Landroid/os/Bundle;)Ljava/lang/Void;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 82
    invoke-virtual {p1}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 83
    invoke-virtual {p0}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/google/firebase/analytics/FirebaseAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;

    move-result-object v1

    .line 85
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 86
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/google/firebase/analytics/FirebaseAnalytics;->setUserProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private synthetic lambda$setUserProperty$4(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Void;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 74
    invoke-virtual {p0}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/analytics/FirebaseAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/firebase/analytics/FirebaseAnalytics;->setUserProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method getAppInstanceId()Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 60
    invoke-virtual {p0}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/analytics/FirebaseAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/analytics/FirebaseAnalytics;->getAppInstanceId()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method logEvent(Ljava/lang/String;Landroid/os/Bundle;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 36
    new-instance v0, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0, p1, p2}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule$$ExternalSyntheticLambda4;-><init>(Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method resetAnalyticsData()Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 94
    new-instance v0, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule$$ExternalSyntheticLambda0;-><init>(Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;)V

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method setAnalyticsCollectionEnabled(Ljava/lang/Boolean;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Boolean;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 44
    new-instance v0, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p1}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule$$ExternalSyntheticLambda2;-><init>(Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;Ljava/lang/Boolean;)V

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method setDefaultEventParameters(Landroid/os/Bundle;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 102
    new-instance v0, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule$$ExternalSyntheticLambda1;-><init>(Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;Landroid/os/Bundle;)V

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method setSessionTimeoutDuration(J)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 52
    new-instance v0, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0, p1, p2}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule$$ExternalSyntheticLambda5;-><init>(Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;J)V

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method setUserId(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 64
    new-instance v0, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0, p1}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule$$ExternalSyntheticLambda6;-><init>(Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method setUserProperties(Landroid/os/Bundle;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 80
    new-instance v0, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0, p1}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule$$ExternalSyntheticLambda7;-><init>(Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;Landroid/os/Bundle;)V

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method setUserProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 72
    new-instance v0, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0, p1, p2}, Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule$$ExternalSyntheticLambda3;-><init>(Lio/invertase/firebase/analytics/UniversalFirebaseAnalyticsModule;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
