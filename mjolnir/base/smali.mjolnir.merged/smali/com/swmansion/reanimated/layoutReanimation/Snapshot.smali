.class public Lcom/swmansion/reanimated/layoutReanimation/Snapshot;
.super Ljava/lang/Object;
.source "Snapshot.java"


# static fields
.field public static final BORDER_BOTTOM_LEFT_RADIUS:Ljava/lang/String; = "borderBottomLeftRadius"

.field public static final BORDER_BOTTOM_RIGHT_RADIUS:Ljava/lang/String; = "borderBottomRightRadius"

.field public static final BORDER_RADIUS:Ljava/lang/String; = "borderRadius"

.field public static final BORDER_TOP_LEFT_RADIUS:Ljava/lang/String; = "borderTopLeftRadius"

.field public static final BORDER_TOP_RIGHT_RADIUS:Ljava/lang/String; = "borderTopRightRadius"

.field public static final CURRENT_BORDER_BOTTOM_LEFT_RADIUS:Ljava/lang/String; = "currentBorderBottomLeftRadius"

.field public static final CURRENT_BORDER_BOTTOM_RIGHT_RADIUS:Ljava/lang/String; = "currentBorderBottomRightRadius"

.field public static final CURRENT_BORDER_RADIUS:Ljava/lang/String; = "currentBorderRadius"

.field public static final CURRENT_BORDER_TOP_LEFT_RADIUS:Ljava/lang/String; = "currentBorderTopLeftRadius"

.field public static final CURRENT_BORDER_TOP_RIGHT_RADIUS:Ljava/lang/String; = "currentBorderTopRightRadius"

.field public static final CURRENT_GLOBAL_ORIGIN_X:Ljava/lang/String; = "currentGlobalOriginX"

.field public static final CURRENT_GLOBAL_ORIGIN_Y:Ljava/lang/String; = "currentGlobalOriginY"

.field public static final CURRENT_HEIGHT:Ljava/lang/String; = "currentHeight"

.field public static final CURRENT_ORIGIN_X:Ljava/lang/String; = "currentOriginX"

.field public static final CURRENT_ORIGIN_Y:Ljava/lang/String; = "currentOriginY"

.field public static final CURRENT_TRANSFORM_MATRIX:Ljava/lang/String; = "currentTransformMatrix"

.field public static final CURRENT_WIDTH:Ljava/lang/String; = "currentWidth"

.field public static final GLOBAL_ORIGIN_X:Ljava/lang/String; = "globalOriginX"

.field public static final GLOBAL_ORIGIN_Y:Ljava/lang/String; = "globalOriginY"

.field public static final HEIGHT:Ljava/lang/String; = "height"

.field public static final ORIGIN_X:Ljava/lang/String; = "originX"

.field public static final ORIGIN_Y:Ljava/lang/String; = "originY"

.field public static final TARGET_BORDER_BOTTOM_LEFT_RADIUS:Ljava/lang/String; = "targetBorderBottomLeftRadius"

.field public static final TARGET_BORDER_BOTTOM_RIGHT_RADIUS:Ljava/lang/String; = "targetBorderBottomRightRadius"

.field public static final TARGET_BORDER_RADIUS:Ljava/lang/String; = "targetBorderRadius"

.field public static final TARGET_BORDER_TOP_LEFT_RADIUS:Ljava/lang/String; = "targetBorderTopLeftRadius"

.field public static final TARGET_BORDER_TOP_RIGHT_RADIUS:Ljava/lang/String; = "targetBorderTopRightRadius"

.field public static final TARGET_GLOBAL_ORIGIN_X:Ljava/lang/String; = "targetGlobalOriginX"

.field public static final TARGET_GLOBAL_ORIGIN_Y:Ljava/lang/String; = "targetGlobalOriginY"

.field public static final TARGET_HEIGHT:Ljava/lang/String; = "targetHeight"

.field public static final TARGET_ORIGIN_X:Ljava/lang/String; = "targetOriginX"

.field public static final TARGET_ORIGIN_Y:Ljava/lang/String; = "targetOriginY"

.field public static final TARGET_TRANSFORM_MATRIX:Ljava/lang/String; = "targetTransformMatrix"

