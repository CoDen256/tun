.class final Lio/grpc/stub/ClientCalls$StreamObserverToCallListenerAdapter;
.super Lio/grpc/stub/ClientCalls$StartableListener;
.source "ClientCalls.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/stub/ClientCalls;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "StreamObserverToCallListenerAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ReqT:",
        "Ljava/lang/Object;",
        "RespT:",
        "Ljava/lang/Object;",
        ">",
        "Lio/grpc/stub/ClientCalls$StartableListener<",
        "TRespT;>;"
    }
.end annotation


# instance fields
.field private final adapter:Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter<",
            "TReqT;>;"
        }
    .end annotation
.end field

.field private firstResponseReceived:Z

.field private final observer:Lio/grpc/stub/StreamObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/stub/StreamObserver<",
            "TRespT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/grpc/stub/StreamObserver;Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/stub/StreamObserver<",
            "TRespT;>;",
            "Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter<",
            "TReqT;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 450
    invoke-direct {p0, v0}, Lio/grpc/stub/ClientCalls$StartableListener;-><init>(Lio/grpc/stub/ClientCalls$1;)V

    iput-object p1, p0, Lio/grpc/stub/ClientCalls$StreamObserverToCallListenerAdapter;->observer:Lio/grpc/stub/StreamObserver;

    iput-object p2, p0, Lio/grpc/stub/ClientCalls$StreamObserverToCallListenerAdapter;->adapter:Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;

    .line 453
    instance-of v0, p1, Lio/grpc/stub/ClientResponseObserver;

    if-eqz v0, :cond_0

    .line 455
    check-cast p1, Lio/grpc/stub/ClientResponseObserver;

    .line 457
    invoke-interface {p1, p2}, Lio/grpc/stub/ClientResponseObserver;->beforeStart(Lio/grpc/stub/ClientCallStreamObserver;)V

    .line 459
    :cond_0
    invoke-static {p2}, Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;->access$100(Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;)V

    return-void
.end method


# virtual methods
.method public onClose(Lio/grpc/Status;Lio/grpc/Metadata;)V
    .locals 1

    .line 484
    invoke-virtual {p1}, Lio/grpc/Status;->isOk()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lio/grpc/stub/ClientCalls$StreamObserverToCallListenerAdapter;->observer:Lio/grpc/stub/StreamObserver;

    .line 485
    invoke-interface {p1}, Lio/grpc/stub/StreamObserver;->onCompleted()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lio/grpc/stub/ClientCalls$StreamObserverToCallListenerAdapter;->observer:Lio/grpc/stub/StreamObserver;

    .line 487
    invoke-virtual {p1, p2}, Lio/grpc/Status;->asRuntimeException(Lio/grpc/Metadata;)Lio/grpc/StatusRuntimeException;

    move-result-object p1

    invoke-interface {v0, p1}, Lio/grpc/stub/StreamObserver;->onError(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public onHeaders(Lio/grpc/Metadata;)V
    .locals 0

    return-void
.end method

.method public onMessage(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TRespT;)V"
        }
    .end annotation

    iget-boolean v0, p0, Lio/grpc/stub/ClientCalls$StreamObserverToCallListenerAdapter;->firstResponseReceived:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lio/grpc/stub/ClientCalls$StreamObserverToCallListenerAdapter;->adapter:Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;

    .line 468
    invoke-static {v0}, Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;->access$200(Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 469
    :cond_0
    sget-object p1, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    const-string v0, "More than one responses received for unary or client-streaming call"

    .line 470
    invoke-virtual {p1, v0}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object p1

    .line 471
    invoke-virtual {p1}, Lio/grpc/Status;->asRuntimeException()Lio/grpc/StatusRuntimeException;

    move-result-object p1

    throw p1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/grpc/stub/ClientCalls$StreamObserverToCallListenerAdapter;->firstResponseReceived:Z

    iget-object v1, p0, Lio/grpc/stub/ClientCalls$StreamObserverToCallListenerAdapter;->observer:Lio/grpc/stub/StreamObserver;

    .line 474
    invoke-interface {v1, p1}, Lio/grpc/stub/StreamObserver;->onNext(Ljava/lang/Object;)V

    iget-object p1, p0, Lio/grpc/stub/ClientCalls$StreamObserverToCallListenerAdapter;->adapter:Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;

    .line 476
    invoke-static {p1}, Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;->access$200(Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lio/grpc/stub/ClientCalls$StreamObserverToCallListenerAdapter;->adapter:Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;

    invoke-static {p1}, Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;->access$300(Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lio/grpc/stub/ClientCalls$StreamObserverToCallListenerAdapter;->adapter:Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;

    .line 478
    invoke-virtual {p1, v0}, Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;->request(I)V

    :cond_2
    return-void
.end method

.method public onReady()V
    .locals 1

    iget-object v0, p0, Lio/grpc/stub/ClientCalls$StreamObserverToCallListenerAdapter;->adapter:Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;

    .line 493
    invoke-static {v0}, Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;->access$400(Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;)Ljava/lang/Runnable;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/grpc/stub/ClientCalls$StreamObserverToCallListenerAdapter;->adapter:Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;

    .line 494
    invoke-static {v0}, Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;->access$400(Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method onStart()V
    .locals 2

    iget-object v0, p0, Lio/grpc/stub/ClientCalls$StreamObserverToCallListenerAdapter;->adapter:Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;

    .line 500
    invoke-static {v0}, Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;->access$500(Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;)I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lio/grpc/stub/ClientCalls$StreamObserverToCallListenerAdapter;->adapter:Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;

    .line 501
    invoke-static {v0}, Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;->access$500(Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;)I

    move-result v1

    invoke-virtual {v0, v1}, Lio/grpc/stub/ClientCalls$CallToStreamObserverAdapter;->request(I)V

    :cond_0
    return-void
.end method
