.class public final Lcom/amazon/a/a/a/b;
.super Ljava/lang/Object;
.source "ContextManagerImplV2.java"

# interfaces
.implements Lcom/amazon/a/a/a/a;
.implements Lcom/amazon/a/a/k/d;


# static fields
.field public static final a:Lcom/amazon/a/a/o/c;


# instance fields
.field private final b:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Lcom/amazon/a/a/o/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/amazon/a/a/o/g<",
            "Landroid/app/Service;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Lcom/amazon/a/a/o/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/amazon/a/a/o/g<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private final f:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final g:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final h:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private i:Landroid/app/Application;
    .annotation runtime Lcom/amazon/a/a/k/a;
    .end annotation
.end field

.field private j:Lcom/amazon/a/a/n/b;
    .annotation runtime Lcom/amazon/a/a/k/a;
    .end annotation
.end field

.field private k:Lcom/amazon/a/a/c/f;
    .annotation runtime Lcom/amazon/a/a/k/a;
    .end annotation
.end field

.field private l:Ljava/lang/String;

.field private m:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 36
    new-instance v0, Lcom/amazon/a/a/o/c;

    const-string v1, "ContextManagerImplV2"

    invoke-direct {v0, v1}, Lcom/amazon/a/a/o/c;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/amazon/a/a/a/b;->b:Ljava/util/concurrent/atomic/AtomicReference;

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/amazon/a/a/a/b;->c:Ljava/util/List;

    .line 56
    new-instance v0, Lcom/amazon/a/a/o/g;

    invoke-direct {v0}, Lcom/amazon/a/a/o/g;-><init>()V

    iput-object v0, p0, Lcom/amazon/a/a/a/b;->d:Lcom/amazon/a/a/o/g;

    .line 63
    new-instance v0, Lcom/amazon/a/a/o/g;

    invoke-direct {v0}, Lcom/amazon/a/a/o/g;-><init>()V

    iput-object v0, p0, Lcom/amazon/a/a/a/b;->e:Lcom/amazon/a/a/o/g;

    .line 69
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/amazon/a/a/a/b;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 77
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/amazon/a/a/a/b;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 85
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/amazon/a/a/a/b;->h:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-boolean v1, p0, Lcom/amazon/a/a/a/b;->m:Z

    return-void
.end method

.method private a(Landroid/content/Intent;)V
    .locals 3

    .line 710
    sget-boolean v0, Lcom/amazon/a/a/o/c;->a:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    .line 711
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Received broadcast intent: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    .line 718
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/a/a/a/b;->l:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 719
    sget-boolean v0, Lcom/amazon/a/a/o/c;->b:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    .line 720
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Received broadcast for unrequested action: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 721
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 720
    invoke-virtual {v0, p1}, Lcom/amazon/a/a/o/c;->b(Ljava/lang/String;)V

    :cond_1
    return-void

    :cond_2
    iget-object v0, p0, Lcom/amazon/a/a/a/b;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 731
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_4

    .line 732
    sget-boolean v0, Lcom/amazon/a/a/o/c;->b:Z

    if-eqz v0, :cond_3

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    .line 733
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Received intent to shutdown app when we are not in shutdown state: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/amazon/a/a/o/c;->b(Ljava/lang/String;)V

    :cond_3
    return-void

    :cond_4
    iget-object p1, p0, Lcom/amazon/a/a/a/b;->h:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 743
    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p1

    if-nez p1, :cond_6

    .line 744
    sget-boolean p1, Lcom/amazon/a/a/o/c;->a:Z

    if-eqz p1, :cond_5

    sget-object p1, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    const-string v0, "shutdown broadcast already received, ignoring"

    .line 745
    invoke-virtual {p1, v0}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    :cond_5
    return-void

    .line 750
    :cond_6
    sget-boolean p1, Lcom/amazon/a/a/o/c;->a:Z

    if-eqz p1, :cond_7

    sget-object p1, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    const-string v0, "Stopping services in response to broadcast"

    .line 751
    invoke-virtual {p1, v0}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    .line 752
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Service to stop: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/amazon/a/a/a/b;->d:Lcom/amazon/a/a/o/g;

    invoke-virtual {v1}, Lcom/amazon/a/a/o/g;->b()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    :cond_7
    iget-object p1, p0, Lcom/amazon/a/a/a/b;->d:Lcom/amazon/a/a/o/g;

    .line 758
    invoke-virtual {p1}, Lcom/amazon/a/a/o/g;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Service;

    .line 759
    invoke-direct {p0, v0}, Lcom/amazon/a/a/a/b;->c(Landroid/app/Service;)V

    goto :goto_0

    :cond_8
    return-void
