.class public final Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;
.super Ljava/lang/Object;
.source "GestureHandlerOrchestrator.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;,
        Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nGestureHandlerOrchestrator.kt\nKotlin\n*S Kotlin\n*F\n+ 1 GestureHandlerOrchestrator.kt\ncom/swmansion/gesturehandler/core/GestureHandlerOrchestrator\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,707:1\n1747#2,3:708\n1747#2,3:711\n1747#2,3:714\n1855#2,2:717\n*S KotlinDebug\n*F\n+ 1 GestureHandlerOrchestrator.kt\ncom/swmansion/gesturehandler/core/GestureHandlerOrchestrator\n*L\n86#1:708,3\n88#1:711,3\n330#1:714,3\n594#1:717,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000r\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0007\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0014\n\u0002\u0008\u0014\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 H2\u00020\u0001:\u0001HB\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0002\u0010\u0008J\u000e\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020!J\u0014\u0010\"\u001a\u00020\u001f2\n\u0010#\u001a\u0006\u0012\u0002\u0008\u00030\rH\u0002J\u0010\u0010$\u001a\u00020\u00132\u0006\u0010 \u001a\u00020!H\u0002J\u0008\u0010%\u001a\u00020\u001fH\u0002J\u0008\u0010&\u001a\u00020\u001fH\u0002J\u0008\u0010\'\u001a\u00020\u001fH\u0002J\u001c\u0010(\u001a\u00020\u001f2\n\u0010#\u001a\u0006\u0012\u0002\u0008\u00030\r2\u0006\u0010)\u001a\u00020*H\u0002J\u0010\u0010+\u001a\u00020\u001f2\u0006\u0010,\u001a\u00020*H\u0002J \u0010-\u001a\u00020\u00132\u0006\u0010 \u001a\u00020!2\u0006\u0010.\u001a\u00020/2\u0006\u00100\u001a\u00020\nH\u0002J\u0010\u00101\u001a\u00020\u001f2\u0006\u0010,\u001a\u00020*H\u0002J(\u00101\u001a\u00020\u00132\u0006\u00102\u001a\u00020\u00032\u0006\u0010.\u001a\u00020/2\u0006\u00100\u001a\u00020\n2\u0006\u0010,\u001a\u00020*H\u0002J\u001a\u00103\u001a\u000e\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\r\u0018\u00010\u000c2\u0006\u0010 \u001a\u00020!J\u0014\u00104\u001a\u00020\u00132\n\u0010#\u001a\u0006\u0012\u0002\u0008\u00030\rH\u0002J\u0006\u00105\u001a\u00020\u0013J\u0010\u00106\u001a\u00020\u00132\u0006\u0010 \u001a\u00020!H\u0002J\u0012\u00107\u001a\u00020\u00132\u0008\u0010 \u001a\u0004\u0018\u00010!H\u0002J\u0010\u00108\u001a\u00020\u00132\u0006\u0010 \u001a\u00020!H\u0002J\u0014\u00109\u001a\u00020\u001f2\n\u0010#\u001a\u0006\u0012\u0002\u0008\u00030\rH\u0002J\"\u0010:\u001a\u00020\u001f2\n\u0010#\u001a\u0006\u0012\u0002\u0008\u00030\r2\u0006\u0010;\u001a\u00020\n2\u0006\u0010<\u001a\u00020\nJ\u000e\u0010=\u001a\u00020\u00132\u0006\u0010,\u001a\u00020*J\u001c\u0010>\u001a\u00020\u001f2\n\u0010#\u001a\u0006\u0012\u0002\u0008\u00030\r2\u0006\u0010 \u001a\u00020!H\u0002J(\u0010?\u001a\u00020\u00132\u0006\u0010 \u001a\u00020!2\u0006\u0010.\u001a\u00020/2\u0006\u00100\u001a\u00020\n2\u0006\u0010,\u001a\u00020*H\u0002J\u0008\u0010@\u001a\u00020\u001fH\u0002J\u0014\u0010A\u001a\u00020\u00132\n\u0010#\u001a\u0006\u0012\u0002\u0008\u00030\rH\u0002J\u0018\u0010B\u001a\u00020*2\u0008\u0010 \u001a\u0004\u0018\u00010!2\u0006\u0010,\u001a\u00020*J\u0018\u0010C\u001a\u00020D2\u0008\u0010 \u001a\u0004\u0018\u00010!2\u0006\u0010E\u001a\u00020DJ(\u0010F\u001a\u00020\u00132\u0006\u0010 \u001a\u00020!2\u0006\u0010.\u001a\u00020/2\u0006\u00100\u001a\u00020\n2\u0006\u0010,\u001a\u00020*H\u0002J\u0014\u0010G\u001a\u00020\u001f2\n\u0010#\u001a\u0006\u0012\u0002\u0008\u00030\rH\u0002R\u000e\u0010\t\u001a\u00020\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R&\u0010\u000b\u001a\u001a\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\r0\u000cj\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\r`\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001e\u0010\u000f\u001a\u0012\u0012\u0004\u0012\u00020\n0\u0010j\u0008\u0012\u0004\u0012\u00020\n`\u0011X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u000e\u00a2\u0006\u0002\n\u0000R&\u0010\u0014\u001a\u001a\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\r0\u000cj\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\r`\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0013X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0017\u001a\u00020\u0018X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0019\u0010\u001a\"\u0004\u0008\u001b\u0010\u001cR&\u0010\u001d\u001a\u001a\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\r0\u000cj\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\r`\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006I"
    }
    d2 = {
        "Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;",
        "",
        "wrapperView",
        "Landroid/view/ViewGroup;",
        "handlerRegistry",
        "Lcom/swmansion/gesturehandler/core/GestureHandlerRegistry;",
        "viewConfigHelper",
        "Lcom/swmansion/gesturehandler/core/ViewConfigurationHelper;",
        "(Landroid/view/ViewGroup;Lcom/swmansion/gesturehandler/core/GestureHandlerRegistry;Lcom/swmansion/gesturehandler/core/ViewConfigurationHelper;)V",
        "activationIndex",
        "",
        "awaitingHandlers",
        "Ljava/util/ArrayList;",
        "Lcom/swmansion/gesturehandler/core/GestureHandler;",
        "Lkotlin/collections/ArrayList;",
        "awaitingHandlersTags",
        "Ljava/util/HashSet;",
        "Lkotlin/collections/HashSet;",
        "finishedHandlersCleanupScheduled",
        "",
        "gestureHandlers",
        "handlingChangeSemaphore",
        "isHandlingTouch",
        "minimumAlphaForTraversal",
        "",
        "getMinimumAlphaForTraversal",
        "()F",
        "setMinimumAlphaForTraversal",
        "(F)V",
        "preparedHandlers",
        "activateNativeHandlersForView",
        "",
        "view",
        "Landroid/view/View;",
        "addAwaitingHandler",
        "handler",
        "canReceiveEvents",
        "cancelAll",
        "cleanupAwaitingHandlers",
        "cleanupFinishedHandlers",
        "deliverEventToGestureHandler",
        "sourceEvent",
        "Landroid/view/MotionEvent;",
        "deliverEventToGestureHandlers",
        "event",
        "extractAncestorHandlers",
        "coords",
        "",
        "pointerId",
        "extractGestureHandlers",
        "viewGroup",
        "getHandlersForView",
        "hasOtherHandlerToWaitFor",
        "isAnyHandlerActive",
        "isClipping",
        "isViewAttachedUnderWrapper",
        "isViewOverflowingParent",
        "makeActive",
        "onHandlerStateChange",
        "newState",
        "prevState",
        "onTouchEvent",
        "recordHandlerIfNotPresent",
        "recordViewHandlersForPointer",
        "scheduleFinishedHandlersCleanup",
        "shouldBeCancelledByFinishedHandler",
        "transformEventToViewCoords",
        "transformPointToViewCoords",
        "Landroid/graphics/PointF;",
        "point",
        "traverseWithPointerEvents",
        "tryActivate",
        "Companion",
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
.field public static final Companion:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;

.field private static final DEFAULT_MIN_ALPHA_FOR_TRAVERSAL:F

.field private static final handlersComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static final inverseMatrix:Landroid/graphics/Matrix;

.field private static final matrixTransformCoords:[F

.field private static final tempCoords:[F

.field private static final tempPoint:Landroid/graphics/PointF;


# instance fields
.field private activationIndex:I

.field private final awaitingHandlers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;>;"
        }
    .end annotation
.end field

.field private final awaitingHandlersTags:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private finishedHandlersCleanupScheduled:Z

.field private final gestureHandlers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;>;"
        }
    .end annotation
.end field

.field private final handlerRegistry:Lcom/swmansion/gesturehandler/core/GestureHandlerRegistry;

.field private handlingChangeSemaphore:I

.field private isHandlingTouch:Z

.field private minimumAlphaForTraversal:F

.field private final preparedHandlers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;>;"
        }
    .end annotation
