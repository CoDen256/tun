.class public final Lcom/facebook/react/internal/interop/InteropEvent;
.super Lcom/facebook/react/uimanager/events/Event;
.source "InteropEvent.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/react/uimanager/events/Event<",
        "Lcom/facebook/react/internal/interop/InteropEvent;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0007\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u00a2\u0006\u0002\u0010\tJ\n\u0010\u000c\u001a\u0004\u0018\u00010\u0005H\u0014J\u0008\u0010\r\u001a\u00020\u0003H\u0016R\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u00058\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\nR\u0013\u0010\u0002\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u000b\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/facebook/react/internal/interop/InteropEvent;",
        "Lcom/facebook/react/uimanager/events/Event;",
        "eventName",
        "",
        "eventData",
        "Lcom/facebook/react/bridge/WritableMap;",
        "surfaceId",
        "",
        "viewTag",
        "(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;II)V",
        "()Lcom/facebook/react/bridge/WritableMap;",
        "()Ljava/lang/String;",
        "getEventData",
        "getEventName",
        "ReactAndroid_release"
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
.field private final eventData:Lcom/facebook/react/bridge/WritableMap;

.field private final eventName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;II)V
    .locals 1

    const-string v0, "eventName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    invoke-direct {p0, p3, p4}, Lcom/facebook/react/uimanager/events/Event;-><init>(II)V

    iput-object p1, p0, Lcom/facebook/react/internal/interop/InteropEvent;->eventName:Ljava/lang/String;

    iput-object p2, p0, Lcom/facebook/react/internal/interop/InteropEvent;->eventData:Lcom/facebook/react/bridge/WritableMap;

    return-void
.end method


# virtual methods
.method public final eventData()Lcom/facebook/react/bridge/WritableMap;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/internal/interop/InteropEvent;->eventData:Lcom/facebook/react/bridge/WritableMap;

    return-object v0
.end method

.method public final eventName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/internal/interop/InteropEvent;->eventName:Ljava/lang/String;

    return-object v0
.end method

.method protected getEventData()Lcom/facebook/react/bridge/WritableMap;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/internal/interop/InteropEvent;->eventData:Lcom/facebook/react/bridge/WritableMap;

    return-object v0
.end method

.method public getEventName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/internal/interop/InteropEvent;->eventName:Ljava/lang/String;

    return-object v0
.end method
