.class public final Lio/grpc/stub/MetadataUtils;
.super Ljava/lang/Object;
.source "MetadataUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/stub/MetadataUtils$MetadataCapturingClientInterceptor;,
        Lio/grpc/stub/MetadataUtils$HeaderAttachingClientInterceptor;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attachHeaders(Lio/grpc/stub/AbstractStub;Lio/grpc/Metadata;)Lio/grpc/stub/AbstractStub;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lio/grpc/stub/AbstractStub<",
            "TT;>;>(TT;",
            "Lio/grpc/Metadata;",
            ")TT;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x1

    new-array v0, v0, [Lio/grpc/ClientInterceptor;

    const/4 v1, 0x0

    .line 56
    invoke-static {p1}, Lio/grpc/stub/MetadataUtils;->newAttachHeadersInterceptor(Lio/grpc/Metadata;)Lio/grpc/ClientInterceptor;

    move-result-object p1

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lio/grpc/stub/AbstractStub;->withInterceptors([Lio/grpc/ClientInterceptor;)Lio/grpc/stub/AbstractStub;

    move-result-object p0

    return-object p0
.end method

.method public static captureMetadata(Lio/grpc/stub/AbstractStub;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicReference;)Lio/grpc/stub/AbstractStub;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lio/grpc/stub/AbstractStub<",
            "TT;>;>(TT;",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lio/grpc/Metadata;",
            ">;",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lio/grpc/Metadata;",
            ">;)TT;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x1

    new-array v0, v0, [Lio/grpc/ClientInterceptor;

    const/4 v1, 0x0

    .line 122
    invoke-static {p1, p2}, Lio/grpc/stub/MetadataUtils;->newCaptureMetadataInterceptor(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicReference;)Lio/grpc/ClientInterceptor;

    move-result-object p1

    aput-object p1, v0, v1

    .line 121
    invoke-virtual {p0, v0}, Lio/grpc/stub/AbstractStub;->withInterceptors([Lio/grpc/ClientInterceptor;)Lio/grpc/stub/AbstractStub;

    move-result-object p0

    return-object p0
.end method

.method public static newAttachHeadersInterceptor(Lio/grpc/Metadata;)Lio/grpc/ClientInterceptor;
    .locals 1

    .line 66
    new-instance v0, Lio/grpc/stub/MetadataUtils$HeaderAttachingClientInterceptor;

    invoke-direct {v0, p0}, Lio/grpc/stub/MetadataUtils$HeaderAttachingClientInterceptor;-><init>(Lio/grpc/Metadata;)V

    return-object v0
.end method

.method public static newCaptureMetadataInterceptor(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicReference;)Lio/grpc/ClientInterceptor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lio/grpc/Metadata;",
            ">;",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lio/grpc/Metadata;",
            ">;)",
            "Lio/grpc/ClientInterceptor;"
        }
    .end annotation

    .line 134
    new-instance v0, Lio/grpc/stub/MetadataUtils$MetadataCapturingClientInterceptor;

    invoke-direct {v0, p0, p1}, Lio/grpc/stub/MetadataUtils$MetadataCapturingClientInterceptor;-><init>(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicReference;)V

    return-object v0
.end method
