.class public final Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;
.super Ljava/lang/Object;
.source "CustomerCenterImpressionEvent.kt"

# interfaces
.implements Lcom/revenuecat/purchases/common/events/FeatureEvent;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;,
        Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$Data;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0008\u0007\u0018\u00002\u00020\u0001:\u0002\u000b\u000cB\u0017\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\n\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;",
        "Lcom/revenuecat/purchases/common/events/FeatureEvent;",
        "creationData",
        "Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;",
        "data",
        "Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$Data;",
        "(Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$Data;)V",
        "getCreationData",
        "()Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;",
        "getData",
        "()Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$Data;",
        "CreationData",
        "Data",
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
.field private final creationData:Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;

.field private final data:Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$Data;


# direct methods
.method public constructor <init>(Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$Data;)V
    .locals 1

    const-string v0, "creationData"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "data"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;->creationData:Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;

    iput-object p2, p0, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;->data:Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$Data;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$Data;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    .line 15
    new-instance p1, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;

    const/4 p3, 0x3

    const/4 p4, 0x0

    invoke-direct {p1, p4, p4, p3, p4}, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;-><init>(Ljava/util/UUID;Ljava/util/Date;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 14
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;-><init>(Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$Data;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;

    iget-object v1, p0, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;->creationData:Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;

    iget-object v3, p1, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;->creationData:Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;->data:Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$Data;

    iget-object p1, p1, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;->data:Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$Data;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public final getCreationData()Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;->creationData:Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;

    return-object v0
.end method

.method public final getData()Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$Data;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;->data:Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$Data;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;->creationData:Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;

    invoke-virtual {v0}, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;->data:Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$Data;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$Data;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CustomerCenterImpressionEvent(creationData="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;->creationData:Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$CreationData;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", data="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent;->data:Lcom/revenuecat/purchases/customercenter/events/CustomerCenterImpressionEvent$Data;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