.end method

.method private a(Lcom/amazon/a/a/a/a/b;Landroid/app/Activity;)V
    .locals 1

    .line 204
    new-instance v0, Lcom/amazon/a/a/a/a/a;

    invoke-direct {v0, p1, p2}, Lcom/amazon/a/a/a/a/a;-><init>(Lcom/amazon/a/a/a/a/b;Landroid/app/Activity;)V

    iget-object p1, p0, Lcom/amazon/a/a/a/b;->k:Lcom/amazon/a/a/c/f;

    .line 207
    invoke-interface {p1, v0}, Lcom/amazon/a/a/c/f;->a(Lcom/amazon/a/a/c/a;)V

    return-void
.end method

.method private a(Lcom/amazon/a/a/a/a/d;)V
    .locals 2

    .line 215
    new-instance v0, Lcom/amazon/a/a/a/a/c;

    iget-object v1, p0, Lcom/amazon/a/a/a/b;->i:Landroid/app/Application;

    invoke-direct {v0, p1, v1}, Lcom/amazon/a/a/a/a/c;-><init>(Lcom/amazon/a/a/a/a/d;Landroid/app/Application;)V

    iget-object p1, p0, Lcom/amazon/a/a/a/b;->k:Lcom/amazon/a/a/c/f;

    .line 216
    invoke-interface {p1, v0}, Lcom/amazon/a/a/c/f;->a(Lcom/amazon/a/a/c/a;)V

    return-void
.end method

