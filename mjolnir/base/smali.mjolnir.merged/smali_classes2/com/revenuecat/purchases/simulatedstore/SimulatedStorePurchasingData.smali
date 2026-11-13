.class public final Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;
.super Ljava/lang/Object;
.source "SimulatedStorePurchasingData.kt"

# interfaces
.implements Lcom/revenuecat/purchases/models/PurchasingData;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u0080\u0008\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0002\u0010\u0008J\t\u0010\u000f\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0010\u001a\u00020\u0005H\u00c6\u0003J\t\u0010\u0011\u001a\u00020\u0007H\u00c6\u0003J\'\u0010\u0012\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007H\u00c6\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u0016H\u00d6\u0003J\t\u0010\u0017\u001a\u00020\u0018H\u00d6\u0001J\t\u0010\u0019\u001a\u00020\u0003H\u00d6\u0001R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000e\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;",
        "Lcom/revenuecat/purchases/models/PurchasingData;",
        "productId",
        "",
        "productType",
        "Lcom/revenuecat/purchases/ProductType;",
        "storeProduct",
        "Lcom/revenuecat/purchases/models/StoreProduct;",
        "(Ljava/lang/String;Lcom/revenuecat/purchases/ProductType;Lcom/revenuecat/purchases/models/StoreProduct;)V",
        "getProductId",
        "()Ljava/lang/String;",
        "getProductType",
        "()Lcom/revenuecat/purchases/ProductType;",
        "getStoreProduct",
        "()Lcom/revenuecat/purchases/models/StoreProduct;",
        "component1",
        "component2",
        "component3",
        "copy",
        "equals",
        "",
        "other",
        "",
        "hashCode",
        "",
        "toString",
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


# instance fields
.field private final productId:Ljava/lang/String;

.field private final productType:Lcom/revenuecat/purchases/ProductType;

.field private final storeProduct:Lcom/revenuecat/purchases/models/StoreProduct;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/revenuecat/purchases/ProductType;Lcom/revenuecat/purchases/models/StoreProduct;)V
    .locals 1

    const-string v0, "productId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "productType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "storeProduct"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->productId:Ljava/lang/String;

    iput-object p2, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->productType:Lcom/revenuecat/purchases/ProductType;

    iput-object p3, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->storeProduct:Lcom/revenuecat/purchases/models/StoreProduct;

    return-void
.end method

.method public static synthetic copy$default(Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;Ljava/lang/String;Lcom/revenuecat/purchases/ProductType;Lcom/revenuecat/purchases/models/StoreProduct;ILjava/lang/Object;)Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;
    .locals 0

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    iget-object p1, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->productId:Ljava/lang/String;

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    iget-object p2, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->productType:Lcom/revenuecat/purchases/ProductType;

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    iget-object p3, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->storeProduct:Lcom/revenuecat/purchases/models/StoreProduct;

    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->copy(Ljava/lang/String;Lcom/revenuecat/purchases/ProductType;Lcom/revenuecat/purchases/models/StoreProduct;)Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->productId:Ljava/lang/String;

    return-object v0
.end method

.method public final component2()Lcom/revenuecat/purchases/ProductType;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->productType:Lcom/revenuecat/purchases/ProductType;

    return-object v0
.end method

.method public final component3()Lcom/revenuecat/purchases/models/StoreProduct;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->storeProduct:Lcom/revenuecat/purchases/models/StoreProduct;

    return-object v0
.end method

.method public final copy(Ljava/lang/String;Lcom/revenuecat/purchases/ProductType;Lcom/revenuecat/purchases/models/StoreProduct;)Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;
    .locals 1

    const-string v0, "productId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "productType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "storeProduct"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;

    invoke-direct {v0, p1, p2, p3}, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;-><init>(Ljava/lang/String;Lcom/revenuecat/purchases/ProductType;Lcom/revenuecat/purchases/models/StoreProduct;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;

    iget-object v1, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->productId:Ljava/lang/String;

    iget-object v3, p1, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->productId:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->productType:Lcom/revenuecat/purchases/ProductType;

    iget-object v3, p1, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->productType:Lcom/revenuecat/purchases/ProductType;

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->storeProduct:Lcom/revenuecat/purchases/models/StoreProduct;

    iget-object p1, p1, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->storeProduct:Lcom/revenuecat/purchases/models/StoreProduct;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    return v2

    :cond_4
    return v0
.end method

.method public getProductId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->productId:Ljava/lang/String;

    return-object v0
.end method

.method public getProductType()Lcom/revenuecat/purchases/ProductType;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->productType:Lcom/revenuecat/purchases/ProductType;

    return-object v0
.end method

.method public final getStoreProduct()Lcom/revenuecat/purchases/models/StoreProduct;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->storeProduct:Lcom/revenuecat/purchases/models/StoreProduct;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->productId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->productType:Lcom/revenuecat/purchases/ProductType;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/ProductType;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->storeProduct:Lcom/revenuecat/purchases/models/StoreProduct;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SimulatedStorePurchasingData(productId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->productId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", productType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->productType:Lcom/revenuecat/purchases/ProductType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", storeProduct="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/simulatedstore/SimulatedStorePurchasingData;->storeProduct:Lcom/revenuecat/purchases/models/StoreProduct;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
