.class public final Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTrackerKt;
.super Ljava/lang/Object;
.source "DiagnosticsTracker.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTrackerKt$WhenMappings;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0003\"\u0018\u0010\u0000\u001a\u00020\u0001*\u00020\u00028BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "diagnosticsName",
        "",
        "Lcom/revenuecat/purchases/ProductType;",
        "getDiagnosticsName",
        "(Lcom/revenuecat/purchases/ProductType;)Ljava/lang/String;",
        "purchases_defaultsRelease"
    }
    k = 0x2
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final synthetic access$getDiagnosticsName(Lcom/revenuecat/purchases/ProductType;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTrackerKt;->getDiagnosticsName(Lcom/revenuecat/purchases/ProductType;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static final getDiagnosticsName(Lcom/revenuecat/purchases/ProductType;)Ljava/lang/String;
    .locals 1

    .line 612
    sget-object v0, Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTrackerKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p0}, Lcom/revenuecat/purchases/ProductType;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-ne p0, v0, :cond_0

    const-string p0, "UNKNOWN"

    goto :goto_0

    .line 615
    :cond_0
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0

    :cond_1
    const-string p0, "NON_SUBSCRIPTION"

    goto :goto_0

    :cond_2
    const-string p0, "AUTO_RENEWABLE_SUBSCRIPTION"

    :goto_0
    return-object p0
.end method
