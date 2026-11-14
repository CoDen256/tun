.class Lcom/google/firebase/firestore/remote/AbstractStream$IdleTimeoutRunnable;
.super Ljava/lang/Object;
.source "AbstractStream.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/remote/AbstractStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "IdleTimeoutRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/firebase/firestore/remote/AbstractStream;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/remote/AbstractStream;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/remote/AbstractStream$IdleTimeoutRunnable;->this$0:Lcom/google/firebase/firestore/remote/AbstractStream;

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/AbstractStream$IdleTimeoutRunnable;->this$0:Lcom/google/firebase/firestore/remote/AbstractStream;

    .line 161
    invoke-static {v0}, Lcom/google/firebase/firestore/remote/AbstractStream;->access$300(Lcom/google/firebase/firestore/remote/AbstractStream;)V

    return-void
.end method
