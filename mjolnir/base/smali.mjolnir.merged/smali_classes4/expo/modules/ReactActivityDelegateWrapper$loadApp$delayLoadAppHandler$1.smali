.class final Lexpo/modules/ReactActivityDelegateWrapper$loadApp$delayLoadAppHandler$1;
.super Lkotlin/jvm/internal/Lambda;
.source "ReactActivityDelegateWrapper.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/ReactActivityDelegateWrapper;->loadApp(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Lexpo/modules/core/interfaces/ReactActivityHandler;",
        "Lexpo/modules/core/interfaces/ReactActivityHandler$DelayLoadAppHandler;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0000\u001a\u0004\u0018\u00010\u00012\u000e\u0010\u0002\u001a\n \u0004*\u0004\u0018\u00010\u00030\u0003H\n\u00a2\u0006\u0002\u0008\u0005"
    }
    d2 = {
        "<anonymous>",
        "Lexpo/modules/core/interfaces/ReactActivityHandler$DelayLoadAppHandler;",
        "it",
        "Lexpo/modules/core/interfaces/ReactActivityHandler;",
        "kotlin.jvm.PlatformType",
        "invoke"
    }
    k = 0x3
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
.method constructor <init>(Lexpo/modules/ReactActivityDelegateWrapper;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/ReactActivityDelegateWrapper$loadApp$delayLoadAppHandler$1;->this$0:Lexpo/modules/ReactActivityDelegateWrapper;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Lexpo/modules/core/interfaces/ReactActivityHandler;)Lexpo/modules/core/interfaces/ReactActivityHandler$DelayLoadAppHandler;
    .locals 2

    iget-object v0, p0, Lexpo/modules/ReactActivityDelegateWrapper$loadApp$delayLoadAppHandler$1;->this$0:Lexpo/modules/ReactActivityDelegateWrapper;

    .line 108
    invoke-static {v0}, Lexpo/modules/ReactActivityDelegateWrapper;->access$getActivity$p(Lexpo/modules/ReactActivityDelegateWrapper;)Lcom/facebook/react/ReactActivity;

    move-result-object v0

    iget-object v1, p0, Lexpo/modules/ReactActivityDelegateWrapper$loadApp$delayLoadAppHandler$1;->this$0:Lexpo/modules/ReactActivityDelegateWrapper;

    invoke-virtual {v1}, Lexpo/modules/ReactActivityDelegateWrapper;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lexpo/modules/core/interfaces/ReactActivityHandler;->getDelayLoadAppHandler(Lcom/facebook/react/ReactActivity;Lcom/facebook/react/ReactNativeHost;)Lexpo/modules/core/interfaces/ReactActivityHandler$DelayLoadAppHandler;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 108
    check-cast p1, Lexpo/modules/core/interfaces/ReactActivityHandler;

    invoke-virtual {p0, p1}, Lexpo/modules/ReactActivityDelegateWrapper$loadApp$delayLoadAppHandler$1;->invoke(Lexpo/modules/core/interfaces/ReactActivityHandler;)Lexpo/modules/core/interfaces/ReactActivityHandler$DelayLoadAppHandler;

    move-result-object p1

    return-object p1
.end method