.field public static final TARGET_WIDTH:Ljava/lang/String; = "targetWidth"

.field public static final TRANSFORM_MATRIX:Ljava/lang/String; = "transformMatrix"

.field public static final WIDTH:Ljava/lang/String; = "width"

.field public static currentKeysToTransform:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static targetKeysToTransform:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

.field public globalOriginX:I

.field public globalOriginY:I

.field public height:I

.field private identityMatrix:[F

.field public originX:I

.field public originXByParent:I

.field public originY:I

.field public originYByParent:I

.field public parent:Landroid/view/ViewGroup;

.field public parentViewManager:Lcom/facebook/react/uimanager/ViewManager;

.field public transformMatrix:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public view:Landroid/view/View;

.field public viewManager:Lcom/facebook/react/uimanager/ViewManager;

.field public width:I


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    const-string/jumbo v1, "targetWidth"

    const-string/jumbo v2, "targetHeight"

    const-string/jumbo v3, "targetOriginX"

    const-string/jumbo v4, "targetOriginY"

    const-string/jumbo v5, "targetGlobalOriginX"

    const-string/jumbo v6, "targetGlobalOriginY"

    const-string/jumbo v7, "targetBorderRadius"

    const-string/jumbo v8, "targetBorderTopLeftRadius"

    const-string/jumbo v9, "targetBorderTopRightRadius"

    const-string/jumbo v10, "targetBorderBottomLeftRadius"

    const-string/jumbo v11, "targetBorderBottomRightRadius"

    filled-new-array/range {v1 .. v11}, [Ljava/lang/String;

    move-result-object v1

    .line 73
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->targetKeysToTransform:Ljava/util/ArrayList;

    .line 85
    new-instance v0, Ljava/util/ArrayList;

    const-string v1, "currentWidth"

    const-string v2, "currentHeight"

    const-string v3, "currentOriginX"

    const-string v4, "currentOriginY"

    const-string v5, "currentGlobalOriginX"

    const-string v6, "currentGlobalOriginY"

    const-string v7, "currentBorderRadius"

    const-string v8, "currentBorderTopLeftRadius"

    const-string v9, "currentBorderTopRightRadius"

    const-string v10, "currentBorderBottomLeftRadius"

    const-string v11, "currentBorderBottomRightRadius"

    filled-new-array/range {v1 .. v11}, [Ljava/lang/String;

    move-result-object v1

    .line 87
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->currentKeysToTransform:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 11

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x9

    new-array v2, v1, [Ljava/lang/Float;

    const/high16 v3, 0x3f800000    # 1.0f

    .line 65
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v2, v6

    const/4 v7, 0x2

    aput-object v5, v2, v7

    const/4 v8, 0x3

    aput-object v5, v2, v8

    const/4 v8, 0x4

    aput-object v3, v2, v8

    const/4 v9, 0x5

    aput-object v5, v2, v9

    const/4 v10, 0x6

    aput-object v5, v2, v10

    const/4 v10, 0x7

    aput-object v5, v2, v10

    const/16 v5, 0x8

    aput-object v3, v2, v5

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->transformMatrix:Ljava/util/List;

    new-array v0, v1, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->identityMatrix:[F

    new-array v0, v7, [I

    .line 122
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    aget v2, v0, v4

    iput v2, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originX:I

    aget v0, v0, v6

    iput v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originY:I

    .line 125
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->width:I

    .line 126
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->height:I

    .line 128
    invoke-direct {p0, p1}, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->findTransformedView(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    new-array v2, v1, [F

    .line 131
    invoke-virtual {v0}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/graphics/Matrix;->getValues([F)V

    .line 132
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->transformMatrix:Ljava/util/List;

    move v3, v4

    :goto_0
    if-ge v3, v1, :cond_0

    iget-object v5, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->transformMatrix:Ljava/util/List;

    .line 134
    aget v6, v2, v3

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->transformMatrix:Ljava/util/List;

    .line 136
    invoke-virtual {v0}, Landroid/view/View;->getScaleX()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v1, v4, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->transformMatrix:Ljava/util/List;

    .line 137
    invoke-virtual {v0}, Landroid/view/View;->getScaleY()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v1, v8, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->transformMatrix:Ljava/util/List;

    .line 138
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v1, v7, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->transformMatrix:Ljava/util/List;

    .line 139
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v1, v9, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget v1, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originX:I

    int-to-float v1, v1

    iget v2, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->width:I

    int-to-float v3, v2

    int-to-float v2, v2

    .line 141
    invoke-virtual {v0}, Landroid/view/View;->getScaleX()F

    move-result v4

    mul-float/2addr v2, v4

    sub-float/2addr v3, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v3, v2

    sub-float/2addr v1, v3

    float-to-int v1, v1

    iput v1, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originX:I

    iget v1, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originY:I

    int-to-float v1, v1

    iget v3, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->height:I

    int-to-float v4, v3

    int-to-float v3, v3

    .line 142
    invoke-virtual {v0}, Landroid/view/View;->getScaleY()F

    move-result v0

    mul-float/2addr v3, v0

    sub-float/2addr v4, v3

    div-float/2addr v4, v2

    sub-float/2addr v1, v4

    float-to-int v0, v1

    iput v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originY:I

    .line 144
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    iput v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originXByParent:I

    .line 145
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    iput v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originYByParent:I

    .line 146
    invoke-static {p1}, Lcom/swmansion/reanimated/ReactNativeUtils;->getBorderRadii(Landroid/view/View;)Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    move-result-object p1

    iput-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method constructor <init>(Landroid/view/View;Lcom/facebook/react/uimanager/NativeViewHierarchyManager;)V
    .locals 9

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x9

    new-array v2, v1, [Ljava/lang/Float;

    const/high16 v3, 0x3f800000    # 1.0f

    .line 65
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v2, v6

    const/4 v7, 0x2

    aput-object v5, v2, v7

    const/4 v8, 0x3

    aput-object v5, v2, v8

    const/4 v8, 0x4

    aput-object v3, v2, v8

    const/4 v8, 0x5

    aput-object v5, v2, v8

    const/4 v8, 0x6

    aput-object v5, v2, v8

    const/4 v8, 0x7

    aput-object v5, v2, v8

    const/16 v5, 0x8

    aput-object v3, v2, v5

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->transformMatrix:Ljava/util/List;

    new-array v0, v1, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->identityMatrix:[F

    .line 101
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->parent:Landroid/view/ViewGroup;

    .line 103
    :try_start_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/facebook/react/uimanager/NativeViewHierarchyManager;->resolveViewManager(I)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object v0

    iput-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->viewManager:Lcom/facebook/react/uimanager/ViewManager;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->parent:Landroid/view/ViewGroup;

    .line 104
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getId()I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/facebook/react/uimanager/NativeViewHierarchyManager;->resolveViewManager(I)Lcom/facebook/react/uimanager/ViewManager;

    move-result-object p2

    iput-object p2, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->parentViewManager:Lcom/facebook/react/uimanager/ViewManager;
    :try_end_0
    .catch Lcom/facebook/react/uimanager/IllegalViewOperationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    :catch_0
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p2

    iput p2, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->width:I

    .line 109
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p2

    iput p2, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->height:I

    .line 110
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p2

    iput p2, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originX:I

    .line 111
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p2

    iput p2, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originY:I

    iput-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->view:Landroid/view/View;

    new-array p2, v7, [I

    .line 114
    invoke-virtual {p1, p2}, Landroid/view/View;->getLocationOnScreen([I)V

    aget p1, p2, v4

    iput p1, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->globalOriginX:I

    aget p1, p2, v6

    iput p1, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->globalOriginY:I

    .line 117
    new-instance p1, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p1

    invoke-direct/range {v0 .. v5}, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;-><init>(FFFFF)V

    iput-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private addBasicConfig(Ljava/util/HashMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originY:I

    .line 180
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "originY"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originX:I

    .line 181
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "originX"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->globalOriginY:I

    .line 182
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "globalOriginY"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->globalOriginX:I

    .line 183
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "globalOriginX"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->height:I

    .line 184
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "height"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->width:I

    .line 185
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string/jumbo v1, "width"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "transformMatrix"

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->transformMatrix:Ljava/util/List;

    .line 186
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    .line 187
    iget v0, v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->full:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "borderRadius"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    .line 188
    iget v0, v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->topLeft:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "borderTopLeftRadius"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    .line 189
    iget v0, v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->topRight:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "borderTopRightRadius"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    .line 190
    iget v0, v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->bottomLeft:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "borderBottomLeftRadius"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    .line 191
    iget v0, v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->bottomRight:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "borderBottomRightRadius"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private addCurrentConfig(Ljava/util/HashMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originY:I

    .line 165
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "currentOriginY"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originX:I

    .line 166
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "currentOriginX"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->globalOriginY:I

    .line 167
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "currentGlobalOriginY"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->globalOriginX:I

    .line 168
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "currentGlobalOriginX"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->height:I

    .line 169
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "currentHeight"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->width:I

    .line 170
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "currentWidth"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "currentTransformMatrix"

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->transformMatrix:Ljava/util/List;

    .line 171
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    .line 172
    iget v0, v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->full:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "currentBorderRadius"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    .line 173
    iget v0, v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->topLeft:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "currentBorderTopLeftRadius"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    .line 174
    iget v0, v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->topRight:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "currentBorderTopRightRadius"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    .line 175
    iget v0, v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->bottomLeft:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "currentBorderBottomLeftRadius"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    .line 176
    iget v0, v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->bottomRight:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "currentBorderBottomRightRadius"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private addTargetConfig(Ljava/util/HashMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originY:I

    .line 150
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string/jumbo v1, "targetOriginY"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->originX:I

    .line 151
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string/jumbo v1, "targetOriginX"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->globalOriginY:I

    .line 152
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string/jumbo v1, "targetGlobalOriginY"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->globalOriginX:I

    .line 153
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string/jumbo v1, "targetGlobalOriginX"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->height:I

    .line 154
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string/jumbo v1, "targetHeight"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->width:I

    .line 155
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string/jumbo v1, "targetWidth"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "targetTransformMatrix"

    iget-object v1, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->transformMatrix:Ljava/util/List;

    .line 156
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    .line 157
    iget v0, v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->full:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string/jumbo v1, "targetBorderRadius"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    .line 158
    iget v0, v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->topLeft:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string/jumbo v1, "targetBorderTopLeftRadius"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    .line 159
    iget v0, v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->topRight:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string/jumbo v1, "targetBorderTopRightRadius"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    .line 160
    iget v0, v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->bottomLeft:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string/jumbo v1, "targetBorderBottomLeftRadius"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->borderRadii:Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    .line 161
    iget v0, v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;->bottomRight:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string/jumbo v1, "targetBorderBottomRightRadius"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private findTransformedView(Landroid/view/View;)Landroid/view/View;
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    move-object v2, v0

    :cond_0
    if-nez v2, :cond_1

    move-object v2, p1

    goto :goto_0

    .line 219
    :cond_1
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/View;

    if-nez v3, :cond_2

    goto :goto_1

    .line 222
    :cond_2
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    :goto_0
    if-nez v2, :cond_3

    goto :goto_1

    :cond_3
    const/16 v1, 0x9

    new-array v1, v1, [F

    .line 228
    invoke-virtual {v2}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/graphics/Matrix;->getValues([F)V

    iget-object v3, p0, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->identityMatrix:[F

    .line 229
    invoke-static {v1, v3}, Ljava/util/Arrays;->equals([F[F)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_4

    if-eqz v2, :cond_4

    .line 232
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Screen"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_4
    :goto_1
    if-eqz v1, :cond_5

    if-eqz v2, :cond_5

    move-object v0, v2

    :cond_5
    return-object v0
.end method


# virtual methods
.method public toBasicMap()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 207
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 208
    invoke-direct {p0, v0}, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->addBasicConfig(Ljava/util/HashMap;)V

    return-object v0
.end method

.method public toCurrentMap()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 201
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 202
    invoke-direct {p0, v0}, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->addCurrentConfig(Ljava/util/HashMap;)V

    return-object v0
.end method

.method public toTargetMap()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 195
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 196
    invoke-direct {p0, v0}, Lcom/swmansion/reanimated/layoutReanimation/Snapshot;->addTargetConfig(Ljava/util/HashMap;)V

    return-object v0
.end method
