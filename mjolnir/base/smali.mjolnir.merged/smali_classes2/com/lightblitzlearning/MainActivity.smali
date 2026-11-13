.class public final Lcom/lightblitzlearning/MainActivity;
.super Lcom/facebook/react/ReactActivity;
.source "MainActivity.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u0003\u001a\u00020\u0004H\u0014J\u0008\u0010\u0005\u001a\u00020\u0006H\u0014J\u0012\u0010\u0007\u001a\u00020\u00082\u0008\u0010\t\u001a\u0004\u0018\u00010\nH\u0014\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/lightblitzlearning/MainActivity;",
        "Lcom/facebook/react/ReactActivity;",
        "()V",
        "createReactActivityDelegate",
        "Lcom/facebook/react/ReactActivityDelegate;",
        "getMainComponentName",
        "",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "app_release"
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
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Lcom/facebook/react/ReactActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected createReactActivityDelegate()Lcom/facebook/react/ReactActivityDelegate;
    .locals 5

    .line 24
    new-instance v0, Lexpo/modules/ReactActivityDelegateWrapper;

    move-object v1, p0

    check-cast v1, Lcom/facebook/react/ReactActivity;

    new-instance v2, Lcom/facebook/react/defaults/DefaultReactActivityDelegate;

    invoke-virtual {p0}, Lcom/lightblitzlearning/MainActivity;->getMainComponentName()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/facebook/react/defaults/DefaultNewArchitectureEntryPoint;->getFabricEnabled()Z

    move-result v4

    invoke-direct {v2, v1, v3, v4}, Lcom/facebook/react/defaults/DefaultReactActivityDelegate;-><init>(Lcom/facebook/react/ReactActivity;Ljava/lang/String;Z)V

    check-cast v2, Lcom/facebook/react/ReactActivityDelegate;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lexpo/modules/ReactActivityDelegateWrapper;-><init>(Lcom/facebook/react/ReactActivity;ZLcom/facebook/react/ReactActivityDelegate;)V

    check-cast v0, Lcom/facebook/react/ReactActivityDelegate;

    return-object v0
.end method

.method protected getMainComponentName()Ljava/lang/String;
    .locals 1

    const-string v0, "Mjolnir"

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    const/4 p1, 0x0

    .line 28
    invoke-super {p0, p1}, Lcom/facebook/react/ReactActivity;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method
