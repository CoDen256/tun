.class public final Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis;
.super Lexpo/modules/kotlin/objects/PropertyComponentBuilder;
.source "PropertyComponentBuilder.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ThisType:",
        "Ljava/lang/Object;",
        ">",
        "Lexpo/modules/kotlin/objects/PropertyComponentBuilder;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPropertyComponentBuilder.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PropertyComponentBuilder.kt\nexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis\n+ 2 AnyType.kt\nexpo/modules/kotlin/types/AnyTypeKt\n*L\n1#1,64:1\n56#2:65\n47#2,7:66\n*S KotlinDebug\n*F\n+ 1 PropertyComponentBuilder.kt\nexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis\n*L\n55#1:65\n55#1:66,7\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\u0018\u0000*\u0004\u0008\u0000\u0010\u00012\u00020\u0002B\u0015\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0002\u0010\u0007J.\u0010\n\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0000\"\u0004\u0008\u0001\u0010\u000b2\u0014\u0008\u0004\u0010\u000c\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u0002H\u000b0\rH\u0086\u0008\u00f8\u0001\u0000JT\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0000\"\u0006\u0008\u0001\u0010\u000b\u0018\u000128\u0008\u0004\u0010\u000c\u001a2\u0012\u0013\u0012\u00118\u0000\u00a2\u0006\u000c\u0008\u0010\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0011\u0012\u0013\u0012\u0011H\u000b\u00a2\u0006\u000c\u0008\u0010\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0012\u0012\u0004\u0012\u00020\u00130\u000fH\u0086\u0008\u00f8\u0001\u0000R\u0011\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\t\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u0014"
    }
    d2 = {
        "Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis;",
        "ThisType",
        "Lexpo/modules/kotlin/objects/PropertyComponentBuilder;",
        "thisType",
        "Lkotlin/reflect/KType;",
        "name",
        "",
        "(Lkotlin/reflect/KType;Ljava/lang/String;)V",
        "getThisType",
        "()Lkotlin/reflect/KType;",
        "get",
        "T",
        "body",
        "Lkotlin/Function1;",
        "set",
        "Lkotlin/Function2;",
        "Lkotlin/ParameterName;",
        "self",
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
.field private final thisType:Lkotlin/reflect/KType;


# direct methods
.method public constructor <init>(Lkotlin/reflect/KType;Ljava/lang/String;)V
    .locals 1

    const-string v0, "thisType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "name"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    invoke-direct {p0, p2}, Lexpo/modules/kotlin/objects/PropertyComponentBuilder;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis;->thisType:Lkotlin/reflect/KType;

    return-void
.end method


# virtual methods
.method public final get(Lkotlin/jvm/functions/Function1;)Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lkotlin/jvm/functions/Function1<",
            "-TThisType;+TT;>;)",
            "Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis<",
            "TThisType;>;"
        }
    .end annotation

    const-string v0, "body"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis;

    .line 42
    new-instance v0, Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    const/4 v1, 0x1

    new-array v2, v1, [Lexpo/modules/kotlin/types/AnyType;

    new-instance v3, Lexpo/modules/kotlin/types/AnyType;

    invoke-virtual {p0}, Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis;->getThisType()Lkotlin/reflect/KType;

    move-result-object v4

    invoke-direct {v3, v4}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    const/4 v4, 0x0

    aput-object v3, v2, v4

    .line 45
    new-instance v3, Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis$get$1$1;

    invoke-direct {v3, p1}, Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis$get$1$1;-><init>(Lkotlin/jvm/functions/Function1;)V

    check-cast v3, Lkotlin/jvm/functions/Function1;

    const-string p1, "get"

    .line 42
    invoke-direct {v0, p1, v2, v3}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    .line 46
    invoke-virtual {p0}, Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis;->getThisType()Lkotlin/reflect/KType;

    move-result-object p1

    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;->setOwnerType(Lkotlin/reflect/KType;)V

    .line 47
    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;->setCanTakeOwner(Z)V

    .line 42
    invoke-virtual {p0, v0}, Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis;->setGetter(Lexpo/modules/kotlin/functions/SyncFunctionComponent;)V

    return-object p0
.end method

.method public final getThisType()Lkotlin/reflect/KType;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis;->thisType:Lkotlin/reflect/KType;

    return-object v0
.end method

.method public final synthetic set(Lkotlin/jvm/functions/Function2;)Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lkotlin/jvm/functions/Function2<",
            "-TThisType;-TT;",
            "Lkotlin/Unit;",
            ">;)",
            "Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis<",
            "TThisType;>;"
        }
    .end annotation

    const-string v0, "body"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 54
    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis;

    .line 55
    new-instance v0, Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    const/4 v1, 0x2

    new-array v1, v1, [Lexpo/modules/kotlin/types/AnyType;

    new-instance v2, Lexpo/modules/kotlin/types/AnyType;

    invoke-virtual {p0}, Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis;->getThisType()Lkotlin/reflect/KType;

    move-result-object v3

    invoke-direct {v2, v3}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    .line 65
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->needClassReification()V

    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->needClassReification()V

    sget-object v2, Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis$set$$inlined$apply$lambda$1;->INSTANCE:Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis$set$$inlined$apply$lambda$1;

    check-cast v2, Lkotlin/jvm/functions/Function0;

    .line 66
    new-instance v3, Lexpo/modules/kotlin/types/AnyType;

    .line 67
    new-instance v4, Lexpo/modules/kotlin/types/LazyKType;

    const/4 v5, 0x4

    const-string v6, "T"

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    const-class v5, Ljava/lang/Object;

    invoke-static {v5}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v5

    const/4 v7, 0x3

    .line 69
    invoke-static {v7, v6}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    const/4 v6, 0x0

    .line 67
    invoke-direct {v4, v5, v6, v2}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v4, Lkotlin/reflect/KType;

    .line 66
    invoke-direct {v3, v4}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    const/4 v2, 0x1

    aput-object v3, v1, v2

    .line 58
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->needClassReification()V

    new-instance v3, Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis$set$1$1;

    invoke-direct {v3, p1}, Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis$set$1$1;-><init>(Lkotlin/jvm/functions/Function2;)V

    check-cast v3, Lkotlin/jvm/functions/Function1;

    const-string p1, "set"

    .line 55
    invoke-direct {v0, p1, v1, v3}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    .line 58
    move-object p1, v0

    check-cast p1, Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    .line 59
    invoke-virtual {p0}, Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis;->getThisType()Lkotlin/reflect/KType;

    move-result-object p1

    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;->setOwnerType(Lkotlin/reflect/KType;)V

    .line 60
    invoke-virtual {v0, v2}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;->setCanTakeOwner(Z)V

    .line 55
    invoke-virtual {p0, v0}, Lexpo/modules/kotlin/objects/PropertyComponentBuilderWithThis;->setSetter(Lexpo/modules/kotlin/functions/SyncFunctionComponent;)V

    return-object p0
.end method
