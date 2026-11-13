.class public final Lexpo/modules/kotlin/activityresult/ActivityResultsManager$registerForActivityResult$$inlined$withActivityAvailable$1;
.super Ljava/lang/Object;
.source "AppCompatActivityAware.kt"

# interfaces
.implements Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/activityresult/ActivityResultsManager;->registerForActivityResult(Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAppCompatActivityAware.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AppCompatActivityAware.kt\nexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt$withActivityAvailable$2$listener$1\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 ActivityResultsManager.kt\nexpo/modules/kotlin/activityresult/ActivityResultsManager\n*L\n1#1,50:1\n1#2:51\n77#3,5:52\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016\u00a8\u0006\u0006\u00b8\u0006\u0000"
    }
    d2 = {
        "expo/modules/kotlin/activityaware/AppCompatActivityAwareKt$withActivityAvailable$2$listener$1",
        "Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;",
        "onActivityAvailable",
        "",
        "activity",
        "Landroidx/appcompat/app/AppCompatActivity;",
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
.field final synthetic $continuation:Lkotlinx/coroutines/CancellableContinuation;

.field final synthetic $contract$inlined:Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;

.field final synthetic $fallbackCallback$inlined:Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;

.field final synthetic $this_withActivityAvailable:Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;

.field final synthetic this$0:Lexpo/modules/kotlin/activityresult/ActivityResultsManager;


# direct methods
.method public constructor <init>(Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;Lkotlinx/coroutines/CancellableContinuation;Lexpo/modules/kotlin/activityresult/ActivityResultsManager;Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$registerForActivityResult$$inlined$withActivityAvailable$1;->$this_withActivityAvailable:Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;

    iput-object p2, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$registerForActivityResult$$inlined$withActivityAvailable$1;->$continuation:Lkotlinx/coroutines/CancellableContinuation;

    iput-object p3, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$registerForActivityResult$$inlined$withActivityAvailable$1;->this$0:Lexpo/modules/kotlin/activityresult/ActivityResultsManager;

    iput-object p4, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$registerForActivityResult$$inlined$withActivityAvailable$1;->$contract$inlined:Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;

    iput-object p5, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$registerForActivityResult$$inlined$withActivityAvailable$1;->$fallbackCallback$inlined:Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityAvailable(Landroidx/appcompat/app/AppCompatActivity;)V
    .locals 5

    const-string v0, "AppContext_rq#"

    const-string v1, "activity"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$registerForActivityResult$$inlined$withActivityAvailable$1;->$this_withActivityAvailable:Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;

    .line 41
    move-object v2, p0

    check-cast v2, Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;

    invoke-interface {v1, v2}, Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;->removeOnActivityAvailableListener(Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;)V

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$registerForActivityResult$$inlined$withActivityAvailable$1;->$continuation:Lkotlinx/coroutines/CancellableContinuation;

    .line 42
    :try_start_0
    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v2, p0

    check-cast v2, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$registerForActivityResult$$inlined$withActivityAvailable$1;

    iget-object v2, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$registerForActivityResult$$inlined$withActivityAvailable$1;->this$0:Lexpo/modules/kotlin/activityresult/ActivityResultsManager;

    .line 52
    invoke-static {v2}, Lexpo/modules/kotlin/activityresult/ActivityResultsManager;->access$getRegistry$p(Lexpo/modules/kotlin/activityresult/ActivityResultsManager;)Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;

    move-result-object v2

    iget-object v3, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$registerForActivityResult$$inlined$withActivityAvailable$1;->this$0:Lexpo/modules/kotlin/activityresult/ActivityResultsManager;

    .line 53
    invoke-static {v3}, Lexpo/modules/kotlin/activityresult/ActivityResultsManager;->access$getNextLocalRequestCode$p(Lexpo/modules/kotlin/activityresult/ActivityResultsManager;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 54
    check-cast p1, Landroidx/lifecycle/LifecycleOwner;

    iget-object v3, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$registerForActivityResult$$inlined$withActivityAvailable$1;->$contract$inlined:Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;

    iget-object v4, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$registerForActivityResult$$inlined$withActivityAvailable$1;->$fallbackCallback$inlined:Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;

    .line 52
    invoke-virtual {v2, v0, p1, v3, v4}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->register(Ljava/lang/String;Landroidx/lifecycle/LifecycleOwner;Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;)Lexpo/modules/kotlin/activityresult/AppContextActivityResultLauncher;

    move-result-object p1

    .line 42
    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {p1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    :goto_0
    invoke-interface {v1, p1}, Lkotlinx/coroutines/CancellableContinuation;->resumeWith(Ljava/lang/Object;)V

    return-void
.end method
