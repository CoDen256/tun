.class final Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$VariableName$Companion$valueMap$2;
.super Lkotlin/jvm/internal/Lambda;
.source "CustomerCenterConfigData.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$VariableName;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Ljava/util/Map<",
        "Ljava/lang/String;",
        "+",
        "Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$VariableName;",
        ">;>;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCustomerCenterConfigData.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CustomerCenterConfigData.kt\ncom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$VariableName$Companion$valueMap$2\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,525:1\n8541#2,2:526\n8801#2,4:528\n*S KotlinDebug\n*F\n+ 1 CustomerCenterConfigData.kt\ncom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$VariableName$Companion$valueMap$2\n*L\n44#1:526,2\n44#1:528,4\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001H\n\u00a2\u0006\u0002\u0008\u0004"
    }
    d2 = {
        "<anonymous>",
        "",
        "",
        "Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$VariableName;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$VariableName$Companion$valueMap$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$VariableName$Companion$valueMap$2;

    invoke-direct {v0}, Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$VariableName$Companion$valueMap$2;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$VariableName$Companion$valueMap$2;->INSTANCE:Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$VariableName$Companion$valueMap$2;

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

    .line 43
    invoke-virtual {p0}, Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$VariableName$Companion$valueMap$2;->invoke()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public final invoke()Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$VariableName;",
            ">;"
        }
    .end annotation

    .line 44
    invoke-static {}, Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$VariableName;->values()[Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$VariableName;

    move-result-object v0

    .line 526
    array-length v1, v0

    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapCapacity(I)I

    move-result v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Lkotlin/ranges/RangesKt;->coerceAtLeast(II)I

    move-result v1

    .line 527
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    check-cast v2, Ljava/util/Map;

    .line 528
    array-length v1, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    aget-object v4, v0, v3

    .line 44
    invoke-virtual {v4}, Lcom/revenuecat/purchases/customercenter/CustomerCenterConfigData$Localization$VariableName;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    .line 529
    invoke-interface {v2, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-object v2
.end method
