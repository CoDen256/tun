.class public final Lcom/revenuecat/purchases/google/usecase/BillingClientUseCaseKt;
.super Ljava/lang/Object;
.source "BillingClientUseCase.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u0019\u0010\u0002\u001a\u00020\u0003X\u0080\u0004\u00f8\u0001\u0000\u00a2\u0006\n\n\u0002\u0010\u0006\u001a\u0004\u0008\u0004\u0010\u0005\"\u0019\u0010\u0007\u001a\u00020\u0003X\u0080\u0004\u00f8\u0001\u0000\u00a2\u0006\n\n\u0002\u0010\u0006\u001a\u0004\u0008\u0008\u0010\u0005\"\u0013\u0010\t\u001a\u00020\u0003X\u0082\u0004\u00f8\u0001\u0000\u00a2\u0006\u0004\n\u0002\u0010\u0006*\u0088\u0001\u0008\u0000\u0010\n\"@\u0012\u0013\u0012\u00110\u000c\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u000f\u0012!\u0012\u001f\u0012\u0006\u0012\u0004\u0018\u00010\u0011\u0012\u0004\u0012\u00020\u00120\u0010\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u0013\u0012\u0004\u0012\u00020\u00120\u000b2@\u0012\u0013\u0012\u00110\u000c\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u000f\u0012!\u0012\u001f\u0012\u0006\u0012\u0004\u0018\u00010\u0011\u0012\u0004\u0012\u00020\u00120\u0010\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u0013\u0012\u0004\u0012\u00020\u00120\u000b\u0082\u0002\u0004\n\u0002\u0008\u0019\u00a8\u0006\u0014"
    }
    d2 = {
        "MAX_RETRIES_DEFAULT",
        "",
        "RETRY_TIMER_MAX_TIME",
        "Lkotlin/time/Duration;",
        "getRETRY_TIMER_MAX_TIME",
        "()J",
        "J",
        "RETRY_TIMER_SERVICE_UNAVAILABLE_MAX_TIME_FOREGROUND",
        "getRETRY_TIMER_SERVICE_UNAVAILABLE_MAX_TIME_FOREGROUND",
        "RETRY_TIMER_START",
        "ExecuteRequestOnUIThreadFunction",
        "Lkotlin/Function2;",
        "",
        "Lkotlin/ParameterName;",
        "name",
        "delayInMillis",
        "Lkotlin/Function1;",
        "Lcom/revenuecat/purchases/PurchasesError;",
        "",
        "onError",
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


# static fields
.field private static final MAX_RETRIES_DEFAULT:I = 0x3

.field private static final RETRY_TIMER_MAX_TIME:J

.field private static final RETRY_TIMER_SERVICE_UNAVAILABLE_MAX_TIME_FOREGROUND:J

.field private static final RETRY_TIMER_START:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 24
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    const/16 v0, 0x36e

    sget-object v1, Lkotlin/time/DurationUnit;->MILLISECONDS:Lkotlin/time/DurationUnit;

    invoke-static {v0, v1}, Lkotlin/time/DurationKt;->toDuration(ILkotlin/time/DurationUnit;)J

    move-result-wide v0

    sput-wide v0, Lcom/revenuecat/purchases/google/usecase/BillingClientUseCaseKt;->RETRY_TIMER_START:J

    .line 25
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    const/16 v0, 0xf

    sget-object v1, Lkotlin/time/DurationUnit;->MINUTES:Lkotlin/time/DurationUnit;

    invoke-static {v0, v1}, Lkotlin/time/DurationKt;->toDuration(ILkotlin/time/DurationUnit;)J

    move-result-wide v0

    sput-wide v0, Lcom/revenuecat/purchases/google/usecase/BillingClientUseCaseKt;->RETRY_TIMER_MAX_TIME:J

    .line 26
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    const/4 v0, 0x4

    sget-object v1, Lkotlin/time/DurationUnit;->SECONDS:Lkotlin/time/DurationUnit;

    invoke-static {v0, v1}, Lkotlin/time/DurationKt;->toDuration(ILkotlin/time/DurationUnit;)J

    move-result-wide v0

    sput-wide v0, Lcom/revenuecat/purchases/google/usecase/BillingClientUseCaseKt;->RETRY_TIMER_SERVICE_UNAVAILABLE_MAX_TIME_FOREGROUND:J

    return-void
.end method

.method public static final synthetic access$getRETRY_TIMER_START$p()J
    .locals 2

    sget-wide v0, Lcom/revenuecat/purchases/google/usecase/BillingClientUseCaseKt;->RETRY_TIMER_START:J

    return-wide v0
.end method

.method public static final getRETRY_TIMER_MAX_TIME()J
    .locals 2

    sget-wide v0, Lcom/revenuecat/purchases/google/usecase/BillingClientUseCaseKt;->RETRY_TIMER_MAX_TIME:J

    return-wide v0
.end method

.method public static final getRETRY_TIMER_SERVICE_UNAVAILABLE_MAX_TIME_FOREGROUND()J
    .locals 2

    sget-wide v0, Lcom/revenuecat/purchases/google/usecase/BillingClientUseCaseKt;->RETRY_TIMER_SERVICE_UNAVAILABLE_MAX_TIME_FOREGROUND:J

    return-wide v0
.end method
