.class public final synthetic Lapp/notifee/core/database/a$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Lapp/notifee/core/database/a;


# direct methods
.method public synthetic constructor <init>(Lapp/notifee/core/database/a;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/notifee/core/database/a$$ExternalSyntheticLambda0;->f$0:Lapp/notifee/core/database/a;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lapp/notifee/core/database/a$$ExternalSyntheticLambda0;->f$0:Lapp/notifee/core/database/a;

    invoke-static {v0}, Lapp/notifee/core/database/a;->$r8$lambda$qTvsy2UlJgFNeKQDPgztn1Y8OR0(Lapp/notifee/core/database/a;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
