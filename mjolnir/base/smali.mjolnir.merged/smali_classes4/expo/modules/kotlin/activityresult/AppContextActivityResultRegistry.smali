.class public final Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;
.super Ljava/lang/Object;
.source "AppContextActivityResultRegistry.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;,
        Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$LifecycleContainer;,
        Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAppContextActivityResultRegistry.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AppContextActivityResultRegistry.kt\nexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 AndroidExtensions.kt\nexpo/modules/kotlin/AndroidExtensionsKt\n+ 4 KotlinUtilities.kt\nexpo/modules/core/utilities/KotlinUtilitiesKt\n+ 5 Maps.kt\nkotlin/collections/MapsKt__MapsKt\n+ 6 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,373:1\n1#2:374\n10#3,5:375\n19#3,5:390\n19#3,5:395\n12#4:380\n526#5:381\n511#5,6:382\n1855#6,2:388\n*S KotlinDebug\n*F\n+ 1 AppContextActivityResultRegistry.kt\nexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry\n*L\n121#1:375,5\n285#1:390,5\n192#1:395,5\n172#1:380\n250#1:381\n250#1:382,6\n267#1:388,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u008a\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001:\u000289B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\"\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u00122\u0006\u0010\u001e\u001a\u00020\u00122\u0008\u0010\u001f\u001a\u0004\u0018\u00010 H\u0007JH\u0010!\u001a\u00020\"\"\u0008\u0008\u0000\u0010#*\u00020\u000e\"\u0004\u0008\u0001\u0010$2\u0006\u0010%\u001a\u00020\u000b2\u0006\u0010\u001e\u001a\u00020\u00122\u0008\u0010\u001f\u001a\u0004\u0018\u00010 2\u0014\u0010&\u001a\u0010\u0012\u0004\u0012\u0002H#\u0012\u0004\u0012\u0002H$\u0018\u00010\u000cH\u0002J\u0008\u0010\'\u001a\u00020\u0012H\u0002JC\u0010(\u001a\u00020\"\"\u0008\u0008\u0000\u0010#*\u00020\u000e\"\u0004\u0008\u0001\u0010$2\u0006\u0010\u001d\u001a\u00020\u00122\u0012\u0010)\u001a\u000e\u0012\u0004\u0012\u0002H#\u0012\u0004\u0012\u0002H$0*2\u0008\u0008\u0001\u0010+\u001a\u0002H#H\u0007\u00a2\u0006\u0002\u0010,J\u000e\u0010-\u001a\u00020\"2\u0006\u0010.\u001a\u00020/J\\\u00100\u001a\u000e\u0012\u0004\u0012\u0002H#\u0012\u0004\u0012\u0002H$01\"\u0008\u0008\u0000\u0010#*\u00020\u000e\"\u0004\u0008\u0001\u0010$2\u0006\u0010%\u001a\u00020\u000b2\u0006\u00102\u001a\u0002032\u0012\u0010)\u001a\u000e\u0012\u0004\u0012\u0002H#\u0012\u0004\u0012\u0002H$0*2\u0012\u00104\u001a\u000e\u0012\u0004\u0012\u0002H#\u0012\u0004\u0012\u0002H$05H\u0007J\u000e\u00106\u001a\u00020\"2\u0006\u0010.\u001a\u00020/J\u0010\u00107\u001a\u00020\"2\u0006\u0010%\u001a\u00020\u000bH\u0007R\u0014\u0010\u0005\u001a\u00020\u00068BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0007\u0010\u0008R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\"\u0010\t\u001a\u0016\u0012\u0004\u0012\u00020\u000b\u0012\u000c\u0012\n\u0012\u0002\u0008\u0003\u0012\u0002\u0008\u00030\u000c0\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u000e0\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u00100\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u00120\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001e\u0010\u0013\u001a\u0012\u0012\u0004\u0012\u00020\u000b0\u0014j\u0008\u0012\u0004\u0012\u00020\u000b`\u0015X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0017X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0019X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u001a\u001a\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006:"
    }
    d2 = {
        "Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;",
        "",
        "currentActivityProvider",
        "Lexpo/modules/kotlin/providers/CurrentActivityProvider;",
        "(Lexpo/modules/kotlin/providers/CurrentActivityProvider;)V",
        "activity",
        "Landroidx/appcompat/app/AppCompatActivity;",
        "getActivity",
        "()Landroidx/appcompat/app/AppCompatActivity;",
        "keyToCallbacksAndContract",
        "",
        "",
        "Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;",
        "keyToInputParam",
        "Ljava/io/Serializable;",
        "keyToLifecycleContainers",
        "Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$LifecycleContainer;",
        "keyToRequestCode",
        "",
        "launchedKeys",
        "Ljava/util/ArrayList;",
        "Lkotlin/collections/ArrayList;",
        "pendingResults",
        "Landroid/os/Bundle;",
        "random",
        "Ljava/util/Random;",
        "requestCodeToKey",
        "dispatchResult",
        "",
        "requestCode",
        "resultCode",
        "data",
        "Landroid/content/Intent;",
        "doDispatch",
        "",
        "I",
        "O",
        "key",
        "callbacksAndContract",
        "generateRandomNumber",
        "onLaunch",
        "contract",
        "Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;",
        "input",
        "(ILexpo/modules/kotlin/activityresult/AppContextActivityResultContract;Ljava/io/Serializable;)V",
        "persistInstanceState",
        "context",
        "Landroid/content/Context;",
        "register",
        "Lexpo/modules/kotlin/activityresult/AppContextActivityResultLauncher;",
        "lifecycleOwner",
        "Landroidx/lifecycle/LifecycleOwner;",
        "fallbackCallback",
        "Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;",
        "restoreInstanceState",
        "unregister",
        "CallbacksAndContract",
        "LifecycleContainer",
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
.field private final currentActivityProvider:Lexpo/modules/kotlin/providers/CurrentActivityProvider;

.field private final keyToCallbacksAndContract:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract<",
            "**>;>;"
        }
    .end annotation
