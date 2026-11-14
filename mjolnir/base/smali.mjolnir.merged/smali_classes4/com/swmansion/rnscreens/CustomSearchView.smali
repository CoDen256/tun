.class public final Lcom/swmansion/rnscreens/CustomSearchView;
.super Landroidx/appcompat/widget/SearchView;
.source "CustomSearchView.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0002\u0008\t\n\u0002\u0010\u000e\n\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0006\u0010\u0016\u001a\u00020\u0017J\u0006\u0010\u0018\u001a\u00020\u0017J\u0006\u0010\u0019\u001a\u00020\u0017J\u0008\u0010\u001a\u001a\u00020\u0017H\u0014J\u0008\u0010\u001b\u001a\u00020\u0017H\u0014J\u0012\u0010\u001c\u001a\u00020\u00172\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u000cH\u0016J\u0012\u0010\u001e\u001a\u00020\u00172\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u000eH\u0016J\u000e\u0010\u001f\u001a\u00020\u00172\u0006\u0010 \u001a\u00020!R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R$\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\u00108F@FX\u0086\u000e\u00a2\u0006\u000c\u001a\u0004\u0008\u0012\u0010\u0013\"\u0004\u0008\u0014\u0010\u0015\u00a8\u0006\""
    }
    d2 = {
        "Lcom/swmansion/rnscreens/CustomSearchView;",
        "Landroidx/appcompat/widget/SearchView;",
        "context",
        "Landroid/content/Context;",
        "fragment",
        "Landroidx/fragment/app/Fragment;",
        "(Landroid/content/Context;Landroidx/fragment/app/Fragment;)V",
        "backPressOverrider",
        "Lcom/swmansion/rnscreens/FragmentBackPressOverrider;",
        "onBackPressedCallback",
        "Landroidx/activity/OnBackPressedCallback;",
        "onCloseListener",
        "Landroidx/appcompat/widget/SearchView$OnCloseListener;",
        "onSearchClickedListener",
        "Landroid/view/View$OnClickListener;",
        "value",
        "",
        "overrideBackAction",
        "getOverrideBackAction",
        "()Z",
        "setOverrideBackAction",
        "(Z)V",
        "cancelSearch",
        "",
        "clearText",
        "focus",
        "onAttachedToWindow",
        "onDetachedFromWindow",
        "setOnCloseListener",
        "listener",
        "setOnSearchClickListener",
        "setText",
        "text",
        "",
        "react-native-screens_release"
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
.field private final backPressOverrider:Lcom/swmansion/rnscreens/FragmentBackPressOverrider;

.field private onBackPressedCallback:Landroidx/activity/OnBackPressedCallback;

.field private onCloseListener:Landroidx/appcompat/widget/SearchView$OnCloseListener;

.field private onSearchClickedListener:Landroid/view/View$OnClickListener;


# direct methods
.method public static synthetic $r8$lambda$GhhjwdxbyQxG3_bpZaC4-0wYYtM(Lcom/swmansion/rnscreens/CustomSearchView;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/swmansion/rnscreens/CustomSearchView;->_init_$lambda$0(Lcom/swmansion/rnscreens/CustomSearchView;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$tAZvIkTGldIk3glabftTOjEINpc(Lcom/swmansion/rnscreens/CustomSearchView;)Z
    .locals 0

    invoke-static {p0}, Lcom/swmansion/rnscreens/CustomSearchView;->_init_$lambda$1(Lcom/swmansion/rnscreens/CustomSearchView;)Z

    move-result p0

    return p0
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/fragment/app/Fragment;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "fragment"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/SearchView;-><init>(Landroid/content/Context;)V

    .line 20
    new-instance p1, Lcom/swmansion/rnscreens/CustomSearchView$onBackPressedCallback$1;

    invoke-direct {p1, p0}, Lcom/swmansion/rnscreens/CustomSearchView$onBackPressedCallback$1;-><init>(Lcom/swmansion/rnscreens/CustomSearchView;)V

    check-cast p1, Landroidx/activity/OnBackPressedCallback;

    iput-object p1, p0, Lcom/swmansion/rnscreens/CustomSearchView;->onBackPressedCallback:Landroidx/activity/OnBackPressedCallback;

    .line 26
    new-instance v0, Lcom/swmansion/rnscreens/FragmentBackPressOverrider;

    invoke-direct {v0, p2, p1}, Lcom/swmansion/rnscreens/FragmentBackPressOverrider;-><init>(Landroidx/fragment/app/Fragment;Landroidx/activity/OnBackPressedCallback;)V

    iput-object v0, p0, Lcom/swmansion/rnscreens/CustomSearchView;->backPressOverrider:Lcom/swmansion/rnscreens/FragmentBackPressOverrider;

    .line 69
    new-instance p1, Lcom/swmansion/rnscreens/CustomSearchView$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0}, Lcom/swmansion/rnscreens/CustomSearchView$$ExternalSyntheticLambda0;-><init>(Lcom/swmansion/rnscreens/CustomSearchView;)V

    invoke-super {p0, p1}, Landroidx/appcompat/widget/SearchView;->setOnSearchClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    new-instance p1, Lcom/swmansion/rnscreens/CustomSearchView$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0}, Lcom/swmansion/rnscreens/CustomSearchView$$ExternalSyntheticLambda1;-><init>(Lcom/swmansion/rnscreens/CustomSearchView;)V

    invoke-super {p0, p1}, Landroidx/appcompat/widget/SearchView;->setOnCloseListener(Landroidx/appcompat/widget/SearchView$OnCloseListener;)V

    const p1, 0x7fffffff

    .line 80
    invoke-virtual {p0, p1}, Lcom/swmansion/rnscreens/CustomSearchView;->setMaxWidth(I)V

    return-void
.end method

.method private static final _init_$lambda$0(Lcom/swmansion/rnscreens/CustomSearchView;Landroid/view/View;)V
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 70
    iget-object v0, p0, Lcom/swmansion/rnscreens/CustomSearchView;->onSearchClickedListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 71
    :cond_0
    iget-object p0, p0, Lcom/swmansion/rnscreens/CustomSearchView;->backPressOverrider:Lcom/swmansion/rnscreens/FragmentBackPressOverrider;

    invoke-virtual {p0}, Lcom/swmansion/rnscreens/FragmentBackPressOverrider;->maybeAddBackCallback()V

    return-void
.end method

.method private static final _init_$lambda$1(Lcom/swmansion/rnscreens/CustomSearchView;)Z
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    iget-object v0, p0, Lcom/swmansion/rnscreens/CustomSearchView;->onCloseListener:Landroidx/appcompat/widget/SearchView$OnCloseListener;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroidx/appcompat/widget/SearchView$OnCloseListener;->onClose()Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 76
    :goto_0
    iget-object p0, p0, Lcom/swmansion/rnscreens/CustomSearchView;->backPressOverrider:Lcom/swmansion/rnscreens/FragmentBackPressOverrider;

    invoke-virtual {p0}, Lcom/swmansion/rnscreens/FragmentBackPressOverrider;->removeBackCallbackIfAdded()V

    return v0
.end method


# virtual methods
.method public final cancelSearch()V
    .locals 1

    .line 44
    invoke-virtual {p0}, Lcom/swmansion/rnscreens/CustomSearchView;->clearText()V

    const/4 v0, 0x1

    .line 45
    invoke-virtual {p0, v0}, Lcom/swmansion/rnscreens/CustomSearchView;->setIconified(Z)V

    return-void
.end method

.method public final clearText()V
    .locals 2

    const-string v0, ""

    .line 39
    check-cast v0, Ljava/lang/CharSequence;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/swmansion/rnscreens/CustomSearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    return-void
.end method

.method public final focus()V
    .locals 1

    const/4 v0, 0x0

    .line 35
    invoke-virtual {p0, v0}, Lcom/swmansion/rnscreens/CustomSearchView;->setIconified(Z)V

    .line 36
    invoke-virtual {p0}, Lcom/swmansion/rnscreens/CustomSearchView;->requestFocusFromTouch()Z

    return-void
.end method

.method public final getOverrideBackAction()Z
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/CustomSearchView;->backPressOverrider:Lcom/swmansion/rnscreens/FragmentBackPressOverrider;

    .line 32
    invoke-virtual {v0}, Lcom/swmansion/rnscreens/FragmentBackPressOverrider;->getOverrideBackAction()Z

    move-result v0

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 57
    invoke-super {p0}, Landroidx/appcompat/widget/SearchView;->onAttachedToWindow()V

    .line 58
    invoke-virtual {p0}, Lcom/swmansion/rnscreens/CustomSearchView;->isIconified()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/swmansion/rnscreens/CustomSearchView;->backPressOverrider:Lcom/swmansion/rnscreens/FragmentBackPressOverrider;

    .line 59
    invoke-virtual {v0}, Lcom/swmansion/rnscreens/FragmentBackPressOverrider;->maybeAddBackCallback()V

    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 64
    invoke-super {p0}, Landroidx/appcompat/widget/SearchView;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/swmansion/rnscreens/CustomSearchView;->backPressOverrider:Lcom/swmansion/rnscreens/FragmentBackPressOverrider;

    .line 65
    invoke-virtual {v0}, Lcom/swmansion/rnscreens/FragmentBackPressOverrider;->removeBackCallbackIfAdded()V

    return-void
.end method

.method public setOnCloseListener(Landroidx/appcompat/widget/SearchView$OnCloseListener;)V
    .locals 0

    iput-object p1, p0, Lcom/swmansion/rnscreens/CustomSearchView;->onCloseListener:Landroidx/appcompat/widget/SearchView$OnCloseListener;

    return-void
.end method

.method public setOnSearchClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/swmansion/rnscreens/CustomSearchView;->onSearchClickedListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public final setOverrideBackAction(Z)V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/rnscreens/CustomSearchView;->backPressOverrider:Lcom/swmansion/rnscreens/FragmentBackPressOverrider;

    .line 30
    invoke-virtual {v0, p1}, Lcom/swmansion/rnscreens/FragmentBackPressOverrider;->setOverrideBackAction(Z)V

    return-void
.end method

.method public final setText(Ljava/lang/String;)V
    .locals 1

    const-string v0, "text"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    check-cast p1, Ljava/lang/CharSequence;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/swmansion/rnscreens/CustomSearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    return-void
.end method
