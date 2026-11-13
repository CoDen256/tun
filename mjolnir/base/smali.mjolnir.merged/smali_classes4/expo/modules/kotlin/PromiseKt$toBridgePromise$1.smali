.class public final Lexpo/modules/kotlin/PromiseKt$toBridgePromise$1;
.super Ljava/lang/Object;
.source "Promise.kt"

# interfaces
.implements Lcom/facebook/react/bridge/Promise;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/PromiseKt;->toBridgePromise(Lexpo/modules/kotlin/Promise;)Lcom/facebook/react/bridge/Promise;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000-\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0003\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0012\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005H\u0017J\u001a\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0007\u001a\u00020\u0008H\u0016J\u001c\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u00052\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005H\u0016J$\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u00052\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0007\u001a\u00020\u0008H\u0016J&\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u00052\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0008\u0010\t\u001a\u0004\u0018\u00010\nH\u0016J0\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u00052\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0008\u0010\t\u001a\u0004\u0018\u00010\n2\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0008H\u0016J\u001c\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u00052\u0008\u0010\t\u001a\u0004\u0018\u00010\nH\u0016J&\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u00052\u0008\u0010\t\u001a\u0004\u0018\u00010\n2\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0008H\u0016J\u0012\u0010\u0002\u001a\u00020\u00032\u0008\u0010\t\u001a\u0004\u0018\u00010\nH\u0016J\u001c\u0010\u0002\u001a\u00020\u00032\u0008\u0010\t\u001a\u0004\u0018\u00010\n2\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0008H\u0016J\u0012\u0010\u000b\u001a\u00020\u00032\u0008\u0010\u000c\u001a\u0004\u0018\u00010\rH\u0016\u00a8\u0006\u000e"
    }
    d2 = {
        "expo/modules/kotlin/PromiseKt$toBridgePromise$1",
        "Lcom/facebook/react/bridge/Promise;",
        "reject",
        "",
        "message",
        "",
        "code",
        "userInfo",
        "Lcom/facebook/react/bridge/WritableMap;",
        "throwable",
        "",
        "resolve",
        "value",
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
.field final synthetic $expoPromise:Lexpo/modules/kotlin/Promise;

.field final synthetic $resolveMethod:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/Object;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lkotlin/jvm/functions/Function1;Lexpo/modules/kotlin/Promise;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/Object;",
            "Lkotlin/Unit;",
            ">;",
            "Lexpo/modules/kotlin/Promise;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$1;->$resolveMethod:Lkotlin/jvm/functions/Function1;

    iput-object p2, p0, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$1;->$expoPromise:Lexpo/modules/kotlin/Promise;

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public reject(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Lkotlin/Deprecated;
        message = "Use reject(code, message, throwable) instead"
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$1;->$expoPromise:Lexpo/modules/kotlin/Promise;

    const-string v1, "UnknownCode"

    const/4 v2, 0x0

    .line 84
    invoke-interface {v0, v1, p1, v2}, Lexpo/modules/kotlin/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public reject(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V
    .locals 1

    const-string v0, "userInfo"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p2, p0, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$1;->$expoPromise:Lexpo/modules/kotlin/Promise;

    if-nez p1, :cond_0

    const-string p1, "UnknownCode"

    :cond_0
    const/4 v0, 0x0

    .line 67
    invoke-interface {p2, p1, v0, v0}, Lexpo/modules/kotlin/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public reject(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$1;->$expoPromise:Lexpo/modules/kotlin/Promise;

    if-nez p1, :cond_0

    const-string p1, "UnknownCode"

    :cond_0
    const/4 v1, 0x0

    .line 47
    invoke-interface {v0, p1, p2, v1}, Lexpo/modules/kotlin/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public reject(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V
    .locals 1

    const-string v0, "userInfo"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p3, p0, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$1;->$expoPromise:Lexpo/modules/kotlin/Promise;

    if-nez p1, :cond_0

    const-string p1, "UnknownCode"

    :cond_0
    const/4 v0, 0x0

    .line 75
    invoke-interface {p3, p1, p2, v0}, Lexpo/modules/kotlin/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$1;->$expoPromise:Lexpo/modules/kotlin/Promise;

    if-nez p1, :cond_0

    const-string p1, "UnknownCode"

    .line 55
    :cond_0
    invoke-interface {v0, p1, p2, p3}, Lexpo/modules/kotlin/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Lcom/facebook/react/bridge/WritableMap;)V
    .locals 0

    iget-object p4, p0, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$1;->$expoPromise:Lexpo/modules/kotlin/Promise;

    if-nez p1, :cond_0

    const-string p1, "UnknownCode"

    .line 79
    :cond_0
    invoke-interface {p4, p1, p2, p3}, Lexpo/modules/kotlin/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public reject(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    iget-object v0, p0, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$1;->$expoPromise:Lexpo/modules/kotlin/Promise;

    if-nez p1, :cond_0

    const-string p1, "UnknownCode"

    :cond_0
    const/4 v1, 0x0

    .line 51
    invoke-interface {v0, p1, v1, p2}, Lexpo/modules/kotlin/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public reject(Ljava/lang/String;Ljava/lang/Throwable;Lcom/facebook/react/bridge/WritableMap;)V
    .locals 1

    iget-object p3, p0, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$1;->$expoPromise:Lexpo/modules/kotlin/Promise;

    if-nez p1, :cond_0

    const-string p1, "UnknownCode"

    :cond_0
    const/4 v0, 0x0

    .line 71
    invoke-interface {p3, p1, v0, p2}, Lexpo/modules/kotlin/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public reject(Ljava/lang/Throwable;)V
    .locals 3

    iget-object v0, p0, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$1;->$expoPromise:Lexpo/modules/kotlin/Promise;

    const-string v1, "UnknownCode"

    const/4 v2, 0x0

    .line 59
    invoke-interface {v0, v1, v2, p1}, Lexpo/modules/kotlin/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public reject(Ljava/lang/Throwable;Lcom/facebook/react/bridge/WritableMap;)V
    .locals 2

    iget-object p2, p0, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$1;->$expoPromise:Lexpo/modules/kotlin/Promise;

    const-string v0, "UnknownCode"

    const/4 v1, 0x0

    .line 63
    invoke-interface {p2, v0, v1, p1}, Lexpo/modules/kotlin/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public resolve(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/PromiseKt$toBridgePromise$1;->$resolveMethod:Lkotlin/jvm/functions/Function1;

    .line 43
    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
