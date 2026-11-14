.class public final Lexpo/modules/core/logging/OSLogHandlerKt;
.super Ljava/lang/Object;
.source "OSLogHandler.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0002"
    }
    d2 = {
        "isAndroid",
        "",
        "expo-modules-core_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final isAndroid:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "java.specification.vendor"

    .line 29
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "The Android Project"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lexpo/modules/core/logging/OSLogHandlerKt;->isAndroid:Z

    return-void
.end method

.method public static final synthetic access$isAndroid$p()Z
    .locals 1

    sget-boolean v0, Lexpo/modules/core/logging/OSLogHandlerKt;->isAndroid:Z

    return v0
.end method
