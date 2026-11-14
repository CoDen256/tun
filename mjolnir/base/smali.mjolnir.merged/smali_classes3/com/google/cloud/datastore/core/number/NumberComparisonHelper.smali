.class public final Lcom/google/cloud/datastore/core/number/NumberComparisonHelper;
.super Ljava/lang/Object;
.source "NumberComparisonHelper.java"


# static fields
.field public static final LONG_EXCLUSIVE_UPPER_BOUND_AS_DOUBLE:D = 9.223372036854776E18

.field public static final LONG_INCLUSIVE_LOWER_BOUND_AS_DOUBLE:D = -9.223372036854776E18

.field public static final MAX_SAFE_LONG:J = 0x20000000000000L

.field public static final MIN_SAFE_LONG:J = -0x20000000000000L


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static compareLongs(JJ)I
    .locals 0

    cmp-long p0, p0, p2

    if-gez p0, :cond_0

    const/4 p0, -0x1

    return p0

    :cond_0
    if-lez p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static firestoreCompareDoubleWithLong(DJ)I
    .locals 4

    .line 37
    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    const-wide/high16 v2, -0x3c20000000000000L    # -9.223372036854776E18

    cmpg-double v0, p0, v2

    if-gez v0, :cond_1

    return v1

    :cond_1
    const-wide/high16 v0, 0x43e0000000000000L    # 9.223372036854776E18

    cmpl-double v0, p0, v0

    if-ltz v0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    double-to-long v0, p0

    .line 52
    invoke-static {v0, v1, p2, p3}, Lcom/google/cloud/datastore/core/number/NumberComparisonHelper;->compareLongs(JJ)I

    move-result v0

    if-eqz v0, :cond_3

    return v0

    :cond_3
    long-to-double p2, p2

    .line 59
    invoke-static {p0, p1, p2, p3}, Lcom/google/cloud/datastore/core/number/NumberComparisonHelper;->firestoreCompareDoubles(DD)I

    move-result p0

    return p0
.end method

.method public static firestoreCompareDoubles(DD)I
    .locals 4

    cmpg-double v0, p0, p2

    const/4 v1, -0x1

    if-gez v0, :cond_0

    return v1

    :cond_0
    cmpl-double v0, p0, p2

    const/4 v2, 0x1

    if-lez v0, :cond_1

    return v2

    :cond_1
    const/4 v3, 0x0

    if-nez v0, :cond_2

    return v3

    .line 93
    :cond_2
    invoke-static {p2, p3}, Ljava/lang/Double;->isNaN(D)Z

    move-result p2

    if-nez p2, :cond_3

    return v1

    .line 96
    :cond_3
    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    move-result p0

    if-nez p0, :cond_4

    return v2

    :cond_4
    return v3
.end method
