.class public final Lexpo/modules/kotlin/sharedobjects/ClassRegistry;
.super Ljava/lang/Object;
.source "ClassRegistry.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J!\u0010\u000b\u001a\u00020\u000c2\n\u0010\r\u001a\u0006\u0012\u0002\u0008\u00030\u00052\u0006\u0010\u000e\u001a\u00020\u0006H\u0000\u00a2\u0006\u0002\u0008\u000fJ\u0014\u0010\u0010\u001a\u00020\u000c2\n\u0010\r\u001a\u0006\u0012\u0002\u0008\u00030\u0005H\u0002J\u001b\u0010\u0011\u001a\u0004\u0018\u00010\u00062\n\u0010\r\u001a\u0006\u0012\u0002\u0008\u00030\u0005H\u0000\u00a2\u0006\u0002\u0008\u0012R*\u0010\u0003\u001a\u0012\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u0005\u0012\u0004\u0012\u00020\u00060\u0004X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\"\u0004\u0008\t\u0010\n\u00a8\u0006\u0013"
    }
    d2 = {
        "Lexpo/modules/kotlin/sharedobjects/ClassRegistry;",
        "",
        "()V",
        "pairs",
        "",
        "Ljava/lang/Class;",
        "Lexpo/modules/kotlin/jni/JavaScriptObject;",
        "getPairs$expo_modules_core_release",
        "()Ljava/util/Map;",
        "setPairs$expo_modules_core_release",
        "(Ljava/util/Map;)V",
        "add",
        "",
        "native",
        "js",
        "add$expo_modules_core_release",
        "delete",
        "toJavaScriptObject",
        "toJavaScriptObject$expo_modules_core_release",
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
.field private pairs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lexpo/modules/kotlin/jni/JavaScriptObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    iput-object v0, p0, Lexpo/modules/kotlin/sharedobjects/ClassRegistry;->pairs:Ljava/util/Map;

    return-void
.end method

.method public static final synthetic access$delete(Lexpo/modules/kotlin/sharedobjects/ClassRegistry;Ljava/lang/Class;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/sharedobjects/ClassRegistry;->delete(Ljava/lang/Class;)V

    return-void
.end method

.method private final delete(Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/sharedobjects/ClassRegistry;->pairs:Ljava/util/Map;

    .line 16
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final add$expo_modules_core_release(Ljava/lang/Class;Lexpo/modules/kotlin/jni/JavaScriptObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Lexpo/modules/kotlin/jni/JavaScriptObject;",
            ")V"
        }
    .end annotation

    const-string v0, "native"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "js"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    new-instance v0, Lexpo/modules/kotlin/sharedobjects/ClassRegistry$add$1;

    invoke-direct {v0, p0, p1}, Lexpo/modules/kotlin/sharedobjects/ClassRegistry$add$1;-><init>(Lexpo/modules/kotlin/sharedobjects/ClassRegistry;Ljava/lang/Class;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-virtual {p2, v0}, Lexpo/modules/kotlin/jni/JavaScriptObject;->defineDeallocator$expo_modules_core_release(Lkotlin/jvm/functions/Function0;)V

    iget-object v0, p0, Lexpo/modules/kotlin/sharedobjects/ClassRegistry;->pairs:Ljava/util/Map;

    .line 12
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final getPairs$expo_modules_core_release()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lexpo/modules/kotlin/jni/JavaScriptObject;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/sharedobjects/ClassRegistry;->pairs:Ljava/util/Map;

    return-object v0
.end method

.method public final setPairs$expo_modules_core_release(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lexpo/modules/kotlin/jni/JavaScriptObject;",
            ">;)V"
        }
    .end annotation

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lexpo/modules/kotlin/sharedobjects/ClassRegistry;->pairs:Ljava/util/Map;

    return-void
.end method

.method public final toJavaScriptObject$expo_modules_core_release(Ljava/lang/Class;)Lexpo/modules/kotlin/jni/JavaScriptObject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Lexpo/modules/kotlin/jni/JavaScriptObject;"
        }
    .end annotation

    const-string v0, "native"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/sharedobjects/ClassRegistry;->pairs:Ljava/util/Map;

    .line 19
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lexpo/modules/kotlin/jni/JavaScriptObject;

    return-object p1
.end method
