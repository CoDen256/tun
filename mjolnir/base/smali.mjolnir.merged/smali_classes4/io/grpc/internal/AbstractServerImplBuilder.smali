.class public abstract Lio/grpc/internal/AbstractServerImplBuilder;
.super Lio/grpc/ServerBuilder;
.source "AbstractServerImplBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lio/grpc/ServerBuilder<",
        "TT;>;>",
        "Lio/grpc/ServerBuilder<",
        "TT;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Lio/grpc/ServerBuilder;-><init>()V

    return-void
.end method

.method public static forPort(I)Lio/grpc/ServerBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lio/grpc/ServerBuilder<",
            "*>;"
        }
    .end annotation

    .line 59
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Subclass failed to hide static factory"

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public bridge synthetic addService(Lio/grpc/BindableService;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerImplBuilder;->addService(Lio/grpc/BindableService;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic addService(Lio/grpc/ServerServiceDefinition;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerImplBuilder;->addService(Lio/grpc/ServerServiceDefinition;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public addService(Lio/grpc/BindableService;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/BindableService;",
            ")TT;"
        }
    .end annotation

    .line 93
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/grpc/ServerBuilder;->addService(Lio/grpc/BindableService;)Lio/grpc/ServerBuilder;

    .line 94
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public addService(Lio/grpc/ServerServiceDefinition;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/ServerServiceDefinition;",
            ")TT;"
        }
    .end annotation

    .line 87
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/grpc/ServerBuilder;->addService(Lio/grpc/ServerServiceDefinition;)Lio/grpc/ServerBuilder;

    .line 88
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic addStreamTracerFactory(Lio/grpc/ServerStreamTracer$Factory;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerImplBuilder;->addStreamTracerFactory(Lio/grpc/ServerStreamTracer$Factory;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public addStreamTracerFactory(Lio/grpc/ServerStreamTracer$Factory;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/ServerStreamTracer$Factory;",
            ")TT;"
        }
    .end annotation

    .line 111
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/grpc/ServerBuilder;->addStreamTracerFactory(Lio/grpc/ServerStreamTracer$Factory;)Lio/grpc/ServerBuilder;

    .line 112
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic addTransportFilter(Lio/grpc/ServerTransportFilter;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerImplBuilder;->addTransportFilter(Lio/grpc/ServerTransportFilter;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public addTransportFilter(Lio/grpc/ServerTransportFilter;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/ServerTransportFilter;",
            ")TT;"
        }
    .end annotation

    .line 105
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/grpc/ServerBuilder;->addTransportFilter(Lio/grpc/ServerTransportFilter;)Lio/grpc/ServerBuilder;

    .line 106
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public build()Lio/grpc/Server;
    .locals 1

    .line 217
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lio/grpc/ServerBuilder;->build()Lio/grpc/Server;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic callExecutor(Lio/grpc/ServerCallExecutorSupplier;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerImplBuilder;->callExecutor(Lio/grpc/ServerCallExecutorSupplier;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public callExecutor(Lio/grpc/ServerCallExecutorSupplier;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/ServerCallExecutorSupplier;",
            ")TT;"
        }
    .end annotation

    .line 75
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/grpc/ServerBuilder;->callExecutor(Lio/grpc/ServerCallExecutorSupplier;)Lio/grpc/ServerBuilder;

    .line 76
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic compressorRegistry(Lio/grpc/CompressorRegistry;)Lio/grpc/ServerBuilder;
    .locals 0
    .param p1    # Lio/grpc/CompressorRegistry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 48
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerImplBuilder;->compressorRegistry(Lio/grpc/CompressorRegistry;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public compressorRegistry(Lio/grpc/CompressorRegistry;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .param p1    # Lio/grpc/CompressorRegistry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/CompressorRegistry;",
            ")TT;"
        }
    .end annotation

    .line 141
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/grpc/ServerBuilder;->compressorRegistry(Lio/grpc/CompressorRegistry;)Lio/grpc/ServerBuilder;

    .line 142
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic decompressorRegistry(Lio/grpc/DecompressorRegistry;)Lio/grpc/ServerBuilder;
    .locals 0
    .param p1    # Lio/grpc/DecompressorRegistry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 48
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerImplBuilder;->decompressorRegistry(Lio/grpc/DecompressorRegistry;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public decompressorRegistry(Lio/grpc/DecompressorRegistry;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .param p1    # Lio/grpc/DecompressorRegistry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/DecompressorRegistry;",
            ")TT;"
        }
    .end annotation

    .line 135
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/grpc/ServerBuilder;->decompressorRegistry(Lio/grpc/DecompressorRegistry;)Lio/grpc/ServerBuilder;

    .line 136
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method protected abstract delegate()Lio/grpc/ServerBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/grpc/ServerBuilder<",
            "*>;"
        }
    .end annotation
.end method

.method public bridge synthetic directExecutor()Lio/grpc/ServerBuilder;
    .locals 1

    .line 48
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->directExecutor()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object v0

    return-object v0
.end method

.method public directExecutor()Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 69
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lio/grpc/ServerBuilder;->directExecutor()Lio/grpc/ServerBuilder;

    .line 70
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic executor(Ljava/util/concurrent/Executor;)Lio/grpc/ServerBuilder;
    .locals 0
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 48
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerImplBuilder;->executor(Ljava/util/concurrent/Executor;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public executor(Ljava/util/concurrent/Executor;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            ")TT;"
        }
    .end annotation

    .line 81
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/grpc/ServerBuilder;->executor(Ljava/util/concurrent/Executor;)Lio/grpc/ServerBuilder;

    .line 82
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic fallbackHandlerRegistry(Lio/grpc/HandlerRegistry;)Lio/grpc/ServerBuilder;
    .locals 0
    .param p1    # Lio/grpc/HandlerRegistry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 48
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerImplBuilder;->fallbackHandlerRegistry(Lio/grpc/HandlerRegistry;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public fallbackHandlerRegistry(Lio/grpc/HandlerRegistry;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .param p1    # Lio/grpc/HandlerRegistry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/HandlerRegistry;",
            ")TT;"
        }
    .end annotation

    .line 117
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/grpc/ServerBuilder;->fallbackHandlerRegistry(Lio/grpc/HandlerRegistry;)Lio/grpc/ServerBuilder;

    .line 118
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic handshakeTimeout(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1, p2, p3}, Lio/grpc/internal/AbstractServerImplBuilder;->handshakeTimeout(JLjava/util/concurrent/TimeUnit;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public handshakeTimeout(JLjava/util/concurrent/TimeUnit;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .line 147
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lio/grpc/ServerBuilder;->handshakeTimeout(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;

    .line 148
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic intercept(Lio/grpc/ServerInterceptor;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerImplBuilder;->intercept(Lio/grpc/ServerInterceptor;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public intercept(Lio/grpc/ServerInterceptor;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/ServerInterceptor;",
            ")TT;"
        }
    .end annotation

    .line 99
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/grpc/ServerBuilder;->intercept(Lio/grpc/ServerInterceptor;)Lio/grpc/ServerBuilder;

    .line 100
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic keepAliveTime(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1, p2, p3}, Lio/grpc/internal/AbstractServerImplBuilder;->keepAliveTime(JLjava/util/concurrent/TimeUnit;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public keepAliveTime(JLjava/util/concurrent/TimeUnit;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .line 153
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lio/grpc/ServerBuilder;->keepAliveTime(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;

    .line 154
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic keepAliveTimeout(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1, p2, p3}, Lio/grpc/internal/AbstractServerImplBuilder;->keepAliveTimeout(JLjava/util/concurrent/TimeUnit;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public keepAliveTimeout(JLjava/util/concurrent/TimeUnit;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .line 159
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lio/grpc/ServerBuilder;->keepAliveTimeout(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;

    .line 160
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic maxConnectionAge(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1, p2, p3}, Lio/grpc/internal/AbstractServerImplBuilder;->maxConnectionAge(JLjava/util/concurrent/TimeUnit;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public maxConnectionAge(JLjava/util/concurrent/TimeUnit;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .line 171
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lio/grpc/ServerBuilder;->maxConnectionAge(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;

    .line 172
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic maxConnectionAgeGrace(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1, p2, p3}, Lio/grpc/internal/AbstractServerImplBuilder;->maxConnectionAgeGrace(JLjava/util/concurrent/TimeUnit;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public maxConnectionAgeGrace(JLjava/util/concurrent/TimeUnit;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .line 177
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lio/grpc/ServerBuilder;->maxConnectionAgeGrace(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;

    .line 178
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic maxConnectionIdle(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1, p2, p3}, Lio/grpc/internal/AbstractServerImplBuilder;->maxConnectionIdle(JLjava/util/concurrent/TimeUnit;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public maxConnectionIdle(JLjava/util/concurrent/TimeUnit;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .line 165
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lio/grpc/ServerBuilder;->maxConnectionIdle(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;

    .line 166
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic maxInboundMessageSize(I)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerImplBuilder;->maxInboundMessageSize(I)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public maxInboundMessageSize(I)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 195
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/grpc/ServerBuilder;->maxInboundMessageSize(I)Lio/grpc/ServerBuilder;

    .line 196
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic maxInboundMetadataSize(I)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerImplBuilder;->maxInboundMetadataSize(I)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public maxInboundMetadataSize(I)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 201
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/grpc/ServerBuilder;->maxInboundMetadataSize(I)Lio/grpc/ServerBuilder;

    .line 202
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic permitKeepAliveTime(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1, p2, p3}, Lio/grpc/internal/AbstractServerImplBuilder;->permitKeepAliveTime(JLjava/util/concurrent/TimeUnit;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public permitKeepAliveTime(JLjava/util/concurrent/TimeUnit;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .line 183
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lio/grpc/ServerBuilder;->permitKeepAliveTime(JLjava/util/concurrent/TimeUnit;)Lio/grpc/ServerBuilder;

    .line 184
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic permitKeepAliveWithoutCalls(Z)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerImplBuilder;->permitKeepAliveWithoutCalls(Z)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public permitKeepAliveWithoutCalls(Z)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .line 189
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/grpc/ServerBuilder;->permitKeepAliveWithoutCalls(Z)Lio/grpc/ServerBuilder;

    .line 190
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setBinaryLog(Lio/grpc/BinaryLog;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Lio/grpc/internal/AbstractServerImplBuilder;->setBinaryLog(Lio/grpc/BinaryLog;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public setBinaryLog(Lio/grpc/BinaryLog;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/BinaryLog;",
            ")TT;"
        }
    .end annotation

    .line 207
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/grpc/ServerBuilder;->setBinaryLog(Lio/grpc/BinaryLog;)Lio/grpc/ServerBuilder;

    .line 208
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method protected final thisT()Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 222
    invoke-static {p0}, Lcom/google/common/base/MoreObjects;->toStringHelper(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "delegate"

    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic useTransportSecurity(Ljava/io/File;Ljava/io/File;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1, p2}, Lio/grpc/internal/AbstractServerImplBuilder;->useTransportSecurity(Ljava/io/File;Ljava/io/File;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic useTransportSecurity(Ljava/io/InputStream;Ljava/io/InputStream;)Lio/grpc/ServerBuilder;
    .locals 0

    .line 48
    invoke-virtual {p0, p1, p2}, Lio/grpc/internal/AbstractServerImplBuilder;->useTransportSecurity(Ljava/io/InputStream;Ljava/io/InputStream;)Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public useTransportSecurity(Ljava/io/File;Ljava/io/File;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/io/File;",
            ")TT;"
        }
    .end annotation

    .line 123
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lio/grpc/ServerBuilder;->useTransportSecurity(Ljava/io/File;Ljava/io/File;)Lio/grpc/ServerBuilder;

    .line 124
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method

.method public useTransportSecurity(Ljava/io/InputStream;Ljava/io/InputStream;)Lio/grpc/internal/AbstractServerImplBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/io/InputStream;",
            ")TT;"
        }
    .end annotation

    .line 129
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->delegate()Lio/grpc/ServerBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lio/grpc/ServerBuilder;->useTransportSecurity(Ljava/io/InputStream;Ljava/io/InputStream;)Lio/grpc/ServerBuilder;

    .line 130
    invoke-virtual {p0}, Lio/grpc/internal/AbstractServerImplBuilder;->thisT()Lio/grpc/internal/AbstractServerImplBuilder;

    move-result-object p1

    return-object p1
.end method
