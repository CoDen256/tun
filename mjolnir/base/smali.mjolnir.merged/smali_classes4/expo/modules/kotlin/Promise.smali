.class public interface abstract Lexpo/modules/kotlin/Promise;
.super Ljava/lang/Object;
.source "Promise.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/kotlin/Promise$DefaultImpls;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0010\u0006\n\u0002\u0010\u0007\n\u0002\u0010\u0008\n\u0000\u0008f\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J$\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u00072\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00072\u0008\u0010\t\u001a\u0004\u0018\u00010\nH&J\u0008\u0010\u000b\u001a\u00020\u0003H\u0016J\u0012\u0010\u000b\u001a\u00020\u00032\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u0001H&J\u0010\u0010\u000b\u001a\u00020\u00032\u0006\u0010\r\u001a\u00020\u000eH\u0016J\u0010\u0010\u000b\u001a\u00020\u00032\u0006\u0010\r\u001a\u00020\u000fH\u0016J\u0010\u0010\u000b\u001a\u00020\u00032\u0006\u0010\r\u001a\u00020\u0010H\u0016J\u0010\u0010\u000b\u001a\u00020\u00032\u0006\u0010\r\u001a\u00020\u0011H\u0016J\u0010\u0010\u000b\u001a\u00020\u00032\u0006\u0010\r\u001a\u00020\u0007H\u0016\u00a8\u0006\u0012"
    }
    d2 = {
        "Lexpo/modules/kotlin/Promise;",
        "",
        "reject",
        "",
        "exception",
        "Lexpo/modules/kotlin/exception/CodedException;",
        "code",
        "",
        "message",
        "cause",
        "",
        "resolve",
        "value",
        "result",
        "",
        "",
        "",
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


# virtual methods
.method public abstract reject(Lexpo/modules/kotlin/exception/CodedException;)V
.end method

.method public abstract reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
.end method

.method public abstract resolve()V
.end method

.method public abstract resolve(D)V
.end method

.method public abstract resolve(F)V
.end method

.method public abstract resolve(I)V
.end method

.method public abstract resolve(Ljava/lang/Object;)V
.end method

.method public abstract resolve(Ljava/lang/String;)V
.end method

.method public abstract resolve(Z)V
.end method
