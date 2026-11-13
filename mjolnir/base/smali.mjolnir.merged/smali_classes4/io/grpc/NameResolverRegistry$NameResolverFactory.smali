.class final Lio/grpc/NameResolverRegistry$NameResolverFactory;
.super Lio/grpc/NameResolver$Factory;
.source "NameResolverRegistry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/NameResolverRegistry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "NameResolverFactory"
.end annotation


# instance fields
.field final synthetic this$0:Lio/grpc/NameResolverRegistry;


# direct methods
.method private constructor <init>(Lio/grpc/NameResolverRegistry;)V
    .locals 0

    iput-object p1, p0, Lio/grpc/NameResolverRegistry$NameResolverFactory;->this$0:Lio/grpc/NameResolverRegistry;

    .line 163
    invoke-direct {p0}, Lio/grpc/NameResolver$Factory;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lio/grpc/NameResolverRegistry;Lio/grpc/NameResolverRegistry$1;)V
    .locals 0

    .line 163
    invoke-direct {p0, p1}, Lio/grpc/NameResolverRegistry$NameResolverFactory;-><init>(Lio/grpc/NameResolverRegistry;)V

    return-void
.end method


# virtual methods
.method public getDefaultScheme()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lio/grpc/NameResolverRegistry$NameResolverFactory;->this$0:Lio/grpc/NameResolverRegistry;

    .line 173
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lio/grpc/NameResolverRegistry$NameResolverFactory;->this$0:Lio/grpc/NameResolverRegistry;

    .line 174
    invoke-static {v1}, Lio/grpc/NameResolverRegistry;->access$200(Lio/grpc/NameResolverRegistry;)Ljava/lang/String;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 175
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public newNameResolver(Ljava/net/URI;Lio/grpc/NameResolver$Args;)Lio/grpc/NameResolver;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/NameResolverRegistry$NameResolverFactory;->this$0:Lio/grpc/NameResolverRegistry;

    .line 167
    invoke-virtual {v0}, Lio/grpc/NameResolverRegistry;->providers()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/NameResolverProvider;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 168
    :cond_0
    invoke-virtual {v0, p1, p2}, Lio/grpc/NameResolverProvider;->newNameResolver(Ljava/net/URI;Lio/grpc/NameResolver$Args;)Lio/grpc/NameResolver;

    move-result-object p1

    :goto_0
    return-object p1
.end method
