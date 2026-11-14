.class Lio/grpc/internal/ApplicationThreadDeframer$5;
.super Ljava/lang/Object;
.source "ApplicationThreadDeframer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/ApplicationThreadDeframer;->close()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/grpc/internal/ApplicationThreadDeframer;


# direct methods
.method constructor <init>(Lio/grpc/internal/ApplicationThreadDeframer;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/internal/ApplicationThreadDeframer$5;->this$0:Lio/grpc/internal/ApplicationThreadDeframer;

    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/ApplicationThreadDeframer$5;->this$0:Lio/grpc/internal/ApplicationThreadDeframer;

    .line 131
    invoke-static {v0}, Lio/grpc/internal/ApplicationThreadDeframer;->access$000(Lio/grpc/internal/ApplicationThreadDeframer;)Lio/grpc/internal/MessageDeframer;

    move-result-object v0

    invoke-virtual {v0}, Lio/grpc/internal/MessageDeframer;->close()V

    return-void
.end method
