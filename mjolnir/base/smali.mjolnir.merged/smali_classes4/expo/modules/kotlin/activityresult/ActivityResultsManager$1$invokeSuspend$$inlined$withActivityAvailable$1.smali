.class public final Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$1;
.super Ljava/lang/Object;
.source "AppCompatActivityAware.kt"

# interfaces
.implements Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAppCompatActivityAware.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AppCompatActivityAware.kt\nexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt$withActivityAvailable$2$listener$1\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 ActivityResultsManager.kt\nexpo/modules/kotlin/activityresult/ActivityResultsManager$1\n*L\n1#1,50:1\n1#2:51\n44#3,2:52\n*E\n"
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

.field final synthetic $this_withActivityAvailable:Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;

.field final synthetic this$0:Lexpo/modules/kotlin/activityresult/ActivityResultsManager;


# direct methods
.method public constructor <init>(Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;Lkotlinx/coroutines/CancellableContinuation;Lexpo/modules/kotlin/activityresult/ActivityResultsManager;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$1;->$this_withActivityAvailable:Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;

    iput-object p2, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$1;->$continuation:Lkotlinx/coroutines/CancellableContinuation;

    iput-object p3, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$1;->this$0:Lexpo/modules/kotlin/activityresult/ActivityResultsManager;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityAvailable(Landroidx/appcompat/app/AppCompatActivity;)V
    .locals 2

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$1;->$this_withActivityAvailable:Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;

    .line 41
    move-object v1, p0

    check-cast v1, Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;

    invoke-interface {v0, v1}, Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;->removeOnActivityAvailableListener(Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;)V

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$1;->$continuation:Lkotlinx/coroutines/CancellableContinuation;

    .line 42
    :try_start_0
    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v1, p0

    check-cast v1, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$1;

    iget-object v1, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$1;->this$0:Lexpo/modules/kotlin/activityresult/ActivityResultsManager;

    .line 52
    invoke-static {v1}, Lexpo/modules/kotlin/activityresult/ActivityResultsManager;->access$getRegistry$p(Lexpo/modules/kotlin/activityresult/ActivityResultsManager;)Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;

    move-result-object v1

    check-cast p1, Landroid/content/Context;

    invoke-virtual {v1, p1}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultRegistry;->restoreInstanceState(Landroid/content/Context;)V

    .line 53
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 42
    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {p1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    :goto_0
    invoke-interface {v0, p1}, Lkotlinx/coroutines/CancellableContinuation;->resumeWith(Ljava/lang/Object;)V

    return-void
.end method
