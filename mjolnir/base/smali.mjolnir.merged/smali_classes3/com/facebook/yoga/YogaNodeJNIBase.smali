.class public abstract Lcom/facebook/yoga/YogaNodeJNIBase;
.super Lcom/facebook/yoga/YogaNode;
.source "YogaNodeJNIBase.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field private static final BORDER:B = 0x4t

.field private static final HAS_NEW_LAYOUT:B = 0x10t

.field private static final LAYOUT_BORDER_START_INDEX:B = 0xet

.field private static final LAYOUT_DIRECTION_INDEX:B = 0x5t

.field private static final LAYOUT_EDGE_SET_FLAG_INDEX:B = 0x0t

.field private static final LAYOUT_HEIGHT_INDEX:B = 0x2t

.field private static final LAYOUT_LEFT_INDEX:B = 0x3t

.field private static final LAYOUT_MARGIN_START_INDEX:B = 0x6t

.field private static final LAYOUT_PADDING_START_INDEX:B = 0xat

.field private static final LAYOUT_TOP_INDEX:B = 0x4t

.field private static final LAYOUT_WIDTH_INDEX:B = 0x1t

.field private static final MARGIN:B = 0x1t

.field private static final PADDING:B = 0x2t


# instance fields
.field private arr:[F
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mBaselineFunction:Lcom/facebook/yoga/YogaBaselineFunction;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mChildren:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/yoga/YogaNodeJNIBase;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mData:Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mHasNewLayout:Z

.field private mLayoutDirection:I

.field private mMeasureFunction:Lcom/facebook/yoga/YogaMeasureFunction;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected mNativePointer:J

.field private mOwner:Lcom/facebook/yoga/YogaNodeJNIBase;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 2

    .line 55
    invoke-static {}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeNewJNI()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/facebook/yoga/YogaNodeJNIBase;-><init>(J)V

    return-void
.end method

.method private constructor <init>(J)V
    .locals 2

    .line 47
    invoke-direct {p0}, Lcom/facebook/yoga/YogaNode;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    const/4 v0, 0x0

    iput v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mLayoutDirection:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mHasNewLayout:Z

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-eqz v0, :cond_0

    iput-wide p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    return-void

    .line 49
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Failed to allocate native memory"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method constructor <init>(Lcom/facebook/yoga/YogaConfig;)V
    .locals 2

    .line 59
    check-cast p1, Lcom/facebook/yoga/YogaConfigJNIBase;

    iget-wide v0, p1, Lcom/facebook/yoga/YogaConfigJNIBase;->mNativePointer:J

    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeNewWithConfigJNI(J)J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/facebook/yoga/YogaNodeJNIBase;-><init>(J)V

    return-void
.end method

.method private clearChildren()V
    .locals 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mChildren:Ljava/util/List;

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 158
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeRemoveAllChildrenJNI(J)V

    return-void
.end method

.method private freeze(Lcom/facebook/yoga/YogaNode;)V
    .locals 2

    .line 224
    invoke-virtual {p0}, Lcom/facebook/yoga/YogaNodeJNIBase;->getData()Ljava/lang/Object;

    move-result-object v0

    .line 225
    instance-of v1, v0, Lcom/facebook/yoga/YogaNode$Inputs;

    if-eqz v1, :cond_0

    .line 226
    check-cast v0, Lcom/facebook/yoga/YogaNode$Inputs;

    invoke-interface {v0, p0, p1}, Lcom/facebook/yoga/YogaNode$Inputs;->freeze(Lcom/facebook/yoga/YogaNode;Lcom/facebook/yoga/YogaNode;)V

    :cond_0
    return-void
.end method

.method private final replaceChild(Lcom/facebook/yoga/YogaNodeJNIBase;I)J
    .locals 1

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mChildren:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 571
    invoke-interface {v0, p2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mChildren:Ljava/util/List;

    .line 572
    invoke-interface {v0, p2, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 573
    iput-object p0, p1, Lcom/facebook/yoga/YogaNodeJNIBase;->mOwner:Lcom/facebook/yoga/YogaNodeJNIBase;

    .line 574
    iget-wide p1, p1, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    return-wide p1

    .line 569
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Cannot replace child. YogaNode does not have children"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static valueFromLong(J)Lcom/facebook/yoga/YogaValue;
    .locals 3

    .line 578
    new-instance v0, Lcom/facebook/yoga/YogaValue;

    long-to-int v1, p0

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    const/16 v2, 0x20

    shr-long/2addr p0, v2

    long-to-int p0, p0

    invoke-direct {v0, v1, p0}, Lcom/facebook/yoga/YogaValue;-><init>(FI)V

    return-object v0
.end method


# virtual methods
.method public addChildAt(Lcom/facebook/yoga/YogaNode;I)V
    .locals 4

    .line 85
    instance-of v0, p1, Lcom/facebook/yoga/YogaNodeJNIBase;

    if-nez v0, :cond_0

    return-void

    .line 88
    :cond_0
    check-cast p1, Lcom/facebook/yoga/YogaNodeJNIBase;

    .line 89
    iget-object v0, p1, Lcom/facebook/yoga/YogaNodeJNIBase;->mOwner:Lcom/facebook/yoga/YogaNodeJNIBase;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mChildren:Ljava/util/List;

    if-nez v0, :cond_1

    .line 94
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mChildren:Ljava/util/List;

    :cond_1
    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mChildren:Ljava/util/List;

    .line 96
    invoke-interface {v0, p2, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 97
    iput-object p0, p1, Lcom/facebook/yoga/YogaNodeJNIBase;->mOwner:Lcom/facebook/yoga/YogaNodeJNIBase;

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 98
    iget-wide v2, p1, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    invoke-static {v0, v1, v2, v3, p2}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeInsertChildJNI(JJI)V

    return-void

    .line 90
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Child already has a parent, it must be removed first."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final baseline(FF)F
    .locals 1

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mBaselineFunction:Lcom/facebook/yoga/YogaBaselineFunction;

    .line 538
    invoke-interface {v0, p0, p1, p2}, Lcom/facebook/yoga/YogaBaselineFunction;->baseline(Lcom/facebook/yoga/YogaNode;FF)F

    move-result p1

    return p1
.end method

.method public calculateLayout(FF)V
    .locals 8

    const/4 v0, 0x0

    .line 199
    invoke-direct {p0, v0}, Lcom/facebook/yoga/YogaNodeJNIBase;->freeze(Lcom/facebook/yoga/YogaNode;)V

    .line 201
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 202
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x0

    move v2, v1

    .line 203
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 204
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/yoga/YogaNodeJNIBase;

    .line 205
    iget-object v4, v3, Lcom/facebook/yoga/YogaNodeJNIBase;->mChildren:Ljava/util/List;

    if-eqz v4, :cond_0

    .line 207
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/facebook/yoga/YogaNodeJNIBase;

    .line 208
    invoke-direct {v5, v3}, Lcom/facebook/yoga/YogaNodeJNIBase;->freeze(Lcom/facebook/yoga/YogaNode;)V

    .line 209
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 214
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Lcom/facebook/yoga/YogaNodeJNIBase;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, [Lcom/facebook/yoga/YogaNodeJNIBase;

    .line 215
    array-length v0, v7

    new-array v6, v0, [J

    .line 216
    :goto_2
    array-length v0, v7

    if-ge v1, v0, :cond_2

    .line 217
    aget-object v0, v7, v1

    iget-wide v2, v0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    aput-wide v2, v6, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_2
    iget-wide v2, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    move v4, p1

    move v5, p2

    .line 220
    invoke-static/range {v2 .. v7}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeCalculateLayoutJNI(JFF[J[Lcom/facebook/yoga/YogaNodeJNIBase;)V

    return-void
.end method

.method public bridge synthetic cloneWithChildren()Lcom/facebook/yoga/YogaNode;
    .locals 1

    .line 15
    invoke-virtual {p0}, Lcom/facebook/yoga/YogaNodeJNIBase;->cloneWithChildren()Lcom/facebook/yoga/YogaNodeJNIBase;

    move-result-object v0

    return-object v0
.end method

.method public cloneWithChildren()Lcom/facebook/yoga/YogaNodeJNIBase;
    .locals 4

    .line 123
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/yoga/YogaNodeJNIBase;

    .line 124
    iget-object v1, v0, Lcom/facebook/yoga/YogaNodeJNIBase;->mChildren:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 125
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, v0, Lcom/facebook/yoga/YogaNodeJNIBase;->mChildren:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, v0, Lcom/facebook/yoga/YogaNodeJNIBase;->mChildren:Ljava/util/List;

    :cond_0
    iget-wide v1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 127
    invoke-static {v1, v2}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeCloneJNI(J)J

    move-result-wide v1

    const/4 v3, 0x0

    .line 128
    iput-object v3, v0, Lcom/facebook/yoga/YogaNodeJNIBase;->mOwner:Lcom/facebook/yoga/YogaNodeJNIBase;

    .line 129
    iput-wide v1, v0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    const/4 v1, 0x0

    .line 130
    :goto_0
    invoke-virtual {v0}, Lcom/facebook/yoga/YogaNodeJNIBase;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 131
    invoke-virtual {v0, v1}, Lcom/facebook/yoga/YogaNodeJNIBase;->getChildAt(I)Lcom/facebook/yoga/YogaNodeJNIBase;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/yoga/YogaNodeJNIBase;->cloneWithChildren()Lcom/facebook/yoga/YogaNodeJNIBase;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Lcom/facebook/yoga/YogaNodeJNIBase;->swapChildAt(Lcom/facebook/yoga/YogaNode;I)V
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0

    :catch_0
    move-exception v0

    .line 137
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public bridge synthetic cloneWithoutChildren()Lcom/facebook/yoga/YogaNode;
    .locals 1

    .line 15
    invoke-virtual {p0}, Lcom/facebook/yoga/YogaNodeJNIBase;->cloneWithoutChildren()Lcom/facebook/yoga/YogaNodeJNIBase;

    move-result-object v0

    return-object v0
.end method

.method public cloneWithoutChildren()Lcom/facebook/yoga/YogaNodeJNIBase;
    .locals 4

    .line 144
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/yoga/YogaNodeJNIBase;

    iget-wide v1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 145
    invoke-static {v1, v2}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeCloneJNI(J)J

    move-result-wide v1

    const/4 v3, 0x0

    .line 146
    iput-object v3, v0, Lcom/facebook/yoga/YogaNodeJNIBase;->mOwner:Lcom/facebook/yoga/YogaNodeJNIBase;

    .line 147
    iput-wide v1, v0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 148
    invoke-direct {v0}, Lcom/facebook/yoga/YogaNodeJNIBase;->clearChildren()V
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 152
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public copyStyle(Lcom/facebook/yoga/YogaNode;)V
    .locals 4

    .line 240
    instance-of v0, p1, Lcom/facebook/yoga/YogaNodeJNIBase;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 243
    check-cast p1, Lcom/facebook/yoga/YogaNodeJNIBase;

    iget-wide v2, p1, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    invoke-static {v0, v1, v2, v3}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeCopyStyleJNI(JJ)V

    return-void
.end method

.method public dirty()V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 231
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeMarkDirtyJNI(J)V

    return-void
.end method

.method public getAlignContent()Lcom/facebook/yoga/YogaAlign;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 287
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetAlignContentJNI(J)I

    move-result v0

    invoke-static {v0}, Lcom/facebook/yoga/YogaAlign;->fromInt(I)Lcom/facebook/yoga/YogaAlign;

    move-result-object v0

    return-object v0
.end method

.method public getAlignItems()Lcom/facebook/yoga/YogaAlign;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 271
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetAlignItemsJNI(J)I

    move-result v0

    invoke-static {v0}, Lcom/facebook/yoga/YogaAlign;->fromInt(I)Lcom/facebook/yoga/YogaAlign;

    move-result-object v0

    return-object v0
.end method

.method public getAlignSelf()Lcom/facebook/yoga/YogaAlign;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 279
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetAlignSelfJNI(J)I

    move-result v0

    invoke-static {v0}, Lcom/facebook/yoga/YogaAlign;->fromInt(I)Lcom/facebook/yoga/YogaAlign;

    move-result-object v0

    return-object v0
.end method

.method public getAspectRatio()F
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 495
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetAspectRatioJNI(J)F

    move-result v0

    return v0
.end method

.method public getBorder(Lcom/facebook/yoga/YogaEdge;)F
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 395
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaEdge;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetBorderJNI(JI)F

    move-result p1

    return p1
.end method

.method public bridge synthetic getChildAt(I)Lcom/facebook/yoga/YogaNode;
    .locals 0

    .line 15
    invoke-virtual {p0, p1}, Lcom/facebook/yoga/YogaNodeJNIBase;->getChildAt(I)Lcom/facebook/yoga/YogaNodeJNIBase;

    move-result-object p1

    return-object p1
.end method

.method public getChildAt(I)Lcom/facebook/yoga/YogaNodeJNIBase;
    .locals 1

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mChildren:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 81
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/yoga/YogaNodeJNIBase;

    return-object p1

    .line 79
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "YogaNode does not have children"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getChildCount()I
    .locals 1

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mChildren:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 74
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getData()Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mData:Ljava/lang/Object;

    return-object v0
.end method

.method public getDisplay()Lcom/facebook/yoga/YogaDisplay;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 319
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetDisplayJNI(J)I

    move-result v0

    invoke-static {v0}, Lcom/facebook/yoga/YogaDisplay;->fromInt(I)Lcom/facebook/yoga/YogaDisplay;

    move-result-object v0

    return-object v0
.end method

.method public getFlex()F
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 327
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetFlexJNI(J)F

    move-result v0

    return v0
.end method

.method public getFlexBasis()Lcom/facebook/yoga/YogaValue;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 351
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetFlexBasisJNI(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNodeJNIBase;->valueFromLong(J)Lcom/facebook/yoga/YogaValue;

    move-result-object v0

    return-object v0
.end method

.method public getFlexDirection()Lcom/facebook/yoga/YogaFlexDirection;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 255
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetFlexDirectionJNI(J)I

    move-result v0

    invoke-static {v0}, Lcom/facebook/yoga/YogaFlexDirection;->fromInt(I)Lcom/facebook/yoga/YogaFlexDirection;

    move-result-object v0

    return-object v0
.end method

.method public getFlexGrow()F
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 335
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetFlexGrowJNI(J)F

    move-result v0

    return v0
.end method

.method public getFlexShrink()F
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 343
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetFlexShrinkJNI(J)F

    move-result v0

    return v0
.end method

.method public getGap(Lcom/facebook/yoga/YogaGutter;)F
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 717
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaGutter;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetGapJNI(JI)F

    move-result p1

    return p1
.end method

.method public getHeight()Lcom/facebook/yoga/YogaValue;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 431
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetHeightJNI(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNodeJNIBase;->valueFromLong(J)Lcom/facebook/yoga/YogaValue;

    move-result-object v0

    return-object v0
.end method

.method public getJustifyContent()Lcom/facebook/yoga/YogaJustify;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 263
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetJustifyContentJNI(J)I

    move-result v0

    invoke-static {v0}, Lcom/facebook/yoga/YogaJustify;->fromInt(I)Lcom/facebook/yoga/YogaJustify;

    move-result-object v0

    return-object v0
.end method

.method public getLayoutBorder(Lcom/facebook/yoga/YogaEdge;)F
    .locals 6

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    if-eqz v0, :cond_4

    const/4 v1, 0x0

    .line 662
    aget v0, v0, v1

    float-to-int v2, v0

    const/4 v3, 0x4

    and-int/2addr v2, v3

    if-ne v2, v3, :cond_4

    float-to-int v2, v0

    const/4 v4, 0x1

    and-int/2addr v2, v4

    if-ne v2, v4, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    rsub-int/lit8 v2, v2, 0xe

    float-to-int v0, v0

    const/4 v5, 0x2

    and-int/2addr v0, v5

    if-ne v0, v5, :cond_1

    goto :goto_1

    :cond_1
    move v1, v3

    :goto_1
    sub-int/2addr v2, v1

    .line 667
    sget-object v0, Lcom/facebook/yoga/YogaNodeJNIBase$1;->$SwitchMap$com$facebook$yoga$YogaEdge:[I

    invoke-virtual {p1}, Lcom/facebook/yoga/YogaEdge;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 685
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot get layout border of multi-edge shorthands"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 681
    :pswitch_0
    invoke-virtual {p0}, Lcom/facebook/yoga/YogaNodeJNIBase;->getLayoutDirection()Lcom/facebook/yoga/YogaDirection;

    move-result-object p1

    sget-object v0, Lcom/facebook/yoga/YogaDirection;->RTL:Lcom/facebook/yoga/YogaDirection;

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    .line 682
    aget p1, p1, v2

    goto :goto_2

    :cond_2
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    add-int/2addr v2, v5

    .line 683
    aget p1, p1, v2

    :goto_2
    return p1

    .line 677
    :pswitch_1
    invoke-virtual {p0}, Lcom/facebook/yoga/YogaNodeJNIBase;->getLayoutDirection()Lcom/facebook/yoga/YogaDirection;

    move-result-object p1

    sget-object v0, Lcom/facebook/yoga/YogaDirection;->RTL:Lcom/facebook/yoga/YogaDirection;

    if-ne p1, v0, :cond_3

    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    add-int/2addr v2, v5

    .line 678
    aget p1, p1, v2

    goto :goto_3

    :cond_3
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    .line 679
    aget p1, p1, v2

    :goto_3
    return p1

    :pswitch_2
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    add-int/lit8 v2, v2, 0x3

    .line 675
    aget p1, p1, v2

    return p1

    :pswitch_3
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    add-int/2addr v2, v5

    .line 673
    aget p1, p1, v2

    return p1

    :pswitch_4
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    add-int/2addr v2, v4

    .line 671
    aget p1, p1, v2

    return p1

    :pswitch_5
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    .line 669
    aget p1, p1, v2

    return p1

    :cond_4
    const/4 p1, 0x0

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getLayoutDirection()Lcom/facebook/yoga/YogaDirection;
    .locals 2

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    if-eqz v0, :cond_0

    const/4 v1, 0x5

    .line 695
    aget v0, v0, v1

    float-to-int v0, v0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mLayoutDirection:I

    .line 694
    :goto_0
    invoke-static {v0}, Lcom/facebook/yoga/YogaDirection;->fromInt(I)Lcom/facebook/yoga/YogaDirection;

    move-result-object v0

    return-object v0
.end method

.method public getLayoutHeight()F
    .locals 2

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    if-eqz v0, :cond_0

    const/4 v1, 0x2

    .line 598
    aget v0, v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getLayoutMargin(Lcom/facebook/yoga/YogaEdge;)F
    .locals 3

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    if-eqz v0, :cond_2

    const/4 v1, 0x0

    .line 603
    aget v0, v0, v1

    float-to-int v0, v0

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_2

    .line 604
    sget-object v0, Lcom/facebook/yoga/YogaNodeJNIBase$1;->$SwitchMap$com$facebook$yoga$YogaEdge:[I

    invoke-virtual {p1}, Lcom/facebook/yoga/YogaEdge;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/16 v0, 0x8

    const/4 v1, 0x6

    packed-switch p1, :pswitch_data_0

    .line 622
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot get layout margins of multi-edge shorthands"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 618
    :pswitch_0
    invoke-virtual {p0}, Lcom/facebook/yoga/YogaNodeJNIBase;->getLayoutDirection()Lcom/facebook/yoga/YogaDirection;

    move-result-object p1

    sget-object v2, Lcom/facebook/yoga/YogaDirection;->RTL:Lcom/facebook/yoga/YogaDirection;

    if-ne p1, v2, :cond_0

    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    .line 619
    aget p1, p1, v1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    .line 620
    aget p1, p1, v0

    :goto_0
    return p1

    .line 614
    :pswitch_1
    invoke-virtual {p0}, Lcom/facebook/yoga/YogaNodeJNIBase;->getLayoutDirection()Lcom/facebook/yoga/YogaDirection;

    move-result-object p1

    sget-object v2, Lcom/facebook/yoga/YogaDirection;->RTL:Lcom/facebook/yoga/YogaDirection;

    if-ne p1, v2, :cond_1

    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    .line 615
    aget p1, p1, v0

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    .line 616
    aget p1, p1, v1

    :goto_1
    return p1

    :pswitch_2
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    const/16 v0, 0x9

    .line 612
    aget p1, p1, v0

    return p1

    :pswitch_3
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    .line 610
    aget p1, p1, v0

    return p1

    :pswitch_4
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    const/4 v0, 0x7

    .line 608
    aget p1, p1, v0

    return p1

    :pswitch_5
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    .line 606
    aget p1, p1, v1

    return p1

    :cond_2
    const/4 p1, 0x0

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getLayoutPadding(Lcom/facebook/yoga/YogaEdge;)F
    .locals 4

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    if-eqz v0, :cond_3

    const/4 v1, 0x0

    .line 631
    aget v0, v0, v1

    float-to-int v2, v0

    const/4 v3, 0x2

    and-int/2addr v2, v3

    if-ne v2, v3, :cond_3

    float-to-int v0, v0

    const/4 v2, 0x1

    and-int/2addr v0, v2

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x4

    :goto_0
    rsub-int/lit8 v0, v1, 0xa

    .line 635
    sget-object v2, Lcom/facebook/yoga/YogaNodeJNIBase$1;->$SwitchMap$com$facebook$yoga$YogaEdge:[I

    invoke-virtual {p1}, Lcom/facebook/yoga/YogaEdge;->ordinal()I

    move-result p1

    aget p1, v2, p1

    packed-switch p1, :pswitch_data_0

    .line 653
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot get layout paddings of multi-edge shorthands"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 649
    :pswitch_0
    invoke-virtual {p0}, Lcom/facebook/yoga/YogaNodeJNIBase;->getLayoutDirection()Lcom/facebook/yoga/YogaDirection;

    move-result-object p1

    sget-object v2, Lcom/facebook/yoga/YogaDirection;->RTL:Lcom/facebook/yoga/YogaDirection;

    if-ne p1, v2, :cond_1

    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    .line 650
    aget p1, p1, v0

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    rsub-int/lit8 v0, v1, 0xc

    .line 651
    aget p1, p1, v0

    :goto_1
    return p1

    .line 645
    :pswitch_1
    invoke-virtual {p0}, Lcom/facebook/yoga/YogaNodeJNIBase;->getLayoutDirection()Lcom/facebook/yoga/YogaDirection;

    move-result-object p1

    sget-object v2, Lcom/facebook/yoga/YogaDirection;->RTL:Lcom/facebook/yoga/YogaDirection;

    if-ne p1, v2, :cond_2

    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    rsub-int/lit8 v0, v1, 0xc

    .line 646
    aget p1, p1, v0

    goto :goto_2

    :cond_2
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    .line 647
    aget p1, p1, v0

    :goto_2
    return p1

    :pswitch_2
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    rsub-int/lit8 v0, v1, 0xd

    .line 643
    aget p1, p1, v0

    return p1

    :pswitch_3
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    rsub-int/lit8 v0, v1, 0xc

    .line 641
    aget p1, p1, v0

    return p1

    :pswitch_4
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    rsub-int/lit8 v0, v1, 0xb

    .line 639
    aget p1, p1, v0

    return p1

    :pswitch_5
    iget-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    .line 637
    aget p1, p1, v0

    return p1

    :cond_3
    const/4 p1, 0x0

    return p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getLayoutWidth()F
    .locals 2

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 593
    aget v0, v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getLayoutX()F
    .locals 2

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    if-eqz v0, :cond_0

    const/4 v1, 0x3

    .line 583
    aget v0, v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getLayoutY()F
    .locals 2

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    if-eqz v0, :cond_0

    const/4 v1, 0x4

    .line 588
    aget v0, v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getMargin(Lcom/facebook/yoga/YogaEdge;)Lcom/facebook/yoga/YogaValue;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 367
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaEdge;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetMarginJNI(JI)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNodeJNIBase;->valueFromLong(J)Lcom/facebook/yoga/YogaValue;

    move-result-object p1

    return-object p1
.end method

.method public getMaxHeight()Lcom/facebook/yoga/YogaValue;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 483
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetMaxHeightJNI(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNodeJNIBase;->valueFromLong(J)Lcom/facebook/yoga/YogaValue;

    move-result-object v0

    return-object v0
.end method

.method public getMaxWidth()Lcom/facebook/yoga/YogaValue;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 471
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetMaxWidthJNI(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNodeJNIBase;->valueFromLong(J)Lcom/facebook/yoga/YogaValue;

    move-result-object v0

    return-object v0
.end method

.method public getMinHeight()Lcom/facebook/yoga/YogaValue;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 459
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetMinHeightJNI(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNodeJNIBase;->valueFromLong(J)Lcom/facebook/yoga/YogaValue;

    move-result-object v0

    return-object v0
.end method

.method public getMinWidth()Lcom/facebook/yoga/YogaValue;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 447
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetMinWidthJNI(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNodeJNIBase;->valueFromLong(J)Lcom/facebook/yoga/YogaValue;

    move-result-object v0

    return-object v0
.end method

.method public getOverflow()Lcom/facebook/yoga/YogaOverflow;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 311
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetOverflowJNI(J)I

    move-result v0

    invoke-static {v0}, Lcom/facebook/yoga/YogaOverflow;->fromInt(I)Lcom/facebook/yoga/YogaOverflow;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getOwner()Lcom/facebook/yoga/YogaNode;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 15
    invoke-virtual {p0}, Lcom/facebook/yoga/YogaNodeJNIBase;->getOwner()Lcom/facebook/yoga/YogaNodeJNIBase;

    move-result-object v0

    return-object v0
.end method

.method public getOwner()Lcom/facebook/yoga/YogaNodeJNIBase;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mOwner:Lcom/facebook/yoga/YogaNodeJNIBase;

    return-object v0
.end method

.method public getPadding(Lcom/facebook/yoga/YogaEdge;)Lcom/facebook/yoga/YogaValue;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 383
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaEdge;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetPaddingJNI(JI)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNodeJNIBase;->valueFromLong(J)Lcom/facebook/yoga/YogaValue;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic getParent()Lcom/facebook/yoga/YogaNode;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 15
    invoke-virtual {p0}, Lcom/facebook/yoga/YogaNodeJNIBase;->getParent()Lcom/facebook/yoga/YogaNodeJNIBase;

    move-result-object v0

    return-object v0
.end method

.method public getParent()Lcom/facebook/yoga/YogaNodeJNIBase;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 188
    invoke-virtual {p0}, Lcom/facebook/yoga/YogaNodeJNIBase;->getOwner()Lcom/facebook/yoga/YogaNodeJNIBase;

    move-result-object v0

    return-object v0
.end method

.method public getPosition(Lcom/facebook/yoga/YogaEdge;)Lcom/facebook/yoga/YogaValue;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 403
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaEdge;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetPositionJNI(JI)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNodeJNIBase;->valueFromLong(J)Lcom/facebook/yoga/YogaValue;

    move-result-object p1

    return-object p1
.end method

.method public getPositionType()Lcom/facebook/yoga/YogaPositionType;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 295
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetPositionTypeJNI(J)I

    move-result v0

    invoke-static {v0}, Lcom/facebook/yoga/YogaPositionType;->fromInt(I)Lcom/facebook/yoga/YogaPositionType;

    move-result-object v0

    return-object v0
.end method

.method public getStyleDirection()Lcom/facebook/yoga/YogaDirection;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 247
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetDirectionJNI(J)I

    move-result v0

    invoke-static {v0}, Lcom/facebook/yoga/YogaDirection;->fromInt(I)Lcom/facebook/yoga/YogaDirection;

    move-result-object v0

    return-object v0
.end method

.method public getWidth()Lcom/facebook/yoga/YogaValue;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 415
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetWidthJNI(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNodeJNIBase;->valueFromLong(J)Lcom/facebook/yoga/YogaValue;

    move-result-object v0

    return-object v0
.end method

.method public getWrap()Lcom/facebook/yoga/YogaWrap;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 303
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleGetFlexWrapJNI(J)I

    move-result v0

    invoke-static {v0}, Lcom/facebook/yoga/YogaWrap;->fromInt(I)Lcom/facebook/yoga/YogaWrap;

    move-result-object v0

    return-object v0
.end method

.method public hasNewLayout()Z
    .locals 3

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    .line 701
    aget v0, v0, v1

    float-to-int v0, v0

    const/16 v2, 0x10

    and-int/2addr v0, v2

    if-ne v0, v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    :cond_1
    iget-boolean v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mHasNewLayout:Z

    return v0
.end method

.method public indexOf(Lcom/facebook/yoga/YogaNode;)I
    .locals 1

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mChildren:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 p1, -0x1

    goto :goto_0

    .line 192
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    :goto_0
    return p1
.end method

.method public isBaselineDefined()Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mBaselineFunction:Lcom/facebook/yoga/YogaBaselineFunction;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isDirty()Z
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 235
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeIsDirtyJNI(J)Z

    move-result v0

    return v0
.end method

.method public isMeasureDefined()Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mMeasureFunction:Lcom/facebook/yoga/YogaMeasureFunction;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isReferenceBaseline()Z
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 106
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeIsReferenceBaselineJNI(J)Z

    move-result v0

    return v0
.end method

.method public markLayoutSeen()V
    .locals 3

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 710
    aget v2, v0, v1

    float-to-int v2, v2

    and-int/lit8 v2, v2, -0x11

    int-to-float v2, v2

    aput v2, v0, v1

    :cond_0
    iput-boolean v1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mHasNewLayout:Z

    return-void
.end method

.method public final measure(FIFI)J
    .locals 7

    .line 519
    invoke-virtual {p0}, Lcom/facebook/yoga/YogaNodeJNIBase;->isMeasureDefined()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mMeasureFunction:Lcom/facebook/yoga/YogaMeasureFunction;

    .line 526
    invoke-static {p2}, Lcom/facebook/yoga/YogaMeasureMode;->fromInt(I)Lcom/facebook/yoga/YogaMeasureMode;

    move-result-object v4

    .line 528
    invoke-static {p4}, Lcom/facebook/yoga/YogaMeasureMode;->fromInt(I)Lcom/facebook/yoga/YogaMeasureMode;

    move-result-object v6

    move-object v2, p0

    move v3, p1

    move v5, p3

    .line 523
    invoke-interface/range {v1 .. v6}, Lcom/facebook/yoga/YogaMeasureFunction;->measure(Lcom/facebook/yoga/YogaNode;FLcom/facebook/yoga/YogaMeasureMode;FLcom/facebook/yoga/YogaMeasureMode;)J

    move-result-wide p1

    return-wide p1

    .line 520
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Measure function isn\'t defined!"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public bridge synthetic removeChildAt(I)Lcom/facebook/yoga/YogaNode;
    .locals 0

    .line 15
    invoke-virtual {p0, p1}, Lcom/facebook/yoga/YogaNodeJNIBase;->removeChildAt(I)Lcom/facebook/yoga/YogaNodeJNIBase;

    move-result-object p1

    return-object p1
.end method

.method public removeChildAt(I)Lcom/facebook/yoga/YogaNodeJNIBase;
    .locals 4

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mChildren:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 166
    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/yoga/YogaNodeJNIBase;

    const/4 v0, 0x0

    .line 167
    iput-object v0, p1, Lcom/facebook/yoga/YogaNodeJNIBase;->mOwner:Lcom/facebook/yoga/YogaNodeJNIBase;

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 168
    iget-wide v2, p1, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    invoke-static {v0, v1, v2, v3}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeRemoveChildJNI(JJ)V

    return-object p1

    .line 163
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Trying to remove a child of a YogaNode that does not have children"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public reset()V
    .locals 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mMeasureFunction:Lcom/facebook/yoga/YogaMeasureFunction;

    iput-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mBaselineFunction:Lcom/facebook/yoga/YogaBaselineFunction;

    iput-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mData:Ljava/lang/Object;

    iput-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->arr:[F

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mHasNewLayout:Z

    const/4 v0, 0x0

    iput v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mLayoutDirection:I

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 70
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeResetJNI(J)V

    return-void
.end method

.method public setAlignContent(Lcom/facebook/yoga/YogaAlign;)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 291
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaAlign;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetAlignContentJNI(JI)V

    return-void
.end method

.method public setAlignItems(Lcom/facebook/yoga/YogaAlign;)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 275
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaAlign;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetAlignItemsJNI(JI)V

    return-void
.end method

.method public setAlignSelf(Lcom/facebook/yoga/YogaAlign;)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 283
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaAlign;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetAlignSelfJNI(JI)V

    return-void
.end method

.method public setAlwaysFormsContainingBlock(Z)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 509
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeSetAlwaysFormsContainingBlockJNI(JZ)V

    return-void
.end method

.method public setAspectRatio(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 499
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetAspectRatioJNI(JF)V

    return-void
.end method

.method public setBaselineFunction(Lcom/facebook/yoga/YogaBaselineFunction;)V
    .locals 2

    iput-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mBaselineFunction:Lcom/facebook/yoga/YogaBaselineFunction;

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 533
    :goto_0
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeSetHasBaselineFuncJNI(JZ)V

    return-void
.end method

.method public setBorder(Lcom/facebook/yoga/YogaEdge;F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 399
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaEdge;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1, p2}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetBorderJNI(JIF)V

    return-void
.end method

.method public setData(Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mData:Ljava/lang/Object;

    return-void
.end method

.method public setDirection(Lcom/facebook/yoga/YogaDirection;)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 251
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaDirection;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetDirectionJNI(JI)V

    return-void
.end method

.method public setDisplay(Lcom/facebook/yoga/YogaDisplay;)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 323
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaDisplay;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetDisplayJNI(JI)V

    return-void
.end method

.method public setFlex(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 331
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetFlexJNI(JF)V

    return-void
.end method

.method public setFlexBasis(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 355
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetFlexBasisJNI(JF)V

    return-void
.end method

.method public setFlexBasisAuto()V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 363
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetFlexBasisAutoJNI(J)V

    return-void
.end method

.method public setFlexBasisPercent(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 359
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetFlexBasisPercentJNI(JF)V

    return-void
.end method

.method public setFlexDirection(Lcom/facebook/yoga/YogaFlexDirection;)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 259
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaFlexDirection;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetFlexDirectionJNI(JI)V

    return-void
.end method

.method public setFlexGrow(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 339
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetFlexGrowJNI(JF)V

    return-void
.end method

.method public setFlexShrink(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 347
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetFlexShrinkJNI(JF)V

    return-void
.end method

.method public setGap(Lcom/facebook/yoga/YogaGutter;F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 722
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaGutter;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1, p2}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetGapJNI(JIF)V

    return-void
.end method

.method public setHeight(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 435
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetHeightJNI(JF)V

    return-void
.end method

.method public setHeightAuto()V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 443
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetHeightAutoJNI(J)V

    return-void
.end method

.method public setHeightPercent(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 439
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetHeightPercentJNI(JF)V

    return-void
.end method

.method public setIsReferenceBaseline(Z)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 102
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeSetIsReferenceBaselineJNI(JZ)V

    return-void
.end method

.method public setJustifyContent(Lcom/facebook/yoga/YogaJustify;)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 267
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaJustify;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetJustifyContentJNI(JI)V

    return-void
.end method

.method public setMargin(Lcom/facebook/yoga/YogaEdge;F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 371
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaEdge;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1, p2}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetMarginJNI(JIF)V

    return-void
.end method

.method public setMarginAuto(Lcom/facebook/yoga/YogaEdge;)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 379
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaEdge;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetMarginAutoJNI(JI)V

    return-void
.end method

.method public setMarginPercent(Lcom/facebook/yoga/YogaEdge;F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 375
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaEdge;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1, p2}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetMarginPercentJNI(JIF)V

    return-void
.end method

.method public setMaxHeight(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 487
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetMaxHeightJNI(JF)V

    return-void
.end method

.method public setMaxHeightPercent(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 491
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetMaxHeightPercentJNI(JF)V

    return-void
.end method

.method public setMaxWidth(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 475
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetMaxWidthJNI(JF)V

    return-void
.end method

.method public setMaxWidthPercent(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 479
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetMaxWidthPercentJNI(JF)V

    return-void
.end method

.method public setMeasureFunction(Lcom/facebook/yoga/YogaMeasureFunction;)V
    .locals 2

    iput-object p1, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mMeasureFunction:Lcom/facebook/yoga/YogaMeasureFunction;

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 504
    :goto_0
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeSetHasMeasureFuncJNI(JZ)V

    return-void
.end method

.method public setMinHeight(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 463
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetMinHeightJNI(JF)V

    return-void
.end method

.method public setMinHeightPercent(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 467
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetMinHeightPercentJNI(JF)V

    return-void
.end method

.method public setMinWidth(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 451
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetMinWidthJNI(JF)V

    return-void
.end method

.method public setMinWidthPercent(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 455
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetMinWidthPercentJNI(JF)V

    return-void
.end method

.method public setOverflow(Lcom/facebook/yoga/YogaOverflow;)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 315
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaOverflow;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetOverflowJNI(JI)V

    return-void
.end method

.method public setPadding(Lcom/facebook/yoga/YogaEdge;F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 387
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaEdge;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1, p2}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetPaddingJNI(JIF)V

    return-void
.end method

.method public setPaddingPercent(Lcom/facebook/yoga/YogaEdge;F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 391
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaEdge;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1, p2}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetPaddingPercentJNI(JIF)V

    return-void
.end method

.method public setPosition(Lcom/facebook/yoga/YogaEdge;F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 407
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaEdge;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1, p2}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetPositionJNI(JIF)V

    return-void
.end method

.method public setPositionPercent(Lcom/facebook/yoga/YogaEdge;F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 411
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaEdge;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1, p2}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetPositionPercentJNI(JIF)V

    return-void
.end method

.method public setPositionType(Lcom/facebook/yoga/YogaPositionType;)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 299
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaPositionType;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetPositionTypeJNI(JI)V

    return-void
.end method

.method public setWidth(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 419
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetWidthJNI(JF)V

    return-void
.end method

.method public setWidthAuto()V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 427
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetWidthAutoJNI(J)V

    return-void
.end method

.method public setWidthPercent(F)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 423
    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetWidthPercentJNI(JF)V

    return-void
.end method

.method public setWrap(Lcom/facebook/yoga/YogaWrap;)V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 307
    invoke-virtual {p1}, Lcom/facebook/yoga/YogaWrap;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeStyleSetFlexWrapJNI(JI)V

    return-void
.end method

.method public swapChildAt(Lcom/facebook/yoga/YogaNode;I)V
    .locals 4

    .line 110
    instance-of v0, p1, Lcom/facebook/yoga/YogaNodeJNIBase;

    if-nez v0, :cond_0

    return-void

    .line 113
    :cond_0
    check-cast p1, Lcom/facebook/yoga/YogaNodeJNIBase;

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mChildren:Ljava/util/List;

    .line 114
    invoke-interface {v0, p2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    iget-object v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mChildren:Ljava/util/List;

    .line 115
    invoke-interface {v0, p2, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 116
    iput-object p0, p1, Lcom/facebook/yoga/YogaNodeJNIBase;->mOwner:Lcom/facebook/yoga/YogaNodeJNIBase;

    iget-wide v0, p0, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    .line 117
    iget-wide v2, p1, Lcom/facebook/yoga/YogaNodeJNIBase;->mNativePointer:J

    invoke-static {v0, v1, v2, v3, p2}, Lcom/facebook/yoga/YogaNative;->jni_YGNodeSwapChildJNI(JJI)V

    return-void
.end method
