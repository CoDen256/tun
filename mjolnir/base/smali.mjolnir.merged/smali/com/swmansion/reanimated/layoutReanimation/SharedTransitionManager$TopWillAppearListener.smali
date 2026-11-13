.class Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TopWillAppearListener;
.super Ljava/lang/Object;
.source "SharedTransitionManager.java"

# interfaces
.implements Lcom/facebook/react/uimanager/events/EventDispatcherListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TopWillAppearListener"
.end annotation


# instance fields
.field private final mEventDispatcher:Lcom/facebook/react/uimanager/events/EventDispatcher;

.field final synthetic this$0:Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;


# direct methods
.method public constructor <init>(Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;Lcom/facebook/react/uimanager/events/EventDispatcher;)V
    .locals 0

    iput-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TopWillAppearListener;->this$0:Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TopWillAppearListener;->mEventDispatcher:Lcom/facebook/react/uimanager/events/EventDispatcher;

    return-void
.end method


# virtual methods
.method public onEventDispatch(Lcom/facebook/react/uimanager/events/Event;)V
    .locals 2

    .line 60
    invoke-virtual {p1}, Lcom/facebook/react/uimanager/events/Event;->getEventName()Ljava/lang/String;

    move-result-object p1

    const-string/jumbo v0, "topWillAppear"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TopWillAppearListener;->this$0:Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;

    .line 61
    invoke-static {p1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->-$$Nest$fgetmAddedSharedViews(Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->-$$Nest$mtryStartSharedTransitionForViews(Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;Ljava/util/List;Z)Z

    iget-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TopWillAppearListener;->this$0:Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;

    .line 62
    invoke-static {p1}, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;->-$$Nest$fgetmAddedSharedViews(Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->clear()V

    iget-object p1, p0, Lcom/swmansion/reanimated/layoutReanimation/SharedTransitionManager$TopWillAppearListener;->mEventDispatcher:Lcom/facebook/react/uimanager/events/EventDispatcher;

    .line 63
    invoke-interface {p1, p0}, Lcom/facebook/react/uimanager/events/EventDispatcher;->removeListener(Lcom/facebook/react/uimanager/events/EventDispatcherListener;)V

    :cond_0
    return-void
.end method
