.class public final Lexpo/modules/kotlin/jni/JavaCallback;
.super Ljava/lang/Object;
.source "JavaCallback.kt"

# interfaces
.implements Lexpo/modules/kotlin/jni/Destructible;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nJavaCallback.kt\nKotlin\n*S Kotlin\n*F\n+ 1 JavaCallback.kt\nexpo/modules/kotlin/jni/JavaCallback\n*L\n1#1,90:1\n68#1,12:91\n68#1,12:103\n68#1,12:115\n68#1,12:127\n68#1,12:139\n68#1,12:151\n68#1,12:163\n*S KotlinDebug\n*F\n+ 1 JavaCallback.kt\nexpo/modules/kotlin/jni/JavaCallback\n*L\n14#1:91,12\n32#1:103,12\n36#1:115,12\n40#1:127,12\n44#1:139,12\n48#1:151,12\n52#1:163,12\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0002\u0010\u0006\n\u0002\u0010\u0007\n\u0002\u0010\u0008\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001B\u000f\u0008\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0017\u0010\u0005\u001a\u00020\u00062\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0008H\u0082\u0008J\u0008\u0010\t\u001a\u00020\u0006H\u0016J\u0008\u0010\n\u001a\u00020\u0006H\u0004J\u0013\u0010\u000b\u001a\u00020\u00062\u0008\u0010\u000c\u001a\u0004\u0018\u00010\rH\u0086\u0002J\u0011\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u000eH\u0086\u0002J\u0011\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u000fH\u0086\u0002J\u0011\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u0010H\u0086\u0002J\u0011\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u0011H\u0086\u0002J\u0011\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u0012H\u0086\u0002J\u0019\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0014\u001a\u00020\u0012H\u0086\u0002J\t\u0010\u0015\u001a\u00020\u0006H\u0082 J\u0011\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u0016H\u0082 J\u0011\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u0017H\u0082 J\u0015\u0010\u0015\u001a\u00020\u00062\n\u0010\u000c\u001a\u0006\u0012\u0002\u0008\u00030\u0018H\u0082 J\u0011\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u000eH\u0082 J\u0011\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u000fH\u0082 J\u0011\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u0010H\u0082 J\u0011\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u0011H\u0082 J\u0011\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u0012H\u0082 J\u0019\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0014\u001a\u00020\u0012H\u0082 R\u0010\u0010\u0002\u001a\u00020\u00038\u0002X\u0083\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0019"
    }
    d2 = {
        "Lexpo/modules/kotlin/jni/JavaCallback;",
        "Lexpo/modules/kotlin/jni/Destructible;",
        "mHybridData",
        "Lcom/facebook/jni/HybridData;",
        "(Lcom/facebook/jni/HybridData;)V",
        "checkIfValid",
        "",
        "body",
        "Lkotlin/Function0;",
        "deallocate",
        "finalize",
        "invoke",
        "result",
        "",
        "",
        "",
        "",
        "",
        "",
        "code",
        "errorMessage",
        "invokeNative",
        "Lcom/facebook/react/bridge/WritableNativeArray;",
        "Lcom/facebook/react/bridge/WritableNativeMap;",
        "Lexpo/modules/kotlin/sharedobjects/SharedRef;",
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
.field private final mHybridData:Lcom/facebook/jni/HybridData;


# direct methods
.method public constructor <init>(Lcom/facebook/jni/HybridData;)V
    .locals 1

    const-string v0, "mHybridData"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/jni/JavaCallback;->mHybridData:Lcom/facebook/jni/HybridData;

    return-void
.end method

.method private final checkIfValid(Lkotlin/jvm/functions/Function0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 69
    :try_start_0
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lexpo/modules/kotlin/jni/JavaCallback;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 71
    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    .line 74
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object v0

    const-string v1, "Invalidated JavaCallback was invoked"

    invoke-virtual {v0, v1, p1}, Lexpo/modules/core/logging/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    .line 77
    :cond_0
    throw p1
.end method

.method private final native invokeNative()V
.end method

.method private final native invokeNative(D)V
.end method

.method private final native invokeNative(F)V
.end method

.method private final native invokeNative(I)V
.end method

.method private final native invokeNative(Lcom/facebook/react/bridge/WritableNativeArray;)V
.end method

.method private final native invokeNative(Lcom/facebook/react/bridge/WritableNativeMap;)V
.end method

.method private final native invokeNative(Lexpo/modules/kotlin/sharedobjects/SharedRef;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/sharedobjects/SharedRef<",
            "*>;)V"
        }
    .end annotation
.end method

.method private final native invokeNative(Ljava/lang/String;)V
.end method

.method private final native invokeNative(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private final native invokeNative(Z)V
.end method


# virtual methods
.method public deallocate()V
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/jni/JavaCallback;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 87
    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->resetNative()V

    return-void
.end method

.method protected final finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 83
    invoke-virtual {p0}, Lexpo/modules/kotlin/jni/JavaCallback;->deallocate()V

    return-void
.end method

.method public final invoke(D)V
    .locals 1

    .line 41
    :try_start_0
    invoke-direct {p0, p1, p2}, Lexpo/modules/kotlin/jni/JavaCallback;->invokeNative(D)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lexpo/modules/kotlin/jni/JavaCallback;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 130
    invoke-virtual {p2}, Lcom/facebook/jni/HybridData;->isValid()Z

    move-result p2

    if-nez p2, :cond_0

    .line 133
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object p2

    const-string v0, "Invalidated JavaCallback was invoked"

    invoke-virtual {p2, v0, p1}, Lexpo/modules/core/logging/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void

    .line 136
    :cond_0
    throw p1
.end method

.method public final invoke(F)V
    .locals 2

    .line 45
    :try_start_0
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/jni/JavaCallback;->invokeNative(F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lexpo/modules/kotlin/jni/JavaCallback;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 142
    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    .line 145
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object v0

    const-string v1, "Invalidated JavaCallback was invoked"

    invoke-virtual {v0, v1, p1}, Lexpo/modules/core/logging/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void

    .line 148
    :cond_0
    throw p1
.end method

.method public final invoke(I)V
    .locals 2

    .line 33
    :try_start_0
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/jni/JavaCallback;->invokeNative(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lexpo/modules/kotlin/jni/JavaCallback;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 106
    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    .line 109
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object v0

    const-string v1, "Invalidated JavaCallback was invoked"

    invoke-virtual {v0, v1, p1}, Lexpo/modules/core/logging/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void

    .line 112
    :cond_0
    throw p1
.end method

.method public final invoke(Ljava/lang/Object;)V
    .locals 3

    const-string v0, "Unknown type: "

    if-nez p1, :cond_0

    .line 16
    :try_start_0
    invoke-direct {p0}, Lexpo/modules/kotlin/jni/JavaCallback;->invokeNative()V

    return-void

    .line 20
    :cond_0
    instance-of v1, p1, Ljava/lang/Integer;

    if-eqz v1, :cond_1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lexpo/modules/kotlin/jni/JavaCallback;->invokeNative(I)V

    goto/16 :goto_0

    .line 21
    :cond_1
    instance-of v1, p1, Ljava/lang/Boolean;

    if-eqz v1, :cond_2

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-direct {p0, p1}, Lexpo/modules/kotlin/jni/JavaCallback;->invokeNative(Z)V

    goto/16 :goto_0

    .line 22
    :cond_2
    instance-of v1, p1, Ljava/lang/Double;

    if-eqz v1, :cond_3

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lexpo/modules/kotlin/jni/JavaCallback;->invokeNative(D)V

    goto :goto_0

    .line 23
    :cond_3
    instance-of v1, p1, Ljava/lang/Float;

    if-eqz v1, :cond_4

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    invoke-direct {p0, p1}, Lexpo/modules/kotlin/jni/JavaCallback;->invokeNative(F)V

    goto :goto_0

    .line 24
    :cond_4
    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_5

    check-cast p1, Ljava/lang/String;

    invoke-direct {p0, p1}, Lexpo/modules/kotlin/jni/JavaCallback;->invokeNative(Ljava/lang/String;)V

    goto :goto_0

    .line 25
    :cond_5
    instance-of v1, p1, Lcom/facebook/react/bridge/WritableNativeArray;

    if-eqz v1, :cond_6

    check-cast p1, Lcom/facebook/react/bridge/WritableNativeArray;

    invoke-direct {p0, p1}, Lexpo/modules/kotlin/jni/JavaCallback;->invokeNative(Lcom/facebook/react/bridge/WritableNativeArray;)V

    goto :goto_0

    .line 26
    :cond_6
    instance-of v1, p1, Lcom/facebook/react/bridge/WritableNativeMap;

    if-eqz v1, :cond_7

    check-cast p1, Lcom/facebook/react/bridge/WritableNativeMap;

    invoke-direct {p0, p1}, Lexpo/modules/kotlin/jni/JavaCallback;->invokeNative(Lcom/facebook/react/bridge/WritableNativeMap;)V

    goto :goto_0

    .line 27
    :cond_7
    instance-of v1, p1, Lexpo/modules/kotlin/sharedobjects/SharedRef;

    if-eqz v1, :cond_8

    check-cast p1, Lexpo/modules/kotlin/sharedobjects/SharedRef;

    invoke-direct {p0, p1}, Lexpo/modules/kotlin/jni/JavaCallback;->invokeNative(Lexpo/modules/kotlin/sharedobjects/SharedRef;)V

    goto :goto_0

    .line 28
    :cond_8
    new-instance v1, Lexpo/modules/kotlin/exception/UnexpectedException;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lexpo/modules/kotlin/exception/UnexpectedException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lexpo/modules/kotlin/jni/JavaCallback;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 94
    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->isValid()Z

    move-result v0

    if-nez v0, :cond_9

    .line 97
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object v0

    const-string v1, "Invalidated JavaCallback was invoked"

    invoke-virtual {v0, v1, p1}, Lexpo/modules/core/logging/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void

    .line 100
    :cond_9
    throw p1
.end method

.method public final invoke(Ljava/lang/String;)V
    .locals 2

    const-string v0, "result"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    :try_start_0
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/jni/JavaCallback;->invokeNative(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lexpo/modules/kotlin/jni/JavaCallback;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 154
    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    .line 157
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object v0

    const-string v1, "Invalidated JavaCallback was invoked"

    invoke-virtual {v0, v1, p1}, Lexpo/modules/core/logging/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void

    .line 160
    :cond_0
    throw p1
.end method

.method public final invoke(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const-string v0, "code"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "errorMessage"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    :try_start_0
    invoke-direct {p0, p1, p2}, Lexpo/modules/kotlin/jni/JavaCallback;->invokeNative(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lexpo/modules/kotlin/jni/JavaCallback;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 166
    invoke-virtual {p2}, Lcom/facebook/jni/HybridData;->isValid()Z

    move-result p2

    if-nez p2, :cond_0

    .line 169
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object p2

    const-string v0, "Invalidated JavaCallback was invoked"

    invoke-virtual {p2, v0, p1}, Lexpo/modules/core/logging/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void

    .line 172
    :cond_0
    throw p1
.end method

.method public final invoke(Z)V
    .locals 2

    .line 37
    :try_start_0
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/jni/JavaCallback;->invokeNative(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lexpo/modules/kotlin/jni/JavaCallback;->mHybridData:Lcom/facebook/jni/HybridData;

    .line 118
    invoke-virtual {v0}, Lcom/facebook/jni/HybridData;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    .line 121
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object v0

    const-string v1, "Invalidated JavaCallback was invoked"

    invoke-virtual {v0, v1, p1}, Lexpo/modules/core/logging/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void

    .line 124
    :cond_0
    throw p1
.end method
