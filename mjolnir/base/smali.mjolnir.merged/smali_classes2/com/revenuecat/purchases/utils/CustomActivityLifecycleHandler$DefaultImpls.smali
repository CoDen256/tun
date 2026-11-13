.class public final Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler$DefaultImpls;
.super Ljava/lang/Object;
.source "CustomActivityLifecycleHandler.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DefaultImpls"
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static onActivityCreated(Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler;Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    invoke-static {p0, p1, p2}, Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler$-CC;->access$onActivityCreated$jd(Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler;Landroid/app/Activity;Landroid/os/Bundle;)V

    return-void
.end method

.method public static onActivityDestroyed(Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler;Landroid/app/Activity;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler$-CC;->access$onActivityDestroyed$jd(Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler;Landroid/app/Activity;)V

    return-void
.end method

.method public static onActivityPaused(Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler;Landroid/app/Activity;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler$-CC;->access$onActivityPaused$jd(Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler;Landroid/app/Activity;)V

    return-void
.end method

.method public static onActivityResumed(Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler;Landroid/app/Activity;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler$-CC;->access$onActivityResumed$jd(Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler;Landroid/app/Activity;)V

    return-void
.end method

.method public static onActivitySaveInstanceState(Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler;Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "outState"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    invoke-static {p0, p1, p2}, Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler$-CC;->access$onActivitySaveInstanceState$jd(Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler;Landroid/app/Activity;Landroid/os/Bundle;)V

    return-void
.end method

.method public static onActivityStarted(Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler;Landroid/app/Activity;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler$-CC;->access$onActivityStarted$jd(Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler;Landroid/app/Activity;)V

    return-void
.end method

.method public static onActivityStopped(Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler;Landroid/app/Activity;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    invoke-static {p0, p1}, Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler$-CC;->access$onActivityStopped$jd(Lcom/revenuecat/purchases/utils/CustomActivityLifecycleHandler;Landroid/app/Activity;)V

    return-void
.end method
