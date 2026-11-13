.class public final Lio/grpc/android/AndroidChannelBuilder;
.super Lio/grpc/ForwardingChannelBuilder;
.source "AndroidChannelBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/grpc/ForwardingChannelBuilder<",
        "Lio/grpc/android/AndroidChannelBuilder;",
        ">;"
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "AndroidChannelBuilder"

.field private static final OKHTTP_CHANNEL_PROVIDER:Lio/grpc/ManagedChannelProvider;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# instance fields
.field private context:Landroid/content/Context;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final delegateBuilder:Lio/grpc/ManagedChannelBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/ManagedChannelBuilder<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 60
    invoke-static {}, Lio/grpc/android/AndroidChannelBuilder;->findOkHttp()Lio/grpc/ManagedChannelProvider;

    move-result-object v0

    sput-object v0, Lio/grpc/android/AndroidChannelBuilder;->OKHTTP_CHANNEL_PROVIDER:Lio/grpc/ManagedChannelProvider;

    return-void
.end method

.method private constructor <init>(Lio/grpc/ManagedChannelBuilder;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "delegateBuilder"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/ManagedChannelBuilder<",
            "*>;)V"
        }
    .end annotation

    .line 146
    invoke-direct {p0}, Lio/grpc/ForwardingChannelBuilder;-><init>()V

    const-string v0, "delegateBuilder"

    .line 147
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/ManagedChannelBuilder;

    iput-object p1, p0, Lio/grpc/android/AndroidChannelBuilder;->delegateBuilder:Lio/grpc/ManagedChannelBuilder;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .line 138
    invoke-direct {p0}, Lio/grpc/ForwardingChannelBuilder;-><init>()V

    sget-object v0, Lio/grpc/android/AndroidChannelBuilder;->OKHTTP_CHANNEL_PROVIDER:Lio/grpc/ManagedChannelProvider;

    if-eqz v0, :cond_0

    .line 143
    invoke-static {v0, p1}, Lio/grpc/InternalManagedChannelProvider;->builderForTarget(Lio/grpc/ManagedChannelProvider;Ljava/lang/String;)Lio/grpc/ManagedChannelBuilder;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/android/AndroidChannelBuilder;->delegateBuilder:Lio/grpc/ManagedChannelBuilder;

    return-void

    .line 140
    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Unable to load OkHttpChannelProvider"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static findOkHttp()Lio/grpc/ManagedChannelProvider;
    .locals 5

    const-string v0, "AndroidChannelBuilder"

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "io.grpc.okhttp.OkHttpChannelProvider"

    .line 65
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    .line 72
    :try_start_1
    const-class v3, Lio/grpc/ManagedChannelProvider;

    invoke-virtual {v2, v3}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v2
    :try_end_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_1

    const/4 v3, 0x0

    :try_start_2
    new-array v4, v3, [Ljava/lang/Class;

    .line 79
    invoke-virtual {v2, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/grpc/ManagedChannelProvider;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 84
    invoke-static {v2}, Lio/grpc/InternalManagedChannelProvider;->isAvailable(Lio/grpc/ManagedChannelProvider;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v2, "OkHttpChannelProvider.isAvailable() returned false"

    .line 85
    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_0
    return-object v2

    :catch_0
    move-exception v2

    const-string v3, "Failed to construct OkHttpChannelProvider"

    .line 81
    invoke-static {v0, v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v1

    :catch_1
    move-exception v2

    const-string v3, "Couldn\'t cast OkHttpChannelProvider to ManagedChannelProvider"

    .line 74
    invoke-static {v0, v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v1

    :catch_2
    move-exception v2

    const-string v3, "Failed to find OkHttpChannelProvider"

    .line 67
    invoke-static {v0, v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v1
.end method

.method public static forAddress(Ljava/lang/String;I)Lio/grpc/android/AndroidChannelBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "name",
            "port"
        }
    .end annotation

    .line 107
    invoke-static {p0, p1}, Lio/grpc/internal/GrpcUtil;->authorityFromHostAndPort(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lio/grpc/android/AndroidChannelBuilder;->forTarget(Ljava/lang/String;)Lio/grpc/android/AndroidChannelBuilder;

    move-result-object p0

    return-object p0
.end method

.method public static forTarget(Ljava/lang/String;)Lio/grpc/android/AndroidChannelBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .line 100
    new-instance v0, Lio/grpc/android/AndroidChannelBuilder;

    invoke-direct {v0, p0}, Lio/grpc/android/AndroidChannelBuilder;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static fromBuilder(Lio/grpc/ManagedChannelBuilder;)Lio/grpc/android/AndroidChannelBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "builder"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/ManagedChannelBuilder<",
            "*>;)",
            "Lio/grpc/android/AndroidChannelBuilder;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 121
    invoke-static {p0}, Lio/grpc/android/AndroidChannelBuilder;->usingBuilder(Lio/grpc/ManagedChannelBuilder;)Lio/grpc/android/AndroidChannelBuilder;

    move-result-object p0

    return-object p0
.end method

.method public static usingBuilder(Lio/grpc/ManagedChannelBuilder;)Lio/grpc/android/AndroidChannelBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "builder"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/ManagedChannelBuilder<",
            "*>;)",
            "Lio/grpc/android/AndroidChannelBuilder;"
        }
    .end annotation

    .line 135
    new-instance v0, Lio/grpc/android/AndroidChannelBuilder;

    invoke-direct {v0, p0}, Lio/grpc/android/AndroidChannelBuilder;-><init>(Lio/grpc/ManagedChannelBuilder;)V

    return-object v0
.end method


# virtual methods
.method public build()Lio/grpc/ManagedChannel;
    .locals 3

    .line 168
    new-instance v0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;

    iget-object v1, p0, Lio/grpc/android/AndroidChannelBuilder;->delegateBuilder:Lio/grpc/ManagedChannelBuilder;

    invoke-virtual {v1}, Lio/grpc/ManagedChannelBuilder;->build()Lio/grpc/ManagedChannel;

    move-result-object v1

    iget-object v2, p0, Lio/grpc/android/AndroidChannelBuilder;->context:Landroid/content/Context;

    invoke-direct {v0, v1, v2}, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;-><init>(Lio/grpc/ManagedChannel;Landroid/content/Context;)V

    return-object v0
.end method

.method public context(Landroid/content/Context;)Lio/grpc/android/AndroidChannelBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    iput-object p1, p0, Lio/grpc/android/AndroidChannelBuilder;->context:Landroid/content/Context;

    return-object p0
.end method

.method protected delegate()Lio/grpc/ManagedChannelBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/grpc/ManagedChannelBuilder<",
            "*>;"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/android/AndroidChannelBuilder;->delegateBuilder:Lio/grpc/ManagedChannelBuilder;

    return-object v0
.end method
