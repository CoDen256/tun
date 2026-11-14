.class final Lio/grpc/internal/ServerImpl$ContextCloser;
.super Ljava/lang/Object;
.source "ServerImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/internal/ServerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ContextCloser"
.end annotation


# instance fields
.field private final cause:Ljava/lang/Throwable;

.field private final context:Lio/grpc/Context$CancellableContext;


# direct methods
.method constructor <init>(Lio/grpc/Context$CancellableContext;Ljava/lang/Throwable;)V
    .locals 0

    .line 970
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/grpc/internal/ServerImpl$ContextCloser;->context:Lio/grpc/Context$CancellableContext;

    iput-object p2, p0, Lio/grpc/internal/ServerImpl$ContextCloser;->cause:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lio/grpc/internal/ServerImpl$ContextCloser;->context:Lio/grpc/Context$CancellableContext;

    iget-object v1, p0, Lio/grpc/internal/ServerImpl$ContextCloser;->cause:Ljava/lang/Throwable;

    .line 977
    invoke-virtual {v0, v1}, Lio/grpc/Context$CancellableContext;->cancel(Ljava/lang/Throwable;)Z

    return-void
.end method