.end field

.field private final viewConfigHelper:Lcom/swmansion/gesturehandler/core/ViewConfigurationHelper;

.field private final wrapperView:Landroid/view/ViewGroup;


# direct methods
.method public static synthetic $r8$lambda$1eq5T9CToOGx3YkRVwRCuoKu-gw(Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/swmansion/gesturehandler/core/GestureHandler;)I
    .locals 0

    invoke-static {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->handlersComparator$lambda$12(Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/swmansion/gesturehandler/core/GestureHandler;)I

    move-result p0

    return p0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->Companion:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;

    .line 614
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    sput-object v0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->tempPoint:Landroid/graphics/PointF;

    const/4 v0, 0x2

    new-array v1, v0, [F

    sput-object v1, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->matrixTransformCoords:[F

    .line 616
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    sput-object v1, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->inverseMatrix:Landroid/graphics/Matrix;

    new-array v0, v0, [F

    sput-object v0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->tempCoords:[F

    .line 618
    new-instance v0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->handlersComparator:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup;Lcom/swmansion/gesturehandler/core/GestureHandlerRegistry;Lcom/swmansion/gesturehandler/core/ViewConfigurationHelper;)V
    .locals 1

    const-string/jumbo v0, "wrapperView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "handlerRegistry"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "viewConfigHelper"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->wrapperView:Landroid/view/ViewGroup;

    iput-object p2, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->handlerRegistry:Lcom/swmansion/gesturehandler/core/GestureHandlerRegistry;

    iput-object p3, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->viewConfigHelper:Lcom/swmansion/gesturehandler/core/ViewConfigurationHelper;

    .line 23
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->gestureHandlers:Ljava/util/ArrayList;

    .line 24
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->awaitingHandlers:Ljava/util/ArrayList;

    .line 25
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->preparedHandlers:Ljava/util/ArrayList;

    .line 32
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->awaitingHandlersTags:Ljava/util/HashSet;

    return-void
.end method

.method public static final synthetic access$getInverseMatrix$cp()Landroid/graphics/Matrix;
    .locals 1

    sget-object v0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->inverseMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public static final synthetic access$getMatrixTransformCoords$cp()[F
    .locals 1

    sget-object v0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->matrixTransformCoords:[F

    return-object v0
.end method

.method private final addAwaitingHandler(Lcom/swmansion/gesturehandler/core/GestureHandler;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->awaitingHandlers:Ljava/util/ArrayList;

    .line 404
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->awaitingHandlers:Ljava/util/ArrayList;

    .line 408
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->awaitingHandlersTags:Ljava/util/HashSet;

    .line 409
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getTag()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const/4 v0, 0x1

    .line 412
    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setAwaiting(Z)V

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->activationIndex:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->activationIndex:I

    .line 413
    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setActivationIndex(I)V

    return-void
.end method

.method private final canReceiveEvents(Landroid/view/View;)Z
    .locals 1

    .line 586
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result p1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->minimumAlphaForTraversal:F

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private final cancelAll()V
    .locals 2

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->awaitingHandlers:Ljava/util/ArrayList;

    .line 239
    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->reversed(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/swmansion/gesturehandler/core/GestureHandler;

    .line 240
    invoke-virtual {v1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->cancel()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->preparedHandlers:Ljava/util/ArrayList;

    .line 244
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->preparedHandlers:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->gestureHandlers:Ljava/util/ArrayList;

    .line 245
    check-cast v1, Ljava/util/Collection;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->gestureHandlers:Ljava/util/ArrayList;

    .line 247
    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->reversed(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/swmansion/gesturehandler/core/GestureHandler;

    .line 248
    invoke-virtual {v1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->cancel()V

    goto :goto_1

    :cond_1
    return-void
.end method

.method private final cleanupAwaitingHandlers()V
    .locals 3

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->awaitingHandlers:Ljava/util/ArrayList;

    .line 108
    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    .line 110
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/swmansion/gesturehandler/core/GestureHandler;

    .line 111
    invoke-virtual {v1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isAwaiting()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->awaitingHandlers:Ljava/util/ArrayList;

    .line 112
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v2, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->awaitingHandlersTags:Ljava/util/HashSet;

    .line 113
    invoke-virtual {v1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getTag()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-void
.end method

.method private final cleanupFinishedHandlers()V
    .locals 5

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->gestureHandlers:Ljava/util/ArrayList;

    .line 69
    check-cast v0, Ljava/util/List;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->asReversedMutable(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/swmansion/gesturehandler/core/GestureHandler;

    sget-object v3, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->Companion:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;

    .line 70
    invoke-virtual {v1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getState()I

    move-result v4

    invoke-static {v3, v4}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;->access$isFinished(Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;I)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isAwaiting()Z

    move-result v3

    if-nez v3, :cond_0

    .line 71
    invoke-virtual {v1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->reset()V

    .line 73
    invoke-virtual {v1, v2}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setActive(Z)V

    .line 74
    invoke-virtual {v1, v2}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setAwaiting(Z)V

    const v2, 0x7fffffff

    .line 75
    invoke-virtual {v1, v2}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setActivationIndex(I)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->gestureHandlers:Ljava/util/ArrayList;

    .line 80
    check-cast v0, Ljava/util/List;

    sget-object v1, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$cleanupFinishedHandlers$2;->INSTANCE:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$cleanupFinishedHandlers$2;

    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->removeAll(Ljava/util/List;Lkotlin/jvm/functions/Function1;)Z

    iput-boolean v2, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->finishedHandlersCleanupScheduled:Z

    return-void
.end method

.method private final deliverEventToGestureHandler(Lcom/swmansion/gesturehandler/core/GestureHandler;Landroid/view/MotionEvent;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;",
            "Landroid/view/MotionEvent;",
            ")V"
        }
    .end annotation

    .line 253
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getView()Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->isViewAttachedUnderWrapper(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 254
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->cancel()V

    return-void

    .line 257
    :cond_0
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->wantEvents()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    .line 261
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 262
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getView()Landroid/view/View;

    move-result-object v1

    invoke-static {p2}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v2

    const-string v3, "obtain(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v1, v2}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->transformEventToViewCoords(Landroid/view/View;Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v1

    .line 272
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getNeedsPointerData()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getState()I

    move-result v2

    if-eqz v2, :cond_2

    .line 273
    invoke-virtual {p1, v1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->updatePointerData(Landroid/view/MotionEvent;)V

    .line 276
    :cond_2
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isAwaiting()Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v2, 0x2

    if-eq v0, v2, :cond_9

    .line 277
    :cond_3
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getState()I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_4

    move v2, v3

    goto :goto_0

    :cond_4
    move v2, v4

    .line 278
    :goto_0
    invoke-virtual {p1, v1, p2}, Lcom/swmansion/gesturehandler/core/GestureHandler;->handle(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)V

    .line 279
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isActive()Z

    move-result p2

    if-eqz p2, :cond_6

    .line 287
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getShouldResetProgress()Z

    move-result p2

    if-eqz p2, :cond_5

    .line 288
    invoke-virtual {p1, v4}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setShouldResetProgress(Z)V

    .line 289
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->resetProgress()V

    .line 291
    :cond_5
    invoke-virtual {p1, v1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchHandlerUpdate(Landroid/view/MotionEvent;)V

    .line 294
    :cond_6
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getNeedsPointerData()Z

    move-result p2

    if-eqz p2, :cond_7

    if-eqz v2, :cond_7

    .line 295
    invoke-virtual {p1, v1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->updatePointerData(Landroid/view/MotionEvent;)V

    :cond_7
    if-eq v0, v3, :cond_8

    const/4 p2, 0x6

    if-eq v0, p2, :cond_8

    const/16 p2, 0xa

    if-eq v0, p2, :cond_8

    goto :goto_1

    .line 301
    :cond_8
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result p2

    invoke-virtual {v1, p2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p2

    .line 302
    invoke-virtual {p1, p2}, Lcom/swmansion/gesturehandler/core/GestureHandler;->stopTrackingPointer(I)V

    .line 306
    :cond_9
    :goto_1
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    return-void
.end method

.method private final deliverEventToGestureHandlers(Landroid/view/MotionEvent;)V
    .locals 2

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->preparedHandlers:Ljava/util/ArrayList;

    .line 224
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->preparedHandlers:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->gestureHandlers:Ljava/util/ArrayList;

    .line 225
    check-cast v1, Ljava/util/Collection;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->preparedHandlers:Ljava/util/ArrayList;

    .line 232
    check-cast v0, Ljava/util/List;

    sget-object v1, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->handlersComparator:Ljava/util/Comparator;

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->sortWith(Ljava/util/List;Ljava/util/Comparator;)V

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->preparedHandlers:Ljava/util/ArrayList;

    .line 233
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/swmansion/gesturehandler/core/GestureHandler;

    .line 234
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p0, v1, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->deliverEventToGestureHandler(Lcom/swmansion/gesturehandler/core/GestureHandler;Landroid/view/MotionEvent;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private final extractAncestorHandlers(Landroid/view/View;[FI)Z
    .locals 10

    .line 444
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-eqz v0, :cond_3

    .line 447
    instance-of v3, v0, Landroid/view/ViewGroup;

    if-eqz v3, :cond_2

    .line 448
    move-object v3, v0

    check-cast v3, Landroid/view/ViewGroup;

    iget-object v4, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->handlerRegistry:Lcom/swmansion/gesturehandler/core/GestureHandlerRegistry;

    .line 450
    move-object v5, v0

    check-cast v5, Landroid/view/View;

    invoke-interface {v4, v5}, Lcom/swmansion/gesturehandler/core/GestureHandlerRegistry;->getHandlersForView(Landroid/view/View;)Ljava/util/ArrayList;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 451
    monitor-enter v4

    .line 452
    :try_start_0
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/swmansion/gesturehandler/core/GestureHandler;

    .line 453
    invoke-virtual {v6}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isEnabled()Z

    move-result v7

    if-eqz v7, :cond_0

    aget v7, p2, v1

    const/4 v8, 0x1

    aget v9, p2, v8

    invoke-virtual {v6, p1, v7, v9}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isWithinBounds(Landroid/view/View;FF)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 455
    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v2, v3

    check-cast v2, Landroid/view/View;

    invoke-direct {p0, v6, v2}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->recordHandlerIfNotPresent(Lcom/swmansion/gesturehandler/core/GestureHandler;Landroid/view/View;)V

    .line 456
    invoke-virtual {v6, p3}, Lcom/swmansion/gesturehandler/core/GestureHandler;->startTrackingPointer(I)V

    move v2, v8

    goto :goto_1

    .line 459
    :cond_1
    sget-object v3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 451
    monitor-exit v4

    goto :goto_2

    :catchall_0
    move-exception p1

    monitor-exit v4

    throw p1

    .line 463
    :cond_2
    :goto_2
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_0

    :cond_3
    return v2
.end method

.method private final extractGestureHandlers(Landroid/view/MotionEvent;)V
    .locals 5

    .line 503
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    .line 504
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    sget-object v2, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->tempCoords:[F

    const/4 v3, 0x0

    .line 505
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    aput v4, v2, v3

    const/4 v3, 0x1

    .line 506
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    aput v0, v2, v3

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->wrapperView:Landroid/view/ViewGroup;

    .line 507
    check-cast v0, Landroid/view/View;

    invoke-direct {p0, v0, v2, v1, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->traverseWithPointerEvents(Landroid/view/View;[FILandroid/view/MotionEvent;)Z

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->wrapperView:Landroid/view/ViewGroup;

    .line 508
    invoke-direct {p0, v0, v2, v1, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->extractGestureHandlers(Landroid/view/ViewGroup;[FILandroid/view/MotionEvent;)Z

    return-void
.end method

.method private final extractGestureHandlers(Landroid/view/ViewGroup;[FILandroid/view/MotionEvent;)Z
    .locals 15

    move-object v0, p0

    move-object/from16 v1, p2

    .line 512
    invoke-virtual/range {p1 .. p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    :goto_0
    const/4 v4, -0x1

    const/4 v5, 0x0

    if-ge v4, v2, :cond_4

    iget-object v4, v0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->viewConfigHelper:Lcom/swmansion/gesturehandler/core/ViewConfigurationHelper;

    move-object/from16 v12, p1

    .line 514
    invoke-interface {v4, v12, v2}, Lcom/swmansion/gesturehandler/core/ViewConfigurationHelper;->getChildInDrawingOrderAtIndex(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object v4

    .line 515
    invoke-direct {p0, v4}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->canReceiveEvents(Landroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_2

    sget-object v13, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->tempPoint:Landroid/graphics/PointF;

    sget-object v14, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->Companion:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;

    .line 517
    aget v7, v1, v5

    aget v8, v1, v3

    move-object v6, v14

    move-object/from16 v9, p1

    move-object v10, v4

    move-object v11, v13

    invoke-static/range {v6 .. v11}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;->access$transformPointToChildViewCoords(Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;FFLandroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/PointF;)V

    .line 518
    aget v6, v1, v5

    .line 519
    aget v7, v1, v3

    .line 520
    iget v8, v13, Landroid/graphics/PointF;->x:F

    aput v8, v1, v5

    .line 521
    iget v8, v13, Landroid/graphics/PointF;->y:F

    aput v8, v1, v3

    .line 523
    invoke-direct {p0, v4}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->isClipping(Landroid/view/View;)Z

    move-result v8

    if-eqz v8, :cond_1

    aget v8, v1, v5

    aget v9, v1, v3

    invoke-static {v14, v8, v9, v4}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;->access$isTransformedTouchPointInView(Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;FFLandroid/view/View;)Z

    move-result v8

    if-eqz v8, :cond_0

    goto :goto_1

    :cond_0
    move/from16 v8, p3

    move-object/from16 v9, p4

    move v4, v5

    goto :goto_2

    :cond_1
    :goto_1
    move/from16 v8, p3

    move-object/from16 v9, p4

    .line 526
    invoke-direct {p0, v4, v1, v8, v9}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->traverseWithPointerEvents(Landroid/view/View;[FILandroid/view/MotionEvent;)Z

    move-result v4

    .line 528
    :goto_2
    aput v6, v1, v5

    .line 529
    aput v7, v1, v3

    if-eqz v4, :cond_3

    return v3

    :cond_2
    move/from16 v8, p3

    move-object/from16 v9, p4

    :cond_3
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_4
    return v5
.end method

.method private static final handlersComparator$lambda$12(Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/swmansion/gesturehandler/core/GestureHandler;)I
    .locals 3

    .line 619
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isActive()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isActive()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isAwaiting()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isAwaiting()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 622
    :cond_1
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getActivationIndex()I

    move-result p1

    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getActivationIndex()I

    move-result p0

    sub-int/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Integer;->signum(I)I

    move-result p0

    goto :goto_2

    .line 623
    :cond_2
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isActive()Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_3

    :goto_0
    move p0, v1

    goto :goto_2

    .line 625
    :cond_3
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isActive()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    :goto_1
    move p0, v2

    goto :goto_2

    .line 627
    :cond_4
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isAwaiting()Z

    move-result p0

    if-eqz p0, :cond_5

    goto :goto_0

    .line 629
    :cond_5
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isAwaiting()Z

    move-result p0

    if-eqz p0, :cond_6

    goto :goto_1

    :cond_6
    const/4 p0, 0x0

    :goto_2
    return p0
.end method

.method private final hasOtherHandlerToWaitFor(Lcom/swmansion/gesturehandler/core/GestureHandler;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->gestureHandlers:Ljava/util/ArrayList;

    .line 86
    check-cast v0, Ljava/lang/Iterable;

    .line 708
    instance-of v1, v0, Ljava/util/Collection;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 709
    :cond_0
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/swmansion/gesturehandler/core/GestureHandler;

    sget-object v3, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->Companion:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;

    .line 86
    invoke-virtual {v1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getState()I

    move-result v4

    invoke-static {v3, v4}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;->access$isFinished(Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;I)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-static {v3, p1, v1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;->access$shouldHandlerWaitForOther(Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/swmansion/gesturehandler/core/GestureHandler;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v2, 0x1

    :cond_2
    :goto_0
    return v2
.end method

.method private final isClipping(Landroid/view/View;)Z
    .locals 1

    .line 591
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->viewConfigHelper:Lcom/swmansion/gesturehandler/core/ViewConfigurationHelper;

    check-cast p1, Landroid/view/ViewGroup;

    invoke-interface {v0, p1}, Lcom/swmansion/gesturehandler/core/ViewConfigurationHelper;->isViewClippingChildren(Landroid/view/ViewGroup;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private final isViewAttachedUnderWrapper(Landroid/view/View;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    iget-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->wrapperView:Landroid/view/ViewGroup;

    const/4 v2, 0x1

    if-ne p1, v1, :cond_1

    return v2

    .line 323
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_2

    iget-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->wrapperView:Landroid/view/ViewGroup;

    if-eq p1, v1, :cond_2

    .line 325
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->wrapperView:Landroid/view/ViewGroup;

    if-ne p1, v1, :cond_3

    move v0, v2

    :cond_3
    return v0
.end method

.method private final isViewOverflowingParent(Landroid/view/View;)Z
    .locals 7

    .line 430
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/view/ViewGroup;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    .line 431
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    sget-object v3, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->matrixTransformCoords:[F

    const/4 v4, 0x0

    .line 433
    aput v4, v3, v1

    const/4 v5, 0x1

    .line 434
    aput v4, v3, v5

    .line 435
    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 436
    aget v2, v3, v1

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v2, v6

    .line 437
    aget v3, v3, v5

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v3, v6

    cmpg-float v6, v2, v4

    if-ltz v6, :cond_2

    .line 439
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v2, v6

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v6

    int-to-float v6, v6

    cmpl-float v2, v2, v6

    if-gtz v2, :cond_2

    cmpg-float v2, v3, v4

    if-ltz v2, :cond_2

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    int-to-float p1, p1

    add-float/2addr v3, p1

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    move-result p1

    int-to-float p1, p1

    cmpl-float p1, v3, p1

    if-lez p1, :cond_3

    :cond_2
    move v1, v5

    :cond_3
    return v1
.end method

.method private final makeActive(Lcom/swmansion/gesturehandler/core/GestureHandler;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;)V"
        }
    .end annotation

    .line 178
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getState()I

    move-result v0

    const/4 v1, 0x0

    .line 180
    invoke-virtual {p1, v1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setAwaiting(Z)V

    const/4 v2, 0x1

    .line 181
    invoke-virtual {p1, v2}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setActive(Z)V

    .line 182
    invoke-virtual {p1, v2}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setShouldResetProgress(Z)V

    iget v3, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->activationIndex:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->activationIndex:I

    .line 183
    invoke-virtual {p1, v3}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setActivationIndex(I)V

    iget-object v3, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->gestureHandlers:Ljava/util/ArrayList;

    .line 186
    check-cast v3, Ljava/util/List;

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->asReversedMutable(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/swmansion/gesturehandler/core/GestureHandler;

    sget-object v5, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->Companion:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;

    .line 187
    invoke-static {v5, v4, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;->access$shouldHandlerBeCancelledBy(Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/swmansion/gesturehandler/core/GestureHandler;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 188
    invoke-virtual {v4}, Lcom/swmansion/gesturehandler/core/GestureHandler;->cancel()V

    goto :goto_0

    :cond_1
    iget-object v3, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->awaitingHandlers:Ljava/util/ArrayList;

    .line 193
    check-cast v3, Ljava/lang/Iterable;

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->reversed(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/swmansion/gesturehandler/core/GestureHandler;

    sget-object v5, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->Companion:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;

    .line 194
    invoke-static {v5, v4, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;->access$shouldHandlerBeCancelledBy(Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/swmansion/gesturehandler/core/GestureHandler;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 195
    invoke-virtual {v4, v1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setAwaiting(Z)V

    goto :goto_1

    .line 198
    :cond_3
    invoke-direct {p0}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->cleanupAwaitingHandlers()V

    if-eq v0, v2, :cond_4

    const/4 v2, 0x3

    if-eq v0, v2, :cond_4

    const/4 v2, 0x2

    const/4 v3, 0x4

    .line 211
    invoke-virtual {p1, v3, v2}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchStateChange(II)V

    if-eq v0, v3, :cond_4

    const/4 v2, 0x5

    .line 214
    invoke-virtual {p1, v2, v3}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchStateChange(II)V

    if-eq v0, v2, :cond_4

    .line 216
    invoke-virtual {p1, v1, v2}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchStateChange(II)V

    :cond_4
    return-void
.end method

.method private final recordHandlerIfNotPresent(Lcom/swmansion/gesturehandler/core/GestureHandler;Landroid/view/View;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->gestureHandlers:Ljava/util/ArrayList;

    .line 418
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->gestureHandlers:Ljava/util/ArrayList;

    .line 422
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    .line 423
    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setActive(Z)V

    .line 424
    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setAwaiting(Z)V

    const v0, 0x7fffffff

    .line 425
    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setActivationIndex(I)V

    .line 426
    invoke-virtual {p1, p2, p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->prepare(Landroid/view/View;Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;)V

    return-void
.end method

.method private final recordViewHandlersForPointer(Landroid/view/View;[FILandroid/view/MotionEvent;)Z
    .locals 9

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->handlerRegistry:Lcom/swmansion/gesturehandler/core/GestureHandlerRegistry;

    .line 471
    invoke-interface {v0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerRegistry;->getHandlersForView(Landroid/view/View;)Ljava/util/ArrayList;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_4

    .line 472
    monitor-enter v0

    .line 473
    :try_start_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v4, v2

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/swmansion/gesturehandler/core/GestureHandler;

    .line 475
    invoke-virtual {v5}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isEnabled()Z

    move-result v6

    if-eqz v6, :cond_0

    aget v6, p2, v2

    aget v7, p2, v1

    invoke-virtual {v5, p1, v6, v7}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isWithinBounds(Landroid/view/View;FF)Z

    move-result v6

    if-nez v6, :cond_1

    goto :goto_0

    :cond_1
    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Integer;

    const/16 v7, 0xa

    .line 480
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    const/16 v7, 0x9

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    const/4 v7, 0x7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x2

    aput-object v7, v6, v8

    invoke-static {v6}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-virtual {p4}, Landroid/view/MotionEvent;->getAction()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    instance-of v6, v5, Lcom/swmansion/gesturehandler/core/HoverGestureHandler;

    if-nez v6, :cond_2

    goto :goto_0

    .line 484
    :cond_2
    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p0, v5, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->recordHandlerIfNotPresent(Lcom/swmansion/gesturehandler/core/GestureHandler;Landroid/view/View;)V

    .line 485
    invoke-virtual {v5, p3}, Lcom/swmansion/gesturehandler/core/GestureHandler;->startTrackingPointer(I)V

    move v4, v1

    goto :goto_0

    .line 488
    :cond_3
    sget-object p4, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 472
    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1

    :cond_4
    move v4, v2

    .line 493
    :goto_1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p4

    int-to-float p4, p4

    aget v0, p2, v2

    const/4 v2, 0x0

    cmpg-float v3, v2, v0

    if-gtz v3, :cond_5

    cmpg-float p4, v0, p4

    if-gtz p4, :cond_5

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p4

    int-to-float p4, p4

    aget v0, p2, v1

    cmpg-float v2, v2, v0

    if-gtz v2, :cond_5

    cmpg-float p4, v0, p4

    if-gtz p4, :cond_5

    .line 494
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->isViewOverflowingParent(Landroid/view/View;)Z

    move-result p4

    if-eqz p4, :cond_5

    invoke-direct {p0, p1, p2, p3}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->extractAncestorHandlers(Landroid/view/View;[FI)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_2

    :cond_5
    move v1, v4

    :goto_2
    return v1
.end method

.method private final scheduleFinishedHandlersCleanup()V
    .locals 1

    iget-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->isHandlingTouch:Z

    if-nez v0, :cond_1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->handlingChangeSemaphore:I

    if-eqz v0, :cond_0

    goto :goto_0

    .line 64
    :cond_0
    invoke-direct {p0}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->cleanupFinishedHandlers()V

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->finishedHandlersCleanupScheduled:Z

    :goto_1
    return-void
.end method

.method private final shouldBeCancelledByFinishedHandler(Lcom/swmansion/gesturehandler/core/GestureHandler;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->gestureHandlers:Ljava/util/ArrayList;

    .line 88
    check-cast v0, Ljava/lang/Iterable;

    .line 711
    instance-of v1, v0, Ljava/util/Collection;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 712
    :cond_0
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/swmansion/gesturehandler/core/GestureHandler;

    sget-object v3, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->Companion:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;

    .line 88
    invoke-static {v3, p1, v1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;->access$shouldHandlerWaitForOther(Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/swmansion/gesturehandler/core/GestureHandler;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getState()I

    move-result v1

    const/4 v3, 0x5

    if-ne v1, v3, :cond_1

    const/4 v2, 0x1

    :cond_2
    :goto_0
    return v2
.end method

.method private final traverseWithPointerEvents(Landroid/view/View;[FILandroid/view/MotionEvent;)Z
    .locals 4

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->viewConfigHelper:Lcom/swmansion/gesturehandler/core/ViewConfigurationHelper;

    .line 539
    invoke-interface {v0, p1}, Lcom/swmansion/gesturehandler/core/ViewConfigurationHelper;->getPointerEventsConfigForView(Landroid/view/View;)Lcom/swmansion/gesturehandler/core/PointerEventsConfig;

    move-result-object v0

    sget-object v1, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v0}, Lcom/swmansion/gesturehandler/core/PointerEventsConfig;->ordinal()I

    move-result v0

    aget v0, v1, v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_5

    const/4 v3, 0x2

    if-eq v0, v3, :cond_4

    const/4 v3, 0x3

    if-eq v0, v3, :cond_2

    const/4 v3, 0x4

    if-ne v0, v3, :cond_1

    .line 574
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 575
    move-object v0, p1

    check-cast v0, Landroid/view/ViewGroup;

    invoke-direct {p0, v0, p2, p3, p4}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->extractGestureHandlers(Landroid/view/ViewGroup;[FILandroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v2

    .line 579
    :goto_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->recordViewHandlersForPointer(Landroid/view/View;[FILandroid/view/MotionEvent;)Z

    move-result p3

    if-nez p3, :cond_6

    if-nez v0, :cond_6

    sget-object p3, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->Companion:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;

    .line 580
    invoke-static {p3, p1, p2}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;->access$shouldHandlerlessViewBecomeTouchTarget(Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;Landroid/view/View;[F)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_1
    new-instance p1, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p1}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p1

    .line 554
    :cond_2
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_3

    .line 555
    move-object v0, p1

    check-cast v0, Landroid/view/ViewGroup;

    invoke-direct {p0, v0, p2, p3, p4}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->extractGestureHandlers(Landroid/view/ViewGroup;[FILandroid/view/MotionEvent;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 558
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->recordViewHandlersForPointer(Landroid/view/View;[FILandroid/view/MotionEvent;)Z

    goto :goto_1

    .line 566
    :cond_3
    instance-of v0, p1, Landroid/widget/EditText;

    if-eqz v0, :cond_5

    .line 567
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->recordViewHandlersForPointer(Landroid/view/View;[FILandroid/view/MotionEvent;)Z

    move-result v1

    goto :goto_1

    .line 547
    :cond_4
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->recordViewHandlersForPointer(Landroid/view/View;[FILandroid/view/MotionEvent;)Z

    move-result p3

    if-nez p3, :cond_6

    sget-object p3, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->Companion:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;

    .line 548
    invoke-static {p3, p1, p2}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;->access$shouldHandlerlessViewBecomeTouchTarget(Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;Landroid/view/View;[F)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    move v1, v2

    :cond_6
    :goto_1
    return v1
.end method

.method private final tryActivate(Lcom/swmansion/gesturehandler/core/GestureHandler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;)V"
        }
    .end annotation

    .line 92
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->shouldBeCancelledByFinishedHandler(Lcom/swmansion/gesturehandler/core/GestureHandler;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 93
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->cancel()V

    return-void

    .line 98
    :cond_0
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->hasOtherHandlerToWaitFor(Lcom/swmansion/gesturehandler/core/GestureHandler;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 99
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->addAwaitingHandler(Lcom/swmansion/gesturehandler/core/GestureHandler;)V

    goto :goto_0

    .line 102
    :cond_1
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->makeActive(Lcom/swmansion/gesturehandler/core/GestureHandler;)V

    const/4 v0, 0x0

    .line 103
    invoke-virtual {p1, v0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setAwaiting(Z)V

    :goto_0
    return-void
.end method


# virtual methods
.method public final activateNativeHandlersForView(Landroid/view/View;)V
    .locals 3

    const-string/jumbo v0, "view"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->handlerRegistry:Lcom/swmansion/gesturehandler/core/GestureHandlerRegistry;

    .line 594
    invoke-interface {v0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerRegistry;->getHandlersForView(Landroid/view/View;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_1

    check-cast v0, Ljava/lang/Iterable;

    .line 717
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/swmansion/gesturehandler/core/GestureHandler;

    .line 595
    instance-of v2, v1, Lcom/swmansion/gesturehandler/core/NativeViewGestureHandler;

    if-nez v2, :cond_0

    goto :goto_0

    .line 598
    :cond_0
    invoke-direct {p0, v1, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->recordHandlerIfNotPresent(Lcom/swmansion/gesturehandler/core/GestureHandler;Landroid/view/View;)V

    .line 600
    new-instance v2, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$activateNativeHandlersForView$1$1;

    invoke-direct {v2, v1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$activateNativeHandlersForView$1$1;-><init>(Lcom/swmansion/gesturehandler/core/GestureHandler;)V

    check-cast v2, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v1, v2}, Lcom/swmansion/gesturehandler/core/GestureHandler;->withMarkedAsInBounds(Lkotlin/jvm/functions/Function0;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final getHandlersForView(Landroid/view/View;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;>;"
        }
    .end annotation

    const-string/jumbo v0, "view"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->handlerRegistry:Lcom/swmansion/gesturehandler/core/GestureHandlerRegistry;

    .line 58
    invoke-interface {v0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerRegistry;->getHandlersForView(Landroid/view/View;)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1
.end method

.method public final getMinimumAlphaForTraversal()F
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->minimumAlphaForTraversal:F

    return v0
.end method

.method public final isAnyHandlerActive()Z
    .locals 4

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->gestureHandlers:Ljava/util/ArrayList;

    .line 330
    check-cast v0, Ljava/lang/Iterable;

    .line 714
    instance-of v1, v0, Ljava/util/Collection;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 715
    :cond_0
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/swmansion/gesturehandler/core/GestureHandler;

    .line 330
    invoke-virtual {v1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getState()I

    move-result v1

    const/4 v3, 0x4

    if-ne v1, v3, :cond_1

    const/4 v2, 0x1

    :cond_2
    :goto_0
    return v2
.end method

.method public final onHandlerStateChange(Lcom/swmansion/gesturehandler/core/GestureHandler;II)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;II)V"
        }
    .end annotation

    const-string v0, "handler"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->handlingChangeSemaphore:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->handlingChangeSemaphore:I

    sget-object v0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->Companion:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;

    .line 121
    invoke-static {v0, p2}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;->access$isFinished(Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;I)Z

    move-result v0

    const/4 v2, 0x2

    const/4 v3, 0x3

    const/4 v4, 0x5

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->awaitingHandlers:Ljava/util/ArrayList;

    .line 124
    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    .line 127
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/swmansion/gesturehandler/core/GestureHandler;

    sget-object v6, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->Companion:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;

    .line 128
    invoke-static {v6, v5, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;->access$shouldHandlerWaitForOther(Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator$Companion;Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/swmansion/gesturehandler/core/GestureHandler;)Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->awaitingHandlersTags:Ljava/util/HashSet;

    invoke-virtual {v5}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getTag()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    goto :goto_0

    :cond_1
    if-ne p2, v4, :cond_3

    .line 134
    invoke-virtual {v5}, Lcom/swmansion/gesturehandler/core/GestureHandler;->cancel()V

    .line 135
    invoke-virtual {v5}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getState()I

    move-result v6

    if-ne v6, v4, :cond_2

    .line 140
    invoke-virtual {v5, v3, v2}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchStateChange(II)V

    :cond_2
    const/4 v6, 0x0

    .line 145
    invoke-virtual {v5, v6}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setAwaiting(Z)V

    goto :goto_0

    .line 148
    :cond_3
    invoke-direct {p0, v5}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->tryActivate(Lcom/swmansion/gesturehandler/core/GestureHandler;)V

    goto :goto_0

    .line 151
    :cond_4
    invoke-direct {p0}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->cleanupAwaitingHandlers()V

    :cond_5
    const/4 v0, 0x4

    if-ne p2, v0, :cond_6

    .line 154
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->tryActivate(Lcom/swmansion/gesturehandler/core/GestureHandler;)V

    goto :goto_2

    :cond_6
    if-eq p3, v0, :cond_9

    if-ne p3, v4, :cond_7

    goto :goto_1

    :cond_7
    if-nez p3, :cond_8

    if-eq p2, v3, :cond_c

    .line 171
    :cond_8
    invoke-virtual {p1, p2, p3}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchStateChange(II)V

    goto :goto_2

    .line 156
    :cond_9
    :goto_1
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isActive()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 157
    invoke-virtual {p1, p2, p3}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchStateChange(II)V

    goto :goto_2

    :cond_a
    if-ne p3, v0, :cond_c

    if-eq p2, v3, :cond_b

    if-ne p2, v1, :cond_c

    .line 164
    :cond_b
    invoke-virtual {p1, p2, v2}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchStateChange(II)V

    :cond_c
    :goto_2
    iget p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->handlingChangeSemaphore:I

    sub-int/2addr p1, v1

    iput p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->handlingChangeSemaphore:I

    .line 174
    invoke-direct {p0}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->scheduleFinishedHandlersCleanup()V

    return-void
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->isHandlingTouch:Z

    .line 44
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    if-eqz v1, :cond_1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    const/4 v2, 0x5

    if-eq v1, v2, :cond_1

    const/4 v2, 0x7

    if-eq v1, v2, :cond_1

    goto :goto_0

    .line 48
    :cond_0
    invoke-direct {p0}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->cancelAll()V

    goto :goto_0

    .line 46
    :cond_1
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->extractGestureHandlers(Landroid/view/MotionEvent;)V

    .line 50
    :goto_0
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->deliverEventToGestureHandlers(Landroid/view/MotionEvent;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->isHandlingTouch:Z

    iget-boolean p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->finishedHandlersCleanupScheduled:Z

    if-eqz p1, :cond_2

    iget p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->handlingChangeSemaphore:I

    if-nez p1, :cond_2

    .line 53
    invoke-direct {p0}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->cleanupFinishedHandlers()V

    :cond_2
    return v0
.end method

.method public final setMinimumAlphaForTraversal(F)V
    .locals 0

    iput p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->minimumAlphaForTraversal:F

    return-void
.end method

.method public final transformEventToViewCoords(Landroid/view/View;Landroid/view/MotionEvent;)Landroid/view/MotionEvent;
    .locals 3

    const-string v0, "event"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez p1, :cond_0

    return-object p2

    .line 345
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/view/ViewGroup;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->wrapperView:Landroid/view/ViewGroup;

    .line 348
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 349
    move-object v1, v0

    check-cast v1, Landroid/view/View;

    invoke-virtual {p0, v1, p2}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->transformEventToViewCoords(Landroid/view/View;Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    :cond_2
    if-eqz v0, :cond_3

    .line 353
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    .line 354
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v2, v0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v2, v0

    .line 355
    invoke-virtual {p2, v1, v2}, Landroid/view/MotionEvent;->setLocation(FF)V

    .line 358
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v0

    if-nez v0, :cond_4

    .line 359
    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object p1

    sget-object v0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->inverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 360
    invoke-virtual {p2, v0}, Landroid/view/MotionEvent;->transform(Landroid/graphics/Matrix;)V

    :cond_4
    return-object p2
.end method

.method public final transformPointToViewCoords(Landroid/view/View;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .locals 4

    const-string v0, "point"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez p1, :cond_0

    return-object p2

    .line 379
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/view/ViewGroup;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->wrapperView:Landroid/view/ViewGroup;

    .line 382
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 383
    move-object v1, v0

    check-cast v1, Landroid/view/View;

    invoke-virtual {p0, v1, p2}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->transformPointToViewCoords(Landroid/view/View;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    :cond_2
    if-eqz v0, :cond_3

    .line 387
    iget v1, p2, Landroid/graphics/PointF;->x:F

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int/2addr v2, v3

    int-to-float v2, v2

    add-float/2addr v1, v2

    iput v1, p2, Landroid/graphics/PointF;->x:F

    .line 388
    iget v1, p2, Landroid/graphics/PointF;->y:F

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v2

    sub-int/2addr v0, v2

    int-to-float v0, v0

    add-float/2addr v1, v0

    iput v1, p2, Landroid/graphics/PointF;->y:F

    .line 391
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v0

    if-nez v0, :cond_4

    .line 392
    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object p1

    sget-object v0, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->inverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    sget-object p1, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->tempCoords:[F

    .line 393
    iget v1, p2, Landroid/graphics/PointF;->x:F

    const/4 v2, 0x0

    aput v1, p1, v2

    .line 394
    iget v1, p2, Landroid/graphics/PointF;->y:F

    const/4 v3, 0x1

    aput v1, p1, v3

    .line 395
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 396
    aget v0, p1, v2

    iput v0, p2, Landroid/graphics/PointF;->x:F

    .line 397
    aget p1, p1, v3

    iput p1, p2, Landroid/graphics/PointF;->y:F

    :cond_4
    return-object p2
.end method
