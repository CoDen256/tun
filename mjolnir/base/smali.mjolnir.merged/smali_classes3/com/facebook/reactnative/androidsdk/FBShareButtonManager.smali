.class public Lcom/facebook/reactnative/androidsdk/FBShareButtonManager;
.super Lcom/facebook/react/uimanager/SimpleViewManager;
.source "FBShareButtonManager.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/react/uimanager/SimpleViewManager<",
        "Lcom/facebook/share/widget/ShareButton;",
        ">;"
    }
.end annotation


# static fields
.field public static final REACT_CLASS:Ljava/lang/String; = "RCTFBShareButton"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/facebook/react/uimanager/SimpleViewManager;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Landroid/view/View;
    .locals 0

    .line 32
    invoke-virtual {p0, p1}, Lcom/facebook/reactnative/androidsdk/FBShareButtonManager;->createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Lcom/facebook/share/widget/ShareButton;

    move-result-object p1

    return-object p1
.end method

.method protected createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Lcom/facebook/share/widget/ShareButton;
    .locals 1

    .line 43
    new-instance v0, Lcom/facebook/share/widget/ShareButton;

    invoke-direct {v0, p1}, Lcom/facebook/share/widget/ShareButton;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "RCTFBShareButton"

    return-object v0
.end method

.method public setShareContent(Lcom/facebook/share/widget/ShareButton;Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "shareContent"
    .end annotation

    .line 48
    invoke-static {p2}, Lcom/facebook/reactnative/androidsdk/Utility;->buildShareContent(Lcom/facebook/react/bridge/ReadableMap;)Lcom/facebook/share/model/ShareContent;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 50
    invoke-virtual {p1, p2}, Lcom/facebook/share/widget/ShareButton;->setShareContent(Lcom/facebook/share/model/ShareContent;)V

    :cond_0
    return-void
.end method