.method static synthetic a(Lcom/amazon/a/a/a/b;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/amazon/a/a/a/b;->j()V

    return-void
.end method

.method static synthetic a(Lcom/amazon/a/a/a/b;Landroid/content/Intent;)V
    .locals 0

    .line 33
    invoke-direct {p0, p1}, Lcom/amazon/a/a/a/b;->a(Landroid/content/Intent;)V

    return-void
.end method

.method private c(Landroid/app/Service;)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    .line 773
    :cond_0
    sget-boolean v0, Lcom/amazon/a/a/o/c;->a:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    .line 774
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Stopping service: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    .line 777
    :cond_1
    invoke-virtual {p1}, Landroid/app/Service;->stopSelf()V

    return-void
.end method

.method private g(Landroid/app/Activity;)Z
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 148
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->isTaskRoot()Z

    move-result p1

    return p1
.end method

.method private h(Landroid/app/Activity;)Z
    .locals 4

    .line 265
    sget-boolean v0, Lcom/amazon/a/a/o/c;->a:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    const-string v1, "Checking if application is destroyed"

    .line 266
    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/amazon/a/a/a/b;->c:Ljava/util/List;

    .line 272
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    :cond_1
    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    .line 276
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "App is destroyed: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/app/Activity;->isTaskRoot()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 276
    invoke-virtual {v0, v2}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    .line 283
    invoke-virtual {p1}, Landroid/app/Activity;->isTaskRoot()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method private i(Landroid/app/Activity;)Landroid/app/Activity;
    .locals 1

    .line 400
    :goto_0
    invoke-virtual {p1}, Landroid/app/Activity;->isChild()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 401
    invoke-virtual {p1}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object p1

    goto :goto_0

    :cond_0
    return-object p1
.end method

.method private i()Z
    .locals 3

    iget-boolean v0, p0, Lcom/amazon/a/a/a/b;->m:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/amazon/a/a/a/b;->c:Ljava/util/List;

    .line 194
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    move v1, v2

    :cond_1
    return v1
.end method

.method private j()V
    .locals 2

    .line 509
    sget-boolean v0, Lcom/amazon/a/a/o/c;->a:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    const-string v1, "----------- EXECUTING FINISH ACTIVITIES -----------"

    .line 510
    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/amazon/a/a/a/b;->i:Landroid/app/Application;

    .line 511
    invoke-virtual {v1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    const-string v1, "---------------------------------------------------"

    .line 512
    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    .line 518
    :cond_0
    invoke-direct {p0}, Lcom/amazon/a/a/a/b;->k()V

    .line 523
    invoke-direct {p0}, Lcom/amazon/a/a/a/b;->l()V

    .line 532
    invoke-direct {p0}, Lcom/amazon/a/a/a/b;->m()V

    return-void
.end method

.method private j(Landroid/app/Activity;)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    .line 564
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->isChild()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    .line 565
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Not finishing activity: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", it is a child of: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 566
    invoke-virtual {p1}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 565
    invoke-virtual {v0, p1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    .line 568
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Finishing Activity: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    .line 569
    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    :goto_0
    return-void
.end method

.method private k()V
    .locals 4

    .line 541
    invoke-virtual {p0}, Lcom/amazon/a/a/a/b;->a()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/a/a/a/b;->c:Ljava/util/List;

    .line 543
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    .line 544
    invoke-virtual {v2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 545
    invoke-direct {p0, v2}, Lcom/amazon/a/a/a/b;->j(Landroid/app/Activity;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private l()V
    .locals 4

    .line 578
    invoke-virtual {p0}, Lcom/amazon/a/a/a/b;->a()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    const-string v1, "Shutdown found no root, no activities to pop off stack!"

    .line 580
    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    return-void

    :cond_0
    sget-object v1, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    const-string v2, "Moving task to background"

    .line 585
    invoke-virtual {v1, v2}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    const/4 v2, 0x1

    .line 586
    invoke-virtual {v0, v2}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    .line 588
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Popping activity stack, root: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    .line 589
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v2, 0x4000000

    .line 590
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/high16 v2, 0x20000000

    .line 591
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 592
    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private m()V
    .locals 3

    .line 600
    new-instance v0, Lcom/amazon/a/a/a/b$2;

    invoke-direct {v0, p0}, Lcom/amazon/a/a/a/b$2;-><init>(Lcom/amazon/a/a/a/b;)V

    iget-object v1, p0, Lcom/amazon/a/a/a/b;->j:Lcom/amazon/a/a/n/b;

    .line 622
    sget-object v2, Lcom/amazon/a/a/n/b/d;->a:Lcom/amazon/a/a/n/b/d;

    invoke-interface {v1, v2, v0}, Lcom/amazon/a/a/n/b;->a(Lcom/amazon/a/a/n/b/d;Lcom/amazon/a/a/n/a;)V

    return-void
.end method


# virtual methods
.method public a()Landroid/app/Activity;
    .locals 3

    .line 126
    invoke-static {}, Lcom/amazon/a/a/o/a/a;->a()V

    iget-object v0, p0, Lcom/amazon/a/a/a/b;->c:Ljava/util/List;

    .line 131
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    iget-object v1, p0, Lcom/amazon/a/a/a/b;->c:Ljava/util/List;

    .line 132
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    .line 133
    invoke-direct {p0, v1}, Lcom/amazon/a/a/a/b;->g(Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public a(Landroid/app/Activity;)V
    .locals 3

    const-string v0, "activity"

    .line 157
    invoke-static {p1, v0}, Lcom/amazon/a/a/o/a/a;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 158
    invoke-static {}, Lcom/amazon/a/a/o/a/a;->a()V

    iget-object v0, p0, Lcom/amazon/a/a/a/b;->c:Ljava/util/List;

    .line 163
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    sget-boolean v0, Lcom/amazon/a/a/o/c;->a:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    .line 166
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Activity->onCreate.  Activity: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", Total Activities: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/amazon/a/a/a/b;->c:Ljava/util/List;

    .line 167
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 166
    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    .line 173
    :cond_0
    sget-object v0, Lcom/amazon/a/a/a/a/b;->a:Lcom/amazon/a/a/a/a/b;

    invoke-direct {p0, v0, p1}, Lcom/amazon/a/a/a/b;->a(Lcom/amazon/a/a/a/a/b;Landroid/app/Activity;)V

    .line 179
    invoke-direct {p0}, Lcom/amazon/a/a/a/b;->i()Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/amazon/a/a/a/b;->m:Z

    .line 181
    sget-object p1, Lcom/amazon/a/a/a/a/d;->a:Lcom/amazon/a/a/a/a/d;

    invoke-direct {p0, p1}, Lcom/amazon/a/a/a/b;->a(Lcom/amazon/a/a/a/a/d;)V

    :cond_1
    return-void
.end method

.method public a(Landroid/app/Service;)V
    .locals 3

    .line 412
    invoke-static {}, Lcom/amazon/a/a/o/a/a;->a()V

    .line 414
    sget-boolean v0, Lcom/amazon/a/a/o/c;->a:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    .line 415
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Service->onCreate: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/amazon/a/a/a/b;->d:Lcom/amazon/a/a/o/g;

    .line 417
    invoke-virtual {v0, p1}, Lcom/amazon/a/a/o/g;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public b()Landroid/app/Activity;
    .locals 1

    .line 450
    invoke-static {}, Lcom/amazon/a/a/o/a/a;->a()V

    iget-object v0, p0, Lcom/amazon/a/a/a/b;->b:Ljava/util/concurrent/atomic/AtomicReference;

    .line 451
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    return-object v0
.end method

.method public b(Landroid/app/Activity;)V
    .locals 3

    const-string v0, "activity"

    .line 225
    invoke-static {p1, v0}, Lcom/amazon/a/a/o/a/a;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 226
    invoke-static {}, Lcom/amazon/a/a/o/a/a;->a()V

    iget-object v0, p0, Lcom/amazon/a/a/a/b;->c:Ljava/util/List;

    .line 231
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 233
    sget-boolean v0, Lcom/amazon/a/a/o/c;->a:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    .line 234
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Activity->onDestroy.  Activity: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", Total Activities: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/amazon/a/a/a/b;->c:Ljava/util/List;

    .line 235
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 234
    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    .line 241
    :cond_0
    sget-object v0, Lcom/amazon/a/a/a/a/b;->b:Lcom/amazon/a/a/a/a/b;

    invoke-direct {p0, v0, p1}, Lcom/amazon/a/a/a/b;->a(Lcom/amazon/a/a/a/a/b;Landroid/app/Activity;)V

    .line 246
    invoke-direct {p0, p1}, Lcom/amazon/a/a/a/b;->h(Landroid/app/Activity;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/amazon/a/a/a/b;->m:Z

    .line 254
    sget-object p1, Lcom/amazon/a/a/a/a/d;->b:Lcom/amazon/a/a/a/a/d;

    invoke-direct {p0, p1}, Lcom/amazon/a/a/a/b;->a(Lcom/amazon/a/a/a/a/d;)V

    :cond_1
    return-void
.end method

.method public b(Landroid/app/Service;)V
    .locals 1

    .line 426
    invoke-static {}, Lcom/amazon/a/a/o/a/a;->a()V

    iget-object v0, p0, Lcom/amazon/a/a/a/b;->d:Lcom/amazon/a/a/o/g;

    .line 431
    invoke-virtual {v0, p1}, Lcom/amazon/a/a/o/g;->b(Ljava/lang/Object;)V

    return-void
.end method

.method public c(Landroid/app/Activity;)V
    .locals 4

    .line 378
    invoke-static {}, Lcom/amazon/a/a/o/a/a;->a()V

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    .line 380
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Activity resumed: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", is child: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 381
    invoke-virtual {p1}, Landroid/app/Activity;->isChild()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 380
    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    .line 383
    invoke-direct {p0, p1}, Lcom/amazon/a/a/a/b;->i(Landroid/app/Activity;)Landroid/app/Activity;

    move-result-object v1

    .line 385
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Setting visible to: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/amazon/a/a/a/b;->b:Ljava/util/concurrent/atomic/AtomicReference;

    .line 387
    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 389
    sget-boolean v1, Lcom/amazon/a/a/o/c;->a:Z

    if-eqz v1, :cond_0

    .line 390
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Activity now visible: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", publishing resume event"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    .line 394
    :cond_0
    sget-object v0, Lcom/amazon/a/a/a/a/b;->c:Lcom/amazon/a/a/a/a/b;

    invoke-direct {p0, v0, p1}, Lcom/amazon/a/a/a/b;->a(Lcom/amazon/a/a/a/a/b;Landroid/app/Activity;)V

    return-void
.end method

.method public c()Z
    .locals 1

    iget-object v0, p0, Lcom/amazon/a/a/a/b;->b:Ljava/util/concurrent/atomic/AtomicReference;

    .line 460
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public d(Landroid/app/Activity;)V
    .locals 3

    .line 349
    invoke-static {}, Lcom/amazon/a/a/o/a/a;->a()V

    .line 351
    sget-boolean v0, Lcom/amazon/a/a/o/c;->a:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    .line 352
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Activity paused: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", visible activity: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    invoke-virtual {p0}, Lcom/amazon/a/a/a/b;->b()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 352
    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    .line 361
    :cond_0
    invoke-virtual {p0}, Lcom/amazon/a/a/a/b;->b()Landroid/app/Activity;

    move-result-object v0

    if-ne v0, p1, :cond_2

    .line 362
    sget-boolean v0, Lcom/amazon/a/a/o/c;->a:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    const-string v1, "Setting visible activity to null"

    .line 363
    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/amazon/a/a/a/b;->b:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    .line 365
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 368
    sget-object v0, Lcom/amazon/a/a/a/a/b;->d:Lcom/amazon/a/a/a/a/b;

    invoke-direct {p0, v0, p1}, Lcom/amazon/a/a/a/b;->a(Lcom/amazon/a/a/a/a/b;Landroid/app/Activity;)V

    :cond_2
    return-void
.end method

.method public d()Z
    .locals 1

    iget-object v0, p0, Lcom/amazon/a/a/a/b;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 440
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/amazon/a/a/a/b;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 441
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public e()V
    .locals 3

    iget-object v0, p0, Lcom/amazon/a/a/a/b;->i:Landroid/app/Application;

    .line 676
    invoke-virtual {v0}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 677
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "com.amazon."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".shutdown"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/a/a/a/b;->l:Ljava/lang/String;

    .line 682
    new-instance v0, Lcom/amazon/a/a/a/b$3;

    invoke-direct {v0, p0}, Lcom/amazon/a/a/a/b$3;-><init>(Lcom/amazon/a/a/a/b;)V

    .line 692
    new-instance v1, Landroid/content/IntentFilter;

    iget-object v2, p0, Lcom/amazon/a/a/a/b;->l:Ljava/lang/String;

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/amazon/a/a/a/b;->i:Landroid/app/Application;

    .line 693
    invoke-virtual {v2, v0, v1}, Landroid/app/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public e(Landroid/app/Activity;)V
    .locals 3

    const-string v0, "activity"

    .line 292
    invoke-static {p1, v0}, Lcom/amazon/a/a/o/a/a;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 293
    invoke-static {}, Lcom/amazon/a/a/o/a/a;->a()V

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    .line 298
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Activity started: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/amazon/a/a/a/b;->e:Lcom/amazon/a/a/o/g;

    .line 299
    invoke-virtual {v0, p1}, Lcom/amazon/a/a/o/g;->a(Ljava/lang/Object;)V

    .line 304
    sget-object v0, Lcom/amazon/a/a/a/a/b;->e:Lcom/amazon/a/a/a/a/b;

    invoke-direct {p0, v0, p1}, Lcom/amazon/a/a/a/b;->a(Lcom/amazon/a/a/a/a/b;Landroid/app/Activity;)V

    iget-object p1, p0, Lcom/amazon/a/a/a/b;->e:Lcom/amazon/a/a/o/g;

    .line 310
    invoke-virtual {p1}, Lcom/amazon/a/a/o/g;->b()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 311
    sget-object p1, Lcom/amazon/a/a/a/a/d;->c:Lcom/amazon/a/a/a/a/d;

    invoke-direct {p0, p1}, Lcom/amazon/a/a/a/b;->a(Lcom/amazon/a/a/a/a/d;)V

    :cond_0
    return-void
.end method

.method public f()V
    .locals 3

    iget-object v0, p0, Lcom/amazon/a/a/a/b;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 472
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 476
    :cond_0
    sget-boolean v0, Lcom/amazon/a/a/o/c;->a:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    const-string v1, "---------- SCHEDULING FINISH ACTIVITIES -----------"

    .line 477
    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/amazon/a/a/a/b;->i:Landroid/app/Application;

    .line 478
    invoke-virtual {v1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    .line 479
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    const-string v1, "---------------------------------------------------"

    .line 480
    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    .line 486
    :cond_1
    new-instance v0, Lcom/amazon/a/a/a/b$1;

    invoke-direct {v0, p0}, Lcom/amazon/a/a/a/b$1;-><init>(Lcom/amazon/a/a/a/b;)V

    iget-object v1, p0, Lcom/amazon/a/a/a/b;->j:Lcom/amazon/a/a/n/b;

    .line 501
    sget-object v2, Lcom/amazon/a/a/n/b/d;->a:Lcom/amazon/a/a/n/b/d;

    invoke-interface {v1, v2, v0}, Lcom/amazon/a/a/n/b;->a(Lcom/amazon/a/a/n/b/d;Lcom/amazon/a/a/n/a;)V

    return-void
.end method

.method public f(Landroid/app/Activity;)V
    .locals 3

    const-string v0, "activity"

    .line 321
    invoke-static {p1, v0}, Lcom/amazon/a/a/o/a/a;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 322
    invoke-static {}, Lcom/amazon/a/a/o/a/a;->a()V

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    .line 327
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Activity stopped: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/amazon/a/a/a/b;->e:Lcom/amazon/a/a/o/g;

    .line 328
    invoke-virtual {v0, p1}, Lcom/amazon/a/a/o/g;->b(Ljava/lang/Object;)V

    .line 333
    sget-object v0, Lcom/amazon/a/a/a/a/b;->f:Lcom/amazon/a/a/a/a/b;

    invoke-direct {p0, v0, p1}, Lcom/amazon/a/a/a/b;->a(Lcom/amazon/a/a/a/a/b;Landroid/app/Activity;)V

    iget-object p1, p0, Lcom/amazon/a/a/a/b;->e:Lcom/amazon/a/a/o/g;

    .line 338
    invoke-virtual {p1}, Lcom/amazon/a/a/o/g;->a()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 339
    sget-object p1, Lcom/amazon/a/a/a/a/d;->d:Lcom/amazon/a/a/a/a/d;

    invoke-direct {p0, p1}, Lcom/amazon/a/a/a/b;->a(Lcom/amazon/a/a/a/a/d;)V

    :cond_0
    return-void
.end method

.method public g()V
    .locals 4

    iget-object v0, p0, Lcom/amazon/a/a/a/b;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 637
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    .line 638
    sget-boolean v0, Lcom/amazon/a/a/o/c;->a:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    const-string v1, "Ignoring duplicate stopServices request"

    .line 639
    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    .line 646
    :cond_0
    sget-boolean v0, Lcom/amazon/a/a/o/c;->a:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    const-string v1, "------------- STOPPING SERVICES -------------------"

    .line 647
    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/amazon/a/a/a/b;->i:Landroid/app/Application;

    .line 648
    invoke-virtual {v1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    const-string v1, "---------------------------------------------------"

    .line 649
    invoke-virtual {v0, v1}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    .line 655
    :cond_1
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/amazon/a/a/a/b;->l:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/amazon/a/a/a/b;->i:Landroid/app/Application;

    .line 656
    invoke-virtual {v1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 658
    sget-boolean v1, Lcom/amazon/a/a/o/c;->a:Z

    if-eqz v1, :cond_2

    sget-object v1, Lcom/amazon/a/a/a/b;->a:Lcom/amazon/a/a/o/c;

    .line 659
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Sending Broadcast!!!!: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ", Thread: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 660
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 659
    invoke-virtual {v1, v2}, Lcom/amazon/a/a/o/c;->a(Ljava/lang/String;)V

    :cond_2
    iget-object v1, p0, Lcom/amazon/a/a/a/b;->i:Landroid/app/Application;

    .line 662
    invoke-virtual {v1, v0}, Landroid/app/Application;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method public h()Z
    .locals 1

    const-string v0, "Method isContextAware() is not used for Kiwi\'s ContextManagerImplV2"

    .line 701
    invoke-static {v0}, Lcom/amazon/a/a/o/a/a;->a(Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0
.end method
