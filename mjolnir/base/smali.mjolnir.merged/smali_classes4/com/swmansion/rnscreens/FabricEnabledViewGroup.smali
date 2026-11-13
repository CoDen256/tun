.class public abstract Lcom/swmansion/rnscreens/FabricEnabledViewGroup;
.super Landroid/view/ViewGroup;
.source "FabricEnabledViewGroup.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0006\n\u0000\u0008&\u0018\u00002\u00020\u0001B\u000f\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0002\u0010\u0004J \u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000e\u001a\u00020\u000fH\u0004R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u00068F\u00a2\u0006\u0006\u001a\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/swmansion/rnscreens/FabricEnabledViewGroup;",
        "Landroid/view/ViewGroup;",
        "context",
        "Lcom/facebook/react/bridge/ReactContext;",
        "(Lcom/facebook/react/bridge/ReactContext;)V",
        "fabricViewStateManager",
        "Lcom/facebook/react/uimanager/FabricViewStateManager;",
        "getFabricViewStateManager",
        "()Lcom/facebook/react/uimanager/FabricViewStateManager;",
        "updateScreenSizeFabric",
        "",
        "width",
        "",
        "height",
        "headerHeight",
        "",
        "react-native-screens_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 0

    .line 7
    check-cast p1, Landroid/content/Context;

    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final getFabricViewStateManager()Lcom/facebook/react/uimanager/FabricViewStateManager;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected final updateScreenSizeFabric(IID)V
    .locals 0

    return-void
.end method
