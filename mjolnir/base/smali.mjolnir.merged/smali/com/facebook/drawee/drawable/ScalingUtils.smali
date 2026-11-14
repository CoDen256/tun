.class public Lcom/facebook/drawee/drawable/ScalingUtils;
.super Ljava/lang/Object;
.source "ScalingUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/drawee/drawable/ScalingUtils$InterpolatingScaleType;,
        Lcom/facebook/drawee/drawable/ScalingUtils$StatefulScaleType;,
        Lcom/facebook/drawee/drawable/ScalingUtils$ScaleTypeFitY;,
        Lcom/facebook/drawee/drawable/ScalingUtils$ScaleTypeFitX;,
        Lcom/facebook/drawee/drawable/ScalingUtils$ScaleTypeFocusCrop;,
        Lcom/facebook/drawee/drawable/ScalingUtils$ScaleTypeCenterCrop;,
        Lcom/facebook/drawee/drawable/ScalingUtils$ScaleTypeCenterInside;,
        Lcom/facebook/drawee/drawable/ScalingUtils$ScaleTypeCenter;,
        Lcom/facebook/drawee/drawable/ScalingUtils$ScaleTypeFitEnd;,
        Lcom/facebook/drawee/drawable/ScalingUtils$ScaleTypeFitCenter;,
        Lcom/facebook/drawee/drawable/ScalingUtils$ScaleTypeFitBottomStart;,
        Lcom/facebook/drawee/drawable/ScalingUtils$ScaleTypeFitStart;,
        Lcom/facebook/drawee/drawable/ScalingUtils$ScaleTypeFitXY;,
        Lcom/facebook/drawee/drawable/ScalingUtils$AbstractScaleType;,
        Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertFromImageViewScaleType(Landroid/widget/ImageView$ScaleType;)Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 154
    sget-object v0, Lcom/facebook/drawee/drawable/ScalingUtils$1;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    invoke-virtual {p0}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result p0

    aget p0, v0, p0

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x0

    return-object p0

    .line 168
    :pswitch_0
    sget-object p0, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_XY:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    return-object p0

    .line 166
    :pswitch_1
    sget-object p0, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_END:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    return-object p0

    .line 164
    :pswitch_2
    sget-object p0, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_START:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    return-object p0

    .line 162
    :pswitch_3
    sget-object p0, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_CENTER:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    return-object p0

    .line 160
    :pswitch_4
    sget-object p0, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->CENTER_INSIDE:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    return-object p0

    .line 158
    :pswitch_5
    sget-object p0, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->CENTER_CROP:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    return-object p0

    .line 156
    :pswitch_6
    sget-object p0, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->CENTER:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getActiveScaleTypeDrawable(Landroid/graphics/drawable/Drawable;)Lcom/facebook/drawee/drawable/ScaleTypeDrawable;
    .locals 4
    .param p0    # Landroid/graphics/drawable/Drawable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 132
    :cond_0
    instance-of v1, p0, Lcom/facebook/drawee/drawable/ScaleTypeDrawable;

    if-eqz v1, :cond_1

    .line 133
    check-cast p0, Lcom/facebook/drawee/drawable/ScaleTypeDrawable;

    return-object p0

    .line 134
    :cond_1
    instance-of v1, p0, Lcom/facebook/drawee/drawable/DrawableParent;

    if-eqz v1, :cond_2

    .line 135
    check-cast p0, Lcom/facebook/drawee/drawable/DrawableParent;

    invoke-interface {p0}, Lcom/facebook/drawee/drawable/DrawableParent;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 136
    invoke-static {p0}, Lcom/facebook/drawee/drawable/ScalingUtils;->getActiveScaleTypeDrawable(Landroid/graphics/drawable/Drawable;)Lcom/facebook/drawee/drawable/ScaleTypeDrawable;

    move-result-object p0

    return-object p0

    .line 137
    :cond_2
    instance-of v1, p0, Lcom/facebook/drawee/drawable/ArrayDrawable;

    if-eqz v1, :cond_4

    .line 138
    check-cast p0, Lcom/facebook/drawee/drawable/ArrayDrawable;

    .line 139
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/ArrayDrawable;->getNumberOfLayers()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_4

    .line 142
    invoke-virtual {p0, v2}, Lcom/facebook/drawee/drawable/ArrayDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 143
    invoke-static {v3}, Lcom/facebook/drawee/drawable/ScalingUtils;->getActiveScaleTypeDrawable(Landroid/graphics/drawable/Drawable;)Lcom/facebook/drawee/drawable/ScaleTypeDrawable;

    move-result-object v3

    if-eqz v3, :cond_3

    return-object v3

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    return-object v0
.end method
