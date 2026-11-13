.class final Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NameResolverErrorHandler;
.super Ljava/lang/Object;
.source "ManagedChannelImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->onError(Lio/grpc/Status;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "NameResolverErrorHandler"
.end annotation


# instance fields
.field final synthetic this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

.field final synthetic val$error:Lio/grpc/Status;


# direct methods
.method constructor <init>(Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;Lio/grpc/Status;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NameResolverErrorHandler;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    iput-object p2, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NameResolverErrorHandler;->val$error:Lio/grpc/Status;

    .line 1882
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NameResolverErrorHandler;->this$1:Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;

    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener$1NameResolverErrorHandler;->val$error:Lio/grpc/Status;

    .line 1885
    invoke-static {v0, v1}, Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;->access$7900(Lio/grpc/internal/ManagedChannelImpl$NameResolverListener;Lio/grpc/Status;)V

    return-void
.end method
