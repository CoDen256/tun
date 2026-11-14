.class final Lexpo/modules/kotlin/sharedobjects/ClassRegistry$add$1;
.super Lkotlin/jvm/internal/Lambda;
.source "ClassRegistry.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/sharedobjects/ClassRegistry;->add$expo_modules_core_release(Ljava/lang/Class;Lexpo/modules/kotlin/jni/JavaScriptObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
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
.field final synthetic $native:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lexpo/modules/kotlin/sharedobjects/ClassRegistry;


# direct methods
.method constructor <init>(Lexpo/modules/kotlin/sharedobjects/ClassRegistry;Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/sharedobjects/ClassRegistry;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/kotlin/sharedobjects/ClassRegistry$add$1;->this$0:Lexpo/modules/kotlin/sharedobjects/ClassRegistry;

    iput-object p2, p0, Lexpo/modules/kotlin/sharedobjects/ClassRegistry$add$1;->$native:Ljava/lang/Class;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lexpo/modules/kotlin/sharedobjects/ClassRegistry$add$1;->invoke()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke()V
    .locals 2

    iget-object v0, p0, Lexpo/modules/kotlin/sharedobjects/ClassRegistry$add$1;->this$0:Lexpo/modules/kotlin/sharedobjects/ClassRegistry;

    iget-object v1, p0, Lexpo/modules/kotlin/sharedobjects/ClassRegistry$add$1;->$native:Ljava/lang/Class;

    .line 10
    invoke-static {v0, v1}, Lexpo/modules/kotlin/sharedobjects/ClassRegistry;->access$delete(Lexpo/modules/kotlin/sharedobjects/ClassRegistry;Ljava/lang/Class;)V

    return-void
.end method
