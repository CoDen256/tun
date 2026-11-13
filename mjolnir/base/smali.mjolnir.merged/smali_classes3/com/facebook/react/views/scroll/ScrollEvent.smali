.class public Lcom/facebook/react/views/scroll/ScrollEvent;
.super Lcom/facebook/react/uimanager/events/Event;
.source "ScrollEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/react/uimanager/events/Event<",
        "Lcom/facebook/react/views/scroll/ScrollEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final EVENTS_POOL:Landroidx/core/util/Pools$SynchronizedPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Pools$SynchronizedPool<",
            "Lcom/facebook/react/views/scroll/ScrollEvent;",
            ">;"
        }
    .end annotation
.end field

.field private static TAG:Ljava/lang/String; = "ScrollEvent"


# instance fields
.field private mContentHeight:I

.field private mContentWidth:I

.field private mScrollEventType:Lcom/facebook/react/views/scroll/ScrollEventType;

.field private mScrollViewHeight:I

.field private mScrollViewWidth:I

.field private mScrollX:F

.field private mScrollY:F

.field private mXVelocity:F

.field private mYVelocity:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 26
    new-instance v0, Landroidx/core/util/Pools$SynchronizedPool;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroidx/core/util/Pools$SynchronizedPool;-><init>(I)V

    sput-object v0, Lcom/facebook/react/views/scroll/ScrollEvent;->EVENTS_POOL:Landroidx/core/util/Pools$SynchronizedPool;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 107
    invoke-direct {p0}, Lcom/facebook/react/uimanager/events/Event;-><init>()V

    return-void
.end method

.method private init(IILcom/facebook/react/views/scroll/ScrollEventType;FFFFIIII)V
    .locals 0

    .line 121
    invoke-super {p0, p1, p2}, Lcom/facebook/react/uimanager/events/Event;->init(II)V

    iput-object p3, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mScrollEventType:Lcom/facebook/react/views/scroll/ScrollEventType;

    iput p4, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mScrollX:F

    iput p5, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mScrollY:F

    iput p6, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mXVelocity:F

    iput p7, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mYVelocity:F

    iput p8, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mContentWidth:I

    iput p9, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mContentHeight:I

    iput p10, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mScrollViewWidth:I

    iput p11, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mScrollViewHeight:I

    return-void
.end method

.method public static obtain(IILcom/facebook/react/views/scroll/ScrollEventType;FFFFIIII)Lcom/facebook/react/views/scroll/ScrollEvent;
    .locals 13

    sget-object v0, Lcom/facebook/react/views/scroll/ScrollEvent;->EVENTS_POOL:Landroidx/core/util/Pools$SynchronizedPool;

    .line 77
    invoke-virtual {v0}, Landroidx/core/util/Pools$SynchronizedPool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/views/scroll/ScrollEvent;

    if-nez v0, :cond_0

    .line 79
    new-instance v0, Lcom/facebook/react/views/scroll/ScrollEvent;

    invoke-direct {v0}, Lcom/facebook/react/views/scroll/ScrollEvent;-><init>()V

    :cond_0
    move-object v1, v0

    move v2, p0

    move v3, p1

    move-object v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    move/from16 v12, p10

    .line 81
    invoke-direct/range {v1 .. v12}, Lcom/facebook/react/views/scroll/ScrollEvent;->init(IILcom/facebook/react/views/scroll/ScrollEventType;FFFFIIII)V

    return-object v0
.end method

