.class public final Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;
.super Ljava/lang/Object;
.source "UnsafeAllocator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexpo/modules/kotlin/allocators/UnsafeAllocator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\"\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u0002H\u00050\u0004\"\u0004\u0008\u0001\u0010\u00052\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u0002H\u00050\u0007H\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;",
        "",
        "()V",
        "createAllocator",
        "Lexpo/modules/kotlin/allocators/UnsafeAllocator;",
        "T",
        "clazz",
        "Ljava/lang/Class;",
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


# static fields
.field static final synthetic $$INSTANCE:Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;


# direct methods
.method public static synthetic $r8$lambda$3Bch5UwHFXWzaHw4fA7ys6B7rIg(Ljava/lang/reflect/Method;Ljava/lang/Class;I)Ljava/lang/Object;
    .locals 0

    invoke-static {p0, p1, p2}, Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;->createAllocator$lambda$0(Ljava/lang/reflect/Method;Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$FT4KgbUBYxt4sEs0Gww3RQxpPqA(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 0

    invoke-static {p0}, Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;->createAllocator$lambda$2(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$WvZx1825Z_lZwwm4dRfBjr5XUig(Ljava/lang/reflect/Method;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 0

    invoke-static {p0, p1, p2}, Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;->createAllocator$lambda$1(Ljava/lang/reflect/Method;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;

    invoke-direct {v0}, Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;-><init>()V

    sput-object v0, Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;->$$INSTANCE:Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static final createAllocator$lambda$0(Ljava/lang/reflect/Method;Ljava/lang/Class;I)Ljava/lang/Object;
    .locals 2

    const-string v0, "$clazz"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 p1, 0x1

    .line 26
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v0, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static final createAllocator$lambda$1(Ljava/lang/reflect/Method;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2

    const-string v0, "$clazz"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    .line 39
    invoke-virtual {p0, p1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static final createAllocator$lambda$2(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 3

    const-string v0, "$clazz"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Cannot allocate "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final createAllocator(Ljava/lang/Class;)Lexpo/modules/kotlin/allocators/UnsafeAllocator;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lexpo/modules/kotlin/allocators/UnsafeAllocator<",
            "TT;>;"
        }
    .end annotation

    const-string v0, "clazz"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 19
    :try_start_0
    const-class v3, Ljava/io/ObjectStreamClass;

    const-string v4, "getConstructorId"

    new-array v5, v2, [Ljava/lang/Class;

    .line 20
    const-class v6, Ljava/lang/Class;

    aput-object v6, v5, v1

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 21
    invoke-virtual {v3, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v4, v2, [Ljava/lang/Object;

    .line 22
    const-class v5, Ljava/lang/Object;

    aput-object v5, v4, v1

    invoke-virtual {v3, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string v4, "null cannot be cast to non-null type kotlin.Int"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const-class v4, Ljava/io/ObjectStreamClass;

    const-string v5, "newInstance"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Class;

    .line 23
    const-class v7, Ljava/lang/Class;

    aput-object v7, v6, v1

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v2

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 24
    invoke-virtual {v4, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 25
    new-instance v5, Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion$$ExternalSyntheticLambda0;

    invoke-direct {v5, v4, p1, v3}, Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion$$ExternalSyntheticLambda0;-><init>(Ljava/lang/reflect/Method;Ljava/lang/Class;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v5

    :catchall_0
    :try_start_1
    const-string v3, "sun.misc.Unsafe"

    .line 33
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-string v4, "theUnsafe"

    .line 34
    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 35
    invoke-virtual {v4, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 36
    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string v4, "allocateInstance"

    new-array v2, v2, [Ljava/lang/Class;

    .line 37
    const-class v5, Ljava/lang/Class;

    aput-object v5, v2, v1

    invoke-virtual {v3, v4, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 38
    new-instance v2, Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion$$ExternalSyntheticLambda1;

    invoke-direct {v2, v1, v0, p1}, Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion$$ExternalSyntheticLambda1;-><init>(Ljava/lang/reflect/Method;Ljava/lang/Object;Ljava/lang/Class;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-object v2

    .line 44
    :catchall_1
    new-instance v0, Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion$$ExternalSyntheticLambda2;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion$$ExternalSyntheticLambda2;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method
