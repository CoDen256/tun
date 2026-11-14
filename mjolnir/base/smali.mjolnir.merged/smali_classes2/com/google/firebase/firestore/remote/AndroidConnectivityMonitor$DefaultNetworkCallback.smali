.class Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$DefaultNetworkCallback;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "AndroidConnectivityMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DefaultNetworkCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;


# direct methods
.method private constructor <init>(Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$DefaultNetworkCallback;->this$0:Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;

    .line 169
    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$1;)V
    .locals 0

    .line 169
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$DefaultNetworkCallback;-><init>(Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;)V

    return-void
.end method


# virtual methods
.method public onAvailable(Landroid/net/Network;)V
    .locals 1

    iget-object p1, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$DefaultNetworkCallback;->this$0:Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;

    const/4 v0, 0x1

    .line 172
    invoke-static {p1, v0}, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;->access$200(Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;Z)V

    return-void
.end method

.method public onLost(Landroid/net/Network;)V
    .locals 1

    iget-object p1, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$DefaultNetworkCallback;->this$0:Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;

    const/4 v0, 0x0

    .line 177
    invoke-static {p1, v0}, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;->access$200(Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;Z)V

    return-void
.end method