.method public static obtain(ILcom/facebook/react/views/scroll/ScrollEventType;FFFFIIII)Lcom/facebook/react/views/scroll/ScrollEvent;
    .locals 11
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, -0x1

    move v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    .line 51
    invoke-static/range {v0 .. v10}, Lcom/facebook/react/views/scroll/ScrollEvent;->obtain(IILcom/facebook/react/views/scroll/ScrollEventType;FFFFIIII)Lcom/facebook/react/views/scroll/ScrollEvent;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public canCoalesce()Z
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mScrollEventType:Lcom/facebook/react/views/scroll/ScrollEventType;

    .line 141
    sget-object v1, Lcom/facebook/react/views/scroll/ScrollEventType;->SCROLL:Lcom/facebook/react/views/scroll/ScrollEventType;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected getEventData()Lcom/facebook/react/bridge/WritableMap;
    .locals 11

    .line 150
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "top"

    const-wide/16 v2, 0x0

    .line 151
    invoke-interface {v0, v1, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const-string v1, "bottom"

    .line 152
    invoke-interface {v0, v1, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const-string v1, "left"

    .line 153
    invoke-interface {v0, v1, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    const-string v1, "right"

    .line 154
    invoke-interface {v0, v1, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 156
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    iget v2, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mScrollX:F

    .line 157
    invoke-static {v2}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v2

    float-to-double v2, v2

    const-string/jumbo v4, "x"

    invoke-interface {v1, v4, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    iget v2, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mScrollY:F

    .line 158
    invoke-static {v2}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v2

    float-to-double v2, v2

    const-string/jumbo v5, "y"

    invoke-interface {v1, v5, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 160
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v2

    iget v3, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mContentWidth:I

    int-to-float v3, v3

    .line 161
    invoke-static {v3}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v3

    float-to-double v6, v3

    const-string/jumbo v3, "width"

    invoke-interface {v2, v3, v6, v7}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    iget v6, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mContentHeight:I

    int-to-float v6, v6

    .line 162
    invoke-static {v6}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v6

    float-to-double v6, v6

    const-string v8, "height"

    invoke-interface {v2, v8, v6, v7}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 164
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v6

    iget v7, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mScrollViewWidth:I

    int-to-float v7, v7

    .line 165
    invoke-static {v7}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v7

    float-to-double v9, v7

    invoke-interface {v6, v3, v9, v10}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    iget v3, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mScrollViewHeight:I

    int-to-float v3, v3

    .line 166
    invoke-static {v3}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v3

    float-to-double v9, v3

    invoke-interface {v6, v8, v9, v10}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 168
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v3

    iget v7, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mXVelocity:F

    float-to-double v7, v7

    .line 169
    invoke-interface {v3, v4, v7, v8}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    iget v4, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mYVelocity:F

    float-to-double v7, v4

    .line 170
    invoke-interface {v3, v5, v7, v8}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 172
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v4

    const-string v5, "contentInset"

    .line 173
    invoke-interface {v4, v5, v0}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    const-string v0, "contentOffset"

    .line 174
    invoke-interface {v4, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    const-string v0, "contentSize"

    .line 175
    invoke-interface {v4, v0, v2}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    const-string v0, "layoutMeasurement"

    .line 176
    invoke-interface {v4, v0, v6}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    const-string/jumbo v0, "velocity"

    .line 177
    invoke-interface {v4, v0, v3}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    const-string v0, "target"

    .line 179
    invoke-virtual {p0}, Lcom/facebook/react/views/scroll/ScrollEvent;->getViewTag()I

    move-result v1

    invoke-interface {v4, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    const-string v0, "responderIgnoreScroll"

    const/4 v1, 0x1

    .line 180
    invoke-interface {v4, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    return-object v4
.end method

.method public getEventName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/scroll/ScrollEvent;->mScrollEventType:Lcom/facebook/react/views/scroll/ScrollEventType;

    .line 135
    invoke-static {v0}, Lcom/facebook/infer/annotation/Assertions;->assertNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/views/scroll/ScrollEventType;

    invoke-static {v0}, Lcom/facebook/react/views/scroll/ScrollEventType;->getJSEventName(Lcom/facebook/react/views/scroll/ScrollEventType;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onDispose()V
    .locals 2

    :try_start_0
    sget-object v0, Lcom/facebook/react/views/scroll/ScrollEvent;->EVENTS_POOL:Landroidx/core/util/Pools$SynchronizedPool;

    .line 99
    invoke-virtual {v0, p0}, Landroidx/core/util/Pools$SynchronizedPool;->release(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/facebook/react/views/scroll/ScrollEvent;->TAG:Ljava/lang/String;

    .line 103
    invoke-static {v1, v0}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
