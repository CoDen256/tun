.class public final Lexpo/modules/core/logging/LogHandlers;
.super Ljava/lang/Object;
.source "LogHandlers.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u000e\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006J\u0016\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\u0005\u001a\u00020\u0006\u00a8\u0006\n"
    }
    d2 = {
        "Lexpo/modules/core/logging/LogHandlers;",
        "",
        "()V",
        "createOSLogHandler",
        "Lexpo/modules/core/logging/LogHandler;",
        "category",
        "",
        "createPersistentFileLogHandler",
        "context",
        "Landroid/content/Context;",
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


# static fields
.field public static final INSTANCE:Lexpo/modules/core/logging/LogHandlers;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lexpo/modules/core/logging/LogHandlers;

    invoke-direct {v0}, Lexpo/modules/core/logging/LogHandlers;-><init>()V

    sput-object v0, Lexpo/modules/core/logging/LogHandlers;->INSTANCE:Lexpo/modules/core/logging/LogHandlers;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createOSLogHandler(Ljava/lang/String;)Lexpo/modules/core/logging/LogHandler;
    .locals 1

    const-string v0, "category"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    new-instance v0, Lexpo/modules/core/logging/OSLogHandler;

    invoke-direct {v0, p1}, Lexpo/modules/core/logging/OSLogHandler;-><init>(Ljava/lang/String;)V

    check-cast v0, Lexpo/modules/core/logging/LogHandler;

    return-object v0
.end method

.method public final createPersistentFileLogHandler(Landroid/content/Context;Ljava/lang/String;)Lexpo/modules/core/logging/LogHandler;
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "category"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    new-instance v0, Lexpo/modules/core/logging/PersistentFileLogHandler;

    invoke-direct {v0, p2, p1}, Lexpo/modules/core/logging/PersistentFileLogHandler;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    check-cast v0, Lexpo/modules/core/logging/LogHandler;

    return-object v0
.end method
