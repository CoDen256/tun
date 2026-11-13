.class public final Lexpo/modules/kotlin/allocators/ObjectConstructorFactory;
.super Ljava/lang/Object;
.source "ObjectConstructorFactory.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J \u0010\u0003\u001a\u0008\u0012\u0004\u0012\u0002H\u00050\u0004\"\u0004\u0008\u0000\u0010\u00052\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u0002H\u00050\u0007J$\u0010\u0008\u001a\n\u0012\u0004\u0012\u0002H\u0005\u0018\u00010\u0004\"\u0004\u0008\u0000\u0010\u00052\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u0002H\u00050\u0007H\u0002J\"\u0010\t\u001a\u0008\u0012\u0004\u0012\u0002H\u00050\u0004\"\u0004\u0008\u0000\u0010\u00052\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u0002H\u00050\u0007H\u0002\u00a8\u0006\n"
    }
    d2 = {
        "Lexpo/modules/kotlin/allocators/ObjectConstructorFactory;",
        "",
        "()V",
        "get",
        "Lexpo/modules/kotlin/allocators/ObjectConstructor;",
        "T",
        "clazz",
        "Ljava/lang/Class;",
        "tryToUseDefaultConstructor",
        "useUnsafeAllocator",
        "expo-modules-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static synthetic $r8$lambda$3OblFktdTZUoRVnJgib5hvalEVk(Lexpo/modules/kotlin/allocators/UnsafeAllocator;)Ljava/lang/Object;
    .locals 0

    invoke-static {p0}, Lexpo/modules/kotlin/allocators/ObjectConstructorFactory;->useUnsafeAllocator$lambda$1(Lexpo/modules/kotlin/allocators/UnsafeAllocator;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$gMs_IWj-D5ge4e5bnXBbdh78BEc(Ljava/lang/reflect/Constructor;)Ljava/lang/Object;
    .locals 0

    invoke-static {p0}, Lexpo/modules/kotlin/allocators/ObjectConstructorFactory;->tryToUseDefaultConstructor$lambda$0(Ljava/lang/reflect/Constructor;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final tryToUseDefaultConstructor(Ljava/lang/Class;)Lexpo/modules/kotlin/allocators/ObjectConstructor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lexpo/modules/kotlin/allocators/ObjectConstructor<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_0
    new-array v0, v0, [Ljava/lang/Class;

    .line 12
    invoke-virtual {p1, v0}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ljava/lang/reflect/Constructor;->isAccessible()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 14
    invoke-virtual {p1, v0}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 17
    :cond_0
    new-instance v0, Lexpo/modules/kotlin/allocators/ObjectConstructorFactory$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/allocators/ObjectConstructorFactory$$ExternalSyntheticLambda0;-><init>(Ljava/lang/reflect/Constructor;)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private static final tryToUseDefaultConstructor$lambda$0(Ljava/lang/reflect/Constructor;)Ljava/lang/Object;
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    .line 18
    invoke-virtual {p0, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private final useUnsafeAllocator(Ljava/lang/Class;)Lexpo/modules/kotlin/allocators/ObjectConstructor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lexpo/modules/kotlin/allocators/ObjectConstructor<",
            "TT;>;"
        }
    .end annotation

    .line 26
    sget-object v0, Lexpo/modules/kotlin/allocators/UnsafeAllocator;->Companion:Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;

    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;->createAllocator(Ljava/lang/Class;)Lexpo/modules/kotlin/allocators/UnsafeAllocator;

    move-result-object p1

    .line 27
    new-instance v0, Lexpo/modules/kotlin/allocators/ObjectConstructorFactory$$ExternalSyntheticLambda1;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/allocators/ObjectConstructorFactory$$ExternalSyntheticLambda1;-><init>(Lexpo/modules/kotlin/allocators/UnsafeAllocator;)V

    return-object v0
.end method

.method private static final useUnsafeAllocator$lambda$1(Lexpo/modules/kotlin/allocators/UnsafeAllocator;)Ljava/lang/Object;
    .locals 1

    const-string v0, "$allocator"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    invoke-interface {p0}, Lexpo/modules/kotlin/allocators/UnsafeAllocator;->newInstance()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final get(Ljava/lang/Class;)Lexpo/modules/kotlin/allocators/ObjectConstructor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lexpo/modules/kotlin/allocators/ObjectConstructor<",
            "TT;>;"
        }
    .end annotation

    const-string v0, "clazz"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/allocators/ObjectConstructorFactory;->tryToUseDefaultConstructor(Ljava/lang/Class;)Lexpo/modules/kotlin/allocators/ObjectConstructor;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lexpo/modules/kotlin/allocators/ObjectConstructorFactory;->useUnsafeAllocator(Ljava/lang/Class;)Lexpo/modules/kotlin/allocators/ObjectConstructor;

    move-result-object v0

    :cond_0
    return-object v0
.end method
