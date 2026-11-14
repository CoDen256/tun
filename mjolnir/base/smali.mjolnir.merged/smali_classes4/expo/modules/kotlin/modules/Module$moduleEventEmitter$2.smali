.class final Lexpo/modules/kotlin/modules/Module$moduleEventEmitter$2;
.super Lkotlin/jvm/internal/Lambda;
.source "Module.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/modules/Module;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lexpo/modules/kotlin/events/EventEmitter;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u0004\u0018\u00010\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "Lexpo/modules/kotlin/events/EventEmitter;",
        "invoke"
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
.field final synthetic this$0:Lexpo/modules/kotlin/modules/Module;


# direct methods
.method constructor <init>(Lexpo/modules/kotlin/modules/Module;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/kotlin/modules/Module$moduleEventEmitter$2;->this$0:Lexpo/modules/kotlin/modules/Module;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Lexpo/modules/kotlin/events/EventEmitter;
    .locals 2

    iget-object v0, p0, Lexpo/modules/kotlin/modules/Module$moduleEventEmitter$2;->this$0:Lexpo/modules/kotlin/modules/Module;

    .line 25
    invoke-virtual {v0}, Lexpo/modules/kotlin/modules/Module;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v0

    iget-object v1, p0, Lexpo/modules/kotlin/modules/Module$moduleEventEmitter$2;->this$0:Lexpo/modules/kotlin/modules/Module;

    invoke-virtual {v0, v1}, Lexpo/modules/kotlin/AppContext;->eventEmitter(Lexpo/modules/kotlin/modules/Module;)Lexpo/modules/kotlin/events/EventEmitter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 25
    invoke-virtual {p0}, Lexpo/modules/kotlin/modules/Module$moduleEventEmitter$2;->invoke()Lexpo/modules/kotlin/events/EventEmitter;

    move-result-object v0

    return-object v0
.end method
