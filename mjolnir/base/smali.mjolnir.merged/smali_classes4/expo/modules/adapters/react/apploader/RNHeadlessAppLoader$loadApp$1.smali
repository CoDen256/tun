.class public final Lexpo/modules/adapters/react/apploader/RNHeadlessAppLoader$loadApp$1;
.super Ljava/lang/Object;
.source "RNHeadlessAppLoader.kt"

# interfaces
.implements Lcom/facebook/react/ReactInstanceEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/adapters/react/apploader/RNHeadlessAppLoader;->loadApp(Landroid/content/Context;Lexpo/modules/apploader/HeadlessAppLoader$Params;Ljava/lang/Runnable;Lexpo/modules/core/interfaces/Consumer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "expo/modules/adapters/react/apploader/RNHeadlessAppLoader$loadApp$1",
        "Lcom/facebook/react/ReactInstanceEventListener;",
        "onReactContextInitialized",
        "",
        "context",
        "Lcom/facebook/react/bridge/ReactContext;",
        "expo-modules-core_release"
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
.field final synthetic $callback:Lexpo/modules/core/interfaces/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lexpo/modules/core/interfaces/Consumer<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $params:Lexpo/modules/apploader/HeadlessAppLoader$Params;


# direct methods
.method constructor <init>(Lexpo/modules/apploader/HeadlessAppLoader$Params;Lexpo/modules/core/interfaces/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/apploader/HeadlessAppLoader$Params;",
            "Lexpo/modules/core/interfaces/Consumer<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/adapters/react/apploader/RNHeadlessAppLoader$loadApp$1;->$params:Lexpo/modules/apploader/HeadlessAppLoader$Params;

    iput-object p2, p0, Lexpo/modules/adapters/react/apploader/RNHeadlessAppLoader$loadApp$1;->$callback:Lexpo/modules/core/interfaces/Consumer;

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onReactContextInitialized(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    sget-object p1, Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier;->INSTANCE:Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier;

    iget-object v0, p0, Lexpo/modules/adapters/react/apploader/RNHeadlessAppLoader$loadApp$1;->$params:Lexpo/modules/apploader/HeadlessAppLoader$Params;

    invoke-virtual {v0}, Lexpo/modules/apploader/HeadlessAppLoader$Params;->getAppScopeKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier;->notifyAppLoaded(Ljava/lang/String;)V

    iget-object p1, p0, Lexpo/modules/adapters/react/apploader/RNHeadlessAppLoader$loadApp$1;->$callback:Lexpo/modules/core/interfaces/Consumer;

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    .line 30
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Lexpo/modules/core/interfaces/Consumer;->apply(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
