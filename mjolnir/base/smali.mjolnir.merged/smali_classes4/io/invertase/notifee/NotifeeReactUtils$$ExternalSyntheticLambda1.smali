.class public final synthetic Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;


# instance fields
.field public final synthetic f$0:Lcom/facebook/react/jstasks/HeadlessJsTaskContext;

.field public final synthetic f$1:Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/react/jstasks/HeadlessJsTaskContext;Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda1;->f$0:Lcom/facebook/react/jstasks/HeadlessJsTaskContext;

    iput-object p2, p0, Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda1;->f$1:Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    iget-object v0, p0, Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda1;->f$0:Lcom/facebook/react/jstasks/HeadlessJsTaskContext;

    iget-object v1, p0, Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda1;->f$1:Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;

    invoke-static {v0, v1}, Lio/invertase/notifee/NotifeeReactUtils;->lambda$startHeadlessTask$0(Lcom/facebook/react/jstasks/HeadlessJsTaskContext;Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;)V

    return-void
.end method
