.class public final Lio/grpc/internal/ConscryptLoader;
.super Ljava/lang/Object;
.source "ConscryptLoader.java"


# static fields
.field private static final IS_CONSCRYPT_METHOD:Ljava/lang/reflect/Method;

.field private static final NEW_PROVIDER_METHOD:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    :try_start_0
    const-string v0, "org.conscrypt.Conscrypt"

    .line 34
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "newProvider"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    .line 35
    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const-string v3, "isConscrypt"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    .line 36
    const-class v5, Ljava/security/Provider;

    aput-object v5, v4, v2

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 41
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    :catch_1
    const/4 v1, 0x0

    move-object v0, v1

    :goto_0
    sput-object v1, Lio/grpc/internal/ConscryptLoader;->NEW_PROVIDER_METHOD:Ljava/lang/reflect/Method;

    sput-object v0, Lio/grpc/internal/ConscryptLoader;->IS_CONSCRYPT_METHOD:Ljava/lang/reflect/Method;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isConscrypt(Ljava/security/Provider;)Z
    .locals 3

    .line 57
    invoke-static {}, Lio/grpc/internal/ConscryptLoader;->isPresent()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    :try_start_0
    sget-object v0, Lio/grpc/internal/ConscryptLoader;->IS_CONSCRYPT_METHOD:Ljava/lang/reflect/Method;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v1

    const/4 p0, 0x0

    .line 61
    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 65
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :catch_1
    move-exception p0

    .line 63
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public static isPresent()Z
    .locals 1

    sget-object v0, Lio/grpc/internal/ConscryptLoader;->NEW_PROVIDER_METHOD:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static newProvider()Ljava/security/Provider;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 71
    invoke-static {}, Lio/grpc/internal/ConscryptLoader;->isPresent()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lio/grpc/internal/ConscryptLoader;->NEW_PROVIDER_METHOD:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 78
    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/Provider;

    return-object v0

    :cond_0
    const-string v0, "org.conscrypt.Conscrypt"

    .line 72
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 73
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Unexpected failure referencing Conscrypt class"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method
