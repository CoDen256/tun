.class Lcom/facebook/react/fabric/mounting/mountitems/SendAccessibilityEvent;
.super Ljava/lang/Object;
.source "SendAccessibilityEvent.java"

# interfaces
.implements Lcom/facebook/react/fabric/mounting/mountitems/MountItem;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private final mEventType:I

.field private final mReactTag:I

.field private final mSurfaceId:I


# direct methods
.method public constructor <init>(III)V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Fabric.SendAccessibilityEvent"

    iput-object v0, p0, Lcom/facebook/react/fabric/mounting/mountitems/SendAccessibilityEvent;->TAG:Ljava/lang/String;

    iput p1, p0, Lcom/facebook/react/fabric/mounting/mountitems/SendAccessibilityEvent;->mSurfaceId:I

    iput p2, p0, Lcom/facebook/react/fabric/mounting/mountitems/SendAccessibilityEvent;->mReactTag:I

    iput p3, p0, Lcom/facebook/react/fabric/mounting/mountitems/SendAccessibilityEvent;->mEventType:I

    return-void
.end method


# virtual methods
.method public execute(Lcom/facebook/react/fabric/mounting/MountingManager;)V
    .locals 3

    :try_start_0
    iget v0, p0, Lcom/facebook/react/fabric/mounting/mountitems/SendAccessibilityEvent;->mSurfaceId:I

    iget v1, p0, Lcom/facebook/react/fabric/mounting/mountitems/SendAccessibilityEvent;->mReactTag:I

    iget v2, p0, Lcom/facebook/react/fabric/mounting/mountitems/SendAccessibilityEvent;->mEventType:I

    .line 34
    invoke-virtual {p1, v0, v1, v2}, Lcom/facebook/react/fabric/mounting/MountingManager;->sendAccessibilityEvent(III)V
    :try_end_0
    .catch Lcom/facebook/react/bridge/RetryableMountingLayerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Fabric.SendAccessibilityEvent"

    .line 43
    invoke-static {v0, p1}, Lcom/facebook/react/bridge/ReactSoftExceptionLogger;->logSoftException(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public getSurfaceId()I
    .locals 1

    iget v0, p0, Lcom/facebook/react/fabric/mounting/mountitems/SendAccessibilityEvent;->mSurfaceId:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SendAccessibilityEvent ["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/facebook/react/fabric/mounting/mountitems/SendAccessibilityEvent;->mReactTag:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/facebook/react/fabric/mounting/mountitems/SendAccessibilityEvent;->mEventType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
