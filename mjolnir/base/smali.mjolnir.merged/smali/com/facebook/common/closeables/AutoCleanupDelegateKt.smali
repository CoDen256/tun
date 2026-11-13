.class public final Lcom/facebook/common/closeables/AutoCleanupDelegateKt;
.super Ljava/lang/Object;
.source "AutoCleanupDelegate.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\"\u001a\u0010\u0000\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0004"
    }
    d2 = {
        "closeableCleanupFunction",
        "Lkotlin/Function1;",
        "Ljava/io/Closeable;",
        "",
        "fbcore_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final closeableCleanupFunction:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/io/Closeable;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 37
    sget-object v0, Lcom/facebook/common/closeables/AutoCleanupDelegateKt$closeableCleanupFunction$1;->INSTANCE:Lcom/facebook/common/closeables/AutoCleanupDelegateKt$closeableCleanupFunction$1;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    sput-object v0, Lcom/facebook/common/closeables/AutoCleanupDelegateKt;->closeableCleanupFunction:Lkotlin/jvm/functions/Function1;

    return-void
.end method

.method public static final synthetic access$getCloseableCleanupFunction$p()Lkotlin/jvm/functions/Function1;
    .locals 1

    sget-object v0, Lcom/facebook/common/closeables/AutoCleanupDelegateKt;->closeableCleanupFunction:Lkotlin/jvm/functions/Function1;

    return-object v0
.end method
