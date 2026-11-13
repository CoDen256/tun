.class public final Lexpo/modules/ReactActivityDelegateWrapper$onCreate$1;
.super Lcom/facebook/react/ReactDelegate;
.source "ReactActivityDelegateWrapper.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/ReactActivityDelegateWrapper;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0014\u00a8\u0006\u0004"
    }
    d2 = {
        "expo/modules/ReactActivityDelegateWrapper$onCreate$1",
        "Lcom/facebook/react/ReactDelegate;",
        "createRootView",
        "Lcom/facebook/react/ReactRootView;",
        "expo_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Lexpo/modules/ReactActivityDelegateWrapper;


# direct methods
.method constructor <init>(Landroid/os/Bundle;Lexpo/modules/ReactActivityDelegateWrapper;Landroid/app/Activity;Lcom/facebook/react/ReactNativeHost;Ljava/lang/String;)V
    .locals 0

    iput-object p2, p0, Lexpo/modules/ReactActivityDelegateWrapper$onCreate$1;->this$0:Lexpo/modules/ReactActivityDelegateWrapper;

    .line 161
    invoke-direct {p0, p3, p4, p5, p1}, Lcom/facebook/react/ReactDelegate;-><init>(Landroid/app/Activity;Lcom/facebook/react/ReactNativeHost;Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method


# virtual methods
.method protected createRootView()Lcom/facebook/react/ReactRootView;
    .locals 2

    iget-object v0, p0, Lexpo/modules/ReactActivityDelegateWrapper$onCreate$1;->this$0:Lexpo/modules/ReactActivityDelegateWrapper;

    .line 168
    invoke-virtual {v0}, Lexpo/modules/ReactActivityDelegateWrapper;->createRootView()Lcom/facebook/react/ReactRootView;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/facebook/react/ReactDelegate;->createRootView()Lcom/facebook/react/ReactRootView;

    move-result-object v0

    const-string v1, "createRootView(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_0
    return-object v0
.end method
