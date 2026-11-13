.class final Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;
.super Ljava/lang/Object;
.source "IntBufferBatchMountItem.java"

# interfaces
.implements Lcom/facebook/react/fabric/mounting/mountitems/BatchMountItem;


# static fields
.field static final INSTRUCTION_CREATE:I = 0x2

.field static final INSTRUCTION_DELETE:I = 0x4

.field static final INSTRUCTION_FLAG_MULTIPLE:I = 0x1

.field static final INSTRUCTION_INSERT:I = 0x8

.field static final INSTRUCTION_REMOVE:I = 0x10

.field static final INSTRUCTION_REMOVE_DELETE_TREE:I = 0x800

.field static final INSTRUCTION_UPDATE_EVENT_EMITTER:I = 0x100

.field static final INSTRUCTION_UPDATE_LAYOUT:I = 0x80

.field static final INSTRUCTION_UPDATE_OVERFLOW_INSET:I = 0x400

.field static final INSTRUCTION_UPDATE_PADDING:I = 0x200

.field static final INSTRUCTION_UPDATE_PROPS:I = 0x20

.field static final INSTRUCTION_UPDATE_STATE:I = 0x40

.field static final TAG:Ljava/lang/String; = "IntBufferBatchMountItem"


# instance fields
.field private final mCommitNumber:I

