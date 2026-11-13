.class Lcom/revenuecat/purchases/react/RNPurchasesModule$1;
.super Ljava/lang/Object;
.source "RNPurchasesModule.java"

# interfaces
.implements Lcom/revenuecat/purchases/hybridcommon/OnResultList;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/react/RNPurchasesModule;->getProductInfo(Lcom/facebook/react/bridge/ReadableArray;Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/revenuecat/purchases/react/RNPurchasesModule;

.field final synthetic val$promise:Lcom/facebook/react/bridge/Promise;


# direct methods
.method constructor <init>(Lcom/revenuecat/purchases/react/RNPurchasesModule;Lcom/facebook/react/bridge/Promise;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/revenuecat/purchases/react/RNPurchasesModule$1;->this$0:Lcom/revenuecat/purchases/react/RNPurchasesModule;

    iput-object p2, p0, Lcom/revenuecat/purchases/react/RNPurchasesModule$1;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/revenuecat/purchases/hybridcommon/ErrorContainer;)V
    .locals 3

    iget-object v0, p0, Lcom/revenuecat/purchases/react/RNPurchasesModule$1;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 151
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/revenuecat/purchases/hybridcommon/ErrorContainer;->getCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/revenuecat/purchases/hybridcommon/ErrorContainer;->getMessage()Ljava/lang/String;

    move-result-object v2

    .line 152
    invoke-virtual {p1}, Lcom/revenuecat/purchases/hybridcommon/ErrorContainer;->getInfo()Ljava/util/Map;

    move-result-object p1

    invoke-static {p1}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertMapToWriteableMap(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    .line 151
    invoke-interface {v0, v1, v2, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method public onReceived(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;>;)V"
        }
    .end annotation

    .line 142
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v0

    .line 143
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 144
    invoke-static {v1}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertMapToWriteableMap(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/WritableArray;->pushMap(Lcom/facebook/react/bridge/ReadableMap;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/revenuecat/purchases/react/RNPurchasesModule$1;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 146
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method
