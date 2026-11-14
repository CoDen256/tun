.class public final synthetic Lio/invertase/notifee/NotifeeReactUtils$2$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;


# direct methods
.method public synthetic constructor <init>(Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/invertase/notifee/NotifeeReactUtils$2$$ExternalSyntheticLambda0;->f$0:Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lio/invertase/notifee/NotifeeReactUtils$2$$ExternalSyntheticLambda0;->f$0:Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;

    invoke-interface {v0}, Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;->call()V

    return-void
.end method
