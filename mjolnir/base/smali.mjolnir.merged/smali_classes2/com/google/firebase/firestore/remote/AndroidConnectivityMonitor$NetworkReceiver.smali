.class Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$NetworkReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AndroidConnectivityMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NetworkReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;

.field private wasConnected:Z


# direct methods
.method private constructor <init>(Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$NetworkReceiver;->this$0:Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;

    .line 182
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$NetworkReceiver;->wasConnected:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$1;)V
    .locals 0

    .line 182
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$NetworkReceiver;-><init>(Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    iget-object p1, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$NetworkReceiver;->this$0:Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;

    .line 188
    invoke-static {p1}, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;->access$300(Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;)Z

    move-result p1

    iget-object p2, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$NetworkReceiver;->this$0:Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;

    .line 189
    invoke-static {p2}, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;->access$300(Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-boolean p2, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$NetworkReceiver;->wasConnected:Z

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$NetworkReceiver;->this$0:Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;

    const/4 v0, 0x1

    .line 190
    invoke-static {p2, v0}, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;->access$200(Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;Z)V

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    iget-boolean p2, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$NetworkReceiver;->wasConnected:Z

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$NetworkReceiver;->this$0:Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;

    const/4 v0, 0x0

    .line 192
    invoke-static {p2, v0}, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;->access$200(Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;Z)V

    :cond_1
    :goto_0
    iput-boolean p1, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$NetworkReceiver;->wasConnected:Z

    return-void
.end method
