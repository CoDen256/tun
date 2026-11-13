.class public Lapp/notifee/core/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lapp/notifee/core/a;->a:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public static a(Landroid/app/NotificationChannel;)Landroid/os/Bundle;
    .locals 8

    const/4 v0, 0x0

    if-eqz p0, :cond_d

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-ge v1, v2, :cond_0

    goto/16 :goto_5

    .line 10
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 11
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannel;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "id"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannel;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "name"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m$1(Landroid/app/NotificationChannel;)Z

    move-result v2

    const-string v3, "badge"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 14
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m$2(Landroid/app/NotificationChannel;)Z

    move-result v2

    const-string v3, "bypassDnd"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 17
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m$1(Landroid/app/NotificationChannel;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 18
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m$1(Landroid/app/NotificationChannel;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "description"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    :cond_1
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m$2(Landroid/app/NotificationChannel;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 23
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m$2(Landroid/app/NotificationChannel;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "groupId"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    :cond_2
    invoke-static {p0}, Landroidx/activity/ComponentDialog$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/NotificationChannel;)I

    move-result v2

    const-string v3, "importance"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 27
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m$3(Landroid/app/NotificationChannel;)Z

    move-result v2

    const-string v3, "lights"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 28
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannel;)Z

    move-result v2

    const-string/jumbo v3, "vibration"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 29
    invoke-static {p0}, Landroidx/activity/ComponentDialog$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/NotificationChannel;)I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_3

    move v2, v4

    goto :goto_0

    :cond_3
    move v2, v3

    :goto_0
    const-string v5, "blocked"

    invoke-virtual {v1, v5, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 32
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannel;)Landroid/net/Uri;

    move-result-object v2

    if-eqz v2, :cond_7

    .line 33
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannel;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v5, "soundURI"

    invoke-virtual {v1, v5, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannel;)Landroid/net/Uri;

    move-result-object v2

    if-nez v2, :cond_4

    goto :goto_1

    .line 36
    :cond_4
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "android.resource"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 37
    invoke-virtual {v2}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v2

    .line 39
    :try_start_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const-string v6, "ResourceUtils"

    const-string v7, "Loaded sound by resource id. New app builds will fail to play sound. Create a new channel to resolve. Issue #341"

    .line 40
    invoke-static {v6, v7}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v5, :cond_6

    .line 45
    new-instance v6, Landroid/util/TypedValue;

    invoke-direct {v6}, Landroid/util/TypedValue;-><init>()V

    .line 46
    sget-object v7, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 47
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7, v5, v6, v4}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 49
    iget-object v4, v6, Landroid/util/TypedValue;->string:Ljava/lang/CharSequence;

    if-nez v4, :cond_5

    .line 50
    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-lez v5, :cond_6

    .line 51
    :cond_5
    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v4, "res/raw/"

    const-string v5, ""

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-object v0, v2

    :cond_6
    :goto_1
    if-eqz v0, :cond_7

    const-string v2, "sound"

    .line 52
    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    :cond_7
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannel;)I

    move-result v0

    if-eqz v0, :cond_9

    .line 57
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannel;)I

    move-result v0

    .line 58
    sget-object v2, Ln/o/t/i/f/e/e/c;->a:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_8

    goto :goto_2

    .line 62
    :cond_8
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "#"

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_2
    const-string v0, "lightColor"

    .line 63
    invoke-virtual {v1, v0, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    :cond_9
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannel;)[J

    move-result-object v0

    if-eqz v0, :cond_b

    .line 69
    array-length v2, v0

    if-lez v2, :cond_b

    .line 71
    :try_start_1
    array-length v2, v0

    new-array v2, v2, [I

    .line 73
    :goto_3
    array-length v4, v0

    if-ge v3, v4, :cond_a

    .line 74
    aget-wide v4, v0, v3

    long-to-int v4, v4

    aput v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_a
    const-string/jumbo v0, "vibrationPattern"

    .line 77
    invoke-virtual {v1, v0, v2}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    :catch_1
    move-exception v0

    const-string v2, "ChannelManager"

    const-string v3, "Unable to convert Vibration Pattern to Channel Bundle"

    .line 79
    invoke-static {v2, v3, v0}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 84
    :cond_b
    :goto_4
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m$1(Landroid/app/NotificationChannel;)I

    move-result p0

    const/16 v0, -0x3e8

    if-eq p0, v0, :cond_c

    const-string/jumbo v0, "visibility"

    .line 86
    invoke-virtual {v1, v0, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    :cond_c
    return-object v1

    :cond_d
    :goto_5
    return-object v0
.end method

.method public static a(Landroid/app/NotificationChannelGroup;)Landroid/os/Bundle;
    .locals 4

    if-eqz p0, :cond_3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    goto :goto_2

    .line 91
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 92
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/NotificationChannelGroup;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/NotificationChannelGroup;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "name"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannelGroup;)Ljava/util/List;

    move-result-object v1

    .line 96
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 98
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Landroidx/activity/ComponentDialog$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/app/NotificationChannel;

    move-result-object v3

    .line 99
    invoke-static {v3}, Lapp/notifee/core/a;->a(Landroid/app/NotificationChannel;)Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const-string v1, "channels"

    .line 102
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    const-string v3, "blocked"

    if-lt v1, v2, :cond_2

    .line 105
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannelGroup;)Z

    move-result v1

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 106
    invoke-static {p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannelGroup;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "description"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    const/4 p0, 0x0

    .line 108
    invoke-virtual {v0, v3, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :goto_1
    return-object v0

    :cond_3
    :goto_2
    const/4 p0, 0x0

    return-object p0
.end method

.method public static a()Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;>;"
        }
    .end annotation

    sget-object v0, Lapp/notifee/core/a;->a:Ljava/util/concurrent/ExecutorService;

    .line 5
    new-instance v1, Lapp/notifee/core/a$$ExternalSyntheticLambda36;

    invoke-direct {v1}, Lapp/notifee/core/a$$ExternalSyntheticLambda36;-><init>()V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public static a(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation

    sget-object v0, Lapp/notifee/core/a;->a:Ljava/util/concurrent/ExecutorService;

    .line 4
    new-instance v1, Lapp/notifee/core/a$$ExternalSyntheticLambda39;

    invoke-direct {v1, p0}, Lapp/notifee/core/a$$ExternalSyntheticLambda39;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/util/List;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ln/o/t/i/f/e/e/a;",
            ">;)",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    sget-object v0, Lapp/notifee/core/a;->a:Ljava/util/concurrent/ExecutorService;

    .line 3
    new-instance v1, Lapp/notifee/core/a$$ExternalSyntheticLambda35;

    invoke-direct {v1, p0}, Lapp/notifee/core/a$$ExternalSyntheticLambda35;-><init>(Ljava/util/List;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ln/o/t/i/f/e/e/a;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ln/o/t/i/f/e/e/a;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    sget-object v0, Lapp/notifee/core/a;->a:Ljava/util/concurrent/ExecutorService;

    .line 2
    new-instance v1, Lapp/notifee/core/a$$ExternalSyntheticLambda32;

    invoke-direct {v1, p0}, Lapp/notifee/core/a$$ExternalSyntheticLambda32;-><init>(Ln/o/t/i/f/e/e/a;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ln/o/t/i/f/e/e/b;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ln/o/t/i/f/e/e/b;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    sget-object v0, Lapp/notifee/core/a;->a:Ljava/util/concurrent/ExecutorService;

    .line 1
    new-instance v1, Lapp/notifee/core/a$$ExternalSyntheticLambda31;

    invoke-direct {v1, p0}, Lapp/notifee/core/a$$ExternalSyntheticLambda31;-><init>(Ln/o/t/i/f/e/e/b;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public static b()Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;>;"
        }
    .end annotation

    sget-object v0, Lapp/notifee/core/a;->a:Ljava/util/concurrent/ExecutorService;

    .line 94
    new-instance v1, Lapp/notifee/core/a$$ExternalSyntheticLambda40;

    invoke-direct {v1}, Lapp/notifee/core/a$$ExternalSyntheticLambda40;-><init>()V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public static b(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation

    sget-object v0, Lapp/notifee/core/a;->a:Ljava/util/concurrent/ExecutorService;

    .line 95
    new-instance v1, Lapp/notifee/core/a$$ExternalSyntheticLambda34;

    invoke-direct {v1, p0}, Lapp/notifee/core/a$$ExternalSyntheticLambda34;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public static b(Ljava/util/List;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ln/o/t/i/f/e/e/b;",
            ">;)",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    sget-object v0, Lapp/notifee/core/a;->a:Ljava/util/concurrent/ExecutorService;

    .line 79
    new-instance v1, Lapp/notifee/core/a$$ExternalSyntheticLambda38;

    invoke-direct {v1, p0}, Lapp/notifee/core/a$$ExternalSyntheticLambda38;-><init>(Ljava/util/List;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public static b(Ln/o/t/i/f/e/e/a;)Ljava/lang/Void;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    return-object v2

    .line 84
    :cond_0
    invoke-static {}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline0;->m$1()V

    .line 85
    iget-object v1, p0, Ln/o/t/i/f/e/e/a;->a:Landroid/os/Bundle;

    const-string v3, "id"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 86
    iget-object v3, p0, Ln/o/t/i/f/e/e/a;->a:Landroid/os/Bundle;

    const-string v4, "name"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 87
    invoke-static {v1, v3}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/app/NotificationChannelGroup;

    move-result-object v1

    const/16 v3, 0x1c

    if-lt v0, v3, :cond_1

    .line 88
    iget-object v0, p0, Ln/o/t/i/f/e/e/a;->a:Landroid/os/Bundle;

    const-string v3, "description"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 89
    iget-object p0, p0, Ln/o/t/i/f/e/e/a;->a:Landroid/os/Bundle;

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 90
    invoke-static {v1, p0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/NotificationChannelGroup;Ljava/lang/String;)V

    .line 91
    :cond_1
    sget-object p0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 92
    invoke-static {p0}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object p0

    .line 93
    invoke-virtual {p0, v1}, Landroidx/core/app/NotificationManagerCompat;->createNotificationChannelGroup(Landroid/app/NotificationChannelGroup;)V

    return-object v2
.end method

.method public static b(Ln/o/t/i/f/e/e/b;)Ljava/lang/Void;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    return-object v2

    .line 5
    :cond_0
    invoke-static {}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline0;->m$2()V

    .line 6
    iget-object v0, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    const-string v1, "id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 7
    iget-object v1, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    const-string v3, "name"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 8
    iget-object v3, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    const-string v4, "importance"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 9
    iget-object v3, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    double-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_0

    :cond_1
    const/4 v3, 0x3

    .line 12
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 13
    :goto_0
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v0, v1, v3}, Landroidx/activity/ComponentDialog$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/String;Ljava/lang/CharSequence;I)Landroid/app/NotificationChannel;

    move-result-object v0

    .line 14
    iget-object v1, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    const-string v3, "badge"

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {v0, v1}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/NotificationChannel;Z)V

    .line 16
    iget-object v1, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    const-string v3, "bypassDnd"

    const/4 v5, 0x0

    invoke-virtual {v1, v3, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {v0, v1}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannel;Z)V

    .line 18
    iget-object v1, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    const-string v3, "description"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 19
    invoke-static {v0, v1}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannel;Ljava/lang/String;)V

    .line 20
    iget-object v1, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    const-string v3, "groupId"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 21
    invoke-static {v0, v1}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m$1(Landroid/app/NotificationChannel;Ljava/lang/String;)V

    .line 22
    iget-object v1, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    const-string v3, "lights"

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {v0, v1}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m$1(Landroid/app/NotificationChannel;Z)V

    .line 25
    invoke-virtual {p0}, Ln/o/t/i/f/e/e/b;->a()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 26
    invoke-virtual {p0}, Ln/o/t/i/f/e/e/b;->a()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v0, v1}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannel;I)V

    .line 27
    :cond_2
    iget-object v1, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    const-string/jumbo v3, "visibility"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 28
    iget-object v1, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getDouble(Ljava/lang/String;)D

    move-result-wide v6

    double-to-int v1, v6

    goto :goto_1

    :cond_3
    move v1, v5

    .line 29
    :goto_1
    invoke-static {v0, v1}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m$1(Landroid/app/NotificationChannel;I)V

    .line 30
    iget-object v1, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    const-string/jumbo v3, "vibration"

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {v0, v1}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m$2(Landroid/app/NotificationChannel;Z)V

    .line 32
    iget-object v1, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    const-string/jumbo v3, "vibrationPattern"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    new-array v1, v5, [J

    goto :goto_3

    .line 36
    :cond_4
    iget-object v1, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    .line 37
    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 39
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [J

    .line 41
    :goto_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v5, v4, :cond_5

    .line 42
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 43
    invoke-virtual {v4}, Ljava/lang/Integer;->longValue()J

    move-result-wide v6

    aput-wide v6, v3, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_5
    move-object v1, v3

    :goto_3
    array-length v3, v1

    if-lez v3, :cond_6

    .line 45
    invoke-static {v0, v1}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannel;[J)V

    .line 46
    :cond_6
    iget-object v1, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    const-string v3, "sound"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7

    move-object v1, v2

    goto :goto_4

    .line 50
    :cond_7
    iget-object v1, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_4
    if-eqz v1, :cond_a

    .line 51
    iget-object v1, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8

    move-object p0, v2

    goto :goto_5

    .line 55
    :cond_8
    iget-object p0, p0, Ln/o/t/i/f/e/e/b;->a:Landroid/os/Bundle;

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 56
    :goto_5
    invoke-static {p0}, Ln/o/t/i/f/e/e/k;->c(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    if-eqz p0, :cond_9

    .line 58
    new-instance v1, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v1}, Landroid/media/AudioAttributes$Builder;-><init>()V

    const/4 v3, 0x5

    .line 60
    invoke-virtual {v1, v3}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v1

    const/4 v3, 0x4

    .line 61
    invoke-virtual {v1, v3}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v1

    .line 62
    invoke-virtual {v1}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v1

    .line 63
    invoke-static {v0, p0, v1}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/NotificationChannel;Landroid/net/Uri;Landroid/media/AudioAttributes;)V

    goto :goto_6

    .line 65
    :cond_9
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "Unable to retrieve sound for channel, sound was specified as: "

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    invoke-static {v0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/NotificationChannel;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "ChannelManager"

    .line 69
    invoke-static {v1, p0}, Lapp/notifee/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6

    .line 75
    :cond_a
    invoke-static {v0, v2, v2}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/NotificationChannel;Landroid/net/Uri;Landroid/media/AudioAttributes;)V

    .line 76
    :goto_6
    sget-object p0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 77
    invoke-static {p0}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object p0

    .line 78
    invoke-virtual {p0, v0}, Landroidx/core/app/NotificationManagerCompat;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    return-object v2
.end method

.method public static c(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    sget-object v0, Lapp/notifee/core/a;->a:Ljava/util/concurrent/ExecutorService;

    .line 19
    new-instance v1, Lapp/notifee/core/a$$ExternalSyntheticLambda33;

    invoke-direct {v1, p0}, Lapp/notifee/core/a$$ExternalSyntheticLambda33;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ljava/util/List;)Ljava/lang/Void;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    return-object v2

    .line 17
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ln/o/t/i/f/e/e/a;

    .line 18
    invoke-static {v0}, Lapp/notifee/core/a;->a(Ln/o/t/i/f/e/e/a;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-object v2
.end method

.method public static c()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 2
    invoke-static {v0}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Landroidx/core/app/NotificationManagerCompat;->getNotificationChannelGroups()Ljava/util/List;

    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_2

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-ge v1, v2, :cond_0

    goto :goto_1

    .line 9
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Landroidx/activity/ComponentDialog$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/app/NotificationChannelGroup;

    move-result-object v2

    .line 11
    invoke-static {v2}, Lapp/notifee/core/a;->a(Landroid/app/NotificationChannelGroup;)Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v1

    .line 12
    :cond_2
    :goto_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static d(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    sget-object v0, Lapp/notifee/core/a;->a:Ljava/util/concurrent/ExecutorService;

    .line 15
    new-instance v1, Lapp/notifee/core/a$$ExternalSyntheticLambda37;

    invoke-direct {v1, p0}, Lapp/notifee/core/a$$ExternalSyntheticLambda37;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ljava/util/List;)Ljava/lang/Void;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 13
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ln/o/t/i/f/e/e/b;

    .line 14
    invoke-static {v0}, Lapp/notifee/core/a;->a(Ln/o/t/i/f/e/e/b;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static d()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 2
    invoke-static {v0}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Landroidx/core/app/NotificationManagerCompat;->getNotificationChannels()Ljava/util/List;

    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_2

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-ge v1, v2, :cond_0

    goto :goto_1

    .line 9
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Landroidx/activity/ComponentDialog$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/app/NotificationChannel;

    move-result-object v2

    .line 11
    invoke-static {v2}, Lapp/notifee/core/a;->a(Landroid/app/NotificationChannel;)Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v1

    .line 12
    :cond_2
    :goto_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static e(Ljava/lang/String;)Landroid/os/Bundle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 2
    invoke-static {v0}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object v0

    .line 3
    invoke-virtual {v0, p0}, Landroidx/core/app/NotificationManagerCompat;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object p0

    .line 5
    invoke-static {p0}, Lapp/notifee/core/a;->a(Landroid/app/NotificationChannel;)Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method public static f(Ljava/lang/String;)Landroid/os/Bundle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 2
    invoke-static {v0}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object v0

    .line 3
    invoke-virtual {v0, p0}, Landroidx/core/app/NotificationManagerCompat;->getNotificationChannelGroup(Ljava/lang/String;)Landroid/app/NotificationChannelGroup;

    move-result-object p0

    .line 5
    invoke-static {p0}, Lapp/notifee/core/a;->a(Landroid/app/NotificationChannelGroup;)Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method public static g(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    .line 1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    .line 2
    :cond_0
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 3
    invoke-static {v0}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object v0

    .line 4
    invoke-virtual {v0, p0}, Landroidx/core/app/NotificationManagerCompat;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object p0

    if-nez p0, :cond_1

    .line 7
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    .line 10
    :cond_1
    invoke-static {p0}, Landroidx/activity/ComponentDialog$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/NotificationChannel;)I

    move-result p0

    if-nez p0, :cond_2

    const/4 p0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static h(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    .line 1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    .line 2
    :cond_0
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 3
    invoke-static {v0}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object v0

    .line 4
    invoke-virtual {v0, p0}, Landroidx/core/app/NotificationManagerCompat;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
