.class Lcom/google/firebase/firestore/LoadBundleTask$ManagedListener;
.super Ljava/lang/Object;
.source "LoadBundleTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/LoadBundleTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ManagedListener"
.end annotation


# instance fields
.field executor:Ljava/util/concurrent/Executor;

.field listener:Lcom/google/firebase/firestore/OnProgressListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/firestore/OnProgressListener<",
            "Lcom/google/firebase/firestore/LoadBundleTaskProgress;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;Lcom/google/firebase/firestore/OnProgressListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Lcom/google/firebase/firestore/OnProgressListener<",
            "Lcom/google/firebase/firestore/LoadBundleTaskProgress;",
            ">;)V"
        }
    .end annotation

    .line 565
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 566
    :cond_0
    sget-object p1, Lcom/google/android/gms/tasks/TaskExecutors;->MAIN_THREAD:Ljava/util/concurrent/Executor;

    :goto_0
    iput-object p1, p0, Lcom/google/firebase/firestore/LoadBundleTask$ManagedListener;->executor:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Lcom/google/firebase/firestore/LoadBundleTask$ManagedListener;->listener:Lcom/google/firebase/firestore/OnProgressListener;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    if-eqz p1, :cond_2

    .line 585
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_1

    goto :goto_0

    .line 587
    :cond_1
    check-cast p1, Lcom/google/firebase/firestore/LoadBundleTask$ManagedListener;

    iget-object v0, p0, Lcom/google/firebase/firestore/LoadBundleTask$ManagedListener;->listener:Lcom/google/firebase/firestore/OnProgressListener;

    .line 588
    iget-object p1, p1, Lcom/google/firebase/firestore/LoadBundleTask$ManagedListener;->listener:Lcom/google/firebase/firestore/OnProgressListener;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/LoadBundleTask$ManagedListener;->listener:Lcom/google/firebase/firestore/OnProgressListener;

    .line 593
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public invokeAsync(Lcom/google/firebase/firestore/LoadBundleTaskProgress;)V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/LoadBundleTask$ManagedListener;->executor:Ljava/util/concurrent/Executor;

    .line 575
    new-instance v1, Lcom/google/firebase/firestore/LoadBundleTask$ManagedListener$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/google/firebase/firestore/LoadBundleTask$ManagedListener$$ExternalSyntheticLambda0;-><init>(Lcom/google/firebase/firestore/LoadBundleTask$ManagedListener;Lcom/google/firebase/firestore/LoadBundleTaskProgress;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$invokeAsync$0$com-google-firebase-firestore-LoadBundleTask$ManagedListener(Lcom/google/firebase/firestore/LoadBundleTaskProgress;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/LoadBundleTask$ManagedListener;->listener:Lcom/google/firebase/firestore/OnProgressListener;

    .line 575
    invoke-interface {v0, p1}, Lcom/google/firebase/firestore/OnProgressListener;->onProgress(Ljava/lang/Object;)V

    return-void
.end method
