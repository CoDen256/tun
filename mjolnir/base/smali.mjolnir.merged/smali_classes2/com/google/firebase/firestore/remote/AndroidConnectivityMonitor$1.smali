.class Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$1;
.super Ljava/lang/Object;
.source "AndroidConnectivityMonitor.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;->configureBackgroundStateListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;

.field final synthetic val$inBackground:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$1;->this$0:Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;

    iput-object p2, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$1;->val$inBackground:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1

    iget-object p1, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$1;->val$inBackground:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p2, 0x1

    const/4 v0, 0x0

    .line 110
    invoke-virtual {p1, p2, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$1;->this$0:Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;

    .line 111
    invoke-virtual {p1}, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;->raiseForegroundNotification()V

    :cond_0
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 2

    iget-object p1, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$1;->val$inBackground:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 124
    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$1;->this$0:Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;

    .line 125
    invoke-virtual {p1}, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;->raiseForegroundNotification()V

    :cond_0
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 2

    iget-object p1, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$1;->val$inBackground:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 117
    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor$1;->this$0:Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;

    .line 118
    invoke-virtual {p1}, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;->raiseForegroundNotification()V

    :cond_0
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method
