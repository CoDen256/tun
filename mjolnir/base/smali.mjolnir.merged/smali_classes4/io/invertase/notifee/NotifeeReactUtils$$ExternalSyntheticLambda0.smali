.class public final synthetic Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Lcom/facebook/react/bridge/WritableMap;

.field public final synthetic f$2:J

.field public final synthetic f$3:Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;JLio/invertase/notifee/NotifeeReactUtils$GenericCallback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iput-object p2, p0, Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda0;->f$1:Lcom/facebook/react/bridge/WritableMap;

    iput-wide p3, p0, Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda0;->f$2:J

    iput-object p5, p0, Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda0;->f$3:Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 5

    iget-object v0, p0, Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iget-object v1, p0, Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda0;->f$1:Lcom/facebook/react/bridge/WritableMap;

    iget-wide v2, p0, Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda0;->f$2:J

    iget-object v4, p0, Lio/invertase/notifee/NotifeeReactUtils$$ExternalSyntheticLambda0;->f$3:Lio/invertase/notifee/NotifeeReactUtils$GenericCallback;

    invoke-static {v0, v1, v2, v3, v4}, Lio/invertase/notifee/NotifeeReactUtils;->lambda$startHeadlessTask$1(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;JLio/invertase/notifee/NotifeeReactUtils$GenericCallback;)V

    return-void
.end method
