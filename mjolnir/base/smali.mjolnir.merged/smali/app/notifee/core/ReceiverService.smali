.class public Lapp/notifee/core/ReceiverService;
.super Landroid/app/Service;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lapp/notifee/core/ReceiverService;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method public static varargs a(Ljava/lang/String;[Ljava/lang/String;[Landroid/os/Bundle;)Landroid/app/PendingIntent;
    .locals 4

    .line 1
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 2
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lapp/notifee/core/ReceiverService;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 3
    invoke-virtual {v1, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/4 p0, 0x0

    .line 5
    :goto_0
    array-length v2, p1

    if-ge p0, v2, :cond_1

    .line 6
    aget-object v2, p1, p0

    .line 8
    array-length v3, p2

    add-int/lit8 v3, v3, -0x1

    if-gt p0, v3, :cond_0

    .line 9
    aget-object v3, p2, p0

    .line 10
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    .line 12
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :goto_1
    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lapp/notifee/core/ReceiverService;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 16
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result p0

    const/high16 p1, 0xa000000

    .line 17
    invoke-static {v0, p0, v1, p1}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a(Ln/o/t/i/f/e/e/f;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 3

    .line 18
    invoke-static {p2}, Ln/o/t/i/f/e/e/g;->a(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p2

    const-string v0, "ReceiverService"

    if-nez p2, :cond_0

    const-string p1, "Failed to get launch activity"

    .line 20
    invoke-static {v0, p1}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 24
    :cond_0
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 p2, -0x1

    if-eq p4, p2, :cond_1

    .line 27
    invoke-virtual {v1, p4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :cond_1
    if-eqz p3, :cond_2

    const-string p2, "mainComponent"

    .line 31
    invoke-virtual {v1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 36
    :cond_2
    invoke-virtual {p0}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    .line 37
    iget-object p4, p1, Ln/o/t/i/f/e/e/f;->a:Lapp/notifee/core/model/NotificationModel;

    .line 38
    invoke-virtual {p4}, Lapp/notifee/core/model/NotificationModel;->a()Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p4

    const/high16 v2, 0xa000000

    .line 39
    invoke-static {p2, p4, v1, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p2

    .line 46
    :try_start_0
    invoke-virtual {p2}, Landroid/app/PendingIntent;->send()V

    .line 47
    invoke-static {p1}, Ln/o/t/i/f/e/e/e;->b(Ljava/lang/Object;)V

    if-eqz p3, :cond_3

    .line 51
    new-instance p2, Ln/o/t/i/f/e/e/h;

    invoke-direct {p2, p3}, Ln/o/t/i/f/e/e/h;-><init>(Ljava/lang/String;)V

    invoke-static {p2}, Ln/o/t/i/f/e/e/e;->b(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 54
    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "Failed to send PendingIntent from launchPendingIntentActivity for notification "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    iget-object p1, p1, Ln/o/t/i/f/e/e/f;->a:Lapp/notifee/core/model/NotificationModel;

    .line 56
    invoke-virtual {p1}, Lapp/notifee/core/model/NotificationModel;->b()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 57
    invoke-static {v0, p1, p2}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x2

    if-nez p2, :cond_0

    return p3

    .line 7
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, -0x1

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "app.notifee.core.ReceiverService.PRESS_INTENT"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    goto :goto_0

    :cond_1
    move v3, p3

    goto :goto_0

    :sswitch_1
    const-string v0, "app.notifee.core.ReceiverService.DELETE_INTENT"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    goto :goto_0

    :cond_2
    move v3, v1

    goto :goto_0

    :sswitch_2
    const-string v0, "app.notifee.core.ReceiverService.ACTION_PRESS_INTENT"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3

    goto :goto_0

    :cond_3
    move v3, v2

    :goto_0
    const-string p2, "notification"

    const-string v0, "pressAction"

    packed-switch v3, :pswitch_data_0

    goto/16 :goto_2

    .line 8
    :pswitch_0
    invoke-virtual {p1, p2}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p2

    if-nez p2, :cond_4

    goto/16 :goto_2

    .line 9
    :cond_4
    new-instance v2, Lapp/notifee/core/model/NotificationModel;

    invoke-direct {v2, p2}, Lapp/notifee/core/model/NotificationModel;-><init>(Landroid/os/Bundle;)V

    .line 10
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    .line 13
    new-instance p2, Landroid/os/Bundle;

    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    if-eqz p1, :cond_5

    .line 16
    invoke-static {p1}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->fromBundle(Landroid/os/Bundle;)Lapp/notifee/core/model/NotificationAndroidPressActionModel;

    move-result-object p1

    .line 17
    invoke-virtual {p1}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->toBundle()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {p2, v0, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_1

    :cond_5
    const/4 p1, 0x0

    .line 20
    :goto_1
    new-instance v0, Lapp/notifee/core/event/NotificationEvent;

    invoke-direct {v0, v1, v2, p2}, Lapp/notifee/core/event/NotificationEvent;-><init>(ILapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;)V

    invoke-static {v0}, Ln/o/t/i/f/e/e/e;->a(Ljava/lang/Object;)V

    if-nez p1, :cond_6

    goto/16 :goto_2

    .line 26
    :cond_6
    invoke-virtual {p1}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->getLaunchActivity()Ljava/lang/String;

    move-result-object v0

    .line 27
    invoke-virtual {p1}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->getMainComponent()Ljava/lang/String;

    move-result-object v1

    if-nez v0, :cond_7

    if-eqz v1, :cond_c

    .line 30
    :cond_7
    new-instance v3, Ln/o/t/i/f/e/e/f;

    invoke-direct {v3, v2, p2}, Ln/o/t/i/f/e/e/f;-><init>(Lapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;)V

    .line 36
    invoke-virtual {p1}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->getLaunchActivityFlags()I

    move-result p1

    .line 37
    invoke-virtual {p0, v3, v0, v1, p1}, Lapp/notifee/core/ReceiverService;->a(Ln/o/t/i/f/e/e/f;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_2

    .line 38
    :pswitch_1
    invoke-virtual {p1, p2}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    if-nez p1, :cond_8

    goto :goto_2

    .line 39
    :cond_8
    new-instance p2, Lapp/notifee/core/model/NotificationModel;

    invoke-direct {p2, p1}, Lapp/notifee/core/model/NotificationModel;-><init>(Landroid/os/Bundle;)V

    .line 40
    new-instance p1, Lapp/notifee/core/event/NotificationEvent;

    invoke-direct {p1, v2, p2}, Lapp/notifee/core/event/NotificationEvent;-><init>(ILapp/notifee/core/model/NotificationModel;)V

    invoke-static {p1}, Ln/o/t/i/f/e/e/e;->a(Ljava/lang/Object;)V

    goto :goto_2

    .line 41
    :pswitch_2
    invoke-virtual {p1, p2}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p2

    .line 42
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    if-eqz p2, :cond_c

    if-nez v1, :cond_9

    goto :goto_2

    .line 43
    :cond_9
    new-instance v2, Lapp/notifee/core/model/NotificationModel;

    invoke-direct {v2, p2}, Lapp/notifee/core/model/NotificationModel;-><init>(Landroid/os/Bundle;)V

    .line 44
    invoke-static {v1}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->fromBundle(Landroid/os/Bundle;)Lapp/notifee/core/model/NotificationAndroidPressActionModel;

    move-result-object p2

    .line 46
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 47
    invoke-virtual {p2}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->toBundle()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v1, v0, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 49
    invoke-static {p1}, Landroidx/core/app/RemoteInput;->getResultsFromIntent(Landroid/content/Intent;)Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_a

    const-string v0, "app.notifee.core.ReceiverService.REMOTE_INPUT_RECEIVER_KEY"

    .line 51
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object p1

    if-eqz p1, :cond_a

    .line 53
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "input"

    invoke-virtual {v1, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    :cond_a
    new-instance p1, Lapp/notifee/core/event/NotificationEvent;

    invoke-direct {p1, p3, v2, v1}, Lapp/notifee/core/event/NotificationEvent;-><init>(ILapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;)V

    invoke-static {p1}, Ln/o/t/i/f/e/e/e;->a(Ljava/lang/Object;)V

    .line 59
    invoke-virtual {p2}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->getLaunchActivity()Ljava/lang/String;

    move-result-object p1

    .line 60
    invoke-virtual {p2}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->getMainComponent()Ljava/lang/String;

    move-result-object v0

    if-nez p1, :cond_b

    if-eqz v0, :cond_c

    .line 63
    :cond_b
    new-instance v3, Ln/o/t/i/f/e/e/f;

    invoke-direct {v3, v2, v1}, Ln/o/t/i/f/e/e/f;-><init>(Lapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;)V

    .line 69
    invoke-virtual {p2}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->getLaunchActivityFlags()I

    move-result p2

    .line 70
    invoke-virtual {p0, v3, p1, v0, p2}, Lapp/notifee/core/ReceiverService;->a(Ln/o/t/i/f/e/e/f;Ljava/lang/String;Ljava/lang/String;I)V

    :cond_c
    :goto_2
    return p3

    :sswitch_data_0
    .sparse-switch
        -0x7a2bfceb -> :sswitch_2
        -0x79412bdc -> :sswitch_1
        -0x74e48cbc -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
