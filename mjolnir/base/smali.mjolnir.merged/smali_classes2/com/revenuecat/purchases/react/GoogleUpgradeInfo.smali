.class Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;
.super Ljava/lang/Object;
.source "GoogleUpgradeInfo.java"


# instance fields
.field private final oldProductIdentifier:Ljava/lang/String;

.field private final prorationMode:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;->oldProductIdentifier:Ljava/lang/String;

    iput-object p2, p0, Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;->prorationMode:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public getOldProductIdentifier()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;->oldProductIdentifier:Ljava/lang/String;

    return-object v0
.end method

.method public getProrationMode()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/react/GoogleUpgradeInfo;->prorationMode:Ljava/lang/Integer;

    return-object v0
.end method
