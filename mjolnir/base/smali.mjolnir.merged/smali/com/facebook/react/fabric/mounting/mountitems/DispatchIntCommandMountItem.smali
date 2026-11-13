.class final Lcom/facebook/react/fabric/mounting/mountitems/DispatchIntCommandMountItem;
.super Lcom/facebook/react/fabric/mounting/mountitems/DispatchCommandMountItem;
.source "DispatchIntCommandMountItem.java"


# instance fields
.field private final mCommandArgs:Lcom/facebook/react/bridge/ReadableArray;

.field private final mCommandId:I

.field private final mReactTag:I

.field private final mSurfaceId:I


# direct methods
.method constructor <init>(IIILcom/facebook/react/bridge/ReadableArray;)V
    .locals 0

    .line 25
    invoke-direct {p0}, Lcom/facebook/react/fabric/mounting/mountitems/DispatchCommandMountItem;-><init>()V

    iput p1, p0, Lcom/facebook/react/fabric/mounting/mountitems/DispatchIntCommandMountItem;->mSurfaceId:I

    iput p2, p0, Lcom/facebook/react/fabric/mounting/mountitems/DispatchIntCommandMountItem;->mReactTag:I

    iput p3, p0, Lcom/facebook/react/fabric/mounting/mountitems/DispatchIntCommandMountItem;->mCommandId:I

    iput-object p4, p0, Lcom/facebook/react/fabric/mounting/mountitems/DispatchIntCommandMountItem;->mCommandArgs:Lcom/facebook/react/bridge/ReadableArray;

    return-void
.end method


# virtual methods
.method public execute(Lcom/facebook/react/fabric/mounting/MountingManager;)V
    .locals 4

    iget v0, p0, Lcom/facebook/react/fabric/mounting/mountitems/DispatchIntCommandMountItem;->mSurfaceId:I

    iget v1, p0, Lcom/facebook/react/fabric/mounting/mountitems/DispatchIntCommandMountItem;->mReactTag:I

    iget v2, p0, Lcom/facebook/react/fabric/mounting/mountitems/DispatchIntCommandMountItem;->mCommandId:I

    iget-object v3, p0, Lcom/facebook/react/fabric/mounting/mountitems/DispatchIntCommandMountItem;->mCommandArgs:Lcom/facebook/react/bridge/ReadableArray;

    .line 39
    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/facebook/react/fabric/mounting/MountingManager;->receiveCommand(IIILcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method

.method public getSurfaceId()I
    .locals 1

    iget v0, p0, Lcom/facebook/react/fabric/mounting/mountitems/DispatchIntCommandMountItem;->mSurfaceId:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DispatchIntCommandMountItem ["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/facebook/react/fabric/mounting/mountitems/DispatchIntCommandMountItem;->mReactTag:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/facebook/react/fabric/mounting/mountitems/DispatchIntCommandMountItem;->mCommandId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