.end field

.field private final keyToInputParam:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/io/Serializable;",
            ">;"
        }
    .end annotation
.end field

.field private final keyToLifecycleContainers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$LifecycleContainer;",
            ">;"
        }
    .end annotation
.end field

.field private final keyToRequestCode:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private launchedKeys:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final pendingResults:Landroid/os/Bundle;

.field private random:Ljava/util/Random;

.field private final requestCodeToKey:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$QQngfQ0gkb-ARox2oDDlVGm2SF4(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;ILandroid/content/IntentSender$SendIntentException;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->onLaunch$lambda$1(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;ILandroid/content/IntentSender$SendIntentException;)V

    return-void
.end method

.method public static synthetic $r8$lambda$gFnAFYQBDwbvoCVbuhBd_kklIEI(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;Ljava/lang/String;Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Lifecycle$Event;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->register$lambda$4(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;Ljava/lang/String;Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Lifecycle$Event;)V

    return-void
.end method

.method public constructor <init>(Lexpo/modules/kotlin/providers/CurrentActivityProvider;)V
    .locals 1

    const-string v0, "currentActivityProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->currentActivityProvider:Lexpo/modules/kotlin/providers/CurrentActivityProvider;

    .line 68
    new-instance p1, Ljava/util/Random;

    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->random:Ljava/util/Random;

    .line 70
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    check-cast p1, Ljava/util/Map;

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->requestCodeToKey:Ljava/util/Map;

    .line 71
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    check-cast p1, Ljava/util/Map;

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToRequestCode:Ljava/util/Map;

    .line 72
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    check-cast p1, Ljava/util/Map;

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToLifecycleContainers:Ljava/util/Map;

    .line 73
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->launchedKeys:Ljava/util/ArrayList;

    .line 78
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    check-cast p1, Ljava/util/Map;

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToCallbacksAndContract:Ljava/util/Map;

    .line 85
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    check-cast p1, Ljava/util/Map;

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToInputParam:Ljava/util/Map;

    .line 87
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->pendingResults:Landroid/os/Bundle;

    return-void
.end method

.method public static final synthetic access$getKeyToCallbacksAndContract$p(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;)Ljava/util/Map;
    .locals 0

    .line 65
    iget-object p0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToCallbacksAndContract:Ljava/util/Map;

    return-object p0
.end method

.method public static final synthetic access$getKeyToInputParam$p(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;)Ljava/util/Map;
    .locals 0

    .line 65
    iget-object p0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToInputParam:Ljava/util/Map;

    return-object p0
.end method

.method public static final synthetic access$getKeyToRequestCode$p(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;)Ljava/util/Map;
    .locals 0

    .line 65
    iget-object p0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToRequestCode:Ljava/util/Map;

    return-object p0
.end method

.method public static final synthetic access$getLaunchedKeys$p(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;)Ljava/util/ArrayList;
    .locals 0

    .line 65
    iget-object p0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->launchedKeys:Ljava/util/ArrayList;

    return-object p0
.end method

.method private final doDispatch(Ljava/lang/String;ILandroid/content/Intent;Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<I::",
            "Ljava/io/Serializable;",
            "O:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "I",
            "Landroid/content/Intent;",
            "Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract<",
            "TI;TO;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToLifecycleContainers:Ljava/util/Map;

    .line 319
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$LifecycleContainer;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$LifecycleContainer;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/lifecycle/Lifecycle;->getCurrentState()Landroidx/lifecycle/Lifecycle$State;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    if-eqz p4, :cond_1

    .line 321
    invoke-virtual {p4}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;->getMainCallback()Landroidx/activity/result/ActivityResultCallback;

    move-result-object v1

    :cond_1
    const-string v2, "null cannot be cast to non-null type I of expo.modules.kotlin.activityresult.AppContextActivityResultRegistry.doDispatch"

    if-eqz v1, :cond_2

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->launchedKeys:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToInputParam:Ljava/util/Map;

    .line 324
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/io/Serializable;

    .line 325
    invoke-virtual {p4}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;->getMainCallback()Landroidx/activity/result/ActivityResultCallback;

    move-result-object v1

    invoke-virtual {p4}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;->getContract()Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;

    move-result-object p4

    invoke-interface {p4, v0, p2, p3}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;->parseResult(Ljava/io/Serializable;ILandroid/content/Intent;)Ljava/lang/Object;

    move-result-object p2

    invoke-interface {v1, p2}, Landroidx/activity/result/ActivityResultCallback;->onActivityResult(Ljava/lang/Object;)V

    iget-object p2, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->launchedKeys:Ljava/util/ArrayList;

    .line 326
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    if-eqz v0, :cond_3

    .line 327
    sget-object v1, Landroidx/lifecycle/Lifecycle$State;->STARTED:Landroidx/lifecycle/Lifecycle$State;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/Lifecycle$State;->isAtLeast(Landroidx/lifecycle/Lifecycle$State;)Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz p4, :cond_3

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->launchedKeys:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToInputParam:Ljava/util/Map;

    .line 330
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/io/Serializable;

    .line 331
    invoke-virtual {p4}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;->getFallbackCallback()Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;

    move-result-object v1

    invoke-virtual {p4}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;->getContract()Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;

    move-result-object p4

    invoke-interface {p4, v0, p2, p3}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;->parseResult(Ljava/io/Serializable;ILandroid/content/Intent;)Ljava/lang/Object;

    move-result-object p2

    invoke-interface {v1, v0, p2}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;->onActivityResult(Ljava/io/Serializable;Ljava/lang/Object;)V

    iget-object p2, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->launchedKeys:Ljava/util/ArrayList;

    .line 332
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    iget-object p4, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->pendingResults:Landroid/os/Bundle;

    .line 335
    new-instance v0, Landroidx/activity/result/ActivityResult;

    invoke-direct {v0, p2, p3}, Landroidx/activity/result/ActivityResult;-><init>(ILandroid/content/Intent;)V

    check-cast v0, Landroid/os/Parcelable;

    invoke-virtual {p4, p1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :goto_1
    return-void
.end method

.method private final generateRandomNumber()I
    .locals 5

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->random:Ljava/util/Random;

    const/high16 v1, 0x7fff0000

    .line 340
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    const/high16 v2, 0x10000

    :goto_0
    add-int/2addr v0, v2

    iget-object v3, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->requestCodeToKey:Ljava/util/Map;

    .line 341
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->random:Ljava/util/Random;

    .line 342
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    goto :goto_0

    :cond_0
    return v0
.end method

.method private final getActivity()Landroidx/appcompat/app/AppCompatActivity;
    .locals 2

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->currentActivityProvider:Lexpo/modules/kotlin/providers/CurrentActivityProvider;

    .line 90
    invoke-interface {v0}, Lexpo/modules/kotlin/providers/CurrentActivityProvider;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v1, v0, Landroidx/appcompat/app/AppCompatActivity;

    if-eqz v1, :cond_0

    check-cast v0, Landroidx/appcompat/app/AppCompatActivity;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Current Activity is not available at the moment"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static final onLaunch$lambda$1(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;ILandroid/content/IntentSender$SendIntentException;)V
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$e"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 139
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "androidx.activity.result.contract.action.INTENT_SENDER_REQUEST"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "androidx.activity.result.contract.extra.SEND_INTENT_EXCEPTION"

    .line 140
    check-cast p2, Ljava/io/Serializable;

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    move-result-object p2

    const/4 v0, 0x0

    .line 136
    invoke-virtual {p0, p1, v0, p2}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->dispatchResult(IILandroid/content/Intent;)Z

    return-void
.end method

.method private static final register$lambda$4(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;Ljava/lang/String;Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Lifecycle$Event;)V
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "<anonymous parameter 0>"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p2, "event"

    invoke-static {p3, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 179
    sget-object p2, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p3}, Landroidx/lifecycle/Lifecycle$Event;->ordinal()I

    move-result p3

    aget p2, p2, p3

    const/4 p3, 0x1

    if-eq p2, p3, :cond_1

    const/4 p3, 0x2

    if-eq p2, p3, :cond_0

    goto :goto_1

    .line 211
    :cond_0
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->unregister(Ljava/lang/String;)V

    goto :goto_1

    .line 187
    :cond_1
    iget-object p2, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToCallbacksAndContract:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;

    if-nez p2, :cond_2

    return-void

    .line 192
    :cond_2
    iget-object p3, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->pendingResults:Landroid/os/Bundle;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_3

    .line 396
    const-class v0, Landroidx/activity/result/ActivityResult;

    invoke-static {p3, p1, v0}, Lcom/horcrux/svg/TSpanView$$ExternalSyntheticApiModelOutline0;->m(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/os/Parcelable;

    goto :goto_0

    .line 399
    :cond_3
    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p3

    .line 192
    :goto_0
    check-cast p3, Landroidx/activity/result/ActivityResult;

    if-eqz p3, :cond_5

    .line 194
    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->pendingResults:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 197
    iget-object p0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToInputParam:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    const-string p1, "null cannot be cast to non-null type I of expo.modules.kotlin.activityresult.AppContextActivityResultRegistry.register$lambda$4$lambda$3"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p0, Ljava/io/Serializable;

    .line 198
    invoke-virtual {p2}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;->getContract()Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;

    move-result-object p1

    invoke-virtual {p3}, Landroidx/activity/result/ActivityResult;->getResultCode()I

    move-result v0

    invoke-virtual {p3}, Landroidx/activity/result/ActivityResult;->getData()Landroid/content/Intent;

    move-result-object p3

    invoke-interface {p1, p0, v0, p3}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;->parseResult(Ljava/io/Serializable;ILandroid/content/Intent;)Ljava/lang/Object;

    move-result-object p1

    .line 200
    invoke-virtual {p2}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;->getMainCallback()Landroidx/activity/result/ActivityResultCallback;

    move-result-object p3

    if-eqz p3, :cond_4

    .line 202
    invoke-virtual {p2}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;->getMainCallback()Landroidx/activity/result/ActivityResultCallback;

    move-result-object p0

    invoke-interface {p0, p1}, Landroidx/activity/result/ActivityResultCallback;->onActivityResult(Ljava/lang/Object;)V

    goto :goto_1

    .line 205
    :cond_4
    invoke-virtual {p2}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;->getFallbackCallback()Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;

    move-result-object p2

    invoke-interface {p2, p0, p1}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;->onActivityResult(Ljava/io/Serializable;Ljava/lang/Object;)V

    :cond_5
    :goto_1
    return-void
.end method


# virtual methods
.method public final dispatchResult(IILandroid/content/Intent;)Z
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->requestCodeToKey:Ljava/util/Map;

    .line 301
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToCallbacksAndContract:Ljava/util/Map;

    .line 302
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;

    .line 303
    invoke-direct {p0, p1, p2, p3, v0}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->doDispatch(Ljava/lang/String;ILandroid/content/Intent;Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;)V

    const/4 p1, 0x1

    return p1
.end method

.method public final onLaunch(ILexpo/modules/kotlin/activityresult/AppContextActivityResultContract;Ljava/io/Serializable;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<I::",
            "Ljava/io/Serializable;",
            "O:",
            "Ljava/lang/Object;",
            ">(I",
            "Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract<",
            "TI;TO;>;TI;)V"
        }
    .end annotation

    const-string v0, "contract"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "input"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 104
    invoke-direct {p0}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-interface {p2, v0, p3}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;->createIntent(Landroid/content/Context;Ljava/io/Serializable;)Landroid/content/Intent;

    move-result-object p2

    const-string p3, "androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE"

    .line 107
    invoke-virtual {p2, p3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    invoke-virtual {p2, p3}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 109
    invoke-virtual {p2, p3}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move-object v8, v0

    .line 111
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p3

    if-eqz p3, :cond_7

    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, -0x6d7fa55f

    if-eq v0, v1, :cond_4

    const v1, -0x233c44cb

    if-eq v0, v1, :cond_1

    goto/16 :goto_2

    :cond_1
    const-string v0, "androidx.activity.result.contract.action.INTENT_SENDER_REQUEST"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_2

    goto :goto_2

    :cond_2
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x21

    const-string v1, "androidx.activity.result.contract.extra.INTENT_SENDER_REQUEST"

    if-lt p3, v0, :cond_3

    .line 376
    const-class p3, Landroidx/activity/result/IntentSenderRequest;

    invoke-static {p2, v1, p3}, Lcom/horcrux/svg/TSpanView$$ExternalSyntheticApiModelOutline0;->m(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/os/Parcelable;

    goto :goto_1

    .line 379
    :cond_3
    invoke-virtual {p2, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    .line 121
    :goto_1
    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast p2, Landroidx/activity/result/IntentSenderRequest;

    .line 125
    :try_start_0
    invoke-direct {p0}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object p3

    move-object v1, p3

    check-cast v1, Landroid/app/Activity;

    .line 126
    invoke-virtual {p2}, Landroidx/activity/result/IntentSenderRequest;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v2

    .line 128
    invoke-virtual {p2}, Landroidx/activity/result/IntentSenderRequest;->getFillInIntent()Landroid/content/Intent;

    move-result-object v4

    .line 129
    invoke-virtual {p2}, Landroidx/activity/result/IntentSenderRequest;->getFlagsMask()I

    move-result v5

    .line 130
    invoke-virtual {p2}, Landroidx/activity/result/IntentSenderRequest;->getFlagsValues()I

    move-result v6

    const/4 v7, 0x0

    move v3, p1

    .line 124
    invoke-static/range {v1 .. v8}, Landroidx/core/app/ActivityCompat;->startIntentSenderForResult(Landroid/app/Activity;Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception p2

    .line 135
    new-instance p3, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p3, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1, p2}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$$ExternalSyntheticLambda1;-><init>(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;ILandroid/content/IntentSender$SendIntentException;)V

    invoke-virtual {p3, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_3

    :cond_4
    const-string v0, "androidx.activity.result.contract.action.REQUEST_PERMISSIONS"

    .line 111
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_5

    goto :goto_2

    :cond_5
    const-string p3, "androidx.activity.result.contract.extra.PERMISSIONS"

    .line 115
    invoke-virtual {p2, p3}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_6

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/String;

    .line 117
    :cond_6
    invoke-direct {p0}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object p3

    check-cast p3, Landroid/app/Activity;

    invoke-static {p3, p2, p1}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    goto :goto_3

    .line 148
    :cond_7
    :goto_2
    invoke-direct {p0}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object p3

    check-cast p3, Landroid/app/Activity;

    invoke-static {p3, p2, p1, v8}, Landroidx/core/app/ActivityCompat;->startActivityForResult(Landroid/app/Activity;Landroid/content/Intent;ILandroid/os/Bundle;)V

    :goto_3
    return-void
.end method

.method public final persistInstanceState(Landroid/content/Context;)V
    .locals 5

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 247
    new-instance v0, Lexpo/modules/kotlin/activityresult/DataPersistor;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/activityresult/DataPersistor;-><init>(Landroid/content/Context;)V

    const-string p1, "launchedKeys"

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->launchedKeys:Ljava/util/ArrayList;

    .line 248
    invoke-virtual {v0, p1, v1}, Lexpo/modules/kotlin/activityresult/DataPersistor;->addStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)Lexpo/modules/kotlin/activityresult/DataPersistor;

    move-result-object p1

    const-string v0, "keyToRequestCode"

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToRequestCode:Ljava/util/Map;

    .line 249
    invoke-virtual {p1, v0, v1}, Lexpo/modules/kotlin/activityresult/DataPersistor;->addStringToIntMap(Ljava/lang/String;Ljava/util/Map;)Lexpo/modules/kotlin/activityresult/DataPersistor;

    move-result-object p1

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToInputParam:Ljava/util/Map;

    .line 381
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v1, Ljava/util/Map;

    .line 382
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 250
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iget-object v4, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->launchedKeys:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 384
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    const-string v0, "keyToParamsForFallbackCallback"

    .line 250
    invoke-virtual {p1, v0, v1}, Lexpo/modules/kotlin/activityresult/DataPersistor;->addStringToSerializableMap(Ljava/lang/String;Ljava/util/Map;)Lexpo/modules/kotlin/activityresult/DataPersistor;

    move-result-object p1

    const-string v0, "pendingResult"

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->pendingResults:Landroid/os/Bundle;

    .line 251
    invoke-virtual {p1, v0, v1}, Lexpo/modules/kotlin/activityresult/DataPersistor;->addBundle(Ljava/lang/String;Landroid/os/Bundle;)Lexpo/modules/kotlin/activityresult/DataPersistor;

    move-result-object p1

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->random:Ljava/util/Random;

    .line 252
    check-cast v0, Ljava/io/Serializable;

    const-string v1, "random"

    invoke-virtual {p1, v1, v0}, Lexpo/modules/kotlin/activityresult/DataPersistor;->addSerializable(Ljava/lang/String;Ljava/io/Serializable;)Lexpo/modules/kotlin/activityresult/DataPersistor;

    move-result-object p1

    .line 253
    invoke-virtual {p1}, Lexpo/modules/kotlin/activityresult/DataPersistor;->persist()V

    return-void
.end method

.method public final register(Ljava/lang/String;Landroidx/lifecycle/LifecycleOwner;Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;)Lexpo/modules/kotlin/activityresult/AppContextActivityResultLauncher;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<I::",
            "Ljava/io/Serializable;",
            "O:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Landroidx/lifecycle/LifecycleOwner;",
            "Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract<",
            "TI;TO;>;",
            "Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback<",
            "TI;TO;>;)",
            "Lexpo/modules/kotlin/activityresult/AppContextActivityResultLauncher<",
            "TI;TO;>;"
        }
    .end annotation

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "lifecycleOwner"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "contract"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "fallbackCallback"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 169
    invoke-interface {p2}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object p2

    const-string v0, "getLifecycle(...)"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToCallbacksAndContract:Ljava/util/Map;

    .line 171
    new-instance v1, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;

    const/4 v2, 0x0

    invoke-direct {v1, p4, v2, p3}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;-><init>(Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;Landroidx/activity/result/ActivityResultCallback;Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToRequestCode:Ljava/util/Map;

    .line 172
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 173
    invoke-direct {p0}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->generateRandomNumber()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->requestCodeToKey:Ljava/util/Map;

    .line 174
    invoke-interface {v2, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToRequestCode:Ljava/util/Map;

    .line 175
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 178
    :cond_0
    new-instance v0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$$ExternalSyntheticLambda0;-><init>(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;Ljava/lang/String;)V

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToLifecycleContainers:Ljava/util/Map;

    .line 218
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$LifecycleContainer;

    if-nez v1, :cond_1

    new-instance v1, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$LifecycleContainer;

    invoke-direct {v1, p2}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$LifecycleContainer;-><init>(Landroidx/lifecycle/Lifecycle;)V

    .line 219
    :cond_1
    invoke-virtual {v1, v0}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$LifecycleContainer;->addObserver(Landroidx/lifecycle/LifecycleEventObserver;)V

    iget-object p2, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToLifecycleContainers:Ljava/util/Map;

    .line 220
    invoke-interface {p2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    new-instance p2, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;

    invoke-direct {p2, p3, p0, p1, p4}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;-><init>(Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;Ljava/lang/String;Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;)V

    check-cast p2, Lexpo/modules/kotlin/activityresult/AppContextActivityResultLauncher;

    return-object p2
.end method

.method public final restoreInstanceState(Landroid/content/Context;)V
    .locals 4

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 260
    new-instance v0, Lexpo/modules/kotlin/activityresult/DataPersistor;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/activityresult/DataPersistor;-><init>(Landroid/content/Context;)V

    const-string p1, "launchedKeys"

    .line 262
    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/activityresult/DataPersistor;->retrieveStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    if-eqz p1, :cond_0

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->launchedKeys:Ljava/util/ArrayList;

    :cond_0
    const-string p1, "keyToParamsForFallbackCallback"

    .line 263
    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/activityresult/DataPersistor;->retrieveStringToSerializableMap(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToInputParam:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_1
    const-string p1, "pendingResult"

    .line 264
    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/activityresult/DataPersistor;->retrieveBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->pendingResults:Landroid/os/Bundle;

    invoke-virtual {v1, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    :cond_2
    const-string p1, "random"

    .line 265
    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/activityresult/DataPersistor;->retrieveSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    if-eqz p1, :cond_3

    check-cast p1, Ljava/util/Random;

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->random:Ljava/util/Random;

    :cond_3
    const-string p1, "keyToRequestCode"

    .line 266
    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/activityresult/DataPersistor;->retrieveStringToIntMap(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    if-eqz p1, :cond_4

    .line 267
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    .line 388
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 267
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v3, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToRequestCode:Ljava/util/Map;

    .line 268
    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v2, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->requestCodeToKey:Ljava/util/Map;

    .line 269
    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_4
    return-void
.end method

.method public final unregister(Ljava/lang/String;)V
    .locals 3

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->launchedKeys:Ljava/util/ArrayList;

    .line 279
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToRequestCode:Ljava/util/Map;

    .line 281
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->requestCodeToKey:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToCallbacksAndContract:Ljava/util/Map;

    .line 283
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->pendingResults:Landroid/os/Bundle;

    .line 284
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->pendingResults:Landroid/os/Bundle;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_1

    .line 391
    const-class v1, Landroidx/activity/result/ActivityResult;

    invoke-static {v0, p1, v1}, Lcom/horcrux/svg/TSpanView$$ExternalSyntheticApiModelOutline0;->m(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Parcelable;

    goto :goto_0

    .line 394
    :cond_1
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    .line 390
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Dropping pending result for request "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ActivityResultRegistry"

    .line 285
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->pendingResults:Landroid/os/Bundle;

    .line 286
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_2
    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToLifecycleContainers:Ljava/util/Map;

    .line 288
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$LifecycleContainer;

    if-eqz v0, :cond_3

    .line 289
    invoke-virtual {v0}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$LifecycleContainer;->clearObservers()V

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->keyToLifecycleContainers:Ljava/util/Map;

    .line 290
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$LifecycleContainer;

    :cond_3
    return-void
.end method
