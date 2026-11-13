.class public Lcom/facebook/react/CompositeReactPackageTurboModuleManagerDelegate$Builder;
.super Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;
.source "CompositeReactPackageTurboModuleManagerDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/react/CompositeReactPackageTurboModuleManagerDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private final mDelegatesBuilder:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;",
            ">;)V"
        }
    .end annotation

    .line 43
    invoke-direct {p0}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/CompositeReactPackageTurboModuleManagerDelegate$Builder;->mDelegatesBuilder:Ljava/util/List;

    return-void
.end method


# virtual methods
.method protected build(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;)Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            "Ljava/util/List<",
            "Lcom/facebook/react/ReactPackage;",
            ">;)",
            "Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;"
        }
    .end annotation

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/facebook/react/CompositeReactPackageTurboModuleManagerDelegate$Builder;->mDelegatesBuilder:Ljava/util/List;

    .line 50
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;

    .line 51
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate$Builder;->build(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;)Lcom/facebook/react/ReactPackageTurboModuleManagerDelegate;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 53
    :cond_0
    new-instance v1, Lcom/facebook/react/CompositeReactPackageTurboModuleManagerDelegate;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v0, v2}, Lcom/facebook/react/CompositeReactPackageTurboModuleManagerDelegate;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;Ljava/util/List;Lcom/facebook/react/CompositeReactPackageTurboModuleManagerDelegate-IA;)V

    return-object v1
.end method
