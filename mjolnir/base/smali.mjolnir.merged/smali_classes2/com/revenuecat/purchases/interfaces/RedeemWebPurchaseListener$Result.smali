.class public abstract Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result;
.super Ljava/lang/Object;
.source "RedeemWebPurchaseListener.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Result"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Error;,
        Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Expired;,
        Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$InvalidToken;,
        Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$PurchaseBelongsToOtherUser;,
        Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Success;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u00086\u0018\u00002\u00020\u0001:\u0005\u0006\u0007\u0008\t\nB\u0007\u0008\u0004\u00a2\u0006\u0002\u0010\u0002R\u0011\u0010\u0003\u001a\u00020\u00048F\u00a2\u0006\u0006\u001a\u0004\u0008\u0003\u0010\u0005\u0082\u0001\u0005\u000b\u000c\r\u000e\u000f\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result;",
        "",
        "()V",
        "isSuccess",
        "",
        "()Z",
        "Error",
        "Expired",
        "InvalidToken",
        "PurchaseBelongsToOtherUser",
        "Success",
        "Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Error;",
        "Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Expired;",
        "Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$InvalidToken;",
        "Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$PurchaseBelongsToOtherUser;",
        "Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Success;",
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


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result;-><init>()V

    return-void
.end method


# virtual methods
.method public final isSuccess()Z
    .locals 2

    .line 46
    instance-of v0, p0, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Success;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_1

    .line 47
    :cond_0
    instance-of v0, p0, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Error;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    :goto_0
    move v0, v1

    goto :goto_1

    .line 48
    :cond_1
    sget-object v0, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$InvalidToken;->INSTANCE:Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$InvalidToken;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 49
    :cond_2
    instance-of v0, p0, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$Expired;

    if-eqz v0, :cond_3

    goto :goto_0

    .line 50
    :cond_3
    sget-object v0, Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$PurchaseBelongsToOtherUser;->INSTANCE:Lcom/revenuecat/purchases/interfaces/RedeemWebPurchaseListener$Result$PurchaseBelongsToOtherUser;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_0

    :goto_1
    return v0

    :cond_4
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0
.end method
