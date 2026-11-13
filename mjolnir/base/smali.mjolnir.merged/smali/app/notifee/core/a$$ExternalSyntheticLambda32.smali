.class public final synthetic Lapp/notifee/core/a$$ExternalSyntheticLambda32;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Ln/o/t/i/f/e/e/a;


# direct methods
.method public synthetic constructor <init>(Ln/o/t/i/f/e/e/a;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/notifee/core/a$$ExternalSyntheticLambda32;->f$0:Ln/o/t/i/f/e/e/a;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lapp/notifee/core/a$$ExternalSyntheticLambda32;->f$0:Ln/o/t/i/f/e/e/a;

    invoke-static {v0}, Lapp/notifee/core/a;->b(Ln/o/t/i/f/e/e/a;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method
