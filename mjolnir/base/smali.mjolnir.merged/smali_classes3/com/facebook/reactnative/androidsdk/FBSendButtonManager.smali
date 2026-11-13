.class public Lcom/facebook/reactnative/androidsdk/FBSendButtonManager;
.super Lcom/facebook/react/uimanager/SimpleViewManager;
.source "FBSendButtonManager.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/react/uimanager/SimpleViewManager<",
        "Lcom/facebook/share/widget/SendButton;",
        ">;"
    }
.end annotation


# static fields
.field public static final REACT_CLASS:Ljava/lang/String; = "RCTFBSendButton"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Lcom/facebook/react/uimanager/SimpleViewManager;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Landroid/view/View;
    .locals 0

    .line 30
    invoke-virtual {p0, p1}, Lcom/facebook/reactnative/androidsdk/FBSendButtonManager;->createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Lcom/facebook/share/widget/SendButton;

    move-result-object p1

    return-object p1
.end method

.method protected createViewInstance(Lcom/facebook/react/uimanager/ThemedReactContext;)Lcom/facebook/share/widget/SendButton;
    .locals 1

    .line 41
    new-instance v0, Lcom/facebook/share/widget/SendButton;

    invoke-direct {v0, p1}, Lcom/facebook/share/widget/SendButton;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "RCTFBSendButton"

    return-object v0
.end method

.method public setShareContent(Lcom/facebook/share/widget/SendButton;Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "shareContent"
    .end annotation

    .line 46
    invoke-static {p2}, Lcom/facebook/reactnative/androidsdk/Utility;->buildShareContent(Lcom/facebook/react/bridge/ReadableMap;)Lcom/facebook/share/model/ShareContent;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 48
    invoke-virtual {p1, p2}, Lcom/facebook/share/widget/SendButton;->setShareContent(Lcom/facebook/share/model/ShareContent;)V

    :cond_0
    return-void
.end method
