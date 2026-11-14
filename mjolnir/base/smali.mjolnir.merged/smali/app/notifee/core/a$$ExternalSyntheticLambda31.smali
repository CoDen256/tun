.class public final synthetic Lapp/notifee/core/a$$ExternalSyntheticLambda31;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Ln/o/t/i/f/e/e/b;


# direct methods
.method public synthetic constructor <init>(Ln/o/t/i/f/e/e/b;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/notifee/core/a$$ExternalSyntheticLambda31;->f$0:Ln/o/t/i/f/e/e/b;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lapp/notifee/core/a$$ExternalSyntheticLambda31;->f$0:Ln/o/t/i/f/e/e/b;

    invoke-static {v0}, Lapp/notifee/core/a;->b(Ln/o/t/i/f/e/e/b;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method
