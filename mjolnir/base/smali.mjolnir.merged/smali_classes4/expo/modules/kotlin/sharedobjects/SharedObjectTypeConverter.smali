.class public final Lexpo/modules/kotlin/sharedobjects/SharedObjectTypeConverter;
.super Lexpo/modules/kotlin/types/NullAwareTypeConverter;
.source "SharedObjectTypeConverter.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lexpo/modules/kotlin/sharedobjects/SharedObject;",
        ">",
        "Lexpo/modules/kotlin/types/NullAwareTypeConverter<",
        "TT;>;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSharedObjectTypeConverter.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SharedObjectTypeConverter.kt\nexpo/modules/kotlin/sharedobjects/SharedObjectTypeConverter\n+ 2 Utils.kt\nexpo/modules/kotlin/UtilsKt\n*L\n1#1,36:1\n21#2:37\n*S KotlinDebug\n*F\n+ 1 SharedObjectTypeConverter.kt\nexpo/modules/kotlin/sharedobjects/SharedObjectTypeConverter\n*L\n25#1:37\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u0008\u0012\u0004\u0012\u0002H\u00010\u0003B\r\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u001f\u0010\t\u001a\u00028\u00002\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\rH\u0016\u00a2\u0006\u0002\u0010\u000eJ\u0008\u0010\u000f\u001a\u00020\u0010H\u0016J\u0008\u0010\u0011\u001a\u00020\u0012H\u0016R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\u0013"
    }
    d2 = {
        "Lexpo/modules/kotlin/sharedobjects/SharedObjectTypeConverter;",
        "T",
        "Lexpo/modules/kotlin/sharedobjects/SharedObject;",
        "Lexpo/modules/kotlin/types/NullAwareTypeConverter;",
        "type",
        "Lkotlin/reflect/KType;",
        "(Lkotlin/reflect/KType;)V",
        "getType",
        "()Lkotlin/reflect/KType;",
        "convertNonOptional",
        "value",
        "",
        "context",
        "Lexpo/modules/kotlin/AppContext;",
        "(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/sharedobjects/SharedObject;",
        "getCppRequiredTypes",
        "Lexpo/modules/kotlin/jni/ExpectedType;",
        "isTrivial",
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
.field private final type:Lkotlin/reflect/KType;


# direct methods
.method public constructor <init>(Lkotlin/reflect/KType;)V
    .locals 1

    const-string v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    invoke-interface {p1}, Lkotlin/reflect/KType;->isMarkedNullable()Z

    move-result v0

    invoke-direct {p0, v0}, Lexpo/modules/kotlin/types/NullAwareTypeConverter;-><init>(Z)V

    iput-object p1, p0, Lexpo/modules/kotlin/sharedobjects/SharedObjectTypeConverter;->type:Lkotlin/reflect/KType;

    return-void
.end method


# virtual methods
.method public convertNonOptional(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/sharedobjects/SharedObject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lexpo/modules/kotlin/AppContext;",
            ")TT;"
        }
    .end annotation

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    instance-of v0, p1, Lcom/facebook/react/bridge/Dynamic;

    if-eqz v0, :cond_0

    .line 19
    check-cast p1, Lcom/facebook/react/bridge/Dynamic;

    invoke-interface {p1}, Lcom/facebook/react/bridge/Dynamic;->asInt()I

    move-result p1

    goto :goto_0

    .line 21
    :cond_0
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 17
    :goto_0
    invoke-static {p1}, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->constructor-impl(I)I

    move-result p1

    if-eqz p2, :cond_2

    .line 26
    invoke-static {p1, p2}, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->toNativeObject-impl(ILexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/sharedobjects/SharedObject;

    move-result-object p1

    if-eqz p1, :cond_1

    return-object p1

    .line 27
    :cond_1
    new-instance p1, Lexpo/modules/kotlin/exception/InvalidSharedObjectException;

    iget-object p2, p0, Lexpo/modules/kotlin/sharedobjects/SharedObjectTypeConverter;->type:Lkotlin/reflect/KType;

    invoke-direct {p1, p2}, Lexpo/modules/kotlin/exception/InvalidSharedObjectException;-><init>(Lkotlin/reflect/KType;)V

    throw p1

    .line 37
    :cond_2
    new-instance p1, Lexpo/modules/kotlin/exception/Exceptions$AppContextLost;

    invoke-direct {p1}, Lexpo/modules/kotlin/exception/Exceptions$AppContextLost;-><init>()V

    throw p1
.end method

.method public bridge synthetic convertNonOptional(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Ljava/lang/Object;
    .locals 0

    .line 12
    invoke-virtual {p0, p1, p2}, Lexpo/modules/kotlin/sharedobjects/SharedObjectTypeConverter;->convertNonOptional(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/sharedobjects/SharedObject;

    move-result-object p1

    return-object p1
.end method

.method public getCppRequiredTypes()Lexpo/modules/kotlin/jni/ExpectedType;
    .locals 4

    .line 32
    new-instance v0, Lexpo/modules/kotlin/jni/ExpectedType;

    const/4 v1, 0x2

    new-array v1, v1, [Lexpo/modules/kotlin/jni/CppType;

    const/4 v2, 0x0

    sget-object v3, Lexpo/modules/kotlin/jni/CppType;->SHARED_OBJECT_ID:Lexpo/modules/kotlin/jni/CppType;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    sget-object v3, Lexpo/modules/kotlin/jni/CppType;->INT:Lexpo/modules/kotlin/jni/CppType;

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    return-object v0
.end method

.method public final getType()Lkotlin/reflect/KType;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/sharedobjects/SharedObjectTypeConverter;->type:Lkotlin/reflect/KType;

    return-object v0
.end method

.method public isTrivial()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
