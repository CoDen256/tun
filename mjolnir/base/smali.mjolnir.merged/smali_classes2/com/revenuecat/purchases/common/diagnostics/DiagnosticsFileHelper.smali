.class public final Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;
.super Lcom/revenuecat/purchases/utils/EventsFileHelper;
.source "DiagnosticsFileHelper.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/revenuecat/purchases/utils/EventsFileHelper<",
        "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntry;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0008\u0000\u0018\u0000 \u000b2\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u000bB\r\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0002\u0010\u0005J\u0008\u0010\u0006\u001a\u00020\u0007H\u0002J\u0006\u0010\u0008\u001a\u00020\tJ\u0006\u0010\n\u001a\u00020\tR\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;",
        "Lcom/revenuecat/purchases/utils/EventsFileHelper;",
        "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntry;",
        "fileHelper",
        "Lcom/revenuecat/purchases/common/FileHelper;",
        "(Lcom/revenuecat/purchases/common/FileHelper;)V",
        "diagnosticsFileSize",
        "",
        "isDiagnosticsFileBigEnoughToSync",
        "",
        "isDiagnosticsFileTooBig",
        "Companion",
        "purchases_defaultsRelease"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper$Companion;

.field public static final DIAGNOSTICS_FILE_LIMIT_IN_KB:I = 0x1f4

.field public static final DIAGNOSTICS_FILE_PATH:Ljava/lang/String; = "RevenueCat/diagnostics/diagnostic_entries.jsonl"

.field public static final DIAGNOSTICS_FILE_SYNC_LIMIT_IN_KB:I = 0xc8


# instance fields
.field private final fileHelper:Lcom/revenuecat/purchases/common/FileHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;->Companion:Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper$Companion;

    return-void
.end method

.method public constructor <init>(Lcom/revenuecat/purchases/common/FileHelper;)V
    .locals 8

    const-string v0, "fileHelper"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "RevenueCat/diagnostics/diagnostic_entries.jsonl"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v6, 0x8

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    .line 11
    invoke-direct/range {v1 .. v7}, Lcom/revenuecat/purchases/utils/EventsFileHelper;-><init>(Lcom/revenuecat/purchases/common/FileHelper;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    iput-object p1, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;->fileHelper:Lcom/revenuecat/purchases/common/FileHelper;

    return-void
.end method

.method private final diagnosticsFileSize()D
    .locals 2

    iget-object v0, p0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;->fileHelper:Lcom/revenuecat/purchases/common/FileHelper;

    const-string v1, "RevenueCat/diagnostics/diagnostic_entries.jsonl"

    .line 29
    invoke-virtual {v0, v1}, Lcom/revenuecat/purchases/common/FileHelper;->fileSizeInKB(Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0
.end method


# virtual methods
.method public final declared-synchronized isDiagnosticsFileBigEnoughToSync()Z
    .locals 4

    monitor-enter p0

    .line 25
    :try_start_0
    invoke-direct {p0}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;->diagnosticsFileSize()D

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/high16 v2, 0x4069000000000000L    # 200.0

    cmpl-double v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized isDiagnosticsFileTooBig()Z
    .locals 4

    monitor-enter p0

    .line 20
    :try_start_0
    invoke-direct {p0}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsFileHelper;->diagnosticsFileSize()D

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide v2, 0x407f400000000000L    # 500.0

    cmpl-double v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
