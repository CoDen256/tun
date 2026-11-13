.class final Lexpo/modules/ReactActivityDelegateWrapper$_reactNativeHost$2;
.super Lkotlin/jvm/internal/Lambda;
.source "ReactActivityDelegateWrapper.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/ReactActivityDelegateWrapper;-><init>(Lcom/facebook/react/ReactActivity;ZLcom/facebook/react/ReactActivityDelegate;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lcom/facebook/react/ReactNativeHost;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "Lcom/facebook/react/ReactNativeHost;",
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

    iput-object p1, p0, Lexpo/modules/ReactActivityDelegateWrapper$_reactNativeHost$2;->this$0:Lexpo/modules/ReactActivityDelegateWrapper;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Lcom/facebook/react/ReactNativeHost;
    .locals 2

    iget-object v0, p0, Lexpo/modules/ReactActivityDelegateWrapper$_reactNativeHost$2;->this$0:Lexpo/modules/ReactActivityDelegateWrapper;

    const-string v1, "getReactNativeHost"

    .line 42
    invoke-static {v0, v1}, Lexpo/modules/ReactActivityDelegateWrapper;->access$invokeDelegateMethod(Lexpo/modules/ReactActivityDelegateWrapper;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/ReactNativeHost;

    return-object v0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 41
    invoke-virtual {p0}, Lexpo/modules/ReactActivityDelegateWrapper$_reactNativeHost$2;->invoke()Lcom/facebook/react/ReactNativeHost;

    move-result-object v0

    return-object v0
.end method
