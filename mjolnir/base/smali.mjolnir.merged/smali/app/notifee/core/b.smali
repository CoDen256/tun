.class public Lapp/notifee/core/b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public static synthetic $r8$lambda$151PIGd68T6XmG3qfUpdhLSxeHA(Lapp/notifee/core/b;Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    invoke-direct {p0, p1}, Lapp/notifee/core/b;->d(Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method

.method public static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lapp/notifee/core/b;->a:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Ljava/lang/String;)Landroid/app/PendingIntent;
    .locals 3

    .line 1
    :try_start_0
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 2
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lapp/notifee/core/NotificationAlarmReceiver;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "notificationId"

    .line 3
    invoke-virtual {v1, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 6
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    const/high16 v2, 0xa000000

    .line 7
    invoke-static {v0, p0, v1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string v0, "NotifeeAlarmManager"

    const-string v1, "Unable to create AlarmManager intent"

    .line 14
    invoke-static {v0, v1, p0}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static a()Lcom/google/android/gms/tasks/Continuation;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Continuation<",
            "Ljava/lang/Object;",
            "Lcom/google/android/gms/tasks/Task;",
            ">;"
        }
    .end annotation

    .line 119
    new-instance v0, Lapp/notifee/core/b$$ExternalSyntheticLambda4;

    invoke-direct {v0}, Lapp/notifee/core/b$$ExternalSyntheticLambda4;-><init>()V

    return-object v0
.end method

.method public static a(Ljava/lang/String;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 73
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ln/o/t/i/f/e/e/o;

    if-eqz p1, :cond_1

    .line 74
    iget-object v0, p1, Ln/o/t/i/f/e/e/o;->b:[B

    if-eqz v0, :cond_1

    .line 75
    iget-object v0, p1, Ln/o/t/i/f/e/e/o;->c:[B

    if-nez v0, :cond_0

    goto :goto_0

    .line 76
    :cond_0
    invoke-static {v0}, Ln/o/t/i/f/e/e/i;->a([B)Landroid/os/Bundle;

    move-result-object v0

    .line 77
    iget-object p1, p1, Ln/o/t/i/f/e/e/o;->b:[B

    .line 78
    invoke-static {p1}, Ln/o/t/i/f/e/e/i;->a([B)Landroid/os/Bundle;

    move-result-object p1

    .line 79
    new-instance v1, Lapp/notifee/core/model/NotificationModel;

    invoke-direct {v1, p1}, Lapp/notifee/core/model/NotificationModel;-><init>(Landroid/os/Bundle;)V

    .line 80
    invoke-static {v1, v0}, Lapp/notifee/core/c;->b(Lapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v2, Lapp/notifee/core/b$$ExternalSyntheticLambda1;

    invoke-direct {v2, v0, v1, p0}, Lapp/notifee/core/b$$ExternalSyntheticLambda1;-><init>(Landroid/os/Bundle;Lapp/notifee/core/model/NotificationModel;Ljava/lang/String;)V

    .line 81
    invoke-virtual {p1, v2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const-string p0, "NotifeeAlarmManager"

    const-string p1, "Attempted to handle doScheduledWork but no notification data was found."

    .line 82
    invoke-static {p0, p1}, Lapp/notifee/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 120
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 121
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    .line 122
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ln/o/t/i/f/e/e/o;

    .line 123
    iget-object v0, v0, Ln/o/t/i/f/e/e/o;->a:Ljava/lang/String;

    .line 124
    invoke-static {v0}, Lapp/notifee/core/b;->a(Ljava/lang/String;)Landroid/app/PendingIntent;

    move-result-object v0

    .line 125
    sget-object v1, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    const-string v2, "alarm"

    .line 126
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AlarmManager;

    if-eqz v0, :cond_0

    .line 127
    invoke-virtual {v1, v0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Landroid/os/Bundle;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    const-string v0, "notificationId"

    .line 15
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_1

    return-void

    .line 21
    :cond_1
    new-instance v0, Lapp/notifee/core/database/a;

    .line 22
    sget-object v1, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 23
    invoke-direct {v0, v1}, Lapp/notifee/core/database/a;-><init>(Landroid/content/Context;)V

    .line 25
    new-instance v1, Lapp/notifee/core/b$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Lapp/notifee/core/b$$ExternalSyntheticLambda5;-><init>(Ljava/lang/String;)V

    .line 70
    invoke-virtual {v0, p0}, Lapp/notifee/core/database/a;->b(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    sget-object v0, Lapp/notifee/core/b;->a:Ljava/util/concurrent/ExecutorService;

    .line 71
    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    new-instance v0, Lapp/notifee/core/b$$ExternalSyntheticLambda6;

    invoke-direct {v0}, Lapp/notifee/core/b$$ExternalSyntheticLambda6;-><init>()V

    .line 72
    invoke-virtual {p0, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public static a(Landroid/os/Bundle;Lapp/notifee/core/model/NotificationModel;Ljava/lang/String;Lcom/google/android/gms/tasks/Task;)V
    .locals 4

    .line 83
    invoke-virtual {p3}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_0

    .line 87
    invoke-virtual {p3}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p0

    const-string p1, "NotifeeAlarmManager"

    const-string p2, "Failed to display notification"

    .line 88
    invoke-static {p1, p2, p0}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    :cond_0
    const-string p3, "repeatFrequency"

    .line 93
    invoke-virtual {p0, p3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 94
    invoke-virtual {p0, p3}, Landroid/os/Bundle;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    cmpl-double p3, v0, v2

    if-eqz p3, :cond_1

    .line 95
    new-instance p2, Ln/o/t/i/f/e/e/l;

    invoke-direct {p2, p0}, Ln/o/t/i/f/e/e/l;-><init>(Landroid/os/Bundle;)V

    const/4 p0, 0x0

    .line 96
    invoke-static {p1, p2, p0}, Lapp/notifee/core/b;->a(Lapp/notifee/core/model/NotificationModel;Ln/o/t/i/f/e/e/l;Z)V

    goto :goto_0

    .line 97
    :cond_1
    sget-object p0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 98
    invoke-static {p0}, Lapp/notifee/core/database/a;->a(Landroid/content/Context;)Lapp/notifee/core/database/a;

    move-result-object p0

    invoke-virtual {p0, p2}, Lapp/notifee/core/database/a;->a(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public static a(Lapp/notifee/core/model/NotificationModel;Ln/o/t/i/f/e/e/l;Z)V
    .locals 6

    .line 99
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationModel;->b()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lapp/notifee/core/b;->a(Ljava/lang/String;)Landroid/app/PendingIntent;

    move-result-object p0

    .line 100
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    const-string v1, "alarm"

    .line 101
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-lt v1, v2, :cond_0

    .line 103
    invoke-static {v0}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/AlarmManager;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 104
    sget-object p0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string p1, "Missing SCHEDULE_EXACT_ALARM permission. Trigger not scheduled. Issue #239"

    invoke-virtual {p0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void

    .line 105
    :cond_0
    iget-object v1, p1, Ln/o/t/i/f/e/e/l;->a:Landroid/os/Bundle;

    const-string/jumbo v2, "timestamp"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    double-to-long v3, v3

    .line 106
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v3, 0x0

    if-nez p2, :cond_4

    .line 107
    iget-object p2, p1, Ln/o/t/i/f/e/e/l;->f:Ljava/lang/String;

    if-eqz p2, :cond_4

    .line 108
    iget-object p2, p1, Ln/o/t/i/f/e/e/l;->a:Landroid/os/Bundle;

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getDouble(Ljava/lang/String;)D

    move-result-wide v1

    double-to-long v1, v1

    .line 109
    iget-object p2, p1, Ln/o/t/i/f/e/e/l;->f:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v4

    const/4 v5, -0x1

    sparse-switch v4, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v4, "HOURLY"

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v5, 0x2

    goto :goto_0

    :sswitch_1
    const-string v4, "DAILY"

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    goto :goto_0

    :cond_2
    const/4 v5, 0x1

    goto :goto_0

    :sswitch_2
    const-string v4, "WEEKLY"

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3

    goto :goto_0

    :cond_3
    move v5, v3

    :goto_0
    packed-switch v5, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    const-wide/32 v4, 0x36ee80

    goto :goto_1

    :pswitch_1
    const-wide/32 v4, 0x5265c00

    goto :goto_1

    :pswitch_2
    const-wide/32 v4, 0x240c8400

    :goto_1
    add-long/2addr v1, v4

    .line 110
    :goto_2
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 111
    :cond_4
    iget-object p1, p1, Ln/o/t/i/f/e/e/l;->e:Ljava/lang/Boolean;

    .line 112
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 114
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    .line 115
    invoke-static {v0, v3, p1, p2, p0}, Landroidx/core/app/AlarmManagerCompat;->setExactAndAllowWhileIdle(Landroid/app/AlarmManager;IJLandroid/app/PendingIntent;)V

    goto :goto_3

    .line 118
    :cond_5
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    invoke-static {v0, v3, p1, p2, p0}, Landroidx/core/app/AlarmManagerCompat;->setExact(Landroid/app/AlarmManager;IJLandroid/app/PendingIntent;)V

    :goto_3
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x679d8b7f -> :sswitch_2
        0x3dce5f9 -> :sswitch_1
        0x7f5e0e71 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static b(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object p0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 2
    invoke-static {p0}, Lapp/notifee/core/database/a;->a(Landroid/content/Context;)Lapp/notifee/core/database/a;

    move-result-object p0

    .line 5
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lapp/notifee/core/database/a;->a(Ljava/lang/Boolean;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    new-instance v0, Lapp/notifee/core/b$$ExternalSyntheticLambda3;

    invoke-direct {v0}, Lapp/notifee/core/b$$ExternalSyntheticLambda3;-><init>()V

    .line 6
    invoke-virtual {p0, v0}, Lcom/google/android/gms/tasks/Task;->continueWith(Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p0

    const-string v0, "NotifeeAlarmManager"

    const-string v1, "Failed to display notification"

    invoke-static {v0, v1, p0}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    :cond_0
    return-void
.end method

.method private d(Lcom/google/android/gms/tasks/Task;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 3
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ln/o/t/i/f/e/e/o;

    .line 4
    iget-object v1, v0, Ln/o/t/i/f/e/e/o;->b:[B

    if-eqz v1, :cond_0

    .line 5
    iget-object v2, v0, Ln/o/t/i/f/e/e/o;->c:[B

    if-eqz v2, :cond_0

    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, v0, Ln/o/t/i/f/e/e/o;->c:[B

    .line 7
    invoke-static {v0}, Ln/o/t/i/f/e/e/i;->a([B)Landroid/os/Bundle;

    move-result-object v0

    .line 10
    invoke-static {v1}, Ln/o/t/i/f/e/e/i;->a([B)Landroid/os/Bundle;

    move-result-object v1

    .line 11
    new-instance v2, Lapp/notifee/core/model/NotificationModel;

    invoke-direct {v2, v1}, Lapp/notifee/core/model/NotificationModel;-><init>(Landroid/os/Bundle;)V

    const-string/jumbo v1, "type"

    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    double-to-int v1, v3

    if-eqz v1, :cond_1

    goto :goto_0

    .line 13
    :cond_1
    new-instance v1, Ln/o/t/i/f/e/e/l;

    invoke-direct {v1, v0}, Ln/o/t/i/f/e/e/l;-><init>(Landroid/os/Bundle;)V

    const/4 v0, 0x0

    .line 14
    invoke-static {v2, v1, v0}, Lapp/notifee/core/b;->a(Lapp/notifee/core/model/NotificationModel;Ln/o/t/i/f/e/e/l;Z)V

    goto :goto_0

    :cond_2
    return-void
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 7
    new-instance v0, Lapp/notifee/core/database/a;

    .line 8
    sget-object v1, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 9
    invoke-direct {v0, v1}, Lapp/notifee/core/database/a;-><init>(Landroid/content/Context;)V

    .line 10
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lapp/notifee/core/database/a;->a(Ljava/lang/Boolean;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    .line 11
    new-instance v1, Lapp/notifee/core/b$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lapp/notifee/core/b$$ExternalSyntheticLambda2;-><init>(Lapp/notifee/core/b;)V

    .line 12
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method
