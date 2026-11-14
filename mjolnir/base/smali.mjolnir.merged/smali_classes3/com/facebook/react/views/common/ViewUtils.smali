.class public Lcom/facebook/react/views/common/ViewUtils;
.super Ljava/lang/Object;
.source "ViewUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getTestId(Landroid/view/View;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 29
    :cond_0
    sget v1, Lcom/facebook/react/R$id;->react_test_id:I

    invoke-virtual {p0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p0

    .line 30
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 31
    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_1
    return-object v0
.end method
