.class final Lexpo/modules/kotlin/jni/JavaScriptTypedArray$kind$2;
.super Lkotlin/jvm/internal/Lambda;
.source "JavaScriptTypedArray.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/jni/JavaScriptTypedArray;-><init>(Lcom/facebook/jni/HybridData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lexpo/modules/kotlin/jni/TypedArrayKind;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nJavaScriptTypedArray.kt\nKotlin\n*S Kotlin\n*F\n+ 1 JavaScriptTypedArray.kt\nexpo/modules/kotlin/jni/JavaScriptTypedArray$kind$2\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,70:1\n1109#2,2:71\n*S KotlinDebug\n*F\n+ 1 JavaScriptTypedArray.kt\nexpo/modules/kotlin/jni/JavaScriptTypedArray$kind$2\n*L\n33#1:71,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "Lexpo/modules/kotlin/jni/TypedArrayKind;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;


# direct methods
.method constructor <init>(Lexpo/modules/kotlin/jni/JavaScriptTypedArray;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/kotlin/jni/JavaScriptTypedArray$kind$2;->this$0:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Lexpo/modules/kotlin/jni/TypedArrayKind;
    .locals 6

    iget-object v0, p0, Lexpo/modules/kotlin/jni/JavaScriptTypedArray$kind$2;->this$0:Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    .line 32
    invoke-static {v0}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray;->access$getRawKind(Lexpo/modules/kotlin/jni/JavaScriptTypedArray;)I

    move-result v0

    .line 33
    invoke-static {}, Lexpo/modules/kotlin/jni/TypedArrayKind;->values()[Lexpo/modules/kotlin/jni/TypedArrayKind;

    move-result-object v1

    .line 71
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 33
    invoke-virtual {v4}, Lexpo/modules/kotlin/jni/TypedArrayKind;->getValue()I

    move-result v5

    if-ne v5, v0, :cond_0

    return-object v4

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 72
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v1, "Array contains no element matching the predicate."

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 31
    invoke-virtual {p0}, Lexpo/modules/kotlin/jni/JavaScriptTypedArray$kind$2;->invoke()Lexpo/modules/kotlin/jni/TypedArrayKind;

    move-result-object v0

    return-object v0
.end method
