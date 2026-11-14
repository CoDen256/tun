.class Lio/grpc/internal/DelayedStream$4;
.super Ljava/lang/Object;
.source "DelayedStream.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/DelayedStream;->setStream(Lio/grpc/internal/ClientStream;)Ljava/lang/Runnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/grpc/internal/DelayedStream;


# direct methods
.method constructor <init>(Lio/grpc/internal/DelayedStream;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/internal/DelayedStream$4;->this$0:Lio/grpc/internal/DelayedStream;

    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/DelayedStream$4;->this$0:Lio/grpc/internal/DelayedStream;

    .line 148
    invoke-static {v0}, Lio/grpc/internal/DelayedStream;->access$100(Lio/grpc/internal/DelayedStream;)V

    return-void
.end method
