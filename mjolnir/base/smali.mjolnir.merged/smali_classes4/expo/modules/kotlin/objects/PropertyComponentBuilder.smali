.class public Lexpo/modules/kotlin/objects/PropertyComponentBuilder;
.super Ljava/lang/Object;
.source "PropertyComponentBuilder.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPropertyComponentBuilder.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PropertyComponentBuilder.kt\nexpo/modules/kotlin/objects/PropertyComponentBuilder\n+ 2 ArrayIntrinsics.kt\nkotlin/ArrayIntrinsicsKt\n+ 3 AnyType.kt\nexpo/modules/kotlin/types/AnyTypeKt\n*L\n1#1,64:1\n26#2:65\n56#3:66\n47#3,7:67\n*S KotlinDebug\n*F\n+ 1 PropertyComponentBuilder.kt\nexpo/modules/kotlin/objects/PropertyComponentBuilder\n*L\n18#1:65\n25#1:66\n25#1:67,7\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\u0008\u0016\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0006\u0010\u0010\u001a\u00020\u0011J\"\u0010\u0012\u001a\u00020\u0000\"\u0004\u0008\u0000\u0010\u00132\u000e\u0008\u0004\u0010\u0014\u001a\u0008\u0012\u0004\u0012\u0002H\u00130\u0015H\u0086\u0008\u00f8\u0001\u0000J9\u0010\u0016\u001a\u00020\u0000\"\u0006\u0008\u0000\u0010\u0013\u0018\u00012#\u0008\u0004\u0010\u0014\u001a\u001d\u0012\u0013\u0012\u0011H\u0013\u00a2\u0006\u000c\u0008\u0018\u0012\u0008\u0008\u0002\u0012\u0004\u0008\u0008(\u0019\u0012\u0004\u0012\u00020\u001a0\u0017H\u0086\u0008\u00f8\u0001\u0000R\u001c\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\"\u0004\u0008\t\u0010\nR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u001c\u0010\r\u001a\u0004\u0018\u00010\u0006X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000e\u0010\u0008\"\u0004\u0008\u000f\u0010\n\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u001b"
    }
    d2 = {
        "Lexpo/modules/kotlin/objects/PropertyComponentBuilder;",
        "",
        "name",
        "",
        "(Ljava/lang/String;)V",
        "getter",
        "Lexpo/modules/kotlin/functions/SyncFunctionComponent;",
        "getGetter",
        "()Lexpo/modules/kotlin/functions/SyncFunctionComponent;",
        "setGetter",
        "(Lexpo/modules/kotlin/functions/SyncFunctionComponent;)V",
        "getName",
        "()Ljava/lang/String;",
        "setter",
        "getSetter",
        "setSetter",
        "build",
        "Lexpo/modules/kotlin/objects/PropertyComponent;",
        "get",
        "T",
        "body",
        "Lkotlin/Function0;",
        "set",
        "Lkotlin/Function1;",
        "Lkotlin/ParameterName;",
        "newValue",
        "",
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


# instance fields
.field private getter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

.field private final name:Ljava/lang/String;

.field private setter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/objects/PropertyComponentBuilder;->name:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final build()Lexpo/modules/kotlin/objects/PropertyComponent;
    .locals 4

    .line 29
    new-instance v0, Lexpo/modules/kotlin/objects/PropertyComponent;

    iget-object v1, p0, Lexpo/modules/kotlin/objects/PropertyComponentBuilder;->name:Ljava/lang/String;

    iget-object v2, p0, Lexpo/modules/kotlin/objects/PropertyComponentBuilder;->getter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    iget-object v3, p0, Lexpo/modules/kotlin/objects/PropertyComponentBuilder;->setter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    invoke-direct {v0, v1, v2, v3}, Lexpo/modules/kotlin/objects/PropertyComponent;-><init>(Ljava/lang/String;Lexpo/modules/kotlin/functions/SyncFunctionComponent;Lexpo/modules/kotlin/functions/SyncFunctionComponent;)V

    return-object v0
.end method

.method public final get(Lkotlin/jvm/functions/Function0;)Lexpo/modules/kotlin/objects/PropertyComponentBuilder;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lkotlin/jvm/functions/Function0<",
            "+TT;>;)",
            "Lexpo/modules/kotlin/objects/PropertyComponentBuilder;"
        }
    .end annotation

    const-string v0, "body"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/objects/PropertyComponentBuilder;

    .line 18
    new-instance v0, Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    const/4 v1, 0x0

    new-array v1, v1, [Lexpo/modules/kotlin/types/AnyType;

    new-instance v2, Lexpo/modules/kotlin/objects/PropertyComponentBuilder$get$1$1;

    invoke-direct {v2, p1}, Lexpo/modules/kotlin/objects/PropertyComponentBuilder$get$1$1;-><init>(Lkotlin/jvm/functions/Function0;)V

    check-cast v2, Lkotlin/jvm/functions/Function1;

    const-string p1, "get"

    invoke-direct {v0, p1, v1, v2}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v0}, Lexpo/modules/kotlin/objects/PropertyComponentBuilder;->setGetter(Lexpo/modules/kotlin/functions/SyncFunctionComponent;)V

    return-object p0
