.class final Lio/grpc/internal/ManagedChannelImpl$ChannelStreamProvider$1ExitIdleModeForTransport;
.super Ljava/lang/Object;
.source "ManagedChannelImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/ManagedChannelImpl$ChannelStreamProvider;->getTransport(Lio/grpc/LoadBalancer$PickSubchannelArgs;)Lio/grpc/internal/ClientTransport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ExitIdleModeForTransport"
.end annotation


# instance fields
.field final synthetic this$1:Lio/grpc/internal/ManagedChannelImpl$ChannelStreamProvider;


# direct methods
.method constructor <init>(Lio/grpc/internal/ManagedChannelImpl$ChannelStreamProvider;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/internal/ManagedChannelImpl$ChannelStreamProvider$1ExitIdleModeForTransport;->this$1:Lio/grpc/internal/ManagedChannelImpl$ChannelStreamProvider;

    .line 505
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$ChannelStreamProvider$1ExitIdleModeForTransport;->this$1:Lio/grpc/internal/ManagedChannelImpl$ChannelStreamProvider;

    .line 508
    iget-object v0, v0, Lio/grpc/internal/ManagedChannelImpl$ChannelStreamProvider;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-virtual {v0}, Lio/grpc/internal/ManagedChannelImpl;->exitIdleMode()V

    return-void
.end method
