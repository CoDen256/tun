.class public Lcom/facebook/react/defaults/DefaultReactActivityDelegate;
.super Lcom/facebook/react/ReactActivityDelegate;
.source "DefaultReactActivityDelegate.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDefaultReactActivityDelegate.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DefaultReactActivityDelegate.kt\ncom/facebook/react/defaults/DefaultReactActivityDelegate\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,53:1\n1#2:54\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0016\u0018\u00002\u00020\u0001B\'\u0008\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u00a2\u0006\u0002\u0010\tB\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0002\u0010\nJ\u0008\u0010\u000b\u001a\u00020\u000cH\u0014J\u0012\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0014J\u0008\u0010\u000f\u001a\u00020\u0007H\u0014R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/facebook/react/defaults/DefaultReactActivityDelegate;",
        "Lcom/facebook/react/ReactActivityDelegate;",
        "activity",
        "Lcom/facebook/react/ReactActivity;",
        "mainComponentName",
        "",
        "fabricEnabled",
        "",
        "concurrentReactEnabled",
        "(Lcom/facebook/react/ReactActivity;Ljava/lang/String;ZZ)V",
        "(Lcom/facebook/react/ReactActivity;Ljava/lang/String;Z)V",
        "createRootView",
        "Lcom/facebook/react/ReactRootView;",
        "bundle",
        "Landroid/os/Bundle;",
        "isFabricEnabled",
        "ReactAndroid_release"
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
.field private final fabricEnabled:Z


# direct methods
.method public constructor <init>(Lcom/facebook/react/ReactActivity;Ljava/lang/String;Z)V
    .locals 1

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "mainComponentName"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/ReactActivityDelegate;-><init>(Lcom/facebook/react/ReactActivity;Ljava/lang/String;)V

    iput-boolean p3, p0, Lcom/facebook/react/defaults/DefaultReactActivityDelegate;->fabricEnabled:Z

    return-void
.end method

.method public synthetic constructor <init>(Lcom/facebook/react/ReactActivity;Ljava/lang/String;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    const/4 p3, 0x0

    .line 24
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/defaults/DefaultReactActivityDelegate;-><init>(Lcom/facebook/react/ReactActivity;Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/ReactActivity;Ljava/lang/String;ZZ)V
    .locals 0
    .annotation runtime Lkotlin/Deprecated;
        level = .enum Lkotlin/DeprecationLevel;->WARNING:Lkotlin/DeprecationLevel;
        message = "Creating DefaultReactActivityDelegate with both fabricEnabled and concurrentReactEnabled is deprecated. Please pass only one boolean value that will be used for both flags"
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = "DefaultReactActivityDelegate(activity, mainComponentName, fabricEnabled)"
            imports = {}
        .end subannotation
    .end annotation

    const-string p4, "activity"

    invoke-static {p1, p4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p4, "mainComponentName"

    invoke-static {p2, p4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/defaults/DefaultReactActivityDelegate;-><init>(Lcom/facebook/react/ReactActivity;Ljava/lang/String;Z)V

    return-void
.end method


# virtual methods
.method protected createRootView()Lcom/facebook/react/ReactRootView;
    .locals 2

    .line 48
    new-instance v0, Lcom/facebook/react/ReactRootView;

    invoke-virtual {p0}, Lcom/facebook/react/defaults/DefaultReactActivityDelegate;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/ReactRootView;-><init>(Landroid/content/Context;)V

    iget-boolean v1, p0, Lcom/facebook/react/defaults/DefaultReactActivityDelegate;->fabricEnabled:Z

    invoke-virtual {v0, v1}, Lcom/facebook/react/ReactRootView;->setIsFabric(Z)V

    return-object v0
.end method

.method protected createRootView(Landroid/os/Bundle;)Lcom/facebook/react/ReactRootView;
    .locals 1

    .line 51
    new-instance p1, Lcom/facebook/react/ReactRootView;

    invoke-virtual {p0}, Lcom/facebook/react/defaults/DefaultReactActivityDelegate;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/facebook/react/ReactRootView;-><init>(Landroid/content/Context;)V

    iget-boolean v0, p0, Lcom/facebook/react/defaults/DefaultReactActivityDelegate;->fabricEnabled:Z

    invoke-virtual {p1, v0}, Lcom/facebook/react/ReactRootView;->setIsFabric(Z)V

    return-object p1
.end method

.method protected isFabricEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/defaults/DefaultReactActivityDelegate;->fabricEnabled:Z

    return v0
.end method
