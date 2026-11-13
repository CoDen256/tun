.class Lio/grpc/internal/DelayedClientCall$DelayedListener$4;
.super Ljava/lang/Object;
.source "DelayedClientCall.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/DelayedClientCall$DelayedListener;->onReady()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/grpc/internal/DelayedClientCall$DelayedListener;


# direct methods
.method constructor <init>(Lio/grpc/internal/DelayedClientCall$DelayedListener;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/internal/DelayedClientCall$DelayedListener$4;->this$0:Lio/grpc/internal/DelayedClientCall$DelayedListener;

    .line 481
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/DelayedClientCall$DelayedListener$4;->this$0:Lio/grpc/internal/DelayedClientCall$DelayedListener;

    .line 484
    invoke-static {v0}, Lio/grpc/internal/DelayedClientCall$DelayedListener;->access$400(Lio/grpc/internal/DelayedClientCall$DelayedListener;)Lio/grpc/ClientCall$Listener;

    move-result-object v0

    invoke-virtual {v0}, Lio/grpc/ClientCall$Listener;->onReady()V

    return-void
.end method
