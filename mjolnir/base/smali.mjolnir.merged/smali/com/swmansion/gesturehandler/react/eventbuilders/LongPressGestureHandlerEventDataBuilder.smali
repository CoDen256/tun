.class public final Lcom/swmansion/gesturehandler/react/eventbuilders/LongPressGestureHandlerEventDataBuilder;
.super Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;
.source "LongPressGestureHandlerEventDataBuilder.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder<",
        "Lcom/swmansion/gesturehandler/core/LongPressGestureHandler;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0007\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\r\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0002\u0010\u0004J\u0010\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0016R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/swmansion/gesturehandler/react/eventbuilders/LongPressGestureHandlerEventDataBuilder;",
        "Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;",
        "Lcom/swmansion/gesturehandler/core/LongPressGestureHandler;",
        "handler",
        "(Lcom/swmansion/gesturehandler/core/LongPressGestureHandler;)V",
        "absoluteX",
        "",
        "absoluteY",
        "duration",
        "",
        "x",
        "y",
        "buildEventData",
        "",
        "eventData",
        "Lcom/facebook/react/bridge/WritableMap;",
        "react-native-gesture-handler_release"
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
.field private final absoluteX:F

.field private final absoluteY:F

.field private final duration:I

.field private final x:F

.field private final y:F


# direct methods
.method public constructor <init>(Lcom/swmansion/gesturehandler/core/LongPressGestureHandler;)V
    .locals 1

    const-string v0, "handler"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    move-object v0, p1

    check-cast v0, Lcom/swmansion/gesturehandler/core/GestureHandler;

    invoke-direct {p0, v0}, Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;-><init>(Lcom/swmansion/gesturehandler/core/GestureHandler;)V

    .line 15
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/LongPressGestureHandler;->getLastRelativePositionX()F

    move-result v0

    iput v0, p0, Lcom/swmansion/gesturehandler/react/eventbuilders/LongPressGestureHandlerEventDataBuilder;->x:F

    .line 16
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/LongPressGestureHandler;->getLastRelativePositionY()F

    move-result v0

    iput v0, p0, Lcom/swmansion/gesturehandler/react/eventbuilders/LongPressGestureHandlerEventDataBuilder;->y:F

    .line 17
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/LongPressGestureHandler;->getLastPositionInWindowX()F

    move-result v0

    iput v0, p0, Lcom/swmansion/gesturehandler/react/eventbuilders/LongPressGestureHandlerEventDataBuilder;->absoluteX:F

    .line 18
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/LongPressGestureHandler;->getLastPositionInWindowY()F

    move-result v0

    iput v0, p0, Lcom/swmansion/gesturehandler/react/eventbuilders/LongPressGestureHandlerEventDataBuilder;->absoluteY:F

    .line 19
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/LongPressGestureHandler;->getDuration()I

    move-result p1

    iput p1, p0, Lcom/swmansion/gesturehandler/react/eventbuilders/LongPressGestureHandlerEventDataBuilder;->duration:I

    return-void
.end method


# virtual methods
.method public buildEventData(Lcom/facebook/react/bridge/WritableMap;)V
    .locals 3

    const-string v0, "eventData"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    invoke-super {p0, p1}, Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;->buildEventData(Lcom/facebook/react/bridge/WritableMap;)V

    iget v0, p0, Lcom/swmansion/gesturehandler/react/eventbuilders/LongPressGestureHandlerEventDataBuilder;->x:F

    .line 26
    invoke-static {v0}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v0

    float-to-double v0, v0

    const-string/jumbo v2, "x"

    invoke-interface {p1, v2, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    iget v0, p0, Lcom/swmansion/gesturehandler/react/eventbuilders/LongPressGestureHandlerEventDataBuilder;->y:F

    .line 27
    invoke-static {v0}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v0

    float-to-double v0, v0

    const-string/jumbo v2, "y"

    invoke-interface {p1, v2, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    iget v0, p0, Lcom/swmansion/gesturehandler/react/eventbuilders/LongPressGestureHandlerEventDataBuilder;->absoluteX:F

    .line 28
    invoke-static {v0}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v0

    float-to-double v0, v0

    const-string v2, "absoluteX"

    invoke-interface {p1, v2, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    iget v0, p0, Lcom/swmansion/gesturehandler/react/eventbuilders/LongPressGestureHandlerEventDataBuilder;->absoluteY:F

    .line 29
    invoke-static {v0}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v0

    float-to-double v0, v0

    const-string v2, "absoluteY"

    invoke-interface {p1, v2, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const-string v0, "duration"

    iget v1, p0, Lcom/swmansion/gesturehandler/react/eventbuilders/LongPressGestureHandlerEventDataBuilder;->duration:I

    .line 30
    invoke-interface {p1, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    return-void
.end method
