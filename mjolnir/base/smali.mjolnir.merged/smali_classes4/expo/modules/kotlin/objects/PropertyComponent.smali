.class public final Lexpo/modules/kotlin/objects/PropertyComponent;
.super Ljava/lang/Object;
.source "PropertyComponent.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPropertyComponent.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PropertyComponent.kt\nexpo/modules/kotlin/objects/PropertyComponent\n+ 2 ArraysJVM.kt\nkotlin/collections/ArraysKt__ArraysJVMKt\n+ 3 ArrayIntrinsics.kt\nkotlin/ArrayIntrinsicsKt\n*L\n1#1,58:1\n37#2,2:59\n37#2,2:62\n26#3:61\n26#3:64\n*S KotlinDebug\n*F\n+ 1 PropertyComponent.kt\nexpo/modules/kotlin/objects/PropertyComponent\n*L\n50#1:59,2\n53#1:62,2\n50#1:61\n53#1:64\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0002\u0010\u0007J\u0016\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\t\u00a8\u0006\u0013"
    }
    d2 = {
        "Lexpo/modules/kotlin/objects/PropertyComponent;",
        "",
        "name",
        "",
        "getter",
        "Lexpo/modules/kotlin/functions/SyncFunctionComponent;",
        "setter",
        "(Ljava/lang/String;Lexpo/modules/kotlin/functions/SyncFunctionComponent;Lexpo/modules/kotlin/functions/SyncFunctionComponent;)V",
        "getGetter",
        "()Lexpo/modules/kotlin/functions/SyncFunctionComponent;",
        "getName",
        "()Ljava/lang/String;",
        "getSetter",
        "attachToJSObject",
        "",
        "appContext",
        "Lexpo/modules/kotlin/AppContext;",
        "jsObject",
        "Lexpo/modules/kotlin/jni/JavaScriptModuleObject;",
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
.field private final getter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

.field private final name:Ljava/lang/String;

.field private final setter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;


# direct methods
.method public static synthetic $r8$lambda$GESF9p8_GLrz3bMsCDu9Sz-mIhI(Lexpo/modules/kotlin/objects/PropertyComponent;Lexpo/modules/kotlin/AppContext;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    invoke-static {p0, p1, p2}, Lexpo/modules/kotlin/objects/PropertyComponent;->attachToJSObject$lambda$0(Lexpo/modules/kotlin/objects/PropertyComponent;Lexpo/modules/kotlin/AppContext;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$swUi9oVBLXI4KhDLsRhcbk3w3kk(Lexpo/modules/kotlin/objects/PropertyComponent;Lexpo/modules/kotlin/AppContext;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    invoke-static {p0, p1, p2}, Lexpo/modules/kotlin/objects/PropertyComponent;->attachToJSObject$lambda$1(Lexpo/modules/kotlin/objects/PropertyComponent;Lexpo/modules/kotlin/AppContext;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Ljava/lang/String;Lexpo/modules/kotlin/functions/SyncFunctionComponent;Lexpo/modules/kotlin/functions/SyncFunctionComponent;)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/objects/PropertyComponent;->name:Ljava/lang/String;

    iput-object p2, p0, Lexpo/modules/kotlin/objects/PropertyComponent;->getter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    iput-object p3, p0, Lexpo/modules/kotlin/objects/PropertyComponent;->setter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Lexpo/modules/kotlin/functions/SyncFunctionComponent;Lexpo/modules/kotlin/functions/SyncFunctionComponent;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1

    and-int/lit8 p5, p4, 0x2

    const/4 v0, 0x0

    if-eqz p5, :cond_0

    move-object p2, v0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    move-object p3, v0

    .line 9
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/kotlin/objects/PropertyComponent;-><init>(Ljava/lang/String;Lexpo/modules/kotlin/functions/SyncFunctionComponent;Lexpo/modules/kotlin/functions/SyncFunctionComponent;)V

    return-void
.end method

.method private static final attachToJSObject$lambda$0(Lexpo/modules/kotlin/objects/PropertyComponent;Lexpo/modules/kotlin/AppContext;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$appContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "args"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    iget-object p0, p0, Lexpo/modules/kotlin/objects/PropertyComponent;->getter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    invoke-virtual {p0, p2, p1}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;->call([Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Ljava/lang/Object;

    move-result-object p0

    .line 32
    sget-object p1, Lexpo/modules/kotlin/types/JSTypeConverter;->INSTANCE:Lexpo/modules/kotlin/types/JSTypeConverter;

    const/4 p2, 0x0

    const/4 v0, 0x2

    invoke-static {p1, p0, p2, v0, p2}, Lexpo/modules/kotlin/types/JSTypeConverter;->convertToJSValue$default(Lexpo/modules/kotlin/types/JSTypeConverter;Ljava/lang/Object;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static final attachToJSObject$lambda$1(Lexpo/modules/kotlin/objects/PropertyComponent;Lexpo/modules/kotlin/AppContext;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$appContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "args"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    iget-object p0, p0, Lexpo/modules/kotlin/objects/PropertyComponent;->setter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    invoke-virtual {p0, p2, p1}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;->call([Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Ljava/lang/Object;

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final attachToJSObject(Lexpo/modules/kotlin/AppContext;Lexpo/modules/kotlin/jni/JavaScriptModuleObject;)V
    .locals 10

    const-string v0, "appContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "jsObject"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/objects/PropertyComponent;->getter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 29
    new-instance v0, Lexpo/modules/kotlin/objects/PropertyComponent$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lexpo/modules/kotlin/objects/PropertyComponent$$ExternalSyntheticLambda0;-><init>(Lexpo/modules/kotlin/objects/PropertyComponent;Lexpo/modules/kotlin/AppContext;)V

    move-object v6, v0

    goto :goto_0

    :cond_0
    move-object v6, v1

    :goto_0
    iget-object v0, p0, Lexpo/modules/kotlin/objects/PropertyComponent;->setter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    if-eqz v0, :cond_1

    .line 38
    new-instance v1, Lexpo/modules/kotlin/objects/PropertyComponent$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lexpo/modules/kotlin/objects/PropertyComponent$$ExternalSyntheticLambda1;-><init>(Lexpo/modules/kotlin/objects/PropertyComponent;Lexpo/modules/kotlin/AppContext;)V

    :cond_1
    move-object v9, v1

    iget-object v3, p0, Lexpo/modules/kotlin/objects/PropertyComponent;->name:Ljava/lang/String;

    iget-object p1, p0, Lexpo/modules/kotlin/objects/PropertyComponent;->getter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    .line 49
    invoke-virtual {p1}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;->getTakesOwner$expo_modules_core_release()Z

    move-result p1

    move v4, p1

    goto :goto_1

    :cond_2
    move v4, v0

    :goto_1
    iget-object p1, p0, Lexpo/modules/kotlin/objects/PropertyComponent;->getter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    if-eqz p1, :cond_3

    .line 50
    invoke-virtual {p1}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;->getCppRequiredTypes()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_3

    check-cast p1, Ljava/util/Collection;

    new-array v1, v0, [Lexpo/modules/kotlin/jni/ExpectedType;

    .line 60
    invoke-interface {p1, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    .line 50
    check-cast p1, [Lexpo/modules/kotlin/jni/ExpectedType;

    if-nez p1, :cond_4

    :cond_3
    new-array p1, v0, [Lexpo/modules/kotlin/jni/ExpectedType;

    :cond_4
    move-object v5, p1

    iget-object p1, p0, Lexpo/modules/kotlin/objects/PropertyComponent;->setter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    if-eqz p1, :cond_5

    .line 52
    invoke-virtual {p1}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;->getTakesOwner$expo_modules_core_release()Z

    move-result p1

    move v7, p1

    goto :goto_2

    :cond_5
    move v7, v0

    :goto_2
    iget-object p1, p0, Lexpo/modules/kotlin/objects/PropertyComponent;->setter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    if-eqz p1, :cond_6

    .line 53
    invoke-virtual {p1}, Lexpo/modules/kotlin/functions/SyncFunctionComponent;->getCppRequiredTypes()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_6

    check-cast p1, Ljava/util/Collection;

    new-array v1, v0, [Lexpo/modules/kotlin/jni/ExpectedType;

    .line 63
    invoke-interface {p1, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    .line 53
    check-cast p1, [Lexpo/modules/kotlin/jni/ExpectedType;

    if-nez p1, :cond_7

    :cond_6
    new-array p1, v0, [Lexpo/modules/kotlin/jni/ExpectedType;

    :cond_7
    move-object v8, p1

    move-object v2, p2

    .line 47
    invoke-virtual/range {v2 .. v9}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->registerProperty(Ljava/lang/String;Z[Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/jni/JNIFunctionBody;Z[Lexpo/modules/kotlin/jni/ExpectedType;Lexpo/modules/kotlin/jni/JNIFunctionBody;)V

    return-void
.end method

.method public final getGetter()Lexpo/modules/kotlin/functions/SyncFunctionComponent;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/objects/PropertyComponent;->getter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    return-object v0
.end method

.method public final getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/objects/PropertyComponent;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final getSetter()Lexpo/modules/kotlin/functions/SyncFunctionComponent;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/objects/PropertyComponent;->setter:Lexpo/modules/kotlin/functions/SyncFunctionComponent;

    return-object v0
.end method
