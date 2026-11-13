.class final Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$PanGestureHandlerFactory;
.super Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;
.source "RNGestureHandlerModule.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PanGestureHandlerFactory"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory<",
        "Lcom/swmansion/gesturehandler/core/PanGestureHandler;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0003J\u0018\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u00022\u0006\u0010\u000f\u001a\u00020\u0010H\u0016J\u0012\u0010\u0011\u001a\u00020\u00022\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u0013H\u0016J\u0010\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u000e\u001a\u00020\u0002H\u0016R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u001a\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00020\tX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000b\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$PanGestureHandlerFactory;",
        "Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;",
        "Lcom/swmansion/gesturehandler/core/PanGestureHandler;",
        "()V",
        "name",
        "",
        "getName",
        "()Ljava/lang/String;",
        "type",
        "Ljava/lang/Class;",
        "getType",
        "()Ljava/lang/Class;",
        "configure",
        "",
        "handler",
        "config",
        "Lcom/facebook/react/bridge/ReadableMap;",
        "create",
        "context",
        "Landroid/content/Context;",
        "createEventBuilder",
        "Lcom/swmansion/gesturehandler/react/eventbuilders/PanGestureHandlerEventDataBuilder;",
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
.field private final name:Ljava/lang/String;

.field private final type:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "Lcom/swmansion/gesturehandler/core/PanGestureHandler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 162
    invoke-direct {p0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;-><init>()V

    .line 163
    const-class v0, Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    iput-object v0, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$PanGestureHandlerFactory;->type:Ljava/lang/Class;

    const-string v0, "PanGestureHandler"

    iput-object v0, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$PanGestureHandlerFactory;->name:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public bridge synthetic configure(Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 0

    .line 162
    check-cast p1, Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    invoke-virtual {p0, p1, p2}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$PanGestureHandlerFactory;->configure(Lcom/swmansion/gesturehandler/core/PanGestureHandler;Lcom/facebook/react/bridge/ReadableMap;)V

    return-void
.end method

.method public configure(Lcom/swmansion/gesturehandler/core/PanGestureHandler;Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 4

    const-string v0, "handler"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "config"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 171
    move-object v0, p1

    check-cast v0, Lcom/swmansion/gesturehandler/core/GestureHandler;

    invoke-super {p0, v0, p2}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;->configure(Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/facebook/react/bridge/ReadableMap;)V

    const-string v0, "activeOffsetXStart"

    .line 173
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 174
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(D)F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setActiveOffsetXStart(F)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    move v0, v2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "activeOffsetXEnd"

    .line 177
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 178
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(D)F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setActiveOffsetXEnd(F)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    move v0, v2

    :cond_1
    const-string v1, "failOffsetXStart"

    .line 181
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 182
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(D)F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setFailOffsetXStart(F)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    move v0, v2

    :cond_2
    const-string v1, "failOffsetXEnd"

    .line 185
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 186
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(D)F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setFailOffsetXEnd(F)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    move v0, v2

    :cond_3
    const-string v1, "activeOffsetYStart"

    .line 189
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 190
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(D)F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setActiveOffsetYStart(F)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    move v0, v2

    :cond_4
    const-string v1, "activeOffsetYEnd"

    .line 193
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 194
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(D)F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setActiveOffsetYEnd(F)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    move v0, v2

    :cond_5
    const-string v1, "failOffsetYStart"

    .line 197
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 198
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(D)F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setFailOffsetYStart(F)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    move v0, v2

    :cond_6
    const-string v1, "failOffsetYEnd"

    .line 201
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 202
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(D)F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setFailOffsetYEnd(F)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    move v0, v2

    :cond_7
    const-string v1, "minVelocity"

    .line 205
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 208
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(D)F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setMinVelocity(F)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    move v0, v2

    :cond_8
    const-string v1, "minVelocityX"

    .line 211
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 212
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(D)F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setMinVelocityX(F)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    move v0, v2

    :cond_9
    const-string v1, "minVelocityY"

    .line 215
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 216
    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(D)F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setMinVelocityY(F)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    goto :goto_1

    :cond_a
    move v2, v0

    :goto_1
    const-string v0, "minDist"

    .line 222
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 223
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(D)F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setMinDist(F)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    goto :goto_2

    :cond_b
    if-eqz v2, :cond_c

    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 225
    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setMinDist(F)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    :cond_c
    :goto_2
    const-string v0, "minPointers"

    .line 227
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 228
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setMinPointers(I)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    :cond_d
    const-string v0, "maxPointers"

    .line 230
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 231
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setMaxPointers(I)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    :cond_e
    const-string v0, "avgTouches"

    .line 233
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 234
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setAverageTouches(Z)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    :cond_f
    const-string v0, "activateAfterLongPress"

    .line 236
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 237
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result p2

    int-to-long v0, p2

    invoke-virtual {p1, v0, v1}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;->setActivateAfterLongPress(J)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    :cond_10
    return-void
.end method

.method public bridge synthetic create(Landroid/content/Context;)Lcom/swmansion/gesturehandler/core/GestureHandler;
    .locals 0

    .line 162
    invoke-virtual {p0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$PanGestureHandlerFactory;->create(Landroid/content/Context;)Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    move-result-object p1

    check-cast p1, Lcom/swmansion/gesturehandler/core/GestureHandler;

    return-object p1
.end method

.method public create(Landroid/content/Context;)Lcom/swmansion/gesturehandler/core/PanGestureHandler;
    .locals 1

    .line 167
    new-instance v0, Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    invoke-direct {v0, p1}, Lcom/swmansion/gesturehandler/core/PanGestureHandler;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public bridge synthetic createEventBuilder(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;
    .locals 0

    .line 162
    check-cast p1, Lcom/swmansion/gesturehandler/core/PanGestureHandler;

    invoke-virtual {p0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$PanGestureHandlerFactory;->createEventBuilder(Lcom/swmansion/gesturehandler/core/PanGestureHandler;)Lcom/swmansion/gesturehandler/react/eventbuilders/PanGestureHandlerEventDataBuilder;

    move-result-object p1

    check-cast p1, Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;

    return-object p1
.end method

.method public createEventBuilder(Lcom/swmansion/gesturehandler/core/PanGestureHandler;)Lcom/swmansion/gesturehandler/react/eventbuilders/PanGestureHandlerEventDataBuilder;
    .locals 1

    const-string v0, "handler"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 241
    new-instance v0, Lcom/swmansion/gesturehandler/react/eventbuilders/PanGestureHandlerEventDataBuilder;

    invoke-direct {v0, p1}, Lcom/swmansion/gesturehandler/react/eventbuilders/PanGestureHandlerEventDataBuilder;-><init>(Lcom/swmansion/gesturehandler/core/PanGestureHandler;)V

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$PanGestureHandlerFactory;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/swmansion/gesturehandler/core/PanGestureHandler;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$PanGestureHandlerFactory;->type:Ljava/lang/Class;

    return-object v0
.end method
