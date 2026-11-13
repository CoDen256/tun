.class public final Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;
.super Lcom/swmansion/gesturehandler/NativeRNGestureHandlerModuleSpec;
.source "RNGestureHandlerModule.kt"

# interfaces
.implements Lcom/swmansion/common/GestureHandlerStateManager;


# annotations
.annotation runtime Lcom/facebook/react/module/annotations/ReactModule;
    name = "RNGestureHandlerModule"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$Companion;,
        Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$FlingGestureHandlerFactory;,
        Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;,
        Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HoverGestureHandlerFactory;,
        Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$LongPressGestureHandlerFactory;,
        Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$ManualGestureHandlerFactory;,
        Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$NativeViewGestureHandlerFactory;,
        Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$PanGestureHandlerFactory;,
        Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$PinchGestureHandlerFactory;,
        Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$RotationGestureHandlerFactory;,
        Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$TapGestureHandlerFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nRNGestureHandlerModule.kt\nKotlin\n*S Kotlin\n*F\n+ 1 RNGestureHandlerModule.kt\ncom/swmansion/gesturehandler/react/RNGestureHandlerModule\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 4 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,740:1\n1#2:741\n288#3,2:742\n1282#4,2:744\n*S KotlinDebug\n*F\n+ 1 RNGestureHandlerModule.kt\ncom/swmansion/gesturehandler/react/RNGestureHandlerModule\n*L\n519#1:742,2\n527#1:744,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00a3\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0006\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0007\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0011*\u0001\u0007\u0008\u0007\u0018\u0000 S2\u00020\u00012\u00020\u0002:\u000bSTUVWXYZ[\\]B\u000f\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0002\u0010\u0005J \u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001b2\u0006\u0010\u001d\u001a\u00020\u001bH\u0017J \u0010\u001e\u001a\u00020\u00192\u0006\u0010\u001f\u001a\u00020 2\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010!\u001a\u00020\"H\u0017J0\u0010#\u001a\u00020\u0019\"\u000e\u0008\u0000\u0010$*\u0008\u0012\u0004\u0012\u0002H$0%2\u0006\u0010\u001f\u001a\u00020 2\u0006\u0010&\u001a\u00020\'2\u0006\u0010!\u001a\u00020\"H\u0002J\u0011\u0010(\u001a\u00020\u00192\u0006\u0010)\u001a\u00020*H\u0082 J\u0010\u0010+\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u001bH\u0017J.\u0010,\u001a\n\u0012\u0004\u0012\u0002H$\u0018\u00010\u000b\"\u000e\u0008\u0000\u0010$*\u0008\u0012\u0004\u0012\u0002H$0%2\u000c\u0010-\u001a\u0008\u0012\u0004\u0012\u0002H$0%H\u0002J\u0012\u0010.\u001a\u0004\u0018\u00010\u00172\u0006\u0010/\u001a\u00020\'H\u0002J\u0008\u00100\u001a\u00020\u0019H\u0017J\u0014\u00101\u001a\u000e\u0012\u0004\u0012\u00020 \u0012\u0004\u0012\u00020302H\u0016J\u0008\u00104\u001a\u00020 H\u0016J\u0008\u00105\u001a\u00020\u0019H\u0017J\u0018\u00106\u001a\u00020\u00192\u0006\u0010\u001c\u001a\u00020\u001b2\u0006\u00107\u001a\u000208H\u0017J\u0008\u00109\u001a\u000208H\u0017J\u0008\u0010:\u001a\u00020\u0019H\u0016J%\u0010;\u001a\u00020\u0019\"\u000e\u0008\u0000\u0010$*\u0008\u0012\u0004\u0012\u0002H$0%2\u0006\u0010-\u001a\u0002H$H\u0002\u00a2\u0006\u0002\u0010<J5\u0010=\u001a\u00020\u0019\"\u000e\u0008\u0000\u0010$*\u0008\u0012\u0004\u0012\u0002H$0%2\u0006\u0010-\u001a\u0002H$2\u0006\u0010>\u001a\u00020\'2\u0006\u0010?\u001a\u00020\'H\u0002\u00a2\u0006\u0002\u0010@J%\u0010A\u001a\u00020\u0019\"\u000e\u0008\u0000\u0010$*\u0008\u0012\u0004\u0012\u0002H$0%2\u0006\u0010-\u001a\u0002H$H\u0002\u00a2\u0006\u0002\u0010<J\u000e\u0010B\u001a\u00020\u00192\u0006\u0010C\u001a\u00020\u0017J\u0018\u0010D\u001a\u00020\u00192\u0006\u0010E\u001a\u00020 2\u0006\u0010F\u001a\u00020GH\u0002J%\u0010H\u001a\u00020\u0019\"\u000e\u0008\u0000\u0010$*\u0008\u0012\u0004\u0012\u0002H$0I2\u0006\u0010J\u001a\u0002H$H\u0002\u00a2\u0006\u0002\u0010KJ\u0010\u0010L\u001a\u00020\u00192\u0006\u0010J\u001a\u00020MH\u0002J%\u0010N\u001a\u00020\u0019\"\u000e\u0008\u0000\u0010$*\u0008\u0012\u0004\u0012\u0002H$0I2\u0006\u0010J\u001a\u0002H$H\u0002\u00a2\u0006\u0002\u0010KJ\u0018\u0010O\u001a\u00020\u00192\u0006\u0010&\u001a\u00020\'2\u0006\u0010>\u001a\u00020\'H\u0016J\u000e\u0010P\u001a\u00020\u00192\u0006\u0010C\u001a\u00020\u0017J\u0018\u0010Q\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010!\u001a\u00020\"H\u0017J(\u0010R\u001a\u00020\u0019\"\u000e\u0008\u0000\u0010$*\u0008\u0012\u0004\u0012\u0002H$0%2\u0006\u0010&\u001a\u00020\'2\u0006\u0010!\u001a\u00020\"H\u0002R\u0010\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u0008R\u001a\u0010\t\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u000b0\nX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u000cR\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0011\u001a\u00020\u0012\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\u00170\u0016X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006^"
    }
    d2 = {
        "Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;",
        "Lcom/swmansion/gesturehandler/NativeRNGestureHandlerModuleSpec;",
        "Lcom/swmansion/common/GestureHandlerStateManager;",
        "reactContext",
        "Lcom/facebook/react/bridge/ReactApplicationContext;",
        "(Lcom/facebook/react/bridge/ReactApplicationContext;)V",
        "eventListener",
        "com/swmansion/gesturehandler/react/RNGestureHandlerModule$eventListener$1",
        "Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$eventListener$1;",
        "handlerFactories",
        "",
        "Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;",
        "[Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;",
        "interactionManager",
        "Lcom/swmansion/gesturehandler/react/RNGestureHandlerInteractionManager;",
        "reanimatedEventDispatcher",
        "Lcom/swmansion/gesturehandler/ReanimatedEventDispatcher;",
        "registry",
        "Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;",
        "getRegistry",
        "()Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;",
        "roots",
        "",
        "Lcom/swmansion/gesturehandler/react/RNGestureHandlerRootHelper;",
        "attachGestureHandler",
        "",
        "handlerTagDouble",
        "",
        "viewTagDouble",
        "actionTypeDouble",
        "createGestureHandler",
        "handlerName",
        "",
        "config",
        "Lcom/facebook/react/bridge/ReadableMap;",
        "createGestureHandlerHelper",
        "T",
        "Lcom/swmansion/gesturehandler/core/GestureHandler;",
        "handlerTag",
        "",
        "decorateRuntime",
        "jsiPtr",
        "",
        "dropGestureHandler",
        "findFactoryForHandler",
        "handler",
        "findRootHelperForViewAncestor",
        "viewTag",
        "flushOperations",
        "getConstants",
        "",
        "",
        "getName",
        "handleClearJSResponder",
        "handleSetJSResponder",
        "blockNativeResponder",
        "",
        "install",
        "invalidate",
        "onHandlerUpdate",
        "(Lcom/swmansion/gesturehandler/core/GestureHandler;)V",
        "onStateChange",
        "newState",
        "oldState",
        "(Lcom/swmansion/gesturehandler/core/GestureHandler;II)V",
        "onTouchEvent",
        "registerRootHelper",
        "root",
        "sendEventForDeviceEvent",
        "eventName",
        "data",
        "Lcom/facebook/react/bridge/WritableMap;",
        "sendEventForDirectEvent",
        "Lcom/facebook/react/uimanager/events/Event;",
        "event",
        "(Lcom/facebook/react/uimanager/events/Event;)V",
        "sendEventForNativeAnimatedEvent",
        "Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent;",
        "sendEventForReanimated",
        "setGestureHandlerState",
        "unregisterRootHelper",
        "updateGestureHandler",
        "updateGestureHandlerHelper",
        "Companion",
        "FlingGestureHandlerFactory",
        "HandlerFactory",
        "HoverGestureHandlerFactory",
        "LongPressGestureHandlerFactory",
        "ManualGestureHandlerFactory",
        "NativeViewGestureHandlerFactory",
        "PanGestureHandlerFactory",
        "PinchGestureHandlerFactory",
        "RotationGestureHandlerFactory",
        "TapGestureHandlerFactory",
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


# static fields
.field public static final Companion:Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$Companion;

.field private static final KEY_DIRECTION:Ljava/lang/String; = "direction"

.field private static final KEY_ENABLED:Ljava/lang/String; = "enabled"

.field private static final KEY_HIT_SLOP:Ljava/lang/String; = "hitSlop"

.field private static final KEY_HIT_SLOP_BOTTOM:Ljava/lang/String; = "bottom"

.field private static final KEY_HIT_SLOP_HEIGHT:Ljava/lang/String; = "height"

.field private static final KEY_HIT_SLOP_HORIZONTAL:Ljava/lang/String; = "horizontal"

.field private static final KEY_HIT_SLOP_LEFT:Ljava/lang/String; = "left"

.field private static final KEY_HIT_SLOP_RIGHT:Ljava/lang/String; = "right"

.field private static final KEY_HIT_SLOP_TOP:Ljava/lang/String; = "top"

.field private static final KEY_HIT_SLOP_VERTICAL:Ljava/lang/String; = "vertical"

.field private static final KEY_HIT_SLOP_WIDTH:Ljava/lang/String; = "width"

.field private static final KEY_LONG_PRESS_MAX_DIST:Ljava/lang/String; = "maxDist"

.field private static final KEY_LONG_PRESS_MIN_DURATION_MS:Ljava/lang/String; = "minDurationMs"

.field private static final KEY_MANUAL_ACTIVATION:Ljava/lang/String; = "manualActivation"

.field private static final KEY_NATIVE_VIEW_DISALLOW_INTERRUPTION:Ljava/lang/String; = "disallowInterruption"

.field private static final KEY_NATIVE_VIEW_SHOULD_ACTIVATE_ON_START:Ljava/lang/String; = "shouldActivateOnStart"

.field private static final KEY_NEEDS_POINTER_DATA:Ljava/lang/String; = "needsPointerData"

.field private static final KEY_NUMBER_OF_POINTERS:Ljava/lang/String; = "numberOfPointers"

.field private static final KEY_PAN_ACTIVATE_AFTER_LONG_PRESS:Ljava/lang/String; = "activateAfterLongPress"

.field private static final KEY_PAN_ACTIVE_OFFSET_X_END:Ljava/lang/String; = "activeOffsetXEnd"

.field private static final KEY_PAN_ACTIVE_OFFSET_X_START:Ljava/lang/String; = "activeOffsetXStart"

.field private static final KEY_PAN_ACTIVE_OFFSET_Y_END:Ljava/lang/String; = "activeOffsetYEnd"

.field private static final KEY_PAN_ACTIVE_OFFSET_Y_START:Ljava/lang/String; = "activeOffsetYStart"

.field private static final KEY_PAN_AVG_TOUCHES:Ljava/lang/String; = "avgTouches"

.field private static final KEY_PAN_FAIL_OFFSET_RANGE_X_END:Ljava/lang/String; = "failOffsetXEnd"

.field private static final KEY_PAN_FAIL_OFFSET_RANGE_X_START:Ljava/lang/String; = "failOffsetXStart"

.field private static final KEY_PAN_FAIL_OFFSET_RANGE_Y_END:Ljava/lang/String; = "failOffsetYEnd"

.field private static final KEY_PAN_FAIL_OFFSET_RANGE_Y_START:Ljava/lang/String; = "failOffsetYStart"

.field private static final KEY_PAN_MAX_POINTERS:Ljava/lang/String; = "maxPointers"

.field private static final KEY_PAN_MIN_DIST:Ljava/lang/String; = "minDist"

.field private static final KEY_PAN_MIN_POINTERS:Ljava/lang/String; = "minPointers"

.field private static final KEY_PAN_MIN_VELOCITY:Ljava/lang/String; = "minVelocity"

.field private static final KEY_PAN_MIN_VELOCITY_X:Ljava/lang/String; = "minVelocityX"

.field private static final KEY_PAN_MIN_VELOCITY_Y:Ljava/lang/String; = "minVelocityY"

.field private static final KEY_SHOULD_CANCEL_WHEN_OUTSIDE:Ljava/lang/String; = "shouldCancelWhenOutside"

.field private static final KEY_TAP_MAX_DELAY_MS:Ljava/lang/String; = "maxDelayMs"

.field private static final KEY_TAP_MAX_DELTA_X:Ljava/lang/String; = "maxDeltaX"

.field private static final KEY_TAP_MAX_DELTA_Y:Ljava/lang/String; = "maxDeltaY"

.field private static final KEY_TAP_MAX_DIST:Ljava/lang/String; = "maxDist"

.field private static final KEY_TAP_MAX_DURATION_MS:Ljava/lang/String; = "maxDurationMs"

.field private static final KEY_TAP_MIN_POINTERS:Ljava/lang/String; = "minPointers"

.field private static final KEY_TAP_NUMBER_OF_TAPS:Ljava/lang/String; = "numberOfTaps"

.field public static final NAME:Ljava/lang/String; = "RNGestureHandlerModule"


# instance fields
.field private final eventListener:Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$eventListener$1;

.field private final handlerFactories:[Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory<",
            "*>;"
        }
    .end annotation
.end field

.field private final interactionManager:Lcom/swmansion/gesturehandler/react/RNGestureHandlerInteractionManager;

.field private final reanimatedEventDispatcher:Lcom/swmansion/gesturehandler/ReanimatedEventDispatcher;

.field private final registry:Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;

.field private final roots:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/swmansion/gesturehandler/react/RNGestureHandlerRootHelper;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$FT3tAKd3VN9xyODRgPxxBEkwF1c(Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;)V
    .locals 0

    invoke-static {p0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->install$lambda$2(Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->Companion:Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$Companion;

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 2

    .line 52
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/NativeRNGestureHandlerModuleSpec;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    .line 309
    new-instance p1, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$eventListener$1;

    invoke-direct {p1, p0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$eventListener$1;-><init>(Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;)V

    iput-object p1, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->eventListener:Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$eventListener$1;

    const/16 p1, 0x9

    new-array p1, p1, [Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;

    .line 323
    new-instance v0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$NativeViewGestureHandlerFactory;

    invoke-direct {v0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$NativeViewGestureHandlerFactory;-><init>()V

    const/4 v1, 0x0

    aput-object v0, p1, v1

    .line 324
    new-instance v0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$TapGestureHandlerFactory;

    invoke-direct {v0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$TapGestureHandlerFactory;-><init>()V

    const/4 v1, 0x1

    aput-object v0, p1, v1

    .line 325
    new-instance v0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$LongPressGestureHandlerFactory;

    invoke-direct {v0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$LongPressGestureHandlerFactory;-><init>()V

    const/4 v1, 0x2

    aput-object v0, p1, v1

    .line 326
    new-instance v0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$PanGestureHandlerFactory;

    invoke-direct {v0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$PanGestureHandlerFactory;-><init>()V

    const/4 v1, 0x3

    aput-object v0, p1, v1

    .line 327
    new-instance v0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$PinchGestureHandlerFactory;

    invoke-direct {v0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$PinchGestureHandlerFactory;-><init>()V

    const/4 v1, 0x4

    aput-object v0, p1, v1

    .line 328
    new-instance v0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$RotationGestureHandlerFactory;

    invoke-direct {v0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$RotationGestureHandlerFactory;-><init>()V

    const/4 v1, 0x5

    aput-object v0, p1, v1

    .line 329
    new-instance v0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$FlingGestureHandlerFactory;

    invoke-direct {v0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$FlingGestureHandlerFactory;-><init>()V

    const/4 v1, 0x6

    aput-object v0, p1, v1

    .line 330
    new-instance v0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$ManualGestureHandlerFactory;

    invoke-direct {v0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$ManualGestureHandlerFactory;-><init>()V

    const/4 v1, 0x7

    aput-object v0, p1, v1

    .line 331
    new-instance v0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HoverGestureHandlerFactory;

    invoke-direct {v0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HoverGestureHandlerFactory;-><init>()V

    const/16 v1, 0x8

    aput-object v0, p1, v1

    iput-object p1, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->handlerFactories:[Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;

    .line 333
    new-instance p1, Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;

    invoke-direct {p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;-><init>()V

    iput-object p1, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->registry:Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;

    .line 334
    new-instance p1, Lcom/swmansion/gesturehandler/react/RNGestureHandlerInteractionManager;

    invoke-direct {p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerInteractionManager;-><init>()V

    iput-object p1, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->interactionManager:Lcom/swmansion/gesturehandler/react/RNGestureHandlerInteractionManager;

    .line 335
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    check-cast p1, Ljava/util/List;

    iput-object p1, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->roots:Ljava/util/List;

    .line 336
    new-instance p1, Lcom/swmansion/gesturehandler/ReanimatedEventDispatcher;

    invoke-direct {p1}, Lcom/swmansion/gesturehandler/ReanimatedEventDispatcher;-><init>()V

    iput-object p1, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->reanimatedEventDispatcher:Lcom/swmansion/gesturehandler/ReanimatedEventDispatcher;

    return-void
.end method

.method public static final synthetic access$onHandlerUpdate(Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;Lcom/swmansion/gesturehandler/core/GestureHandler;)V
    .locals 0

    .line 49
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->onHandlerUpdate(Lcom/swmansion/gesturehandler/core/GestureHandler;)V

    return-void
.end method

.method public static final synthetic access$onStateChange(Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;Lcom/swmansion/gesturehandler/core/GestureHandler;II)V
    .locals 0

    .line 49
    invoke-direct {p0, p1, p2, p3}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->onStateChange(Lcom/swmansion/gesturehandler/core/GestureHandler;II)V

    return-void
.end method

.method public static final synthetic access$onTouchEvent(Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;Lcom/swmansion/gesturehandler/core/GestureHandler;)V
    .locals 0

    .line 49
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->onTouchEvent(Lcom/swmansion/gesturehandler/core/GestureHandler;)V

    return-void
.end method

.method private final createGestureHandlerHelper(Ljava/lang/String;ILcom/facebook/react/bridge/ReadableMap;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "TT;>;>(",
            "Ljava/lang/String;",
            "I",
            "Lcom/facebook/react/bridge/ReadableMap;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->registry:Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;

    .line 346
    invoke-virtual {v0, p2}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;->getHandler(I)Lcom/swmansion/gesturehandler/core/GestureHandler;

    move-result-object v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->handlerFactories:[Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;

    .line 352
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 353
    invoke-virtual {v3}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 354
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    invoke-virtual {v3, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;->create(Landroid/content/Context;)Lcom/swmansion/gesturehandler/core/GestureHandler;

    move-result-object p1

    .line 355
    invoke-virtual {p1, p2}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setTag(I)V

    iget-object p2, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->eventListener:Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$eventListener$1;

    .line 356
    check-cast p2, Lcom/swmansion/gesturehandler/core/OnTouchEventListener;

    invoke-virtual {p1, p2}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setOnTouchEventListener(Lcom/swmansion/gesturehandler/core/OnTouchEventListener;)Lcom/swmansion/gesturehandler/core/GestureHandler;

    iget-object p2, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->registry:Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;

    .line 358
    invoke-virtual {p2, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;->registerHandler(Lcom/swmansion/gesturehandler/core/GestureHandler;)V

    iget-object p2, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->interactionManager:Lcom/swmansion/gesturehandler/react/RNGestureHandlerInteractionManager;

    .line 359
    invoke-virtual {p2, p1, p3}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerInteractionManager;->configureInteractions(Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/facebook/react/bridge/ReadableMap;)V

    .line 360
    invoke-virtual {v3, p1, p3}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;->configure(Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/facebook/react/bridge/ReadableMap;)V

    return-void

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 364
    :cond_1
    new-instance p2, Lcom/facebook/react/bridge/JSApplicationIllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Invalid handler name "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/facebook/react/bridge/JSApplicationIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 347
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 348
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Handler with tag "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " already exists. Please ensure that no Gesture instance is used across multiple GestureDetectors."

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 347
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final native decorateRuntime(J)V
.end method

.method private final findFactoryForHandler(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "TT;>;>(",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "TT;>;)",
            "Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->handlerFactories:[Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;

    .line 744
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 527
    invoke-virtual {v3}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;->getType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_1
    return-object v3
.end method

.method private final findRootHelperForViewAncestor(I)Lcom/swmansion/gesturehandler/react/RNGestureHandlerRootHelper;
    .locals 6

    .line 513
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    const-string v1, "getReactApplicationContext(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/react/bridge/ReactContext;

    invoke-static {v0}, Lcom/swmansion/gesturehandler/react/ExtensionsKt;->getUIManager(Lcom/facebook/react/bridge/ReactContext;)Lcom/facebook/react/uimanager/UIManagerModule;

    move-result-object v0

    .line 514
    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/UIManagerModule;->resolveRootTagFromReactTag(I)I

    move-result p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ge p1, v0, :cond_0

    return-object v1

    :cond_0
    iget-object v0, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->roots:Ljava/util/List;

    .line 518
    monitor-enter v0

    :try_start_0
    iget-object v2, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->roots:Ljava/util/List;

    .line 519
    check-cast v2, Ljava/lang/Iterable;

    .line 742
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lcom/swmansion/gesturehandler/react/RNGestureHandlerRootHelper;

    .line 520
    invoke-virtual {v4}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerRootHelper;->getRootView()Landroid/view/ViewGroup;

    move-result-object v5

    instance-of v5, v5, Lcom/facebook/react/ReactRootView;

    if-eqz v5, :cond_1

    invoke-virtual {v4}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerRootHelper;->getRootView()Landroid/view/ViewGroup;

    move-result-object v4

    check-cast v4, Lcom/facebook/react/ReactRootView;

    invoke-virtual {v4}, Lcom/facebook/react/ReactRootView;->getRootViewTag()I

    move-result v4

    if-ne v4, p1, :cond_1

    move-object v1, v3

    .line 743
    :cond_2
    check-cast v1, Lcom/swmansion/gesturehandler/react/RNGestureHandlerRootHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 519
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method private static final install$lambda$2(Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;)V
    .locals 2

    const-string/jumbo v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    :try_start_0
    const-string v0, "gesturehandler"

    .line 450
    invoke-static {v0}, Lcom/facebook/soloader/SoLoader;->loadLibrary(Ljava/lang/String;)Z

    .line 451
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/react/bridge/ReactApplicationContext;->getJavaScriptContextHolder()Lcom/facebook/react/bridge/JavaScriptContextHolder;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 452
    invoke-virtual {v0}, Lcom/facebook/react/bridge/JavaScriptContextHolder;->get()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->decorateRuntime(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "[RNGestureHandler]"

    const-string v0, "Could not install JSI bindings."

    .line 454
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method private final onHandlerUpdate(Lcom/swmansion/gesturehandler/core/GestureHandler;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "TT;>;>(TT;)V"
        }
    .end annotation

    .line 532
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getTag()I

    move-result v0

    if-gez v0, :cond_0

    return-void

    .line 536
    :cond_0
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getState()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_5

    .line 537
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->findFactoryForHandler(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    .line 539
    :cond_1
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getActionType()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    .line 541
    sget-object v4, Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent;->Companion:Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent$Companion;

    invoke-virtual {v0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;->createEventBuilder(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x4

    const/4 v9, 0x0

    move-object v5, p1

    invoke-static/range {v4 .. v9}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent$Companion;->obtain$default(Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent$Companion;Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;ZILjava/lang/Object;)Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent;

    move-result-object p1

    .line 542
    check-cast p1, Lcom/facebook/react/uimanager/events/Event;

    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->sendEventForReanimated(Lcom/facebook/react/uimanager/events/Event;)V

    goto :goto_0

    .line 543
    :cond_2
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getActionType()I

    move-result v2

    const/4 v4, 0x2

    if-ne v2, v4, :cond_3

    .line 545
    sget-object v1, Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent;->Companion:Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent$Companion;

    .line 547
    invoke-virtual {v0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;->createEventBuilder(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;

    move-result-object v0

    .line 545
    invoke-virtual {v1, p1, v0, v3}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent$Companion;->obtain(Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;Z)Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent;

    move-result-object p1

    .line 550
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->sendEventForNativeAnimatedEvent(Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent;)V

    goto :goto_0

    .line 551
    :cond_3
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getActionType()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_4

    .line 557
    sget-object v4, Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent;->Companion:Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent$Companion;

    invoke-virtual {v0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;->createEventBuilder(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x4

    const/4 v9, 0x0

    move-object v5, p1

    invoke-static/range {v4 .. v9}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent$Companion;->obtain$default(Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent$Companion;Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;ZILjava/lang/Object;)Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent;

    move-result-object p1

    .line 558
    check-cast p1, Lcom/facebook/react/uimanager/events/Event;

    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->sendEventForDirectEvent(Lcom/facebook/react/uimanager/events/Event;)V

    goto :goto_0

    .line 560
    :cond_4
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getActionType()I

    move-result v2

    if-ne v2, v1, :cond_5

    .line 562
    sget-object v1, Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent;->Companion:Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent$Companion;

    invoke-virtual {v0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;->createEventBuilder(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent$Companion;->createEventData(Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    const-string v0, "onGestureHandlerEvent"

    .line 563
    invoke-direct {p0, v0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->sendEventForDeviceEvent(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    :cond_5
    :goto_0
    return-void
.end method

.method private final onStateChange(Lcom/swmansion/gesturehandler/core/GestureHandler;II)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "TT;>;>(TT;II)V"
        }
    .end annotation

    .line 571
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getTag()I

    move-result v0

    if-gez v0, :cond_0

    return-void

    .line 575
    :cond_0
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->findFactoryForHandler(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    .line 577
    :cond_1
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getActionType()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 579
    sget-object v1, Lcom/swmansion/gesturehandler/react/RNGestureHandlerStateChangeEvent;->Companion:Lcom/swmansion/gesturehandler/react/RNGestureHandlerStateChangeEvent$Companion;

    invoke-virtual {v0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;->createEventBuilder(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;

    move-result-object v0

    invoke-virtual {v1, p1, p2, p3, v0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerStateChangeEvent$Companion;->obtain(Lcom/swmansion/gesturehandler/core/GestureHandler;IILcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;)Lcom/swmansion/gesturehandler/react/RNGestureHandlerStateChangeEvent;

    move-result-object p1

    .line 580
    check-cast p1, Lcom/facebook/react/uimanager/events/Event;

    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->sendEventForReanimated(Lcom/facebook/react/uimanager/events/Event;)V

    goto :goto_1

    .line 581
    :cond_2
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getActionType()I

    move-result v1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_4

    .line 582
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getActionType()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_3

    goto :goto_0

    .line 592
    :cond_3
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getActionType()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_5

    .line 594
    sget-object v1, Lcom/swmansion/gesturehandler/react/RNGestureHandlerStateChangeEvent;->Companion:Lcom/swmansion/gesturehandler/react/RNGestureHandlerStateChangeEvent$Companion;

    invoke-virtual {v0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;->createEventBuilder(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;

    move-result-object p1

    invoke-virtual {v1, p1, p2, p3}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerStateChangeEvent$Companion;->createEventData(Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;II)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    const-string p2, "onGestureHandlerStateChange"

    .line 595
    invoke-direct {p0, p2, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->sendEventForDeviceEvent(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    goto :goto_1

    .line 589
    :cond_4
    :goto_0
    sget-object v1, Lcom/swmansion/gesturehandler/react/RNGestureHandlerStateChangeEvent;->Companion:Lcom/swmansion/gesturehandler/react/RNGestureHandlerStateChangeEvent$Companion;

    invoke-virtual {v0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;->createEventBuilder(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;

    move-result-object v0

    invoke-virtual {v1, p1, p2, p3, v0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerStateChangeEvent$Companion;->obtain(Lcom/swmansion/gesturehandler/core/GestureHandler;IILcom/swmansion/gesturehandler/react/eventbuilders/GestureHandlerEventDataBuilder;)Lcom/swmansion/gesturehandler/react/RNGestureHandlerStateChangeEvent;

    move-result-object p1

    .line 590
    check-cast p1, Lcom/facebook/react/uimanager/events/Event;

    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->sendEventForDirectEvent(Lcom/facebook/react/uimanager/events/Event;)V

    :cond_5
    :goto_1
    return-void
.end method

.method private final onTouchEvent(Lcom/swmansion/gesturehandler/core/GestureHandler;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "TT;>;>(TT;)V"
        }
    .end annotation

    .line 602
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getTag()I

    move-result v0

    if-gez v0, :cond_0

    return-void

    .line 606
    :cond_0
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getState()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x4

    if-eq v0, v1, :cond_1

    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getState()I

    move-result v0

    if-eq v0, v2, :cond_1

    .line 607
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getState()I

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 609
    :cond_1
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getActionType()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 611
    sget-object v0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerTouchEvent;->Companion:Lcom/swmansion/gesturehandler/react/RNGestureHandlerTouchEvent$Companion;

    invoke-virtual {v0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerTouchEvent$Companion;->obtain(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/react/RNGestureHandlerTouchEvent;

    move-result-object p1

    .line 612
    check-cast p1, Lcom/facebook/react/uimanager/events/Event;

    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->sendEventForReanimated(Lcom/facebook/react/uimanager/events/Event;)V

    goto :goto_0

    .line 613
    :cond_2
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getActionType()I

    move-result v0

    if-ne v0, v2, :cond_3

    .line 615
    sget-object v0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerTouchEvent;->Companion:Lcom/swmansion/gesturehandler/react/RNGestureHandlerTouchEvent$Companion;

    invoke-virtual {v0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerTouchEvent$Companion;->createEventData(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    const-string v0, "onGestureHandlerEvent"

    .line 616
    invoke-direct {p0, v0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->sendEventForDeviceEvent(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    :cond_3
    :goto_0
    return-void
.end method

.method private final sendEventForDeviceEvent(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V
    .locals 2

    .line 647
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    const-string v1, "getReactApplicationContext(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/react/bridge/ReactContext;

    invoke-static {v0}, Lcom/swmansion/gesturehandler/react/ExtensionsKt;->getDeviceEventEmitter(Lcom/facebook/react/bridge/ReactContext;)Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/facebook/react/modules/core/DeviceEventManagerModule$RCTDeviceEventEmitter;->emit(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method private final sendEventForDirectEvent(Lcom/facebook/react/uimanager/events/Event;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/facebook/react/uimanager/events/Event<",
            "TT;>;>(TT;)V"
        }
    .end annotation

    .line 642
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    const-string v1, "getReactApplicationContext(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/react/bridge/ReactContext;

    invoke-static {v0, p1}, Lcom/swmansion/gesturehandler/ReactContextExtensionsKt;->dispatchEvent(Lcom/facebook/react/bridge/ReactContext;Lcom/facebook/react/uimanager/events/Event;)V

    return-void
.end method

.method private final sendEventForNativeAnimatedEvent(Lcom/swmansion/gesturehandler/react/RNGestureHandlerEvent;)V
    .locals 2

    .line 637
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    const-string v1, "getReactApplicationContext(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/react/bridge/ReactContext;

    check-cast p1, Lcom/facebook/react/uimanager/events/Event;

    invoke-static {v0, p1}, Lcom/swmansion/gesturehandler/ReactContextExtensionsKt;->dispatchEvent(Lcom/facebook/react/bridge/ReactContext;Lcom/facebook/react/uimanager/events/Event;)V

    return-void
.end method

.method private final sendEventForReanimated(Lcom/facebook/react/uimanager/events/Event;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/facebook/react/uimanager/events/Event<",
            "TT;>;>(TT;)V"
        }
    .end annotation

    .line 628
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->sendEventForDirectEvent(Lcom/facebook/react/uimanager/events/Event;)V

    return-void
.end method

.method private final updateGestureHandlerHelper(ILcom/facebook/react/bridge/ReadableMap;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "TT;>;>(I",
            "Lcom/facebook/react/bridge/ReadableMap;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->registry:Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;

    .line 394
    invoke-virtual {v0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;->getHandler(I)Lcom/swmansion/gesturehandler/core/GestureHandler;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 396
    invoke-direct {p0, v0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->findFactoryForHandler(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->interactionManager:Lcom/swmansion/gesturehandler/react/RNGestureHandlerInteractionManager;

    .line 398
    invoke-virtual {v2, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerInteractionManager;->dropRelationsForHandlerWithTag(I)V

    iget-object p1, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->interactionManager:Lcom/swmansion/gesturehandler/react/RNGestureHandlerInteractionManager;

    .line 399
    invoke-virtual {p1, v0, p2}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerInteractionManager;->configureInteractions(Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/facebook/react/bridge/ReadableMap;)V

    .line 400
    invoke-virtual {v1, v0, p2}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$HandlerFactory;->configure(Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/facebook/react/bridge/ReadableMap;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public attachGestureHandler(DDD)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    double-to-int p1, p1

    double-to-int p2, p3

    double-to-int p3, p5

    iget-object p4, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->registry:Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;

    .line 387
    invoke-virtual {p4, p1, p2, p3}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;->attachHandlerToView(III)Z

    move-result p2

    if-eqz p2, :cond_0

    return-void

    .line 388
    :cond_0
    new-instance p2, Lcom/facebook/react/bridge/JSApplicationIllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "Handler with tag "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " does not exists"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/facebook/react/bridge/JSApplicationIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public createGestureHandler(Ljava/lang/String;DLcom/facebook/react/bridge/ReadableMap;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    const-string v0, "handlerName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "config"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    double-to-int p2, p2

    .line 375
    invoke-direct {p0, p1, p2, p4}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->createGestureHandlerHelper(Ljava/lang/String;ILcom/facebook/react/bridge/ReadableMap;)V

    return-void
.end method

.method public dropGestureHandler(D)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    double-to-int p1, p1

    iget-object p2, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->interactionManager:Lcom/swmansion/gesturehandler/react/RNGestureHandlerInteractionManager;

    .line 415
    invoke-virtual {p2, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerInteractionManager;->dropRelationsForHandlerWithTag(I)V

    iget-object p2, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->registry:Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;

    .line 416
    invoke-virtual {p2, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;->dropHandler(I)V

    return-void
.end method

.method public flushOperations()V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    return-void
.end method

.method public getConstants()Ljava/util/Map;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x2

    .line 467
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-array v2, v0, [Lkotlin/Pair;

    const/4 v3, 0x6

    new-array v3, v3, [Lkotlin/Pair;

    const-string v4, "UNDETERMINED"

    const/4 v5, 0x0

    .line 466
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v4, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v4

    aput-object v4, v3, v5

    const-string v4, "BEGAN"

    .line 467
    invoke-static {v4, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v4

    const/4 v6, 0x1

    .line 470
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v4, v3, v6

    const/4 v4, 0x4

    .line 468
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "ACTIVE"

    invoke-static {v9, v8}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v9

    aput-object v9, v3, v0

    const-string v9, "CANCELLED"

    const/4 v10, 0x3

    .line 469
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v9, v11}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v9

    aput-object v9, v3, v10

    const-string v9, "FAILED"

    .line 470
    invoke-static {v9, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v9

    aput-object v9, v3, v4

    const-string v9, "END"

    const/4 v11, 0x5

    .line 471
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v9, v12}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v9

    aput-object v9, v3, v11

    .line 465
    invoke-static {v3}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v3

    const-string v9, "State"

    invoke-static {v9, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v3

    aput-object v3, v2, v5

    new-array v3, v4, [Lkotlin/Pair;

    const-string v4, "RIGHT"

    .line 474
    invoke-static {v4, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v4

    aput-object v4, v3, v5

    const-string v4, "LEFT"

    .line 475
    invoke-static {v4, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    aput-object v1, v3, v6

    const-string v1, "UP"

    .line 476
    invoke-static {v1, v8}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    aput-object v1, v3, v0

    const/16 v0, 0x8

    .line 477
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "DOWN"

    invoke-static {v1, v0}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v0

    aput-object v0, v3, v10

    .line 473
    invoke-static {v3}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    const-string v1, "Direction"

    invoke-static {v1, v0}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v0

    aput-object v0, v2, v6

    .line 464
    invoke-static {v2}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "RNGestureHandlerModule"

    return-object v0
.end method

.method public final getRegistry()Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->registry:Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;

    return-object v0
.end method

.method public handleClearJSResponder()V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    return-void
.end method

.method public handleSetJSResponder(DZ)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    double-to-int p1, p1

    .line 422
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->findRootHelperForViewAncestor(I)Lcom/swmansion/gesturehandler/react/RNGestureHandlerRootHelper;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 423
    invoke-virtual {p2, p1, p3}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerRootHelper;->handleSetJSResponder(IZ)V

    :cond_0
    return-void
.end method

.method public install()Z
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
        isBlockingSynchronousMethod = true
    .end annotation

    .line 448
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    new-instance v1, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule$$ExternalSyntheticLambda0;-><init>(Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;)V

    invoke-virtual {v0, v1}, Lcom/facebook/react/bridge/ReactApplicationContext;->runOnJSQueueThread(Ljava/lang/Runnable;)Z

    const/4 v0, 0x1

    return v0
.end method

.method public invalidate()V
    .locals 4

    iget-object v0, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->registry:Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;

    .line 483
    invoke-virtual {v0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;->dropAllHandlers()V

    iget-object v0, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->interactionManager:Lcom/swmansion/gesturehandler/react/RNGestureHandlerInteractionManager;

    .line 484
    invoke-virtual {v0}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerInteractionManager;->reset()V

    iget-object v0, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->roots:Ljava/util/List;

    .line 485
    monitor-enter v0

    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->roots:Ljava/util/List;

    .line 486
    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->roots:Ljava/util/List;

    .line 487
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget-object v2, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->roots:Ljava/util/List;

    const/4 v3, 0x0

    .line 488
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/swmansion/gesturehandler/react/RNGestureHandlerRootHelper;

    .line 489
    invoke-virtual {v2}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerRootHelper;->tearDown()V

    iget-object v2, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->roots:Ljava/util/List;

    .line 490
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v2, v1, :cond_0

    goto :goto_0

    .line 491
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Expected root helper to get unregistered while tearing down"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 494
    :cond_1
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 485
    monitor-exit v0

    .line 495
    invoke-super {p0}, Lcom/swmansion/gesturehandler/NativeRNGestureHandlerModuleSpec;->invalidate()V

    return-void

    :catchall_0
    move-exception v1

    .line 485
    monitor-exit v0

    throw v1
.end method

.method public final registerRootHelper(Lcom/swmansion/gesturehandler/react/RNGestureHandlerRootHelper;)V
    .locals 4

    const-string v0, "Root helper"

    const-string v1, "root"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->roots:Ljava/util/List;

    .line 499
    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->roots:Ljava/util/List;

    .line 500
    invoke-interface {v2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v0, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->roots:Ljava/util/List;

    .line 503
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 499
    monitor-exit v1

    return-void

    .line 501
    :cond_0
    :try_start_1
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " already registered"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 499
    monitor-exit v1

    throw p1
.end method

.method public setGestureHandlerState(II)V
    .locals 2

    iget-object v0, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->registry:Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;

    .line 435
    invoke-virtual {v0, p1}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerRegistry;->getHandler(I)Lcom/swmansion/gesturehandler/core/GestureHandler;

    move-result-object p1

    if-eqz p1, :cond_5

    const/4 v0, 0x1

    if-eq p2, v0, :cond_4

    const/4 v1, 0x2

    if-eq p2, v1, :cond_3

    const/4 v1, 0x3

    if-eq p2, v1, :cond_2

    const/4 v1, 0x4

    if-eq p2, v1, :cond_1

    const/4 v0, 0x5

    if-eq p2, v0, :cond_0

    goto :goto_0

    .line 439
    :cond_0
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->end()V

    goto :goto_0

    .line 437
    :cond_1
    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->activate(Z)V

    goto :goto_0

    .line 441
    :cond_2
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->cancel()V

    goto :goto_0

    .line 438
    :cond_3
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->begin()V

    goto :goto_0

    .line 440
    :cond_4
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->fail()V

    :cond_5
    :goto_0
    return-void
.end method

.method public final unregisterRootHelper(Lcom/swmansion/gesturehandler/react/RNGestureHandlerRootHelper;)V
    .locals 2

    const-string v0, "root"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->roots:Ljava/util/List;

    .line 508
    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->roots:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public updateGestureHandler(DLcom/facebook/react/bridge/ReadableMap;)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    const-string v0, "config"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    double-to-int p1, p1

    .line 409
    invoke-direct {p0, p1, p3}, Lcom/swmansion/gesturehandler/react/RNGestureHandlerModule;->updateGestureHandlerHelper(ILcom/facebook/react/bridge/ReadableMap;)V

    return-void
.end method
