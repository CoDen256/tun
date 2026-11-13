.class public final Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;
.source "TargetGlobal.java"

# interfaces
.implements Lcom/google/firebase/firestore/proto/TargetGlobalOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/proto/TargetGlobal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$Builder<",
        "Lcom/google/firebase/firestore/proto/TargetGlobal;",
        "Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;",
        ">;",
        "Lcom/google/firebase/firestore/proto/TargetGlobalOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 338
    invoke-static {}, Lcom/google/firebase/firestore/proto/TargetGlobal;->access$000()Lcom/google/firebase/firestore/proto/TargetGlobal;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/firebase/firestore/proto/TargetGlobal$1;)V
    .locals 0

    .line 331
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearHighestListenSequenceNumber()Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;
    .locals 1

    .line 423
    invoke-virtual {p0}, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->copyOnWrite()V

    .line 424
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-static {v0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->access$400(Lcom/google/firebase/firestore/proto/TargetGlobal;)V

    return-object p0
.end method

.method public clearHighestTargetId()Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;
    .locals 1

    .line 380
    invoke-virtual {p0}, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->copyOnWrite()V

    .line 381
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-static {v0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->access$200(Lcom/google/firebase/firestore/proto/TargetGlobal;)V

    return-object p0
.end method

.method public clearLastRemoteSnapshotVersion()Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;
    .locals 1

    .line 536
    invoke-virtual {p0}, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->copyOnWrite()V

    .line 537
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-static {v0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->access$700(Lcom/google/firebase/firestore/proto/TargetGlobal;)V

    return-object p0
.end method

.method public clearTargetCount()Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;
    .locals 1

    .line 576
    invoke-virtual {p0}, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->copyOnWrite()V

    .line 577
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-static {v0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->access$900(Lcom/google/firebase/firestore/proto/TargetGlobal;)V

    return-object p0
.end method

.method public getHighestListenSequenceNumber()J
    .locals 2

    .line 396
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->getHighestListenSequenceNumber()J

    move-result-wide v0

    return-wide v0
.end method

.method public getHighestTargetId()I
    .locals 1

    .line 353
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->getHighestTargetId()I

    move-result v0

    return v0
.end method

.method public getLastRemoteSnapshotVersion()Lcom/google/protobuf/Timestamp;
    .locals 1

    .line 462
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->getLastRemoteSnapshotVersion()Lcom/google/protobuf/Timestamp;

    move-result-object v0

    return-object v0
.end method

.method public getTargetCount()I
    .locals 1

    .line 551
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->getTargetCount()I

    move-result v0

    return v0
.end method

.method public hasLastRemoteSnapshotVersion()Z
    .locals 1

    .line 444
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/TargetGlobal;->hasLastRemoteSnapshotVersion()Z

    move-result v0

    return v0
.end method

.method public mergeLastRemoteSnapshotVersion(Lcom/google/protobuf/Timestamp;)Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;
    .locals 1

    .line 518
    invoke-virtual {p0}, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->copyOnWrite()V

    .line 519
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-static {v0, p1}, Lcom/google/firebase/firestore/proto/TargetGlobal;->access$600(Lcom/google/firebase/firestore/proto/TargetGlobal;Lcom/google/protobuf/Timestamp;)V

    return-object p0
.end method

.method public setHighestListenSequenceNumber(J)Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;
    .locals 1

    .line 409
    invoke-virtual {p0}, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->copyOnWrite()V

    .line 410
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-static {v0, p1, p2}, Lcom/google/firebase/firestore/proto/TargetGlobal;->access$300(Lcom/google/firebase/firestore/proto/TargetGlobal;J)V

    return-object p0
.end method

.method public setHighestTargetId(I)Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;
    .locals 1

    .line 366
    invoke-virtual {p0}, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->copyOnWrite()V

    .line 367
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-static {v0, p1}, Lcom/google/firebase/firestore/proto/TargetGlobal;->access$100(Lcom/google/firebase/firestore/proto/TargetGlobal;I)V

    return-object p0
.end method

.method public setLastRemoteSnapshotVersion(Lcom/google/protobuf/Timestamp$Builder;)Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;
    .locals 1

    .line 499
    invoke-virtual {p0}, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->copyOnWrite()V

    .line 500
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-virtual {p1}, Lcom/google/protobuf/Timestamp$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp;

    invoke-static {v0, p1}, Lcom/google/firebase/firestore/proto/TargetGlobal;->access$500(Lcom/google/firebase/firestore/proto/TargetGlobal;Lcom/google/protobuf/Timestamp;)V

    return-object p0
.end method

.method public setLastRemoteSnapshotVersion(Lcom/google/protobuf/Timestamp;)Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;
    .locals 1

    .line 479
    invoke-virtual {p0}, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->copyOnWrite()V

    .line 480
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-static {v0, p1}, Lcom/google/firebase/firestore/proto/TargetGlobal;->access$500(Lcom/google/firebase/firestore/proto/TargetGlobal;Lcom/google/protobuf/Timestamp;)V

    return-object p0
.end method

.method public setTargetCount(I)Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;
    .locals 1

    .line 563
    invoke-virtual {p0}, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->copyOnWrite()V

    .line 564
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/TargetGlobal$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firebase/firestore/proto/TargetGlobal;

    invoke-static {v0, p1}, Lcom/google/firebase/firestore/proto/TargetGlobal;->access$800(Lcom/google/firebase/firestore/proto/TargetGlobal;I)V

    return-object p0
.end method
