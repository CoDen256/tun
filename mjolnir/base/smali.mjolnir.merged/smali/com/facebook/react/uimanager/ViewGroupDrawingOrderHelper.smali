.class public Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;
.super Ljava/lang/Object;
.source "ViewGroupDrawingOrderHelper.java"


# instance fields
.field private mDrawingOrderIndices:[I

.field private mNumberOfChildrenWithZIndex:I

.field private final mViewGroup:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mNumberOfChildrenWithZIndex:I

    iput-object p1, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mViewGroup:Landroid/view/ViewGroup;

    return-void
.end method


# virtual methods
.method public getChildDrawingOrder(II)I
    .locals 5

    iget-object v0, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mDrawingOrderIndices:[I

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 70
    array-length v2, v0

    if-ge p2, v2, :cond_0

    aget v0, v0, p2

    if-lt v0, p1, :cond_1

    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    .line 76
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    .line 77
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v0, v3

    const-string v2, "ReactNative"

    const-string v3, "getChildDrawingOrder index out of bounds! Please check any custom view manipulations you may have done. childCount = %d, index = %d"

    .line 72
    invoke-static {v2, v3, v0}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 78
    invoke-virtual {p0}, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->update()V

    :cond_1
    iget-object v0, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mDrawingOrderIndices:[I

    if-nez v0, :cond_3

    .line 82
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move v2, v1

    :goto_0
    if-ge v2, p1, :cond_2

    iget-object v3, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mViewGroup:Landroid/view/ViewGroup;

    .line 84
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 87
    :cond_2
    new-instance v2, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper$1;

    invoke-direct {v2, p0}, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper$1;-><init>(Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;)V

    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 106
    new-array v2, p1, [I

    iput-object v2, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mDrawingOrderIndices:[I

    :goto_1
    if-ge v1, p1, :cond_3

    .line 108
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    iget-object v3, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mDrawingOrderIndices:[I

    iget-object v4, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mViewGroup:Landroid/view/ViewGroup;

    .line 109
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v2

    aput v2, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mDrawingOrderIndices:[I

    .line 112
    aget p1, p1, p2

    return p1
.end method

.method public handleAddView(Landroid/view/View;)V
    .locals 0

    .line 35
    invoke-static {p1}, Lcom/facebook/react/uimanager/ViewGroupManager;->getViewZIndex(Landroid/view/View;)Ljava/lang/Integer;

    move-result-object p1

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mNumberOfChildrenWithZIndex:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mNumberOfChildrenWithZIndex:I

    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mDrawingOrderIndices:[I

    return-void
.end method

.method public handleRemoveView(Landroid/view/View;)V
    .locals 0

    .line 49
    invoke-static {p1}, Lcom/facebook/react/uimanager/ViewGroupManager;->getViewZIndex(Landroid/view/View;)Ljava/lang/Integer;

    move-result-object p1

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mNumberOfChildrenWithZIndex:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mNumberOfChildrenWithZIndex:I

    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mDrawingOrderIndices:[I

    return-void
.end method

.method public shouldEnableCustomDrawingOrder()Z
    .locals 1

    iget v0, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mNumberOfChildrenWithZIndex:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public update()V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mNumberOfChildrenWithZIndex:I

    :goto_0
    iget-object v1, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mViewGroup:Landroid/view/ViewGroup;

    .line 118
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mViewGroup:Landroid/view/ViewGroup;

    .line 119
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/react/uimanager/ViewGroupManager;->getViewZIndex(Landroid/view/View;)Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mNumberOfChildrenWithZIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mNumberOfChildrenWithZIndex:I

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/react/uimanager/ViewGroupDrawingOrderHelper;->mDrawingOrderIndices:[I

    return-void
.end method
