.class public final Lexpo/modules/kotlin/events/EventListenerWithPayload;
.super Lexpo/modules/kotlin/events/EventListener;
.source "EventListener.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Payload:",
        "Ljava/lang/Object;",
        ">",
        "Lexpo/modules/kotlin/events/EventListener;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0007\u0018\u0000*\u0004\u0008\u0000\u0010\u00012\u00020\u0002B!\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0012\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00070\u0006\u00a2\u0006\u0002\u0010\u0008J\u0013\u0010\u000b\u001a\u00020\u00072\u0006\u0010\u000c\u001a\u00028\u0000\u00a2\u0006\u0002\u0010\rR\u001d\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00070\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\n\u00a8\u0006\u000e"
    }
    d2 = {
        "Lexpo/modules/kotlin/events/EventListenerWithPayload;",
        "Payload",
        "Lexpo/modules/kotlin/events/EventListener;",
        "eventName",
        "Lexpo/modules/kotlin/events/EventName;",
        "body",
        "Lkotlin/Function1;",
        "",
        "(Lexpo/modules/kotlin/events/EventName;Lkotlin/jvm/functions/Function1;)V",
        "getBody",
        "()Lkotlin/jvm/functions/Function1;",
        "call",
        "sender",
        "(Ljava/lang/Object;)V",
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
.field private final body:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "TPayload;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lexpo/modules/kotlin/events/EventName;Lkotlin/jvm/functions/Function1;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/events/EventName;",
            "Lkotlin/jvm/functions/Function1<",
            "-TPayload;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "eventName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "body"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 23
    invoke-direct {p0, p1, v0}, Lexpo/modules/kotlin/events/EventListener;-><init>(Lexpo/modules/kotlin/events/EventName;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    iput-object p2, p0, Lexpo/modules/kotlin/events/EventListenerWithPayload;->body:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TPayload;)V"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/events/EventListenerWithPayload;->body:Lkotlin/jvm/functions/Function1;

    .line 25
    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final getBody()Lkotlin/jvm/functions/Function1;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function1<",
            "TPayload;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/events/EventListenerWithPayload;->body:Lkotlin/jvm/functions/Function1;

    return-object v0
.end method
