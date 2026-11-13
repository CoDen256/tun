.class public final Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$AsyncFunction$1;
.super Lkotlin/jvm/internal/Lambda;
.source "ObjectDefinitionBuilder.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/defaultmodules/CoreModule;->definition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function2<",
        "[",
        "Ljava/lang/Object;",
        "Lexpo/modules/kotlin/Promise;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nObjectDefinitionBuilder.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$5\n+ 2 CoreModule.kt\nexpo/modules/kotlin/defaultmodules/CoreModule\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,505:1\n59#2,6:506\n65#2,25:513\n1#3:512\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0010\u0000\u001a\u00020\u0001\"\u0006\u0008\u0000\u0010\u0002\u0018\u0001\"\u0006\u0008\u0001\u0010\u0003\u0018\u00012\u0010\u0010\u0004\u001a\u000c\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\u00060\u00052\u0006\u0010\u0007\u001a\u00020\u0008H\n\u00a2\u0006\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "<anonymous>",
        "",
        "R",
        "P0",
        "<anonymous parameter 0>",
        "",
        "",
        "promise",
        "Lexpo/modules/kotlin/Promise;",
        "invoke",
        "([Ljava/lang/Object;Lexpo/modules/kotlin/Promise;)V",
        "expo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$5"
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
.field final synthetic this$0:Lexpo/modules/kotlin/defaultmodules/CoreModule;


# direct methods
.method public constructor <init>(Lexpo/modules/kotlin/defaultmodules/CoreModule;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$AsyncFunction$1;->this$0:Lexpo/modules/kotlin/defaultmodules/CoreModule;

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 223
    check-cast p1, [Ljava/lang/Object;

    check-cast p2, Lexpo/modules/kotlin/Promise;

    invoke-virtual {p0, p1, p2}, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$AsyncFunction$1;->invoke([Ljava/lang/Object;Lexpo/modules/kotlin/Promise;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method public final invoke([Ljava/lang/Object;Lexpo/modules/kotlin/Promise;)V
    .locals 6

    const-string v0, "forName(...)"

    const-string v1, "<anonymous parameter 0>"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "promise"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 217
    check-cast p2, Ljava/lang/String;

    iget-object p1, p0, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$AsyncFunction$1;->this$0:Lexpo/modules/kotlin/defaultmodules/CoreModule;

    .line 506
    invoke-virtual {p1}, Lexpo/modules/kotlin/defaultmodules/CoreModule;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object p1

    invoke-virtual {p1}, Lexpo/modules/kotlin/AppContext;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p1

    instance-of p2, p1, Lcom/facebook/react/ReactActivity;

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    check-cast p1, Lcom/facebook/react/ReactActivity;

    goto :goto_0

    :cond_0
    move-object p1, v1

    :goto_0
    if-nez p1, :cond_1

    goto :goto_2

    :cond_1
    const-class p2, Lcom/facebook/react/ReactActivity;

    const-string v2, "mDelegate"

    .line 510
    invoke-virtual {p2, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p2

    const/4 v2, 0x1

    .line 511
    invoke-virtual {p2, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 513
    invoke-virtual {p2, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 514
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    const-string v3, "getReactDelegate"

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Class;

    invoke-virtual {p2, v3, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p2

    .line 515
    invoke-virtual {p2, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v2, v4, [Ljava/lang/Object;

    .line 516
    invoke-virtual {p2, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    instance-of p2, p1, Lcom/facebook/react/ReactDelegate;

    if-eqz p2, :cond_2

    move-object v1, p1

    check-cast v1, Lcom/facebook/react/ReactDelegate;

    :cond_2
    if-nez v1, :cond_3

    goto :goto_2

    .line 518
    :cond_3
    sget-boolean p1, Lcom/facebook/react/config/ReactFeatureFlags;->enableBridgelessArchitecture:Z

    if-nez p1, :cond_4

    .line 519
    invoke-virtual {v1}, Lcom/facebook/react/ReactDelegate;->getReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;

    move-result-object p1

    :try_start_0
    const-string p2, "com.facebook.react.devsupport.ReleaseDevSupportManager"

    .line 524
    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p2

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const-string p2, "com.facebook.react.devsupport.DisabledDevSupportManager"

    .line 526
    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p2

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 528
    :goto_1
    invoke-virtual {p1}, Lcom/facebook/react/ReactInstanceManager;->getDevSupportManager()Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 529
    new-instance p2, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$1$4$1;

    invoke-direct {p2, p1}, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$1$4$1;-><init>(Lcom/facebook/react/ReactInstanceManager;)V

    check-cast p2, Ljava/lang/Runnable;

    invoke-static {p2}, Lcom/facebook/react/bridge/UiThreadUtil;->runOnUiThread(Ljava/lang/Runnable;)Z

    goto :goto_2

    .line 536
    :cond_4
    invoke-virtual {v1}, Lcom/facebook/react/ReactDelegate;->reload()V

    :goto_2
    return-void
.end method
