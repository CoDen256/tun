.class public final Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$2;
.super Lkotlin/jvm/internal/Lambda;
.source "AppCompatActivityAware.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Ljava/lang/Throwable;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAppCompatActivityAware.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AppCompatActivityAware.kt\nexpo/modules/kotlin/activityaware/AppCompatActivityAwareKt$withActivityAvailable$2$1\n*L\n1#1,50:1\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0002\u0010\u0000\u001a\u00020\u0001\"\u0004\u0008\u0000\u0010\u00022\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004H\n\u00a2\u0006\u0002\u0008\u0005\u00a8\u0006\u0006"
    }
    d2 = {
        "<anonymous>",
        "",
        "R",
        "it",
        "",
        "invoke",
        "expo/modules/kotlin/activityaware/AppCompatActivityAwareKt$withActivityAvailable$2$1"
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
.field final synthetic $listener:Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$1;

.field final synthetic $this_withActivityAvailable:Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;


# direct methods
.method public constructor <init>(Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$1;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$2;->$this_withActivityAvailable:Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;

    iput-object p2, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$2;->$listener:Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$1;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 46
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$2;->invoke(Ljava/lang/Throwable;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method public final invoke(Ljava/lang/Throwable;)V
    .locals 1

    iget-object p1, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$2;->$this_withActivityAvailable:Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;

    iget-object v0, p0, Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$2;->$listener:Lexpo/modules/kotlin/activityresult/ActivityResultsManager$1$invokeSuspend$$inlined$withActivityAvailable$1;

    .line 47
    check-cast v0, Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;

    invoke-interface {p1, v0}, Lexpo/modules/kotlin/activityaware/AppCompatActivityAware;->removeOnActivityAvailableListener(Lexpo/modules/kotlin/activityaware/OnActivityAvailableListener;)V

    return-void
.end method
