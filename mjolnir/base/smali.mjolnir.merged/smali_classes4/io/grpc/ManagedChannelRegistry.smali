.class public final Lio/grpc/ManagedChannelRegistry;
.super Ljava/lang/Object;
.source "ManagedChannelRegistry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/ManagedChannelRegistry$ProviderNotFoundException;,
        Lio/grpc/ManagedChannelRegistry$ManagedChannelPriorityAccessor;
    }
.end annotation


# static fields
.field private static instance:Lio/grpc/ManagedChannelRegistry;

.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private final allProviders:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Lio/grpc/ManagedChannelProvider;",
            ">;"
        }
    .end annotation
.end field

.field private effectiveProviders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/grpc/ManagedChannelProvider;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lio/grpc/ManagedChannelRegistry;

    .line 45
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/grpc/ManagedChannelRegistry;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lio/grpc/ManagedChannelRegistry;->allProviders:Ljava/util/LinkedHashSet;

    .line 52
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/ManagedChannelRegistry;->effectiveProviders:Ljava/util/List;

    return-void
.end method

.method private declared-synchronized addProvider(Lio/grpc/ManagedChannelProvider;)V
    .locals 2

    monitor-enter p0

    .line 69
    :try_start_0
    invoke-virtual {p1}, Lio/grpc/ManagedChannelProvider;->isAvailable()Z

    move-result v0

    const-string v1, "isAvailable() returned false"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    iget-object v0, p0, Lio/grpc/ManagedChannelRegistry;->allProviders:Ljava/util/LinkedHashSet;

    .line 70
    invoke-virtual {v0, p1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public static declared-synchronized getDefaultRegistry()Lio/grpc/ManagedChannelRegistry;
    .locals 6

    const-class v0, Lio/grpc/ManagedChannelRegistry;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lio/grpc/ManagedChannelRegistry;->instance:Lio/grpc/ManagedChannelRegistry;

    if-nez v1, :cond_2

    .line 101
    const-class v1, Lio/grpc/ManagedChannelProvider;

    .line 103
    invoke-static {}, Lio/grpc/ManagedChannelRegistry;->getHardCodedClasses()Ljava/util/List;

    move-result-object v2

    const-class v3, Lio/grpc/ManagedChannelProvider;

    .line 104
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    new-instance v4, Lio/grpc/ManagedChannelRegistry$ManagedChannelPriorityAccessor;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lio/grpc/ManagedChannelRegistry$ManagedChannelPriorityAccessor;-><init>(Lio/grpc/ManagedChannelRegistry$1;)V

    .line 101
    invoke-static {v1, v2, v3, v4}, Lio/grpc/ServiceProviders;->loadAll(Ljava/lang/Class;Ljava/lang/Iterable;Ljava/lang/ClassLoader;Lio/grpc/ServiceProviders$PriorityAccessor;)Ljava/util/List;

    move-result-object v1

    .line 106
    new-instance v2, Lio/grpc/ManagedChannelRegistry;

    invoke-direct {v2}, Lio/grpc/ManagedChannelRegistry;-><init>()V

    sput-object v2, Lio/grpc/ManagedChannelRegistry;->instance:Lio/grpc/ManagedChannelRegistry;

    .line 107
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/grpc/ManagedChannelProvider;

    sget-object v3, Lio/grpc/ManagedChannelRegistry;->logger:Ljava/util/logging/Logger;

    .line 108
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Service loader found "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 109
    invoke-virtual {v2}, Lio/grpc/ManagedChannelProvider;->isAvailable()Z

    move-result v3

    if-eqz v3, :cond_0

    sget-object v3, Lio/grpc/ManagedChannelRegistry;->instance:Lio/grpc/ManagedChannelRegistry;

    .line 110
    invoke-direct {v3, v2}, Lio/grpc/ManagedChannelRegistry;->addProvider(Lio/grpc/ManagedChannelProvider;)V

    goto :goto_0

    :cond_1
    sget-object v1, Lio/grpc/ManagedChannelRegistry;->instance:Lio/grpc/ManagedChannelRegistry;

    .line 113
    invoke-direct {v1}, Lio/grpc/ManagedChannelRegistry;->refreshProviders()V

    :cond_2
    sget-object v1, Lio/grpc/ManagedChannelRegistry;->instance:Lio/grpc/ManagedChannelRegistry;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method static getHardCodedClasses()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation

    .line 137
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    const-string v1, "io.grpc.okhttp.OkHttpChannelProvider"

    .line 139
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    sget-object v2, Lio/grpc/ManagedChannelRegistry;->logger:Ljava/util/logging/Logger;

    .line 141
    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v4, "Unable to find OkHttpChannelProvider"

    invoke-virtual {v2, v3, v4, v1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    :try_start_1
    const-string v1, "io.grpc.netty.NettyChannelProvider"

    .line 144
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v1

    sget-object v2, Lio/grpc/ManagedChannelRegistry;->logger:Ljava/util/logging/Logger;

    .line 146
    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v4, "Unable to find NettyChannelProvider"

    invoke-virtual {v2, v3, v4, v1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    :try_start_2
    const-string v1, "io.grpc.netty.UdsNettyChannelProvider"

    .line 149
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v1

    sget-object v2, Lio/grpc/ManagedChannelRegistry;->logger:Ljava/util/logging/Logger;

    .line 151
    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v4, "Unable to find UdsNettyChannelProvider"

    invoke-virtual {v2, v3, v4, v1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 153
    :goto_2
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private declared-synchronized refreshProviders()V
    .locals 2

    monitor-enter p0

    .line 84
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lio/grpc/ManagedChannelRegistry;->allProviders:Ljava/util/LinkedHashSet;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 87
    new-instance v1, Lio/grpc/ManagedChannelRegistry$1;

    invoke-direct {v1, p0}, Lio/grpc/ManagedChannelRegistry$1;-><init>(Lio/grpc/ManagedChannelRegistry;)V

    invoke-static {v1}, Ljava/util/Collections;->reverseOrder(Ljava/util/Comparator;)Ljava/util/Comparator;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 93
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/ManagedChannelRegistry;->effectiveProviders:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized deregister(Lio/grpc/ManagedChannelProvider;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lio/grpc/ManagedChannelRegistry;->allProviders:Ljava/util/LinkedHashSet;

    .line 79
    invoke-virtual {v0, p1}, Ljava/util/LinkedHashSet;->remove(Ljava/lang/Object;)Z

    .line 80
    invoke-direct {p0}, Lio/grpc/ManagedChannelRegistry;->refreshProviders()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method newChannelBuilder(Lio/grpc/NameResolverRegistry;Ljava/lang/String;Lio/grpc/ChannelCredentials;)Lio/grpc/ManagedChannelBuilder;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/NameResolverRegistry;",
            "Ljava/lang/String;",
            "Lio/grpc/ChannelCredentials;",
            ")",
            "Lio/grpc/ManagedChannelBuilder<",
            "*>;"
        }
    .end annotation

    .line 165
    :try_start_0
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 166
    invoke-virtual {p1}, Lio/grpc/NameResolverRegistry;->providers()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/NameResolverProvider;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_0

    .line 171
    invoke-virtual {p1}, Lio/grpc/NameResolverRegistry;->providers()Ljava/util/Map;

    move-result-object v0

    .line 172
    invoke-virtual {p1}, Lio/grpc/NameResolverRegistry;->asFactory()Lio/grpc/NameResolver$Factory;

    move-result-object p1

    invoke-virtual {p1}, Lio/grpc/NameResolver$Factory;->getDefaultScheme()Ljava/lang/String;

    move-result-object p1

    .line 171
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lio/grpc/NameResolverProvider;

    :cond_0
    if-eqz v0, :cond_1

    .line 176
    invoke-virtual {v0}, Lio/grpc/NameResolverProvider;->getProducedSocketAddressTypes()Ljava/util/Collection;

    move-result-object p1

    goto :goto_1

    .line 177
    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object p1

    .line 179
    :goto_1
    invoke-virtual {p0}, Lio/grpc/ManagedChannelRegistry;->providers()Ljava/util/List;

    move-result-object v0

    .line 180
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    .line 185
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 186
    invoke-virtual {p0}, Lio/grpc/ManagedChannelRegistry;->providers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/grpc/ManagedChannelProvider;

    .line 188
    invoke-virtual {v2}, Lio/grpc/ManagedChannelProvider;->getSupportedSocketAddressTypes()Ljava/util/Collection;

    move-result-object v3

    .line 189
    invoke-interface {v3, p1}, Ljava/util/Collection;->containsAll(Ljava/util/Collection;)Z

    move-result v3

    const-string v4, "; "

    if-nez v3, :cond_2

    .line 190
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": does not support 1 or more of "

    .line 192
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    invoke-interface {p1}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 197
    :cond_2
    invoke-virtual {v2, p2, p3}, Lio/grpc/ManagedChannelProvider;->newChannelBuilder(Ljava/lang/String;Lio/grpc/ChannelCredentials;)Lio/grpc/ManagedChannelProvider$NewChannelBuilderResult;

    move-result-object v3

    .line 198
    invoke-virtual {v3}, Lio/grpc/ManagedChannelProvider$NewChannelBuilderResult;->getChannelBuilder()Lio/grpc/ManagedChannelBuilder;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 199
    invoke-virtual {v3}, Lio/grpc/ManagedChannelProvider$NewChannelBuilderResult;->getChannelBuilder()Lio/grpc/ManagedChannelBuilder;

    move-result-object p1

    return-object p1

    .line 201
    :cond_3
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    .line 203
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    invoke-virtual {v3}, Lio/grpc/ManagedChannelProvider$NewChannelBuilderResult;->getError()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 206
    :cond_4
    new-instance p1, Lio/grpc/ManagedChannelRegistry$ProviderNotFoundException;

    const/4 p2, 0x2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->substring(I)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lio/grpc/ManagedChannelRegistry$ProviderNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 181
    :cond_5
    new-instance p1, Lio/grpc/ManagedChannelRegistry$ProviderNotFoundException;

    const-string p2, "No functional channel service provider found. Try adding a dependency on the grpc-okhttp, grpc-netty, or grpc-netty-shaded artifact"

    invoke-direct {p1, p2}, Lio/grpc/ManagedChannelRegistry$ProviderNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method newChannelBuilder(Ljava/lang/String;Lio/grpc/ChannelCredentials;)Lio/grpc/ManagedChannelBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lio/grpc/ChannelCredentials;",
            ")",
            "Lio/grpc/ManagedChannelBuilder<",
            "*>;"
        }
    .end annotation

    .line 157
    invoke-static {}, Lio/grpc/NameResolverRegistry;->getDefaultRegistry()Lio/grpc/NameResolverRegistry;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lio/grpc/ManagedChannelRegistry;->newChannelBuilder(Lio/grpc/NameResolverRegistry;Ljava/lang/String;Lio/grpc/ChannelCredentials;)Lio/grpc/ManagedChannelBuilder;

    move-result-object p1

    return-object p1
.end method

.method provider()Lio/grpc/ManagedChannelProvider;
    .locals 2

    .line 128
    invoke-virtual {p0}, Lio/grpc/ManagedChannelRegistry;->providers()Ljava/util/List;

    move-result-object v0

    .line 129
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/ManagedChannelProvider;

    :goto_0
    return-object v0
.end method

.method declared-synchronized providers()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/grpc/ManagedChannelProvider;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lio/grpc/ManagedChannelRegistry;->effectiveProviders:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized register(Lio/grpc/ManagedChannelProvider;)V
    .locals 0

    monitor-enter p0

    .line 64
    :try_start_0
    invoke-direct {p0, p1}, Lio/grpc/ManagedChannelRegistry;->addProvider(Lio/grpc/ManagedChannelProvider;)V

    .line 65
    invoke-direct {p0}, Lio/grpc/ManagedChannelRegistry;->refreshProviders()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
