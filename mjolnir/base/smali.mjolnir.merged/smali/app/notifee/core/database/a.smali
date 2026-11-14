.class public Lapp/notifee/core/database/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:Lapp/notifee/core/database/a;


# instance fields
.field public a:Ln/o/t/i/f/e/e/m;


# direct methods
.method public static synthetic $r8$lambda$6XRinSlFJzHXLRZ2Rfk8fG1M2QA(Lapp/notifee/core/database/a;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0, p1}, Lapp/notifee/core/database/a;->b(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic $r8$lambda$BD7IakSOfJWQ4xoRljgwShVVxDY(Lapp/notifee/core/database/a;Ljava/lang/String;)Ln/o/t/i/f/e/e/o;
    .locals 0

    invoke-direct {p0, p1}, Lapp/notifee/core/database/a;->d(Ljava/lang/String;)Ln/o/t/i/f/e/e/o;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$KOUu-7bCMFK6D9ZylfhwZWXcMys(Lapp/notifee/core/database/a;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lapp/notifee/core/database/a;->c(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Ofl5cUKz5Y7923PwdtXgKOe6d68(Lapp/notifee/core/database/a;Ln/o/t/i/f/e/e/o;)V
    .locals 0

    invoke-direct {p0, p1}, Lapp/notifee/core/database/a;->b(Ln/o/t/i/f/e/e/o;)V

    return-void
.end method

.method public static synthetic $r8$lambda$WcGoLBzHajVMUqZMNJKonWUWI7s(Lapp/notifee/core/database/a;Ljava/lang/Boolean;)Ljava/util/List;
    .locals 0

    invoke-direct {p0, p1}, Lapp/notifee/core/database/a;->b(Ljava/lang/Boolean;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$qTvsy2UlJgFNeKQDPgztn1Y8OR0(Lapp/notifee/core/database/a;)Ljava/util/List;
    .locals 0

    invoke-direct {p0}, Lapp/notifee/core/database/a;->d()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$uSvmDLspa3JyvsY4xOi_8t6igE0(Lapp/notifee/core/database/a;)V
    .locals 0

    invoke-direct {p0}, Lapp/notifee/core/database/a;->c()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-static {p1}, Lapp/notifee/core/database/NotifeeCoreDatabase;->a(Landroid/content/Context;)Lapp/notifee/core/database/NotifeeCoreDatabase;

    move-result-object p1

    .line 3
    invoke-virtual {p1}, Lapp/notifee/core/database/NotifeeCoreDatabase;->a()Ln/o/t/i/f/e/e/m;

    move-result-object p1

    iput-object p1, p0, Lapp/notifee/core/database/a;->a:Ln/o/t/i/f/e/e/m;

    return-void
.end method

.method public static a(Landroid/content/Context;)Lapp/notifee/core/database/a;
    .locals 2

    const-class v0, Lapp/notifee/core/database/a;

    .line 1
    monitor-enter v0

    :try_start_0
    sget-object v1, Lapp/notifee/core/database/a;->b:Lapp/notifee/core/database/a;

    if-nez v1, :cond_0

    .line 3
    new-instance v1, Lapp/notifee/core/database/a;

    invoke-direct {v1, p0}, Lapp/notifee/core/database/a;-><init>(Landroid/content/Context;)V

    sput-object v1, Lapp/notifee/core/database/a;->b:Lapp/notifee/core/database/a;

    :cond_0
    sget-object p0, Lapp/notifee/core/database/a;->b:Lapp/notifee/core/database/a;

    .line 6
    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    .line 7
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static a(Lapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;Ljava/lang/Boolean;)V
    .locals 3

    .line 13
    new-instance v0, Ln/o/t/i/f/e/e/o;

    .line 15
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationModel;->b()Ljava/lang/String;

    move-result-object v1

    .line 16
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationModel;->toBundle()Landroid/os/Bundle;

    move-result-object p0

    .line 17
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    .line 18
    invoke-virtual {v2, p0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 19
    invoke-virtual {v2}, Landroid/os/Parcel;->marshall()[B

    move-result-object p0

    .line 20
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    .line 21
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    .line 22
    invoke-virtual {v2, p1}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 23
    invoke-virtual {v2}, Landroid/os/Parcel;->marshall()[B

    move-result-object p1

    .line 24
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    .line 25
    invoke-direct {v0, v1, p0, p1, p2}, Ln/o/t/i/f/e/e/o;-><init>(Ljava/lang/String;[B[BLjava/lang/Boolean;)V

    sget-object p0, Lapp/notifee/core/database/a;->b:Lapp/notifee/core/database/a;

    .line 28
    invoke-virtual {p0, v0}, Lapp/notifee/core/database/a;->a(Ln/o/t/i/f/e/e/o;)V

    return-void
.end method

.method private synthetic b(Ljava/lang/Boolean;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lapp/notifee/core/database/a;->a:Ln/o/t/i/f/e/e/m;

    .line 3
    invoke-interface {v0, p1}, Ln/o/t/i/f/e/e/m;->a(Ljava/lang/Boolean;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method private synthetic b(Ljava/util/List;)V
    .locals 1

    iget-object v0, p0, Lapp/notifee/core/database/a;->a:Ln/o/t/i/f/e/e/m;

    .line 5
    invoke-interface {v0, p1}, Ln/o/t/i/f/e/e/m;->a(Ljava/util/List;)V

    return-void
.end method

.method private synthetic b(Ln/o/t/i/f/e/e/o;)V
    .locals 1

    iget-object v0, p0, Lapp/notifee/core/database/a;->a:Ln/o/t/i/f/e/e/m;

    .line 1
    invoke-interface {v0, p1}, Ln/o/t/i/f/e/e/m;->a(Ln/o/t/i/f/e/e/o;)V

    return-void
.end method

.method private synthetic c()V
    .locals 1

    iget-object v0, p0, Lapp/notifee/core/database/a;->a:Ln/o/t/i/f/e/e/m;

    .line 2
    invoke-interface {v0}, Ln/o/t/i/f/e/e/m;->a()V

    return-void
.end method

.method private synthetic c(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lapp/notifee/core/database/a;->a:Ln/o/t/i/f/e/e/m;

    .line 1
    invoke-interface {v0, p1}, Ln/o/t/i/f/e/e/m;->a(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic d()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lapp/notifee/core/database/a;->a:Ln/o/t/i/f/e/e/m;

    .line 2
    invoke-interface {v0}, Ln/o/t/i/f/e/e/m;->b()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private synthetic d(Ljava/lang/String;)Ln/o/t/i/f/e/e/o;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lapp/notifee/core/database/a;->a:Ln/o/t/i/f/e/e/m;

    .line 1
    invoke-interface {v0, p1}, Ln/o/t/i/f/e/e/m;->b(Ljava/lang/String;)Ln/o/t/i/f/e/e/o;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public a(Ljava/lang/Boolean;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Boolean;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/util/List<",
            "Ln/o/t/i/f/e/e/o;",
            ">;>;"
        }
    .end annotation

    .line 9
    sget-object v0, Lapp/notifee/core/database/NotifeeCoreDatabase;->b:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lapp/notifee/core/database/a$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Lapp/notifee/core/database/a$$ExternalSyntheticLambda4;-><init>(Lapp/notifee/core/database/a;Ljava/lang/Boolean;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public a()V
    .locals 2

    .line 12
    sget-object v0, Lapp/notifee/core/database/NotifeeCoreDatabase;->b:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lapp/notifee/core/database/a$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lapp/notifee/core/database/a$$ExternalSyntheticLambda1;-><init>(Lapp/notifee/core/database/a;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 2

    .line 10
    sget-object v0, Lapp/notifee/core/database/NotifeeCoreDatabase;->b:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lapp/notifee/core/database/a$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1}, Lapp/notifee/core/database/a$$ExternalSyntheticLambda5;-><init>(Lapp/notifee/core/database/a;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public a(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 11
    sget-object v0, Lapp/notifee/core/database/NotifeeCoreDatabase;->b:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lapp/notifee/core/database/a$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Lapp/notifee/core/database/a$$ExternalSyntheticLambda3;-><init>(Lapp/notifee/core/database/a;Ljava/util/List;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public a(Ln/o/t/i/f/e/e/o;)V
    .locals 2

    .line 8
    sget-object v0, Lapp/notifee/core/database/NotifeeCoreDatabase;->b:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lapp/notifee/core/database/a$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Lapp/notifee/core/database/a$$ExternalSyntheticLambda2;-><init>(Lapp/notifee/core/database/a;Ln/o/t/i/f/e/e/o;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public b()Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/util/List<",
            "Ln/o/t/i/f/e/e/o;",
            ">;>;"
        }
    .end annotation

    .line 4
    sget-object v0, Lapp/notifee/core/database/NotifeeCoreDatabase;->b:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lapp/notifee/core/database/a$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lapp/notifee/core/database/a$$ExternalSyntheticLambda0;-><init>(Lapp/notifee/core/database/a;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public b(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ln/o/t/i/f/e/e/o;",
            ">;"
        }
    .end annotation

    .line 2
    sget-object v0, Lapp/notifee/core/database/NotifeeCoreDatabase;->b:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lapp/notifee/core/database/a$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, p1}, Lapp/notifee/core/database/a$$ExternalSyntheticLambda6;-><init>(Lapp/notifee/core/database/a;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
