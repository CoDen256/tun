.class final Lcom/revenuecat/purchases/paywalls/components/common/VariableLocalizationKey$Companion$1;
.super Lkotlin/jvm/internal/Lambda;
.source "Localization.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/paywalls/components/common/VariableLocalizationKey;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlinx/serialization/KSerializer<",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/revenuecat/purchases/paywalls/components/common/VariableLocalizationKey$Companion$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/common/VariableLocalizationKey$Companion$1;

    invoke-direct {v0}, Lcom/revenuecat/purchases/paywalls/components/common/VariableLocalizationKey$Companion$1;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/common/VariableLocalizationKey$Companion$1;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/common/VariableLocalizationKey$Companion$1;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 124
    invoke-virtual {p0}, Lcom/revenuecat/purchases/paywalls/components/common/VariableLocalizationKey$Companion$1;->invoke()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    return-object v0
.end method

.method public final invoke()Lkotlinx/serialization/KSerializer;
    .locals 47
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/serialization/KSerializer<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 124
    invoke-static {}, Lcom/revenuecat/purchases/paywalls/components/common/VariableLocalizationKey;->values()[Lcom/revenuecat/purchases/paywalls/components/common/VariableLocalizationKey;

    move-result-object v0

    check-cast v0, [Ljava/lang/Enum;

    const-string v1, "day"

    const-string v2, "daily"

    const-string v3, "day_short"

    const-string v4, "week"

    const-string v5, "weekly"

    const-string v6, "week_short"

    const-string v7, "month"

    const-string v8, "monthly"

    const-string v9, "month_short"

    const-string v10, "year"

    const-string v11, "yearly"

    const-string v12, "year_short"

    const-string v13, "annual"

    const-string v14, "annually"

    const-string v15, "annual_short"

    const-string v16, "lifetime"

    const-string v17, "free_price"

    const-string v18, "percent"

    const-string v19, "num_day_zero"

    const-string v20, "num_day_one"

    const-string v21, "num_day_two"

    const-string v22, "num_day_few"

    const-string v23, "num_day_many"

    const-string v24, "num_day_other"

    const-string v25, "num_week_zero"

    const-string v26, "num_week_one"

    const-string v27, "num_week_two"

    const-string v28, "num_week_few"

    const-string v29, "num_week_many"

    const-string v30, "num_week_other"

    const-string v31, "num_month_zero"

    const-string v32, "num_month_one"

    const-string v33, "num_month_two"

    const-string v34, "num_month_few"

    const-string v35, "num_month_many"

    const-string v36, "num_month_other"

    const-string v37, "num_year_zero"

    const-string v38, "num_year_one"

    const-string v39, "num_year_two"

    const-string v40, "num_year_few"

    const-string v41, "num_year_many"

    const-string v42, "num_year_other"

    const-string v43, "num_days_short"

    const-string v44, "num_weeks_short"

    const-string v45, "num_months_short"

    const-string v46, "num_years_short"

    filled-new-array/range {v1 .. v46}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2e

    new-array v2, v2, [[Ljava/lang/annotation/Annotation;

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object v4, v2, v3

    const/4 v3, 0x3

    aput-object v4, v2, v3

    const/4 v3, 0x4

    aput-object v4, v2, v3

    const/4 v3, 0x5

    aput-object v4, v2, v3

    const/4 v3, 0x6

    aput-object v4, v2, v3

    const/4 v3, 0x7

    aput-object v4, v2, v3

    const/16 v3, 0x8

    aput-object v4, v2, v3

    const/16 v3, 0x9

    aput-object v4, v2, v3

    const/16 v3, 0xa

    aput-object v4, v2, v3

    const/16 v3, 0xb

    aput-object v4, v2, v3

    const/16 v3, 0xc

    aput-object v4, v2, v3

    const/16 v3, 0xd

    aput-object v4, v2, v3

    const/16 v3, 0xe

    aput-object v4, v2, v3

    const/16 v3, 0xf

    aput-object v4, v2, v3

    const/16 v3, 0x10

    aput-object v4, v2, v3

    const/16 v3, 0x11

    aput-object v4, v2, v3

    const/16 v3, 0x12

    aput-object v4, v2, v3

    const/16 v3, 0x13

    aput-object v4, v2, v3

    const/16 v3, 0x14

    aput-object v4, v2, v3

    const/16 v3, 0x15

    aput-object v4, v2, v3

    const/16 v3, 0x16

    aput-object v4, v2, v3

    const/16 v3, 0x17

    aput-object v4, v2, v3

    const/16 v3, 0x18

    aput-object v4, v2, v3

    const/16 v3, 0x19

    aput-object v4, v2, v3

    const/16 v3, 0x1a

    aput-object v4, v2, v3

    const/16 v3, 0x1b

    aput-object v4, v2, v3

    const/16 v3, 0x1c

    aput-object v4, v2, v3

    const/16 v3, 0x1d

    aput-object v4, v2, v3

    const/16 v3, 0x1e

    aput-object v4, v2, v3

    const/16 v3, 0x1f

    aput-object v4, v2, v3

    const/16 v3, 0x20

    aput-object v4, v2, v3

    const/16 v3, 0x21

    aput-object v4, v2, v3

    const/16 v3, 0x22

    aput-object v4, v2, v3

    const/16 v3, 0x23

    aput-object v4, v2, v3

    const/16 v3, 0x24

    aput-object v4, v2, v3

    const/16 v3, 0x25

    aput-object v4, v2, v3

    const/16 v3, 0x26

    aput-object v4, v2, v3

    const/16 v3, 0x27

    aput-object v4, v2, v3

    const/16 v3, 0x28

    aput-object v4, v2, v3

    const/16 v3, 0x29

    aput-object v4, v2, v3

    const/16 v3, 0x2a

    aput-object v4, v2, v3

    const/16 v3, 0x2b

    aput-object v4, v2, v3

    const/16 v3, 0x2c

    aput-object v4, v2, v3

    const/16 v3, 0x2d

    aput-object v4, v2, v3

    const-string v3, "com.revenuecat.purchases.paywalls.components.common.VariableLocalizationKey"

    invoke-static {v3, v0, v1, v2, v4}, Lkotlinx/serialization/internal/EnumsKt;->createAnnotatedEnumSerializer(Ljava/lang/String;[Ljava/lang/Enum;[Ljava/lang/String;[[Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    return-object v0
.end method