.field private final mIntBuffer:[I

.field private final mIntBufferLen:I

.field private final mObjBuffer:[Ljava/lang/Object;

.field private final mObjBufferLen:I

.field private final mSurfaceId:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(I[I[Ljava/lang/Object;I)V
    .locals 0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mSurfaceId:I

    iput p4, p0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mCommitNumber:I

    iput-object p2, p0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    iput-object p3, p0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mObjBuffer:[Ljava/lang/Object;

    const/4 p1, 0x0

    if-eqz p2, :cond_0

    .line 71
    array-length p2, p2

    goto :goto_0

    :cond_0
    move p2, p1

    :goto_0
    iput p2, p0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBufferLen:I

    if-eqz p3, :cond_1

    .line 72
    array-length p1, p3

    :cond_1
    iput p1, p0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mObjBufferLen:I

    return-void
.end method

.method private beginMarkers(Ljava/lang/String;)V
    .locals 2

    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "FabricUIManager::"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p1}, Lcom/facebook/systrace/Systrace;->beginSection(JLjava/lang/String;)V

    iget p1, p0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mCommitNumber:I

    if-lez p1, :cond_0

    .line 79
    sget-object p1, Lcom/facebook/react/bridge/ReactMarkerConstants;->FABRIC_BATCH_EXECUTION_START:Lcom/facebook/react/bridge/ReactMarkerConstants;

    const/4 v0, 0x0

    iget v1, p0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mCommitNumber:I

    invoke-static {p1, v0, v1}, Lcom/facebook/react/bridge/ReactMarker;->logFabricMarker(Lcom/facebook/react/bridge/ReactMarkerConstants;Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method private endMarkers()V
    .locals 3

    iget v0, p0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mCommitNumber:I

    if-lez v0, :cond_0

    .line 86
    sget-object v0, Lcom/facebook/react/bridge/ReactMarkerConstants;->FABRIC_BATCH_EXECUTION_END:Lcom/facebook/react/bridge/ReactMarkerConstants;

    const/4 v1, 0x0

    iget v2, p0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mCommitNumber:I

    invoke-static {v0, v1, v2}, Lcom/facebook/react/bridge/ReactMarker;->logFabricMarker(Lcom/facebook/react/bridge/ReactMarkerConstants;Ljava/lang/String;I)V

    :cond_0
    const-wide/16 v0, 0x0

    .line 90
    invoke-static {v0, v1}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    return-void
.end method


# virtual methods
.method public execute(Lcom/facebook/react/fabric/mounting/MountingManager;)V
    .locals 19

    move-object/from16 v0, p0

    iget v1, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mSurfaceId:I

    move-object/from16 v2, p1

    .line 95
    invoke-virtual {v2, v1}, Lcom/facebook/react/fabric/mounting/MountingManager;->getSurfaceManager(I)Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;

    move-result-object v1

    const/4 v10, 0x0

    const/4 v11, 0x1

    if-nez v1, :cond_0

    sget-object v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->TAG:Ljava/lang/String;

    new-array v2, v11, [Ljava/lang/Object;

    iget v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mSurfaceId:I

    .line 100
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v10

    const-string v3, "Skipping batch of MountItems; no SurfaceMountingManager found for [%d]."

    .line 97
    invoke-static {v1, v3, v2}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    .line 103
    :cond_0
    invoke-virtual {v1}, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;->isStopped()Z

    move-result v2

    if-eqz v2, :cond_1

    sget-object v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->TAG:Ljava/lang/String;

    new-array v2, v11, [Ljava/lang/Object;

    iget v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mSurfaceId:I

    .line 104
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v10

    const-string v3, "Skipping batch of MountItems; was stopped [%d]."

    invoke-static {v1, v3, v2}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    .line 107
    :cond_1
    sget-boolean v2, Lcom/facebook/react/fabric/FabricUIManager;->ENABLE_FABRIC_LOGS:Z

    if-eqz v2, :cond_2

    sget-object v2, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->TAG:Ljava/lang/String;

    iget v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mSurfaceId:I

    .line 108
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "Executing IntBufferBatchMountItem on surface [%d]"

    invoke-static {v2, v4, v3}, Lcom/facebook/common/logging/FLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    const-string v2, "mountViews"

    .line 111
    invoke-direct {v0, v2}, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->beginMarkers(Ljava/lang/String;)V

    move v2, v10

    move v3, v2

    :goto_0
    iget v4, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBufferLen:I

    if-ge v2, v4, :cond_11

    iget-object v4, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v5, v2, 0x1

    .line 115
    aget v6, v4, v2

    and-int/lit8 v12, v6, -0x2

    and-int/2addr v6, v11

    if-eqz v6, :cond_3

    add-int/lit8 v2, v2, 0x2

    .line 117
    aget v4, v4, v5

    move v5, v2

    move v13, v4

    goto :goto_1

    :cond_3
    move v13, v11

    :goto_1
    move v14, v3

    move v2, v5

    move v15, v10

    :goto_2
    if-ge v15, v13, :cond_10

    const/4 v3, 0x2

    if-ne v12, v3, :cond_5

    iget-object v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mObjBuffer:[Ljava/lang/Object;

    add-int/lit8 v4, v14, 0x1

    .line 120
    aget-object v3, v3, v14

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/facebook/react/fabric/mounting/mountitems/FabricNameComponentMapping;->getFabricComponentName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v5, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v6, v2, 0x1

    .line 121
    aget v7, v5, v2

    iget-object v8, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mObjBuffer:[Ljava/lang/Object;

    add-int/lit8 v9, v14, 0x2

    aget-object v4, v8, v4

    move-object/from16 v16, v4

    check-cast v16, Lcom/facebook/react/bridge/ReadableMap;

    add-int/lit8 v4, v14, 0x3

    aget-object v9, v8, v9

    check-cast v9, Lcom/facebook/react/uimanager/StateWrapper;

    add-int/lit8 v14, v14, 0x4

    aget-object v4, v8, v4

    move-object v8, v4

    check-cast v8, Lcom/facebook/react/fabric/events/EventEmitterWrapper;

    add-int/lit8 v17, v2, 0x2

    aget v2, v5, v6

    if-ne v2, v11, :cond_4

    move/from16 v18, v11

    goto :goto_3

    :cond_4
    move/from16 v18, v10

    :goto_3
    move-object v2, v1

    move v4, v7

    move-object/from16 v5, v16

    move-object v6, v9

    move-object v7, v8

    move/from16 v8, v18

    invoke-virtual/range {v2 .. v8}, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;->createView(Ljava/lang/String;ILcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/uimanager/StateWrapper;Lcom/facebook/react/fabric/events/EventEmitterWrapper;Z)V

    :goto_4
    move/from16 v2, v17

    goto/16 :goto_7

    :cond_5
    const/4 v3, 0x4

    if-ne v12, v3, :cond_6

    iget-object v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v4, v2, 0x1

    .line 129
    aget v2, v3, v2

    invoke-virtual {v1, v2}, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;->deleteView(I)V

    move v2, v4

    goto/16 :goto_7

    :cond_6
    const/16 v3, 0x8

    if-ne v12, v3, :cond_7

    iget-object v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v4, v2, 0x1

    .line 131
    aget v5, v3, v2

    add-int/lit8 v6, v2, 0x2

    .line 132
    aget v4, v3, v4

    add-int/lit8 v2, v2, 0x3

    .line 133
    aget v3, v3, v6

    invoke-virtual {v1, v4, v5, v3}, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;->addViewAt(III)V

    goto/16 :goto_7

    :cond_7
    const/16 v3, 0x10

    if-ne v12, v3, :cond_8

    iget-object v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v4, v2, 0x1

    .line 135
    aget v5, v3, v2

    add-int/lit8 v6, v2, 0x2

    aget v4, v3, v4

    add-int/lit8 v2, v2, 0x3

    aget v3, v3, v6

    invoke-virtual {v1, v5, v4, v3}, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;->removeViewAt(III)V

    goto/16 :goto_7

    :cond_8
    const/16 v3, 0x800

    if-ne v12, v3, :cond_9

    iget-object v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v4, v2, 0x1

    .line 137
    aget v5, v3, v2

    add-int/lit8 v6, v2, 0x2

    aget v4, v3, v4

    add-int/lit8 v2, v2, 0x3

    aget v3, v3, v6

    invoke-virtual {v1, v5, v4, v3}, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;->removeDeleteTreeAt(III)V

    goto/16 :goto_7

    :cond_9
    const/16 v3, 0x20

    if-ne v12, v3, :cond_a

    iget-object v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v4, v2, 0x1

    .line 140
    aget v2, v3, v2

    iget-object v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mObjBuffer:[Ljava/lang/Object;

    add-int/lit8 v5, v14, 0x1

    aget-object v3, v3, v14

    check-cast v3, Lcom/facebook/react/bridge/ReadableMap;

    invoke-virtual {v1, v2, v3}, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;->updateProps(ILcom/facebook/react/bridge/ReadableMap;)V

    :goto_5
    move v2, v4

    move v14, v5

    goto/16 :goto_7

    :cond_a
    const/16 v3, 0x40

    if-ne v12, v3, :cond_b

    iget-object v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v4, v2, 0x1

    .line 142
    aget v2, v3, v2

    iget-object v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mObjBuffer:[Ljava/lang/Object;

    add-int/lit8 v5, v14, 0x1

    aget-object v3, v3, v14

    check-cast v3, Lcom/facebook/react/uimanager/StateWrapper;

    invoke-virtual {v1, v2, v3}, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;->updateState(ILcom/facebook/react/uimanager/StateWrapper;)V

    goto :goto_5

    :cond_b
    const/16 v3, 0x80

    if-ne v12, v3, :cond_c

    iget-object v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v4, v2, 0x1

    .line 144
    aget v5, v3, v2

    add-int/lit8 v6, v2, 0x2

    .line 145
    aget v4, v3, v4

    add-int/lit8 v7, v2, 0x3

    .line 146
    aget v6, v3, v6

    add-int/lit8 v8, v2, 0x4

    .line 147
    aget v7, v3, v7

    add-int/lit8 v9, v2, 0x5

    .line 148
    aget v8, v3, v8

    add-int/lit8 v16, v2, 0x6

    .line 149
    aget v9, v3, v9

    add-int/lit8 v17, v2, 0x7

    .line 150
    aget v16, v3, v16

    move-object v2, v1

    move v3, v5

    move v5, v6

    move v6, v7

    move v7, v8

    move v8, v9

    move/from16 v9, v16

    .line 152
    invoke-virtual/range {v2 .. v9}, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;->updateLayout(IIIIIII)V

    goto/16 :goto_4

    :cond_c
    const/16 v3, 0x200

    if-ne v12, v3, :cond_d

    iget-object v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v4, v2, 0x1

    .line 156
    aget v5, v3, v2

    add-int/lit8 v6, v2, 0x2

    aget v4, v3, v4

    add-int/lit8 v7, v2, 0x3

    aget v6, v3, v6

    add-int/lit8 v8, v2, 0x4

    aget v7, v3, v7

    add-int/lit8 v9, v2, 0x5

    aget v8, v3, v8

    move-object v2, v1

    move v3, v5

    move v5, v6

    move v6, v7

    move v7, v8

    invoke-virtual/range {v2 .. v7}, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;->updatePadding(IIIII)V

    :goto_6
    move v2, v9

    goto :goto_7

    :cond_d
    const/16 v3, 0x400

    if-ne v12, v3, :cond_e

    iget-object v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v4, v2, 0x1

    .line 159
    aget v5, v3, v2

    add-int/lit8 v6, v2, 0x2

    .line 160
    aget v4, v3, v4

    add-int/lit8 v7, v2, 0x3

    .line 161
    aget v6, v3, v6

    add-int/lit8 v8, v2, 0x4

    .line 162
    aget v7, v3, v7

    add-int/lit8 v9, v2, 0x5

    .line 163
    aget v8, v3, v8

    move-object v2, v1

    move v3, v5

    move v5, v6

    move v6, v7

    move v7, v8

    .line 165
    invoke-virtual/range {v2 .. v7}, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;->updateOverflowInset(IIIII)V

    goto :goto_6

    :cond_e
    const/16 v3, 0x100

    if-ne v12, v3, :cond_f

    iget-object v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v4, v2, 0x1

    .line 172
    aget v2, v3, v2

    iget-object v3, v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mObjBuffer:[Ljava/lang/Object;

    add-int/lit8 v5, v14, 0x1

    aget-object v3, v3, v14

    check-cast v3, Lcom/facebook/react/fabric/events/EventEmitterWrapper;

    invoke-virtual {v1, v2, v3}, Lcom/facebook/react/fabric/mounting/SurfaceMountingManager;->updateEventEmitter(ILcom/facebook/react/fabric/events/EventEmitterWrapper;)V

    goto/16 :goto_5

    :goto_7
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_2

    .line 175
    :cond_f
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Invalid type argument to IntBufferBatchMountItem: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " at index: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_10
    move v3, v14

    goto/16 :goto_0

    .line 181
    :cond_11
    invoke-direct/range {p0 .. p0}, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->endMarkers()V

    return-void
.end method

.method public getSurfaceId()I
    .locals 1

    iget v0, p0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mSurfaceId:I

    return v0
.end method

.method public isBatchEmpty()Z
    .locals 1

    iget v0, p0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBufferLen:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 17

    move-object/from16 v1, p0

    const/4 v2, 0x0

    .line 197
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IntBufferBatchMountItem [surface:%d]:\n"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    iget v6, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mSurfaceId:I

    .line 198
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v3, v2

    move v5, v3

    :cond_0
    iget v6, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBufferLen:I

    if-ge v3, v6, :cond_d

    iget-object v6, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v7, v3, 0x1

    .line 201
    aget v8, v6, v3

    and-int/lit8 v9, v8, -0x2

    and-int/2addr v8, v4

    if-eqz v8, :cond_1

    add-int/lit8 v3, v3, 0x2

    .line 203
    aget v6, v6, v7

    move v7, v3

    goto :goto_0

    :cond_1
    move v6, v4

    :goto_0
    move v3, v7

    move v7, v2

    :goto_1
    if-ge v7, v6, :cond_0

    const/4 v8, 0x3

    const/4 v10, 0x2

    if-ne v9, v10, :cond_2

    iget-object v11, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mObjBuffer:[Ljava/lang/Object;

    .line 206
    aget-object v11, v11, v5

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Lcom/facebook/react/fabric/mounting/mountitems/FabricNameComponentMapping;->getFabricComponentName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    add-int/lit8 v5, v5, 0x4

    const-string v12, "CREATE [%d] - layoutable:%d - %s\n"

    new-array v8, v8, [Ljava/lang/Object;

    iget-object v13, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v14, v3, 0x1

    .line 208
    aget v13, v13, v3

    .line 211
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v8, v2

    iget-object v13, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v3, v3, 0x2

    aget v13, v13, v14

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v8, v4

    aput-object v11, v8, v10

    .line 209
    invoke-static {v12, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 208
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_4

    :cond_2
    const/4 v11, 0x4

    if-ne v9, v11, :cond_3

    const-string v8, "DELETE [%d]\n"

    new-array v10, v4, [Ljava/lang/Object;

    iget-object v11, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v12, v3, 0x1

    .line 213
    aget v3, v11, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v10, v2

    invoke-static {v8, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_2
    move v3, v12

    goto/16 :goto_4

    :cond_3
    const/16 v12, 0x8

    if-ne v9, v12, :cond_4

    const-string v11, "INSERT [%d]->[%d] @%d\n"

    new-array v8, v8, [Ljava/lang/Object;

    iget-object v12, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v13, v3, 0x1

    .line 215
    aget v12, v12, v3

    .line 217
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v8, v2

    iget-object v12, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v14, v3, 0x2

    aget v12, v12, v13

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v8, v4

    iget-object v12, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v3, v3, 0x3

    aget v12, v12, v14

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v8, v10

    .line 216
    invoke-static {v11, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 215
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_4

    :cond_4
    const/16 v12, 0x10

    if-ne v9, v12, :cond_5

    const-string v11, "REMOVE [%d]->[%d] @%d\n"

    new-array v8, v8, [Ljava/lang/Object;

    iget-object v12, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v13, v3, 0x1

    .line 219
    aget v12, v12, v3

    .line 221
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v8, v2

    iget-object v12, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v14, v3, 0x2

    aget v12, v12, v13

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v8, v4

    iget-object v12, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v3, v3, 0x3

    aget v12, v12, v14

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v8, v10

    .line 220
    invoke-static {v11, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 219
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_4

    :cond_5
    const/16 v12, 0x800

    if-ne v9, v12, :cond_6

    const-string v11, "REMOVE+DELETE TREE [%d]->[%d] @%d\n"

    new-array v8, v8, [Ljava/lang/Object;

    iget-object v12, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v13, v3, 0x1

    .line 223
    aget v12, v12, v3

    .line 226
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v8, v2

    iget-object v12, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v14, v3, 0x2

    aget v12, v12, v13

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v8, v4

    iget-object v12, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v3, v3, 0x3

    aget v12, v12, v14

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v8, v10

    .line 224
    invoke-static {v11, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 223
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_4

    :cond_6
    const/16 v12, 0x20

    const-string v13, "<hidden>"

    if-ne v9, v12, :cond_7

    :try_start_1
    iget-object v8, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mObjBuffer:[Ljava/lang/Object;

    add-int/lit8 v11, v5, 0x1

    .line 228
    aget-object v5, v8, v5

    const-string v5, "UPDATE PROPS [%d]: %s\n"

    new-array v8, v10, [Ljava/lang/Object;

    iget-object v10, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v12, v3, 0x1

    .line 233
    aget v3, v10, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v8, v2

    aput-object v13, v8, v4

    invoke-static {v5, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_3
    move v5, v11

    goto/16 :goto_2

    :cond_7
    const/16 v12, 0x40

    if-ne v9, v12, :cond_8

    iget-object v8, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mObjBuffer:[Ljava/lang/Object;

    add-int/lit8 v11, v5, 0x1

    .line 235
    aget-object v5, v8, v5

    check-cast v5, Lcom/facebook/react/uimanager/StateWrapper;

    const-string v5, "UPDATE STATE [%d]: %s\n"

    new-array v8, v10, [Ljava/lang/Object;

    iget-object v10, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v12, v3, 0x1

    .line 240
    aget v3, v10, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v8, v2

    aput-object v13, v8, v4

    invoke-static {v5, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    :cond_8
    const/16 v12, 0x80

    if-ne v9, v12, :cond_9

    iget-object v12, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v14, v3, 0x1

    .line 242
    aget v15, v12, v3

    add-int/lit8 v16, v3, 0x2

    .line 243
    aget v12, v12, v14

    const-string v14, "UPDATE LAYOUT [%d]->[%d]: x:%d y:%d w:%d h:%d displayType:%d\n"

    const/4 v13, 0x7

    new-array v13, v13, [Ljava/lang/Object;

    .line 247
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v13, v2

    .line 248
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v13, v4

    iget-object v12, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v15, v3, 0x3

    aget v12, v12, v16

    .line 249
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v13, v10

    iget-object v10, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v12, v3, 0x4

    aget v10, v10, v15

    .line 250
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v13, v8

    iget-object v8, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v10, v3, 0x5

    aget v8, v8, v12

    .line 251
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v13, v11

    iget-object v8, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v11, v3, 0x6

    aget v8, v8, v10

    .line 252
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v10, 0x5

    aput-object v8, v13, v10

    iget-object v8, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v3, v3, 0x7

    aget v8, v8, v11

    .line 253
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v10, 0x6

    aput-object v8, v13, v10

    .line 245
    invoke-static {v14, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 244
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_4

    :cond_9
    const/16 v12, 0x200

    if-ne v9, v12, :cond_a

    const-string v12, "UPDATE PADDING [%d]: top:%d right:%d bottom:%d left:%d\n"

    const/4 v13, 0x5

    new-array v13, v13, [Ljava/lang/Object;

    iget-object v14, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v15, v3, 0x1

    .line 255
    aget v14, v14, v3

    .line 258
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v2

    iget-object v14, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v16, v3, 0x2

    aget v14, v14, v15

    .line 259
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v4

    iget-object v14, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v15, v3, 0x3

    aget v14, v14, v16

    .line 260
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v10

    iget-object v10, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v14, v3, 0x4

    aget v10, v10, v15

    .line 261
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v13, v8

    iget-object v8, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v3, v3, 0x5

    aget v8, v8, v14

    .line 262
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v13, v11

    .line 256
    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 255
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    :cond_a
    const/16 v12, 0x400

    if-ne v9, v12, :cond_b

    const-string v12, "UPDATE OVERFLOWINSET [%d]: left:%d top:%d right:%d bottom:%d\n"

    const/4 v13, 0x5

    new-array v13, v13, [Ljava/lang/Object;

    iget-object v14, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v15, v3, 0x1

    .line 264
    aget v14, v14, v3

    .line 267
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v2

    iget-object v14, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v16, v3, 0x2

    aget v14, v14, v15

    .line 268
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v4

    iget-object v14, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v15, v3, 0x3

    aget v14, v14, v16

    .line 269
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v10

    iget-object v10, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v14, v3, 0x4

    aget v10, v10, v15

    .line 270
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v13, v8

    iget-object v8, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v3, v3, 0x5

    aget v8, v8, v14

    .line 271
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v13, v11

    .line 265
    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 264
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    :cond_b
    const/16 v8, 0x100

    if-ne v9, v8, :cond_c

    add-int/lit8 v5, v5, 0x1

    const-string v8, "UPDATE EVENTEMITTER [%d]\n"

    new-array v10, v4, [Ljava/lang/Object;

    iget-object v11, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    add-int/lit8 v12, v3, 0x1

    .line 274
    aget v3, v11, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v10, v2

    invoke-static {v8, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_2

    :goto_4
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1

    :cond_c
    sget-object v4, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->TAG:Ljava/lang/String;

    .line 276
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "String so far: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid type argument to IntBufferBatchMountItem: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " at index: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 282
    :cond_d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    sget-object v3, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->TAG:Ljava/lang/String;

    const-string v4, "Caught exception trying to print"

    .line 287
    invoke-static {v3, v4, v0}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 289
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move v3, v2

    :goto_5
    iget v4, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBufferLen:I

    if-ge v3, v4, :cond_e

    iget-object v4, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mIntBuffer:[I

    .line 291
    aget v4, v4, v3

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", "

    .line 292
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    :cond_e
    sget-object v3, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->TAG:Ljava/lang/String;

    .line 294
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_6
    iget v0, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mObjBufferLen:I

    if-ge v2, v0, :cond_10

    sget-object v0, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->TAG:Ljava/lang/String;

    iget-object v3, v1, Lcom/facebook/react/fabric/mounting/mountitems/IntBufferBatchMountItem;->mObjBuffer:[Ljava/lang/Object;

    .line 297
    aget-object v3, v3, v2

    if-eqz v3, :cond_f

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_7

    :cond_f
    const-string v3, "null"

    :goto_7
    invoke-static {v0, v3}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_10
    const-string v0, ""

    return-object v0
.end method
