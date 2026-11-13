.class public Lcom/google/firebase/firestore/core/ActivityScope;
.super Ljava/lang/Object;
.source "ActivityScope.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/core/ActivityScope$StopListenerFragment;,
        Lcom/google/firebase/firestore/core/ActivityScope$StopListenerSupportFragment;,
        Lcom/google/firebase/firestore/core/ActivityScope$CallbackList;
    }
.end annotation


# static fields
.field private static final FRAGMENT_TAG:Ljava/lang/String; = "FirestoreOnStopObserverFragment"

.field private static final SUPPORT_FRAGMENT_TAG:Ljava/lang/String; = "FirestoreOnStopObserverSupportFragment"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bind(Landroid/app/Activity;Lcom/google/firebase/firestore/ListenerRegistration;)Lcom/google/firebase/firestore/ListenerRegistration;
    .locals 1

    if-eqz p0, :cond_1

    .line 191
    instance-of v0, p0, Landroidx/fragment/app/FragmentActivity;

    if-eqz v0, :cond_0

    .line 192
    check-cast p0, Landroidx/fragment/app/FragmentActivity;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/google/firebase/firestore/core/ActivityScope$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1}, Lcom/google/firebase/firestore/core/ActivityScope$$ExternalSyntheticLambda0;-><init>(Lcom/google/firebase/firestore/ListenerRegistration;)V

    invoke-static {p0, v0}, Lcom/google/firebase/firestore/core/ActivityScope;->onFragmentActivityStopCallOnce(Landroidx/fragment/app/FragmentActivity;Ljava/lang/Runnable;)V

    goto :goto_0

    .line 194
    :cond_0
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/google/firebase/firestore/core/ActivityScope$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1}, Lcom/google/firebase/firestore/core/ActivityScope$$ExternalSyntheticLambda0;-><init>(Lcom/google/firebase/firestore/ListenerRegistration;)V

    invoke-static {p0, v0}, Lcom/google/firebase/firestore/core/ActivityScope;->onActivityStopCallOnce(Landroid/app/Activity;Ljava/lang/Runnable;)V

    :cond_1
    :goto_0
    return-object p1
.end method

.method private static castFragment(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 114
    :cond_0
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 116
    :catch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Fragment with tag \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\' is a "

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " but should be a "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic lambda$onActivityStopCallOnce$0(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .locals 3

    .line 142
    const-class v0, Lcom/google/firebase/firestore/core/ActivityScope$StopListenerFragment;

    .line 145
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "FirestoreOnStopObserverFragment"

    invoke-virtual {v1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v1

    .line 143
    invoke-static {v0, v1, v2}, Lcom/google/firebase/firestore/core/ActivityScope;->castFragment(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/core/ActivityScope$StopListenerFragment;

    if-eqz v0, :cond_0

    .line 148
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/ActivityScope$StopListenerFragment;->isRemoving()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 149
    :cond_0
    new-instance v0, Lcom/google/firebase/firestore/core/ActivityScope$StopListenerFragment;

    invoke-direct {v0}, Lcom/google/firebase/firestore/core/ActivityScope$StopListenerFragment;-><init>()V

    .line 151
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    .line 152
    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 153
    invoke-virtual {v1, v0, v2}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 154
    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 156
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    .line 159
    :cond_1
    iget-object p0, v0, Lcom/google/firebase/firestore/core/ActivityScope$StopListenerFragment;->callbacks:Lcom/google/firebase/firestore/core/ActivityScope$CallbackList;

    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/core/ActivityScope$CallbackList;->add(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$onFragmentActivityStopCallOnce$1(Landroidx/fragment/app/FragmentActivity;Ljava/lang/Runnable;)V
    .locals 3

    .line 166
    const-class v0, Lcom/google/firebase/firestore/core/ActivityScope$StopListenerSupportFragment;

    .line 169
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    const-string v2, "FirestoreOnStopObserverSupportFragment"

    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    .line 167
    invoke-static {v0, v1, v2}, Lcom/google/firebase/firestore/core/ActivityScope;->castFragment(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/core/ActivityScope$StopListenerSupportFragment;

    if-eqz v0, :cond_0

    .line 172
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/ActivityScope$StopListenerSupportFragment;->isRemoving()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 173
    :cond_0
    new-instance v0, Lcom/google/firebase/firestore/core/ActivityScope$StopListenerSupportFragment;

    invoke-direct {v0}, Lcom/google/firebase/firestore/core/ActivityScope$StopListenerSupportFragment;-><init>()V

    .line 175
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    .line 176
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v1

    .line 177
    invoke-virtual {v1, v0, v2}, Landroidx/fragment/app/FragmentTransaction;->add(Landroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object v1

    .line 178
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 180
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->executePendingTransactions()Z

    .line 183
    :cond_1
    iget-object p0, v0, Lcom/google/firebase/firestore/core/ActivityScope$StopListenerSupportFragment;->callbacks:Lcom/google/firebase/firestore/core/ActivityScope$CallbackList;

    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/core/ActivityScope$CallbackList;->add(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static onActivityStopCallOnce(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .locals 3

    .line 136
    instance-of v0, p0, Landroidx/fragment/app/FragmentActivity;

    xor-int/lit8 v0, v0, 0x1

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "onActivityStopCallOnce must be called with a *non*-FragmentActivity Activity."

    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 140
    new-instance v0, Lcom/google/firebase/firestore/core/ActivityScope$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Lcom/google/firebase/firestore/core/ActivityScope$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;Ljava/lang/Runnable;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static onFragmentActivityStopCallOnce(Landroidx/fragment/app/FragmentActivity;Ljava/lang/Runnable;)V
    .locals 1

    .line 164
    new-instance v0, Lcom/google/firebase/firestore/core/ActivityScope$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p1}, Lcom/google/firebase/firestore/core/ActivityScope$$ExternalSyntheticLambda2;-><init>(Landroidx/fragment/app/FragmentActivity;Ljava/lang/Runnable;)V

    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
