.class public final Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;
.super Lexpo/modules/kotlin/activityresult/AppContextActivityResultLauncher;
.source "AppContextActivityResultRegistry.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->register(Ljava/lang/String;Landroidx/lifecycle/LifecycleOwner;Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;)Lexpo/modules/kotlin/activityresult/AppContextActivityResultLauncher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lexpo/modules/kotlin/activityresult/AppContextActivityResultLauncher<",
        "TI;TO;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0001J#\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00028\u00002\u000c\u0010\t\u001a\u0008\u0012\u0004\u0012\u00028\u00010\nH\u0016\u00a2\u0006\u0002\u0010\u000bR \u0010\u0002\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\u0005\u00a8\u0006\u000c"
    }
    d2 = {
        "expo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2",
        "Lexpo/modules/kotlin/activityresult/AppContextActivityResultLauncher;",
        "contract",
        "Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;",
        "getContract",
        "()Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;",
        "launch",
        "",
        "input",
        "callback",
        "Landroidx/activity/result/ActivityResultCallback;",
        "(Ljava/io/Serializable;Landroidx/activity/result/ActivityResultCallback;)V",
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
.field final synthetic $contract:Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract<",
            "TI;TO;>;"
        }
    .end annotation
.end field

.field final synthetic $fallbackCallback:Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback<",
            "TI;TO;>;"
        }
    .end annotation
.end field

.field final synthetic $key:Ljava/lang/String;

.field private final contract:Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract<",
            "TI;TO;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;


# direct methods
.method constructor <init>(Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;Ljava/lang/String;Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract<",
            "TI;TO;>;",
            "Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback<",
            "TI;TO;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->$contract:Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;

    iput-object p2, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->this$0:Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;

    iput-object p3, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->$key:Ljava/lang/String;

    iput-object p4, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->$fallbackCallback:Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;

    .line 222
    invoke-direct {p0}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultLauncher;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->contract:Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;

    return-void
.end method


# virtual methods
.method public getContract()Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract<",
            "TI;TO;>;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->contract:Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;

    return-object v0
.end method

.method public launch(Ljava/io/Serializable;Landroidx/activity/result/ActivityResultCallback;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TI;",
            "Landroidx/activity/result/ActivityResultCallback<",
            "TO;>;)V"
        }
    .end annotation

    const-string v0, "input"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->this$0:Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;

    .line 224
    invoke-static {v0}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->access$getKeyToRequestCode$p(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->$key:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->this$0:Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;

    .line 227
    invoke-static {v1}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->access$getKeyToCallbacksAndContract$p(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;)Ljava/util/Map;

    move-result-object v1

    iget-object v2, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->$key:Ljava/lang/String;

    new-instance v3, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;

    iget-object v4, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->$fallbackCallback:Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;

    iget-object v5, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->$contract:Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;

    invoke-direct {v3, v4, p2, v5}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$CallbacksAndContract;-><init>(Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;Landroidx/activity/result/ActivityResultCallback;Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;)V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->this$0:Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;

    .line 228
    invoke-static {p2}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->access$getKeyToInputParam$p(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;)Ljava/util/Map;

    move-result-object p2

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->$key:Ljava/lang/String;

    invoke-interface {p2, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->this$0:Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;

    .line 229
    invoke-static {p2}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->access$getLaunchedKeys$p(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;)Ljava/util/ArrayList;

    move-result-object p2

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->$key:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :try_start_0
    iget-object p2, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->this$0:Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->$contract:Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;

    .line 232
    invoke-virtual {p2, v0, v1, p1}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->onLaunch(ILexpo/modules/kotlin/activityresult/AppContextActivityResultContract;Ljava/io/Serializable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    iget-object p2, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->this$0:Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;

    .line 234
    invoke-static {p2}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->access$getLaunchedKeys$p(Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;)Ljava/util/ArrayList;

    move-result-object p2

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->$key:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 235
    throw p1

    .line 225
    :cond_0
    new-instance p2, Ljava/lang/IllegalStateException;

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry$register$2;->$contract:Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Attempting to launch an unregistered ActivityResultLauncher with contract "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " and input "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ". You must ensure the ActivityResultLauncher is registered before calling launch()"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
.end method
