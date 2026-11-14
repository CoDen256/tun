.class final Lio/grpc/stub/ClientCalls$GrpcFuture;
.super Lcom/google/common/util/concurrent/AbstractFuture;
.source "ClientCalls.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/stub/ClientCalls;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "GrpcFuture"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<RespT:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/util/concurrent/AbstractFuture<",
        "TRespT;>;"
    }
.end annotation


# instance fields
.field private final call:Lio/grpc/ClientCall;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/ClientCall<",
            "*TRespT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/grpc/ClientCall;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/ClientCall<",
            "*TRespT;>;)V"
        }
    .end annotation

    .line 558
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractFuture;-><init>()V

    iput-object p1, p0, Lio/grpc/stub/ClientCalls$GrpcFuture;->call:Lio/grpc/ClientCall;

    return-void
.end method

.method static synthetic access$600(Lio/grpc/stub/ClientCalls$GrpcFuture;)Lio/grpc/ClientCall;
    .locals 0

    .line 554
    iget-object p0, p0, Lio/grpc/stub/ClientCalls$GrpcFuture;->call:Lio/grpc/ClientCall;

    return-object p0
.end method


# virtual methods
.method protected interruptTask()V
    .locals 3

    iget-object v0, p0, Lio/grpc/stub/ClientCalls$GrpcFuture;->call:Lio/grpc/ClientCall;

    const-string v1, "GrpcFuture was cancelled"

    const/4 v2, 0x0

    .line 564
    invoke-virtual {v0, v1, v2}, Lio/grpc/ClientCall;->cancel(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method protected pendingToString()Ljava/lang/String;
    .locals 3

    .line 579
    invoke-static {p0}, Lcom/google/common/base/MoreObjects;->toStringHelper(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "clientCall"

    iget-object v2, p0, Lio/grpc/stub/ClientCalls$GrpcFuture;->call:Lio/grpc/ClientCall;

    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected set(Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TRespT;)Z"
        }
    .end annotation

    .line 569
    invoke-super {p0, p1}, Lcom/google/common/util/concurrent/AbstractFuture;->set(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method protected setException(Ljava/lang/Throwable;)Z
    .locals 0

    .line 574
    invoke-super {p0, p1}, Lcom/google/common/util/concurrent/AbstractFuture;->setException(Ljava/lang/Throwable;)Z

    move-result p1

    return p1
.end method
