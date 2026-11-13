.class public final Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper;
.super Ljava/lang/Object;
.source "AppCompatActivityAwareHelper.kt"

# interfaces
.implements Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0010\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u0008H\u0016J\u000e\u0010\u000e\u001a\u00020\u000c2\u0006\u0010\u000f\u001a\u00020\u0005J\u0010\u0010\u0010\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u0008H\u0016R\u0014\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0017\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\n\u00a8\u0006\u0011"
    }
    d2 = {
        "Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper;",
        "Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;",
        "()V",
        "activityReference",
        "Ljava/lang/ref/WeakReference;",
        "Landroidx/appcompat/app/AppCompatActivity;",
        "listeners",
        "Ljava/util/concurrent/CopyOnWriteArrayList;",
        "Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;",
        "getListeners",
        "()Ljava/util/concurrent/CopyOnWriteArrayList;",
        "addOnActivityAvailableListener",
        "",
        "listener",
        "dispatchOnActivityAvailable",
        "activity",
        "removeOnActivityAvailableListener",
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
.field private activityReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroidx/appcompat/app/AppCompatActivity;",
            ">;"
        }
    .end annotation
.end field

.field private final listeners:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$L0_3q4QT_5Qc1BOqSsnIOw3Ce3A(Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper;Landroidx/appcompat/app/AppCompatActivity;)V
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper;->dispatchOnActivityAvailable$lambda$0(Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper;Landroidx/appcompat/app/AppCompatActivity;)V

    return-void
.end method

.method public static synthetic $r8$lambda$MJo57NMiKjaIp3Qo59kZSLCg8IY(Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;Landroidx/appcompat/app/AppCompatActivity;)V
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper;->addOnActivityAvailableListener$lambda$2$lambda$1(Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;Landroidx/appcompat/app/AppCompatActivity;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper;->listeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 15
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper;->activityReference:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private static final addOnActivityAvailableListener$lambda$2$lambda$1(Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;Landroidx/appcompat/app/AppCompatActivity;)V
    .locals 1

    const-string v0, "$listener"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    invoke-interface {p0, p1}, Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;->onActivityAvailable(Landroidx/appcompat/app/AppCompatActivity;)V

    return-void
.end method

.method private static final dispatchOnActivityAvailable$lambda$0(Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper;Landroidx/appcompat/app/AppCompatActivity;)V
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    iget-object p0, p0, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper;->listeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;

    .line 22
    invoke-interface {v0, p1}, Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;->onActivityAvailable(Landroidx/appcompat/app/AppCompatActivity;)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public addOnActivityAvailableListener(Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;)V
    .locals 2

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper;->listeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 30
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper;->activityReference:Ljava/lang/ref/WeakReference;

    .line 31
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/app/AppCompatActivity;

    if-eqz v0, :cond_0

    .line 32
    new-instance v1, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1, v0}, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper$$ExternalSyntheticLambda0;-><init>(Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;Landroidx/appcompat/app/AppCompatActivity;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public final dispatchOnActivityAvailable(Landroidx/appcompat/app/AppCompatActivity;)V
    .locals 1

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper;->activityReference:Ljava/lang/ref/WeakReference;

    .line 20
    new-instance v0, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper$$ExternalSyntheticLambda1;-><init>(Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper;Landroidx/appcompat/app/AppCompatActivity;)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AppCompatActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final getListeners()Ljava/util/concurrent/CopyOnWriteArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper;->listeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-object v0
.end method

.method public removeOnActivityAvailableListener(Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;)V
    .locals 1

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/activityaware/AppCompatActivityAwareHelper;->listeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 39
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method
