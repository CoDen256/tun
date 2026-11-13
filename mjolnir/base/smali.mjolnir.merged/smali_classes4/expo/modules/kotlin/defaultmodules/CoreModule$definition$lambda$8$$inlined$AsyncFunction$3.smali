.class public final Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$AsyncFunction$3;
.super Lkotlin/jvm/internal/Lambda;
.source "ObjectDefinitionBuilder.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


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
        "Lkotlin/jvm/functions/Function1<",
        "[",
        "Ljava/lang/Object;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nObjectDefinitionBuilder.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$6\n+ 2 EnforceType.kt\nexpo/modules/kotlin/types/EnforceTypeKt\n+ 3 CoreModule.kt\nexpo/modules/kotlin/defaultmodules/CoreModule\n+ 4 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,505:1\n8#2,4:506\n59#3,6:510\n65#3,25:517\n1#4:516\n*S KotlinDebug\n*F\n+ 1 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$6\n*L\n220#1:506,4\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0008\u0004\n\u0002\u0010\u0011\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0010\u0000\u001a\u0002H\u0001\"\u0006\u0008\u0000\u0010\u0001\u0018\u0001\"\u0006\u0008\u0001\u0010\u0002\u0018\u00012\u0010\u0010\u0003\u001a\u000c\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\u00050\u0004H\n\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "<anonymous>",
        "R",
        "P0",
        "<name for destructuring parameter 0>",
        "",
        "",
        "invoke",
        "([Ljava/lang/Object;)Ljava/lang/Object;",
        "expo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$6"
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

    iput-object p1, p0, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$AsyncFunction$3;->this$0:Lexpo/modules/kotlin/defaultmodules/CoreModule;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 219
    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$AsyncFunction$3;->invoke([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invoke([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Lkotlin/Unit;"
        }
    .end annotation

    const-string v0, "forName(...)"

    const-string v1, "<name for destructuring parameter 0>"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 219
    aget-object p1, p1, v1

    .line 221
    check-cast p1, Ljava/lang/String;

    iget-object p1, p0, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$lambda$8$$inlined$AsyncFunction$3;->this$0:Lexpo/modules/kotlin/defaultmodules/CoreModule;

    .line 510
    invoke-virtual {p1}, Lexpo/modules/kotlin/defaultmodules/CoreModule;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object p1

    invoke-virtual {p1}, Lexpo/modules/kotlin/AppContext;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p1

    instance-of v2, p1, Lcom/facebook/react/ReactActivity;

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    check-cast p1, Lcom/facebook/react/ReactActivity;

    goto :goto_0

    :cond_0
    move-object p1, v3

    :goto_0
    if-nez p1, :cond_1

    goto :goto_2

    :cond_1
    const-class v2, Lcom/facebook/react/ReactActivity;

    const-string v4, "mDelegate"

    .line 514
    invoke-virtual {v2, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v4, 0x1

    .line 515
    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 517
    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 518
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v5, "getReactDelegate"

    new-array v6, v1, [Ljava/lang/Class;

    invoke-virtual {v2, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 519
    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v1, v1, [Ljava/lang/Object;

    .line 520
    invoke-virtual {v2, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    instance-of v1, p1, Lcom/facebook/react/ReactDelegate;

    if-eqz v1, :cond_2

    move-object v3, p1

    check-cast v3, Lcom/facebook/react/ReactDelegate;

    :cond_2
    if-nez v3, :cond_3

    goto :goto_2

    .line 522
    :cond_3
    sget-boolean p1, Lcom/facebook/react/config/ReactFeatureFlags;->enableBridgelessArchitecture:Z

    if-nez p1, :cond_4

    .line 523
    invoke-virtual {v3}, Lcom/facebook/react/ReactDelegate;->getReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;

    move-result-object p1

    :try_start_0
    const-string v1, "com.facebook.react.devsupport.ReleaseDevSupportManager"

    .line 528
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const-string v1, "com.facebook.react.devsupport.DisabledDevSupportManager"

    .line 530
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 532
    :goto_1
    invoke-virtual {p1}, Lcom/facebook/react/ReactInstanceManager;->getDevSupportManager()Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 533
    new-instance v0, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$1$4$1;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/defaultmodules/CoreModule$definition$1$4$1;-><init>(Lcom/facebook/react/ReactInstanceManager;)V

    check-cast v0, Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/facebook/react/bridge/UiThreadUtil;->runOnUiThread(Ljava/lang/Runnable;)Z

    goto :goto_2

    .line 540
    :cond_4
    invoke-virtual {v3}, Lcom/facebook/react/ReactDelegate;->reload()V

    .line 541
    :goto_2
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method
