.class Lio/grpc/internal/ClientCallImpl$1ClosedByNotFoundCompressor;
.super Lio/grpc/internal/ContextRunnable;
.source "ClientCallImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/ClientCallImpl;->startInternal(Lio/grpc/ClientCall$Listener;Lio/grpc/Metadata;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ClosedByNotFoundCompressor"
.end annotation


# instance fields
.field final synthetic this$0:Lio/grpc/internal/ClientCallImpl;

.field final synthetic val$compressorName:Ljava/lang/String;

.field final synthetic val$finalObserver:Lio/grpc/ClientCall$Listener;


# direct methods
.method constructor <init>(Lio/grpc/internal/ClientCallImpl;Lio/grpc/ClientCall$Listener;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lio/grpc/internal/ClientCallImpl$1ClosedByNotFoundCompressor;->this$0:Lio/grpc/internal/ClientCallImpl;

    iput-object p2, p0, Lio/grpc/internal/ClientCallImpl$1ClosedByNotFoundCompressor;->val$finalObserver:Lio/grpc/ClientCall$Listener;

    iput-object p3, p0, Lio/grpc/internal/ClientCallImpl$1ClosedByNotFoundCompressor;->val$compressorName:Ljava/lang/String;

    .line 232
    invoke-static {p1}, Lio/grpc/internal/ClientCallImpl;->access$200(Lio/grpc/internal/ClientCallImpl;)Lio/grpc/Context;

    move-result-object p1

    invoke-direct {p0, p1}, Lio/grpc/internal/ContextRunnable;-><init>(Lio/grpc/Context;)V

    return-void
.end method


# virtual methods
.method public runInContext()V
    .locals 6

    iget-object v0, p0, Lio/grpc/internal/ClientCallImpl$1ClosedByNotFoundCompressor;->this$0:Lio/grpc/internal/ClientCallImpl;

    iget-object v1, p0, Lio/grpc/internal/ClientCallImpl$1ClosedByNotFoundCompressor;->val$finalObserver:Lio/grpc/ClientCall$Listener;

    .line 237
    sget-object v2, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lio/grpc/internal/ClientCallImpl$1ClosedByNotFoundCompressor;->val$compressorName:Ljava/lang/String;

    aput-object v5, v3, v4

    const-string v4, "Unable to find compressor by name %s"

    .line 240
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 239
    invoke-virtual {v2, v3}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object v2

    new-instance v3, Lio/grpc/Metadata;

    invoke-direct {v3}, Lio/grpc/Metadata;-><init>()V

    .line 237
    invoke-static {v0, v1, v2, v3}, Lio/grpc/internal/ClientCallImpl;->access$300(Lio/grpc/internal/ClientCallImpl;Lio/grpc/ClientCall$Listener;Lio/grpc/Status;Lio/grpc/Metadata;)V

    return-void
.end method