.end method

.method public final getGetter()Lexpo/modules/kotlin/functions/SyncFunctionComponent;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/objects/PropertyComponentBuilder;->getter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    return-object v0
.end method

.method public final getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/objects/PropertyComponentBuilder;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final getSetter()Lexpo/modules/kotlin/functions/SyncFunctionComponent;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/objects/PropertyComponentBuilder;->setter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    return-object v0
.end method

.method public final synthetic set(Lkotlin/jvm/functions/Function1;)Lexpo/modules/kotlin/objects/PropertyComponentBuilder;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lkotlin/jvm/functions/Function1<",
            "-TT;",
            "Lkotlin/Unit;",
            ">;)",
            "Lexpo/modules/kotlin/objects/PropertyComponentBuilder;"
        }
    .end annotation

    const-string v0, "body"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/objects/PropertyComponentBuilder;

    .line 25
    new-instance v0, Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    const/4 v1, 0x1

    new-array v1, v1, [Lexpo/modules/kotlin/types/AnyType;

    .line 66
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->needClassReification()V

    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->needClassReification()V

    sget-object v2, Lexpo/modules/kotlin/objects/PropertyComponentBuilder$set$$inlined$apply$lambda$1;->INSTANCE:Lexpo/modules/kotlin/objects/PropertyComponentBuilder$set$$inlined$apply$lambda$1;

    check-cast v2, Lkotlin/jvm/functions/Function0;

    .line 67
    new-instance v3, Lexpo/modules/kotlin/types/AnyType;

    .line 68
    new-instance v4, Lexpo/modules/kotlin/types/LazyKType;

    const/4 v5, 0x4

    const-string v6, "T"

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    const-class v5, Ljava/lang/Object;

    invoke-static {v5}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v5

    const/4 v7, 0x3

    .line 70
    invoke-static {v7, v6}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    const/4 v6, 0x0

    .line 68
    invoke-direct {v4, v5, v6, v2}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v4, Lkotlin/reflect/KType;

    .line 67
    invoke-direct {v3, v4}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    const/4 v2, 0x0

    aput-object v3, v1, v2

    .line 25
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->needClassReification()V

    new-instance v2, Lexpo/modules/kotlin/objects/PropertyComponentBuilder$set$1$1;

    invoke-direct {v2, p1}, Lexpo/modules/kotlin/objects/PropertyComponentBuilder$set$1$1;-><init>(Lkotlin/jvm/functions/Function1;)V

    check-cast v2, Lkotlin/jvm/functions/Function1;

    const-string p1, "set"

    invoke-direct {v0, p1, v1, v2}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v0}, Lexpo/modules/kotlin/objects/PropertyComponentBuilder;->setSetter(Lexpo/modules/kotlin/functions/SyncFunctionComponent;)V

    return-object p0
.end method

.method public final setGetter(Lexpo/modules/kotlin/functions/SyncFunctionComponent;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/kotlin/objects/PropertyComponentBuilder;->getter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    return-void
.end method

.method public final setSetter(Lexpo/modules/kotlin/functions/SyncFunctionComponent;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/kotlin/objects/PropertyComponentBuilder;->setter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    return-void
.end method
