.class Lio/grpc/internal/DelayedClientCall$7;
.super Ljava/lang/Object;
.source "DelayedClientCall.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/DelayedClientCall;->halfClose()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/grpc/internal/DelayedClientCall;


# direct methods
.method constructor <init>(Lio/grpc/internal/DelayedClientCall;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/internal/DelayedClientCall$7;->this$0:Lio/grpc/internal/DelayedClientCall;

    .line 365
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/DelayedClientCall$7;->this$0:Lio/grpc/internal/DelayedClientCall;

    .line 368
    invoke-static {v0}, Lio/grpc/internal/DelayedClientCall;->access$200(Lio/grpc/internal/DelayedClientCall;)Lio/grpc/ClientCall;

    move-result-object v0

    invoke-virtual {v0}, Lio/grpc/ClientCall;->halfClose()V

    return-void
.end method
