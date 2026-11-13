.class Lio/grpc/internal/CallCredentialsApplyingTransportFactory$CallCredentialsApplyingTransport$1;
.super Ljava/lang/Object;
.source "CallCredentialsApplyingTransportFactory.java"

# interfaces
.implements Lio/grpc/internal/MetadataApplierImpl$MetadataApplierListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/internal/CallCredentialsApplyingTransportFactory$CallCredentialsApplyingTransport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/grpc/internal/CallCredentialsApplyingTransportFactory$CallCredentialsApplyingTransport;


# direct methods
.method constructor <init>(Lio/grpc/internal/CallCredentialsApplyingTransportFactory$CallCredentialsApplyingTransport;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/internal/CallCredentialsApplyingTransportFactory$CallCredentialsApplyingTransport$1;->this$1:Lio/grpc/internal/CallCredentialsApplyingTransportFactory$CallCredentialsApplyingTransport;

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/CallCredentialsApplyingTransportFactory$CallCredentialsApplyingTransport$1;->this$1:Lio/grpc/internal/CallCredentialsApplyingTransportFactory$CallCredentialsApplyingTransport;

    .line 90
    invoke-static {v0}, Lio/grpc/internal/CallCredentialsApplyingTransportFactory$CallCredentialsApplyingTransport;->access$000(Lio/grpc/internal/CallCredentialsApplyingTransportFactory$CallCredentialsApplyingTransport;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/grpc/internal/CallCredentialsApplyingTransportFactory$CallCredentialsApplyingTransport$1;->this$1:Lio/grpc/internal/CallCredentialsApplyingTransportFactory$CallCredentialsApplyingTransport;

    .line 91
    invoke-static {v0}, Lio/grpc/internal/CallCredentialsApplyingTransportFactory$CallCredentialsApplyingTransport;->access$100(Lio/grpc/internal/CallCredentialsApplyingTransportFactory$CallCredentialsApplyingTransport;)V

    :cond_0
    return-void
.end method
