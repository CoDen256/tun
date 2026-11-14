.class public Lcom/swmansion/reanimated/ReactNativeUtils;
.super Ljava/lang/Object;
.source "ReactNativeUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;
    }
.end annotation


# static fields
.field private static getCornerRadiiMethod:Ljava/lang/reflect/Method;

.field private static mBorderRadiusField:Ljava/lang/reflect/Field;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBorderRadii(Landroid/view/View;)Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;
    .locals 17

    move-object/from16 v0, p0

    .line 30
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 31
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 32
    instance-of v1, v0, Lcom/facebook/react/views/view/ReactViewBackgroundDrawable;

    if-eqz v1, :cond_4

    .line 33
    check-cast v0, Lcom/facebook/react/views/view/ReactViewBackgroundDrawable;

    .line 34
    new-instance v7, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    .line 35
    invoke-virtual {v0}, Lcom/facebook/react/views/view/ReactViewBackgroundDrawable;->getFullBorderRadius()F

    move-result v2

    sget-object v1, Lcom/facebook/react/views/view/ReactViewBackgroundDrawable$BorderRadiusLocation;->TOP_LEFT:Lcom/facebook/react/views/view/ReactViewBackgroundDrawable$BorderRadiusLocation;

    .line 36
    invoke-virtual {v0, v1}, Lcom/facebook/react/views/view/ReactViewBackgroundDrawable;->getBorderRadius(Lcom/facebook/react/views/view/ReactViewBackgroundDrawable$BorderRadiusLocation;)F

    move-result v3

    sget-object v1, Lcom/facebook/react/views/view/ReactViewBackgroundDrawable$BorderRadiusLocation;->TOP_RIGHT:Lcom/facebook/react/views/view/ReactViewBackgroundDrawable$BorderRadiusLocation;

    .line 37
    invoke-virtual {v0, v1}, Lcom/facebook/react/views/view/ReactViewBackgroundDrawable;->getBorderRadius(Lcom/facebook/react/views/view/ReactViewBackgroundDrawable$BorderRadiusLocation;)F

    move-result v4

    sget-object v1, Lcom/facebook/react/views/view/ReactViewBackgroundDrawable$BorderRadiusLocation;->BOTTOM_LEFT:Lcom/facebook/react/views/view/ReactViewBackgroundDrawable$BorderRadiusLocation;

    .line 38
    invoke-virtual {v0, v1}, Lcom/facebook/react/views/view/ReactViewBackgroundDrawable;->getBorderRadius(Lcom/facebook/react/views/view/ReactViewBackgroundDrawable$BorderRadiusLocation;)F

    move-result v5

    sget-object v1, Lcom/facebook/react/views/view/ReactViewBackgroundDrawable$BorderRadiusLocation;->BOTTOM_RIGHT:Lcom/facebook/react/views/view/ReactViewBackgroundDrawable$BorderRadiusLocation;

    .line 39
    invoke-virtual {v0, v1}, Lcom/facebook/react/views/view/ReactViewBackgroundDrawable;->getBorderRadius(Lcom/facebook/react/views/view/ReactViewBackgroundDrawable$BorderRadiusLocation;)F

    move-result v6

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;-><init>(FFFFF)V

    return-object v7

    .line 42
    :cond_0
    instance-of v1, v0, Lcom/facebook/react/views/image/ReactImageView;

    if-eqz v1, :cond_4

    :try_start_0
    sget-object v1, Lcom/swmansion/reanimated/ReactNativeUtils;->mBorderRadiusField:Ljava/lang/reflect/Field;

    const/4 v2, 0x1

    if-nez v1, :cond_1

    .line 45
    const-class v1, Lcom/facebook/react/views/image/ReactImageView;

    const-string v3, "mBorderRadius"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Lcom/swmansion/reanimated/ReactNativeUtils;->mBorderRadiusField:Ljava/lang/reflect/Field;

    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    :cond_1
    sget-object v1, Lcom/swmansion/reanimated/ReactNativeUtils;->mBorderRadiusField:Ljava/lang/reflect/Field;

    .line 48
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v1

    sget-object v3, Lcom/swmansion/reanimated/ReactNativeUtils;->getCornerRadiiMethod:Ljava/lang/reflect/Method;

    const/4 v4, 0x0

    if-nez v3, :cond_2

    .line 50
    const-class v3, Lcom/facebook/react/views/image/ReactImageView;

    const-string v5, "getCornerRadii"

    new-array v6, v2, [Ljava/lang/Class;

    const-class v7, [F

    aput-object v7, v6, v4

    .line 51
    invoke-virtual {v3, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    sput-object v3, Lcom/swmansion/reanimated/ReactNativeUtils;->getCornerRadiiMethod:Ljava/lang/reflect/Method;

    .line 52
    invoke-virtual {v3, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 54
    :cond_2
    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-eqz v3, :cond_3

    const/4 v1, 0x0

    :cond_3
    move v6, v1

    const/4 v1, 0x4

    new-array v1, v1, [F

    sget-object v3, Lcom/swmansion/reanimated/ReactNativeUtils;->getCornerRadiiMethod:Ljava/lang/reflect/Method;

    new-array v5, v2, [Ljava/lang/Object;

    aput-object v1, v5, v4

    .line 58
    invoke-virtual {v3, v0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    new-instance v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    aget v7, v1, v4

    aget v8, v1, v2

    const/4 v2, 0x2

    aget v9, v1, v2

    const/4 v2, 0x3

    aget v10, v1, v2

    move-object v5, v0

    invoke-direct/range {v5 .. v10}, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;-><init>(FFFFF)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 70
    :catch_0
    :cond_4
    new-instance v0, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object v11, v0

    invoke-direct/range {v11 .. v16}, Lcom/swmansion/reanimated/ReactNativeUtils$BorderRadii;-><init>(FFFFF)V

    return-object v0
.end method
