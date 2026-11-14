.class final Lcom/revenuecat/purchases/models/PeriodConstants;
.super Ljava/lang/Object;
.source "Period.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0006\n\u0002\u0008\u0006\u0008\u00c2\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/revenuecat/purchases/models/PeriodConstants;",
        "",
        "()V",
        "DAYS_PER_MONTH",
        "",
        "DAYS_PER_WEEK",
        "DAYS_PER_YEAR",
        "MONTHS_PER_YEAR",
        "WEEKS_PER_MONTH",
        "WEEKS_PER_YEAR",
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
.field public static final DAYS_PER_MONTH:D = 30.0

.field public static final DAYS_PER_WEEK:D = 7.0

.field public static final DAYS_PER_YEAR:D = 365.0

.field public static final INSTANCE:Lcom/revenuecat/purchases/models/PeriodConstants;

.field public static final MONTHS_PER_YEAR:D = 12.0

.field public static final WEEKS_PER_MONTH:D = 4.345238095238096

.field public static final WEEKS_PER_YEAR:D = 52.142857142857146


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/models/PeriodConstants;

    invoke-direct {v0}, Lcom/revenuecat/purchases/models/PeriodConstants;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/models/PeriodConstants;->INSTANCE:Lcom/revenuecat/purchases/models/PeriodConstants;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
