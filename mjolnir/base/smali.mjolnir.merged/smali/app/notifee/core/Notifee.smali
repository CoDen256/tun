.class public Lapp/notifee/core/Notifee;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Lapp/notifee/core/Notifee;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(Landroid/content/Intent;)V
    .locals 1

    .line 5
    invoke-static {}, Lapp/notifee/core/Notifee;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic a(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Void;

    invoke-interface {p0, v1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static synthetic b(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Void;

    invoke-interface {p0, v1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static synthetic c(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Void;

    invoke-interface {p0, v1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static configure(Lapp/notifee/core/NotifeeConfig;)V
    .locals 3

    const-class v0, Lapp/notifee/core/Notifee;

    .line 1
    monitor-enter v0

    :try_start_0
    sget-object v1, Lapp/notifee/core/Notifee;->a:Lapp/notifee/core/Notifee;

    if-nez v1, :cond_1

    const-class v1, Lapp/notifee/core/Notifee;

    .line 3
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    sget-object v2, Lapp/notifee/core/Notifee;->a:Lapp/notifee/core/Notifee;

    if-eqz v2, :cond_0

    .line 4
    monitor-exit v1

    goto :goto_0

    .line 5
    :cond_0
    new-instance v2, Lapp/notifee/core/Notifee;

    invoke-direct {v2}, Lapp/notifee/core/Notifee;-><init>()V

    sput-object v2, Lapp/notifee/core/Notifee;->a:Lapp/notifee/core/Notifee;

    .line 6
    iget-object p0, p0, Lapp/notifee/core/NotifeeConfig;->a:Lapp/notifee/core/interfaces/EventListener;

    .line 7
    invoke-static {p0}, Lapp/notifee/core/EventSubscriber;->register(Lapp/notifee/core/interfaces/EventListener;)V

    .line 8
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p0

    .line 9
    :cond_1
    :goto_0
    monitor-exit v0

    return-void

    :catchall_1
    move-exception p0

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p0
.end method

.method public static synthetic d(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Void;

    invoke-interface {p0, v1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static synthetic e(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Void;

    invoke-interface {p0, v1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static synthetic f(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Void;

    invoke-interface {p0, v1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static synthetic g(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-interface {p0, v1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object v0

    const-string v2, "API"

    const-string v3, "createTriggerNotification"

    invoke-static {v2, v3, v0}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static getContext()Landroid/content/Context;
    .locals 1

    .line 1
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    return-object v0
.end method

.method public static getInstance()Lapp/notifee/core/Notifee;
    .locals 1

    sget-object v0, Lapp/notifee/core/Notifee;->a:Lapp/notifee/core/Notifee;

    return-object v0
.end method

.method public static synthetic h(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-interface {p0, v1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object v0

    const-string v2, "API"

    const-string v3, "displayNotification"

    invoke-static {v2, v3, v0}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static synthetic i(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Bundle;

    invoke-interface {p0, v1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static synthetic j(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Bundle;

    invoke-interface {p0, v1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static synthetic k(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-interface {p0, v1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static synthetic l(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-interface {p0, v1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static synthetic m(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-interface {p0, v1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static synthetic n(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-interface {p0, v1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static synthetic o(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-interface {p0, v1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public cancelAllNotifications(ILapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lapp/notifee/core/c;->a(I)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda13;

    invoke-direct {v0, p2}, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda13;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 2
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public cancelAllNotificationsWithIds(ILjava/util/List;Ljava/lang/String;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Lapp/notifee/core/c;->a(ILjava/util/List;Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda12;

    invoke-direct {p2, p4}, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda12;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 2
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public createChannel(Landroid/os/Bundle;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ln/o/t/i/f/e/e/b;

    invoke-direct {v0, p1}, Ln/o/t/i/f/e/e/b;-><init>(Landroid/os/Bundle;)V

    .line 2
    invoke-static {v0}, Lapp/notifee/core/a;->a(Ln/o/t/i/f/e/e/b;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda9;

    invoke-direct {v0, p2}, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda9;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 3
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public createChannelGroup(Landroid/os/Bundle;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ln/o/t/i/f/e/e/a;

    invoke-direct {v0, p1}, Ln/o/t/i/f/e/e/a;-><init>(Landroid/os/Bundle;)V

    .line 2
    invoke-static {v0}, Lapp/notifee/core/a;->a(Ln/o/t/i/f/e/e/a;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda3;

    invoke-direct {v0, p2}, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda3;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 3
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public createChannelGroups(Ljava/util/List;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 2
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;

    .line 3
    new-instance v2, Ln/o/t/i/f/e/e/a;

    invoke-direct {v2, v1}, Ln/o/t/i/f/e/e/a;-><init>(Landroid/os/Bundle;)V

    .line 4
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 7
    :cond_0
    invoke-static {v0}, Lapp/notifee/core/a;->a(Ljava/util/List;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda8;

    invoke-direct {v0, p2}, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda8;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 8
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public createChannels(Ljava/util/List;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 2
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;

    .line 3
    new-instance v2, Ln/o/t/i/f/e/e/b;

    invoke-direct {v2, v1}, Ln/o/t/i/f/e/e/b;-><init>(Landroid/os/Bundle;)V

    .line 4
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 7
    :cond_0
    invoke-static {v0}, Lapp/notifee/core/a;->b(Ljava/util/List;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda6;

    invoke-direct {v0, p2}, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda6;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 8
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public createTriggerNotification(Landroid/os/Bundle;Landroid/os/Bundle;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            "Landroid/os/Bundle;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lapp/notifee/core/model/NotificationModel;

    invoke-direct {v0, p1}, Lapp/notifee/core/model/NotificationModel;-><init>(Landroid/os/Bundle;)V

    .line 2
    invoke-static {v0, p2}, Lapp/notifee/core/c;->a(Lapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda0;

    invoke-direct {p2, p3}, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda0;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 3
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public deleteChannel(Ljava/lang/String;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lapp/notifee/core/a;->a:Ljava/util/concurrent/ExecutorService;

    .line 2
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 3
    invoke-static {v0}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object v0

    .line 4
    invoke-virtual {v0, p1}, Landroidx/core/app/NotificationManagerCompat;->deleteNotificationChannel(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 5
    invoke-interface {p2, p1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    return-void
.end method

.method public deleteChannelGroup(Ljava/lang/String;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lapp/notifee/core/a;->a:Ljava/util/concurrent/ExecutorService;

    .line 2
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 3
    invoke-static {v0}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object v0

    .line 4
    invoke-virtual {v0, p1}, Landroidx/core/app/NotificationManagerCompat;->deleteNotificationChannelGroup(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 5
    invoke-interface {p2, p1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    return-void
.end method

.method public displayNotification(Landroid/os/Bundle;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lapp/notifee/core/model/NotificationModel;

    invoke-direct {v0, p1}, Lapp/notifee/core/model/NotificationModel;-><init>(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    .line 2
    invoke-static {v0, p1}, Lapp/notifee/core/c;->b(Lapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda14;

    invoke-direct {v0, p2}, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda14;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 3
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public getChannel(Ljava/lang/String;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lapp/notifee/core/a;->a(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda11;

    invoke-direct {v0, p2}, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda11;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 2
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public getChannelGroup(Ljava/lang/String;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lapp/notifee/core/a;->b(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda1;

    invoke-direct {v0, p2}, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda1;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 2
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public getChannelGroups(Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lapp/notifee/core/a;->a()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda7;

    invoke-direct {v1, p1}, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda7;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 2
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public getChannels(Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lapp/notifee/core/a;->b()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda4;

    invoke-direct {v1, p1}, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda4;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 2
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public getDisplayedNotifications(Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lapp/notifee/core/c;->a()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda5;

    invoke-direct {v1, p1}, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda5;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 2
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public getInitialNotification(Landroid/app/Activity;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ln/o/t/i/f/e/e/e;->b:Ln/o/t/i/f/e/e/e;

    .line 2
    iget-object v0, v0, Ln/o/t/i/f/e/e/e;->a:Lorg/greenrobot/eventbus/EventBus;

    .line 3
    const-class v1, Ln/o/t/i/f/e/e/f;

    invoke-virtual {v0, v1}, Lorg/greenrobot/eventbus/EventBus;->removeStickyEvent(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 4
    check-cast v0, Ln/o/t/i/f/e/e/f;

    .line 5
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const/4 v2, 0x0

    const-string v3, "notification"

    if-eqz v0, :cond_0

    .line 6
    iget-object p1, v0, Ln/o/t/i/f/e/e/f;->b:Landroid/os/Bundle;

    .line 7
    invoke-virtual {v1, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 8
    iget-object p1, v0, Ln/o/t/i/f/e/e/f;->a:Lapp/notifee/core/model/NotificationModel;

    .line 9
    invoke-virtual {p1}, Lapp/notifee/core/model/NotificationModel;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v1, v3, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 10
    invoke-interface {p2, v2, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 15
    :try_start_0
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 16
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 18
    invoke-virtual {p1, v3}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    .line 19
    invoke-virtual {v1, v3, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 21
    invoke-interface {p2, v2, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const-string v0, "API"

    const-string v1, "getInitialNotification"

    .line 25
    invoke-static {v0, v1, p1}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 30
    :cond_1
    invoke-interface {p2, v2, v2}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    return-void
.end method

.method public getMainComponent(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Ln/o/t/i/f/e/e/e;->b:Ln/o/t/i/f/e/e/e;

    .line 2
    iget-object v0, v0, Ln/o/t/i/f/e/e/e;->a:Lorg/greenrobot/eventbus/EventBus;

    .line 3
    const-class v1, Ln/o/t/i/f/e/e/h;

    invoke-virtual {v0, v1}, Lorg/greenrobot/eventbus/EventBus;->removeStickyEvent(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 4
    check-cast v0, Ln/o/t/i/f/e/e/h;

    if-nez v0, :cond_0

    return-object p1

    .line 5
    :cond_0
    iget-object p1, v0, Ln/o/t/i/f/e/e/h;->a:Ljava/lang/String;

    return-object p1
.end method

.method public getPowerManagerInfo(Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 2
    invoke-static {v0}, Ln/o/t/i/f/e/e/j;->a(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    .line 3
    invoke-static {v0}, Ln/o/t/i/f/e/e/g;->a(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    .line 5
    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 6
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    const-string v5, "manufacturer"

    .line 7
    invoke-virtual {v4, v5, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "model"

    .line 8
    invoke-virtual {v4, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v1, "version"

    .line 9
    invoke-virtual {v4, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "activity"

    .line 10
    invoke-virtual {v4, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 11
    invoke-interface {p1, v0, v4}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    return-void
.end method

.method public getTriggerNotificationIds(Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lapp/notifee/core/c;->a(Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public getTriggerNotifications(Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lapp/notifee/core/c;->b(Lapp/notifee/core/interfaces/MethodCallResult;)V

    return-void
.end method

.method public isBatteryOptimizationEnabled(Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    const-string v1, "power"

    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    .line 6
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/PowerManager;->isIgnoringBatteryOptimizations(Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const/4 v1, 0x0

    .line 7
    invoke-interface {p1, v1, v0}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    return-void
.end method

.method public isChannelBlocked(Ljava/lang/String;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lapp/notifee/core/a;->c(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda15;

    invoke-direct {v0, p2}, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda15;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 2
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public isChannelCreated(Ljava/lang/String;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lapp/notifee/core/a;->d(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda2;

    invoke-direct {v0, p2}, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda2;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 2
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public openBatteryOptimizationSettings(Landroid/app/Activity;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    const-string v0, "PowerManagerUtils"

    .line 6
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v2, "android.settings.IGNORE_BATTERY_OPTIMIZATION_SETTINGS"

    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v2, 0x10000000

    .line 8
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    if-eqz p1, :cond_1

    .line 9
    sget-object v2, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 10
    invoke-static {v2, v1}, Ln/o/t/i/f/e/e/g;->a(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 12
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_0

    const-string p1, "battery optimization settings is not available on device"

    .line 13
    invoke-static {v0, p1}, Lapp/notifee/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 17
    :cond_0
    invoke-static {p1, v1}, Ln/o/t/i/f/e/e/g;->a(Landroid/app/Activity;Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v1, "An error occurred whilst trying to open battery optimization settings"

    .line 20
    invoke-static {v0, v1, p1}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 21
    invoke-interface {p2, p1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    return-void
.end method

.method public openNotificationSettings(Ljava/lang/String;Landroid/app/Activity;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/app/Activity;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lapp/notifee/core/Notifee;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    if-nez p2, :cond_0

    goto :goto_2

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v0, v2, :cond_2

    if-eqz p1, :cond_1

    .line 12
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.settings.CHANNEL_NOTIFICATION_SETTINGS"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "android.provider.extra.CHANNEL_ID"

    .line 13
    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 15
    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-string p1, "android.settings.APP_NOTIFICATION_SETTINGS"

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 17
    :goto_0
    invoke-static {}, Lapp/notifee/core/Notifee;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    const-string v2, "android.provider.extra.APP_PACKAGE"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1

    .line 19
    :cond_2
    new-instance v0, Landroid/content/Intent;

    const-string p1, "android.settings.APPLICATION_SETTINGS"

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    :goto_1
    const/high16 p1, 0x10000000

    .line 22
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 24
    new-instance p1, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda10;

    invoke-direct {p1, v0}, Lapp/notifee/core/Notifee$$ExternalSyntheticLambda10;-><init>(Landroid/content/Intent;)V

    invoke-virtual {p2, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 25
    invoke-interface {p3, v1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    return-void

    :cond_3
    :goto_2
    const-string p1, "openNotificationSettings"

    const-string p2, "attempted to start activity but no current activity or context was available."

    .line 26
    invoke-static {p1, p2}, Lapp/notifee/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    invoke-interface {p3, v1, v1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    return-void
.end method

.method public openPowerManagerSettings(Landroid/app/Activity;Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-class v0, Ln/o/t/i/f/e/e/j;

    monitor-enter v0

    .line 2
    :try_start_0
    sget-object v1, Ln/o/t/i/f/e/e/j;->a:Landroid/content/Intent;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 3
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 4
    invoke-static {v0}, Ln/o/t/i/f/e/e/j;->a(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    :cond_0
    if-eqz v1, :cond_1

    const/high16 v0, 0x10000000

    .line 9
    :try_start_1
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 10
    invoke-static {p1, v1}, Ln/o/t/i/f/e/e/g;->a(Landroid/app/Activity;Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Unable to start activity: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    invoke-static {v1}, Ln/o/t/i/f/e/e/g;->a(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "PowerManagerUtils"

    .line 14
    invoke-static {v1, v0, p1}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    :cond_1
    const-string p1, "PowerManagerUtils"

    const-string v0, "Unable to find an activity to open the device\'s power manager"

    .line 18
    invoke-static {p1, v0}, Lapp/notifee/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const/4 p1, 0x0

    .line 19
    invoke-interface {p2, p1, p1}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception p1

    .line 20
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public stopForegroundService(Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lapp/notifee/core/ForegroundService;->a:Ljava/lang/String;

    .line 2
    new-instance v0, Landroid/content/Intent;

    .line 3
    sget-object v1, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 4
    const-class v2, Lapp/notifee/core/ForegroundService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "app.notifee.core.ForegroundService.STOP"

    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 6
    :try_start_0
    sget-object v1, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 7
    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "ForegroundService"

    const-string v2, "Unable to stop foreground service"

    .line 12
    invoke-static {v1, v2, v0}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 13
    :catch_1
    sget-object v1, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 14
    invoke-virtual {v1, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    :goto_0
    const/4 v0, 0x0

    .line 15
    invoke-interface {p1, v0, v0}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    return-void
.end method
