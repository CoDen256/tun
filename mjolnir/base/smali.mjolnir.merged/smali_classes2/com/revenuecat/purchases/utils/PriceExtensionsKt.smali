.class public final Lcom/revenuecat/purchases/utils/PriceExtensionsKt;
.super Ljava/lang/Object;
.source "PriceExtensions.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0006\n\u0002\u0008\u0003\u001a\u001c\u0010\u0000\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0000\u001a\u001c\u0010\u0006\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0000\u001a\u001c\u0010\u0007\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\u0004\u001a\u00020\u0005H\u0002\u001a\u001c\u0010\n\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0000\u001a\u001c\u0010\u000b\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "pricePerDay",
        "Lcom/revenuecat/purchases/models/Price;",
        "billingPeriod",
        "Lcom/revenuecat/purchases/models/Period;",
        "locale",
        "Ljava/util/Locale;",
        "pricePerMonth",
        "pricePerPeriod",
        "units",
        "",
        "pricePerWeek",
        "pricePerYear",
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
.method public static final synthetic pricePerDay(Lcom/revenuecat/purchases/models/Price;Lcom/revenuecat/purchases/models/Period;Ljava/util/Locale;)Lcom/revenuecat/purchases/models/Price;
    .locals 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "billingPeriod"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "locale"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    invoke-virtual {p1}, Lcom/revenuecat/purchases/models/Period;->getValueInDays()D

    move-result-wide v0

    invoke-static {p0, v0, v1, p2}, Lcom/revenuecat/purchases/utils/PriceExtensionsKt;->pricePerPeriod(Lcom/revenuecat/purchases/models/Price;DLjava/util/Locale;)Lcom/revenuecat/purchases/models/Price;

    move-result-object p0

    return-object p0
.end method

.method public static final pricePerMonth(Lcom/revenuecat/purchases/models/Price;Lcom/revenuecat/purchases/models/Period;Ljava/util/Locale;)Lcom/revenuecat/purchases/models/Price;
    .locals 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "billingPeriod"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "locale"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    invoke-virtual {p1}, Lcom/revenuecat/purchases/models/Period;->getValueInMonths()D

    move-result-wide v0

    invoke-static {p0, v0, v1, p2}, Lcom/revenuecat/purchases/utils/PriceExtensionsKt;->pricePerPeriod(Lcom/revenuecat/purchases/models/Price;DLjava/util/Locale;)Lcom/revenuecat/purchases/models/Price;

    move-result-object p0

    return-object p0
.end method

.method private static final pricePerPeriod(Lcom/revenuecat/purchases/models/Price;DLjava/util/Locale;)Lcom/revenuecat/purchases/models/Price;
    .locals 2

    .line 29
    invoke-virtual {p0}, Lcom/revenuecat/purchases/models/Price;->getAmountMicros()J

    move-result-wide v0

    long-to-double v0, v0

    div-double/2addr v0, p1

    .line 30
    sget-object p1, Lcom/revenuecat/purchases/utils/PriceFactory;->INSTANCE:Lcom/revenuecat/purchases/utils/PriceFactory;

    double-to-long v0, v0

    invoke-virtual {p0}, Lcom/revenuecat/purchases/models/Price;->getCurrencyCode()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, v0, v1, p0, p3}, Lcom/revenuecat/purchases/utils/PriceFactory;->createPrice$purchases_defaultsRelease(JLjava/lang/String;Ljava/util/Locale;)Lcom/revenuecat/purchases/models/Price;

    move-result-object p0

    return-object p0
.end method

.method public static final pricePerWeek(Lcom/revenuecat/purchases/models/Price;Lcom/revenuecat/purchases/models/Period;Ljava/util/Locale;)Lcom/revenuecat/purchases/models/Price;
    .locals 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "billingPeriod"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "locale"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-virtual {p1}, Lcom/revenuecat/purchases/models/Period;->getValueInWeeks()D

    move-result-wide v0

    invoke-static {p0, v0, v1, p2}, Lcom/revenuecat/purchases/utils/PriceExtensionsKt;->pricePerPeriod(Lcom/revenuecat/purchases/models/Price;DLjava/util/Locale;)Lcom/revenuecat/purchases/models/Price;

    move-result-object p0

    return-object p0
.end method

.method public static final pricePerYear(Lcom/revenuecat/purchases/models/Price;Lcom/revenuecat/purchases/models/Period;Ljava/util/Locale;)Lcom/revenuecat/purchases/models/Price;
    .locals 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "billingPeriod"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "locale"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    invoke-virtual {p1}, Lcom/revenuecat/purchases/models/Period;->getValueInYears()D

    move-result-wide v0

    invoke-static {p0, v0, v1, p2}, Lcom/revenuecat/purchases/utils/PriceExtensionsKt;->pricePerPeriod(Lcom/revenuecat/purchases/models/Price;DLjava/util/Locale;)Lcom/revenuecat/purchases/models/Price;

    move-result-object p0

    return-object p0
.end method
