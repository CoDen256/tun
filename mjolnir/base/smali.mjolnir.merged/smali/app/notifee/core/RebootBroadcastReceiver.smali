.class public Lapp/notifee/core/RebootBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    const-string p1, "RebootReceiver"

    const-string p2, "Received reboot event"

    .line 1
    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    new-instance p1, Lapp/notifee/core/b;

    invoke-direct {p1}, Lapp/notifee/core/b;-><init>()V

    invoke-virtual {p1}, Lapp/notifee/core/b;->b()V

    return-void
.end method
