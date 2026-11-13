.class public final Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencies$Creator;
.super Ljava/lang/Object;
.source "VirtualCurrencies.kt"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencies;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Creator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencies;",
        ">;"
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


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createFromParcel(Landroid/os/Parcel;)Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencies;
    .locals 5

    const-string v0, "parcel"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1, v0}, Ljava/util/LinkedHashMap;-><init>(I)V

    const/4 v2, 0x0

    :goto_0
    if-eq v2, v0, :cond_0

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrency;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v4, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    check-cast v1, Ljava/util/Map;

    new-instance p1, Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencies;

    invoke-direct {p1, v1}, Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencies;-><init>(Ljava/util/Map;)V

    return-object p1
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencies$Creator;->createFromParcel(Landroid/os/Parcel;)Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencies;

    move-result-object p1

    return-object p1
.end method

.method public final newArray(I)[Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencies;
    .locals 0

    new-array p1, p1, [Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencies;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencies$Creator;->newArray(I)[Lcom/revenuecat/purchases/virtualcurrencies/VirtualCurrencies;

    move-result-object p1

    return-object p1
.end method
