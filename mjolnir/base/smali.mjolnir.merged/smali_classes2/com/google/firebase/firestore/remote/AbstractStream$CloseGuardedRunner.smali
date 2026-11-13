.class Lcom/google/firebase/firestore/remote/AbstractStream$CloseGuardedRunner;
.super Ljava/lang/Object;
.source "AbstractStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/remote/AbstractStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CloseGuardedRunner"
.end annotation


# instance fields
.field private final initialCloseCount:J

.field final synthetic this$0:Lcom/google/firebase/firestore/remote/AbstractStream;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/remote/AbstractStream;J)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/remote/AbstractStream$CloseGuardedRunner;->this$0:Lcom/google/firebase/firestore/remote/AbstractStream;

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Lcom/google/firebase/firestore/remote/AbstractStream$CloseGuardedRunner;->initialCloseCount:J

    return-void
.end method


# virtual methods
.method run(Ljava/lang/Runnable;)V
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/AbstractStream$CloseGuardedRunner;->this$0:Lcom/google/firebase/firestore/remote/AbstractStream;

    .line 65
    invoke-static {v0}, Lcom/google/firebase/firestore/remote/AbstractStream;->access$000(Lcom/google/firebase/firestore/remote/AbstractStream;)Lcom/google/firebase/firestore/util/AsyncQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/util/AsyncQueue;->verifyIsCurrentThread()V

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/AbstractStream$CloseGuardedRunner;->this$0:Lcom/google/firebase/firestore/remote/AbstractStream;

    .line 66
    invoke-static {v0}, Lcom/google/firebase/firestore/remote/AbstractStream;->access$100(Lcom/google/firebase/firestore/remote/AbstractStream;)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/firebase/firestore/remote/AbstractStream$CloseGuardedRunner;->initialCloseCount:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 67
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/google/firebase/firestore/remote/AbstractStream$CloseGuardedRunner;->this$0:Lcom/google/firebase/firestore/remote/AbstractStream;

    .line 70
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "stream callback skipped by CloseGuardedRunner."

    .line 69
    invoke-static {p1, v1, v0}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
