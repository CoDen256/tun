.class public abstract Lcom/facebook/react/ReactActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ReactActivity.java"

# interfaces
.implements Lcom/facebook/react/modules/core/DefaultHardwareBackBtnHandler;
.implements Lcom/facebook/react/modules/core/PermissionAwareActivity;


# instance fields
.field private final mDelegate:Lcom/facebook/react/ReactActivityDelegate;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 28
    invoke-virtual {p0}, Lcom/facebook/react/ReactActivity;->createReactActivityDelegate()Lcom/facebook/react/ReactActivityDelegate;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    return-void
.end method


# virtual methods
.method protected createReactActivityDelegate()Lcom/facebook/react/ReactActivityDelegate;
    .locals 2

    .line 41
    new-instance v0, Lcom/facebook/react/ReactActivityDelegate;

    invoke-virtual {p0}, Lcom/facebook/react/ReactActivity;->getMainComponentName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/facebook/react/ReactActivityDelegate;-><init>(Lcom/facebook/react/ReactActivity;Ljava/lang/String;)V

    return-object v0
.end method

.method protected getMainComponentName()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getReactDelegate()Lcom/facebook/react/ReactDelegate;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 69
    invoke-virtual {v0}, Lcom/facebook/react/ReactActivityDelegate;->getReactDelegate()Lcom/facebook/react/ReactDelegate;

    move-result-object v0

    return-object v0
.end method

.method protected final getReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 142
    invoke-virtual {v0}, Lcom/facebook/react/ReactActivityDelegate;->getReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;

    move-result-object v0

    return-object v0
.end method

.method protected final getReactNativeHost()Lcom/facebook/react/ReactNativeHost;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 138
    invoke-virtual {v0}, Lcom/facebook/react/ReactActivityDelegate;->getReactNativeHost()Lcom/facebook/react/ReactNativeHost;

    move-result-object v0

    return-object v0
.end method

.method public invokeDefaultOnBackPressed()V
    .locals 0

    .line 102
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onBackPressed()V

    return-void
.end method

.method protected final loadApp(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 146
    invoke-virtual {v0, p1}, Lcom/facebook/react/ReactActivityDelegate;->loadApp(Ljava/lang/String;)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 74
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 75
    invoke-virtual {v0, p1, p2, p3}, Lcom/facebook/react/ReactActivityDelegate;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onBackPressed()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 95
    invoke-virtual {v0}, Lcom/facebook/react/ReactActivityDelegate;->onBackPressed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 96
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onBackPressed()V

    :cond_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 133
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 134
    invoke-virtual {v0, p1}, Lcom/facebook/react/ReactActivityDelegate;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 46
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 47
    invoke-virtual {v0, p1}, Lcom/facebook/react/ReactActivityDelegate;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 64
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 65
    invoke-virtual {v0}, Lcom/facebook/react/ReactActivityDelegate;->onDestroy()V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 80
    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/ReactActivityDelegate;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0, p1, p2}, Landroidx/appcompat/app/AppCompatActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public onKeyLongPress(ILandroid/view/KeyEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 90
    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/ReactActivityDelegate;->onKeyLongPress(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0, p1, p2}, Landroidx/appcompat/app/AppCompatActivity;->onKeyLongPress(ILandroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 85
    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/ReactActivityDelegate;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0, p1, p2}, Landroidx/appcompat/app/AppCompatActivity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 107
    invoke-virtual {v0, p1}, Lcom/facebook/react/ReactActivityDelegate;->onNewIntent(Landroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 108
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onNewIntent(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 1

    .line 52
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onPause()V

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 53
    invoke-virtual {v0}, Lcom/facebook/react/ReactActivityDelegate;->onPause()V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1

    .line 121
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 122
    invoke-virtual {v0, p1, p2, p3}, Lcom/facebook/react/ReactActivityDelegate;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 58
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onResume()V

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 59
    invoke-virtual {v0}, Lcom/facebook/react/ReactActivityDelegate;->onResume()V

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1

    .line 127
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onWindowFocusChanged(Z)V

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 128
    invoke-virtual {v0, p1}, Lcom/facebook/react/ReactActivityDelegate;->onWindowFocusChanged(Z)V

    return-void
.end method

.method public requestPermissions([Ljava/lang/String;ILcom/facebook/react/modules/core/PermissionListener;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/ReactActivity;->mDelegate:Lcom/facebook/react/ReactActivityDelegate;

    .line 115
    invoke-virtual {v0, p1, p2, p3}, Lcom/facebook/react/ReactActivityDelegate;->requestPermissions([Ljava/lang/String;ILcom/facebook/react/modules/core/PermissionListener;)V

    return-void
.end method
