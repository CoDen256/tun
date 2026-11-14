.class public final Lcom/revenuecat/purchases/utils/EntitlementInfoHelper;
.super Ljava/lang/Object;
.source "EntitlementInfoHelper.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J6\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00082\u0008\u0010\t\u001a\u0004\u0018\u00010\u00082\u0008\u0010\n\u001a\u0004\u0018\u00010\u00082\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/revenuecat/purchases/utils/EntitlementInfoHelper;",
        "",
        "()V",
        "getWillRenew",
        "",
        "store",
        "Lcom/revenuecat/purchases/Store;",
        "expirationDate",
        "Ljava/util/Date;",
        "unsubscribeDetectedAt",
        "billingIssueDetectedAt",
        "periodType",
        "Lcom/revenuecat/purchases/PeriodType;",
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
.field public static final INSTANCE:Lcom/revenuecat/purchases/utils/EntitlementInfoHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/utils/EntitlementInfoHelper;

    invoke-direct {v0}, Lcom/revenuecat/purchases/utils/EntitlementInfoHelper;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/utils/EntitlementInfoHelper;->INSTANCE:Lcom/revenuecat/purchases/utils/EntitlementInfoHelper;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getWillRenew(Lcom/revenuecat/purchases/Store;Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/PeriodType;)Z
    .locals 3

    const-string v0, "store"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    sget-object v0, Lcom/revenuecat/purchases/Store;->PROMOTIONAL:Lcom/revenuecat/purchases/Store;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, v0, :cond_0

    move p1, v1

    goto :goto_0

    :cond_0
    move p1, v2

    :goto_0
    if-nez p2, :cond_1

    move p2, v1

    goto :goto_1

    :cond_1
    move p2, v2

    :goto_1
    if-eqz p3, :cond_2

    move p3, v1

    goto :goto_2

    :cond_2
    move p3, v2

    :goto_2
    if-eqz p4, :cond_3

    move p4, v1

    goto :goto_3

    :cond_3
    move p4, v2

    .line 20
    :goto_3
    sget-object v0, Lcom/revenuecat/purchases/PeriodType;->PREPAID:Lcom/revenuecat/purchases/PeriodType;

    if-ne p5, v0, :cond_4

    move p5, v1

    goto :goto_4

    :cond_4
    move p5, v2

    :goto_4
    if-nez p1, :cond_5

    if-nez p2, :cond_5

    if-nez p3, :cond_5

    if-nez p4, :cond_5

    if-nez p5, :cond_5

    goto :goto_5

    :cond_5
    move v1, v2

    :goto_5
    return v1
.end method
