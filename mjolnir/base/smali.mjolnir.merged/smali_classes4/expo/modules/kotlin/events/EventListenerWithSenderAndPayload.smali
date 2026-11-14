.class public final Lexpo/modules/kotlin/events/EventListenerWithSenderAndPayload;
.super Lexpo/modules/kotlin/events/EventListener;
.source "EventListener.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Sender:",
        "Ljava/lang/Object;",
        "Payload:",
        "Ljava/lang/Object;",
        ">",
        "Lexpo/modules/kotlin/events/EventListener;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0008\u0018\u0000*\u0004\u0008\u0000\u0010\u0001*\u0004\u0008\u0001\u0010\u00022\u00020\u0003B\'\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0018\u0010\u0006\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00020\u00080\u0007\u00a2\u0006\u0002\u0010\tJ\u001b\u0010\u000c\u001a\u00020\u00082\u0006\u0010\r\u001a\u00028\u00002\u0006\u0010\u000e\u001a\u00028\u0001\u00a2\u0006\u0002\u0010\u000fR#\u0010\u0006\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00020\u00080\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000b\u00a8\u0006\u0010"
    }
    d2 = {
        "Lexpo/modules/kotlin/events/EventListenerWithSenderAndPayload;",
        "Sender",
        "Payload",
        "Lexpo/modules/kotlin/events/EventListener;",
        "eventName",
        "Lexpo/modules/kotlin/events/EventName;",
        "body",
        "Lkotlin/Function2;",
        "",
        "(Lexpo/modules/kotlin/events/EventName;Lkotlin/jvm/functions/Function2;)V",
        "getBody",
        "()Lkotlin/jvm/functions/Function2;",
        "call",
        "sender",
        "payload",
        "(Ljava/lang/Object;Ljava/lang/Object;)V",
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
.field private final body:Lkotlin/jvm/functions/Function2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function2<",
            "TSender;TPayload;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lexpo/modules/kotlin/events/EventName;Lkotlin/jvm/functions/Function2;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/events/EventName;",
            "Lkotlin/jvm/functions/Function2<",
            "-TSender;-TPayload;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "eventName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "body"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 35
    invoke-direct {p0, p1, v0}, Lexpo/modules/kotlin/events/EventListener;-><init>(Lexpo/modules/kotlin/events/EventName;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    iput-object p2, p0, Lexpo/modules/kotlin/events/EventListenerWithSenderAndPayload;->body:Lkotlin/jvm/functions/Function2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TSender;TPayload;)V"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/events/EventListenerWithSenderAndPayload;->body:Lkotlin/jvm/functions/Function2;

    .line 37
    invoke-interface {v0, p1, p2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final getBody()Lkotlin/jvm/functions/Function2;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function2<",
            "TSender;TPayload;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/events/EventListenerWithSenderAndPayload;->body:Lkotlin/jvm/functions/Function2;

    return-object v0
.end method
