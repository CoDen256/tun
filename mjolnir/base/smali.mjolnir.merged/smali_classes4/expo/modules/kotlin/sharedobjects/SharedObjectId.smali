.class public final Lexpo/modules/kotlin/sharedobjects/SharedObjectId;
.super Ljava/lang/Object;
.source "SharedObjectRegistry.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0008\u0087@\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u001a\u0010\u0008\u001a\u00020\t2\u0008\u0010\n\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0010\u0010\r\u001a\u00020\u0003H\u00d6\u0001\u00a2\u0006\u0004\u0008\u000e\u0010\u0005J\u0017\u0010\u000f\u001a\u0004\u0018\u00010\u00102\u0006\u0010\u0011\u001a\u00020\u0012\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0017\u0010\u0015\u001a\u0004\u0018\u00010\u00162\u0006\u0010\u0011\u001a\u00020\u0012\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u001aH\u00d6\u0001\u00a2\u0006\u0004\u0008\u001b\u0010\u001cR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\u0088\u0001\u0002\u00a8\u0006\u001d"
    }
    d2 = {
        "Lexpo/modules/kotlin/sharedobjects/SharedObjectId;",
        "",
        "value",
        "",
        "constructor-impl",
        "(I)I",
        "getValue",
        "()I",
        "equals",
        "",
        "other",
        "equals-impl",
        "(ILjava/lang/Object;)Z",
        "hashCode",
        "hashCode-impl",
        "toJavaScriptObject",
        "Lexpo/modules/kotlin/jni/JavaScriptObject;",
        "appContext",
        "Lexpo/modules/kotlin/AppContext;",
        "toJavaScriptObject-impl",
        "(ILexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/jni/JavaScriptObject;",
        "toNativeObject",
        "Lexpo/modules/kotlin/sharedobjects/SharedObject;",
        "toNativeObject-impl",
        "(ILexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/sharedobjects/SharedObject;",
        "toString",
        "",
        "toString-impl",
        "(I)Ljava/lang/String;",
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

.annotation runtime Lkotlin/jvm/JvmInline;
.end annotation


# instance fields
.field private final value:I


# direct methods
.method private synthetic constructor <init>(I)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->value:I

    return-void
.end method

.method public static final synthetic box-impl(I)Lexpo/modules/kotlin/sharedobjects/SharedObjectId;
    .locals 1

    new-instance v0, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;

    invoke-direct {v0, p0}, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;-><init>(I)V

    return-object v0
.end method

.method public static constructor-impl(I)I
    .locals 0

    return p0
.end method

.method public static equals-impl(ILjava/lang/Object;)Z
    .locals 2

    instance-of v0, p1, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    check-cast p1, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;

    invoke-virtual {p1}, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->unbox-impl()I

    move-result p1

    if-eq p0, p1, :cond_1

    return v1

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public static final equals-impl0(II)Z
    .locals 0

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static hashCode-impl(I)I
    .locals 0

    return p0
.end method

.method public static final toJavaScriptObject-impl(ILexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/jni/JavaScriptObject;
    .locals 1

    const-string v0, "appContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    invoke-static {p0, p1}, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->toNativeObject-impl(ILexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/sharedobjects/SharedObject;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 18
    :cond_0
    invoke-virtual {p1}, Lexpo/modules/kotlin/AppContext;->getSharedObjectRegistry$expo_modules_core_release()Lexpo/modules/kotlin/sharedobjects/SharedObjectRegistry;

    move-result-object p1

    invoke-virtual {p1, p0}, Lexpo/modules/kotlin/sharedobjects/SharedObjectRegistry;->toJavaScriptObject$expo_modules_core_release(Lexpo/modules/kotlin/sharedobjects/SharedObject;)Lexpo/modules/kotlin/jni/JavaScriptObject;

    move-result-object p0

    return-object p0
.end method

.method public static final toNativeObject-impl(ILexpo/modules/kotlin/AppContext;)Lexpo/modules/kotlin/sharedobjects/SharedObject;
    .locals 1

    const-string v0, "appContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    invoke-virtual {p1}, Lexpo/modules/kotlin/AppContext;->getSharedObjectRegistry$expo_modules_core_release()Lexpo/modules/kotlin/sharedobjects/SharedObjectRegistry;

    move-result-object p1

    invoke-virtual {p1, p0}, Lexpo/modules/kotlin/sharedobjects/SharedObjectRegistry;->toNativeObject-kyJHjyY$expo_modules_core_release(I)Lexpo/modules/kotlin/sharedobjects/SharedObject;

    move-result-object p0

    return-object p0
.end method

.method public static toString-impl(I)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SharedObjectId(value="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    iget v0, p0, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->value:I

    invoke-static {v0, p1}, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->equals-impl(ILjava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final getValue()I
    .locals 1

    iget v0, p0, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->value:I

    return v0
.end method

.method public hashCode()I
    .locals 1

    iget v0, p0, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->value:I

    invoke-static {v0}, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->hashCode-impl(I)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    iget v0, p0, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->value:I

    invoke-static {v0}, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->toString-impl(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final synthetic unbox-impl()I
    .locals 1

    iget v0, p0, Lexpo/modules/kotlin/sharedobjects/SharedObjectId;->value:I

    return v0
.end method
