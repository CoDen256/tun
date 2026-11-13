.class public final Lcom/google/firebase/firestore/core/EventManager;
.super Ljava/lang/Object;
.source "EventManager.java"

# interfaces
.implements Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/core/EventManager$ListenOptions;,
        Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;
    }
.end annotation


# instance fields
.field private onlineState:Lcom/google/firebase/firestore/core/OnlineState;

.field private final queries:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/firebase/firestore/core/Query;",
            "Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final snapshotsInSyncListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/firebase/firestore/EventListener<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation
.end field

.field private final syncEngine:Lcom/google/firebase/firestore/core/SyncEngine;


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/core/SyncEngine;)V
    .locals 1

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/firestore/core/EventManager;->snapshotsInSyncListeners:Ljava/util/Set;

    .line 64
    sget-object v0, Lcom/google/firebase/firestore/core/OnlineState;->UNKNOWN:Lcom/google/firebase/firestore/core/OnlineState;

    iput-object v0, p0, Lcom/google/firebase/firestore/core/EventManager;->onlineState:Lcom/google/firebase/firestore/core/OnlineState;

    iput-object p1, p0, Lcom/google/firebase/firestore/core/EventManager;->syncEngine:Lcom/google/firebase/firestore/core/SyncEngine;

    .line 68
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/firestore/core/EventManager;->queries:Ljava/util/Map;

    .line 69
    invoke-virtual {p1, p0}, Lcom/google/firebase/firestore/core/SyncEngine;->setCallback(Lcom/google/firebase/firestore/core/SyncEngine$SyncEngineCallback;)V

    return-void
.end method

.method private raiseSnapshotsInSyncEvent()V
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/firestore/core/EventManager;->snapshotsInSyncListeners:Ljava/util/Set;

    .line 136
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/EventListener;

    const/4 v2, 0x0

    .line 137
    invoke-interface {v1, v2, v2}, Lcom/google/firebase/firestore/EventListener;->onEvent(Ljava/lang/Object;Lcom/google/firebase/firestore/FirebaseFirestoreException;)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public addQueryListener(Lcom/google/firebase/firestore/core/QueryListener;)I
    .locals 6

    .line 80
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/QueryListener;->getQuery()Lcom/google/firebase/firestore/core/Query;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/firestore/core/EventManager;->queries:Ljava/util/Map;

    .line 82
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_0

    move v4, v2

    goto :goto_0

    :cond_0
    move v4, v3

    :goto_0
    if-eqz v4, :cond_1

    .line 85
    new-instance v1, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;

    invoke-direct {v1}, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;-><init>()V

    iget-object v5, p0, Lcom/google/firebase/firestore/core/EventManager;->queries:Ljava/util/Map;

    .line 86
    invoke-interface {v5, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    :cond_1
    invoke-static {v1}, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;->access$000(Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v5, p0, Lcom/google/firebase/firestore/core/EventManager;->onlineState:Lcom/google/firebase/firestore/core/OnlineState;

    .line 92
    invoke-virtual {p1, v5}, Lcom/google/firebase/firestore/core/QueryListener;->onOnlineStateChanged(Lcom/google/firebase/firestore/core/OnlineState;)Z

    move-result v5

    xor-int/2addr v2, v5

    const-string v5, "onOnlineStateChanged() shouldn\'t raise an event for brand-new listeners."

    new-array v3, v3, [Ljava/lang/Object;

    .line 93
    invoke-static {v2, v5, v3}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 96
    invoke-static {v1}, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;->access$100(Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;)Lcom/google/firebase/firestore/core/ViewSnapshot;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 97
    invoke-static {v1}, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;->access$100(Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;)Lcom/google/firebase/firestore/core/ViewSnapshot;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/google/firebase/firestore/core/QueryListener;->onViewSnapshot(Lcom/google/firebase/firestore/core/ViewSnapshot;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 99
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/EventManager;->raiseSnapshotsInSyncEvent()V

    :cond_2
    if-eqz v4, :cond_3

    iget-object p1, p0, Lcom/google/firebase/firestore/core/EventManager;->syncEngine:Lcom/google/firebase/firestore/core/SyncEngine;

    .line 104
    invoke-virtual {p1, v0}, Lcom/google/firebase/firestore/core/SyncEngine;->listen(Lcom/google/firebase/firestore/core/Query;)I

    move-result p1

    invoke-static {v1, p1}, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;->access$202(Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;I)I

    .line 106
    :cond_3
    invoke-static {v1}, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;->access$200(Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;)I

    move-result p1

    return p1
.end method

.method public addSnapshotsInSyncListener(Lcom/google/firebase/firestore/EventListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/EventListener<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/core/EventManager;->snapshotsInSyncListeners:Ljava/util/Set;

    .line 126
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    .line 127
    invoke-interface {p1, v0, v0}, Lcom/google/firebase/firestore/EventListener;->onEvent(Ljava/lang/Object;Lcom/google/firebase/firestore/FirebaseFirestoreException;)V

    return-void
.end method

.method public handleOnlineStateChange(Lcom/google/firebase/firestore/core/OnlineState;)V
    .locals 4

    iput-object p1, p0, Lcom/google/firebase/firestore/core/EventManager;->onlineState:Lcom/google/firebase/firestore/core/OnlineState;

    iget-object v0, p0, Lcom/google/firebase/firestore/core/EventManager;->queries:Ljava/util/Map;

    .line 176
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;

    .line 177
    invoke-static {v2}, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;->access$000(Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/core/QueryListener;

    .line 178
    invoke-virtual {v3, p1}, Lcom/google/firebase/firestore/core/QueryListener;->onOnlineStateChanged(Lcom/google/firebase/firestore/core/OnlineState;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    if-eqz v1, :cond_3

    .line 184
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/EventManager;->raiseSnapshotsInSyncEvent()V

    :cond_3
    return-void
.end method

.method public onError(Lcom/google/firebase/firestore/core/Query;Lio/grpc/Status;)V
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/firestore/core/EventManager;->queries:Ljava/util/Map;

    .line 163
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;

    if-eqz v0, :cond_0

    .line 165
    invoke-static {v0}, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;->access$000(Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/core/QueryListener;

    .line 166
    invoke-static {p2}, Lcom/google/firebase/firestore/util/Util;->exceptionFromStatus(Lio/grpc/Status;)Lcom/google/firebase/firestore/FirebaseFirestoreException;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/core/QueryListener;->onError(Lcom/google/firebase/firestore/FirebaseFirestoreException;)V

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/google/firebase/firestore/core/EventManager;->queries:Ljava/util/Map;

    .line 169
    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public onViewSnapshots(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/core/ViewSnapshot;",
            ">;)V"
        }
    .end annotation

    .line 144
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/core/ViewSnapshot;

    .line 145
    invoke-virtual {v1}, Lcom/google/firebase/firestore/core/ViewSnapshot;->getQuery()Lcom/google/firebase/firestore/core/Query;

    move-result-object v2

    iget-object v3, p0, Lcom/google/firebase/firestore/core/EventManager;->queries:Ljava/util/Map;

    .line 146
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;

    if-eqz v2, :cond_0

    .line 148
    invoke-static {v2}, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;->access$000(Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/firebase/firestore/core/QueryListener;

    .line 149
    invoke-virtual {v4, v1}, Lcom/google/firebase/firestore/core/QueryListener;->onViewSnapshot(Lcom/google/firebase/firestore/core/ViewSnapshot;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    .line 153
    :cond_2
    invoke-static {v2, v1}, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;->access$102(Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;Lcom/google/firebase/firestore/core/ViewSnapshot;)Lcom/google/firebase/firestore/core/ViewSnapshot;

    goto :goto_0

    :cond_3
    if-eqz v0, :cond_4

    .line 157
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/EventManager;->raiseSnapshotsInSyncEvent()V

    :cond_4
    return-void
.end method

.method public removeQueryListener(Lcom/google/firebase/firestore/core/QueryListener;)V
    .locals 3

    .line 111
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/QueryListener;->getQuery()Lcom/google/firebase/firestore/core/Query;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/firestore/core/EventManager;->queries:Ljava/util/Map;

    .line 112
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;

    if-eqz v1, :cond_0

    .line 115
    invoke-static {v1}, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;->access$000(Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 116
    invoke-static {v1}, Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;->access$000(Lcom/google/firebase/firestore/core/EventManager$QueryListenersInfo;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/firebase/firestore/core/EventManager;->queries:Ljava/util/Map;

    .line 120
    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/google/firebase/firestore/core/EventManager;->syncEngine:Lcom/google/firebase/firestore/core/SyncEngine;

    .line 121
    invoke-virtual {p1, v0}, Lcom/google/firebase/firestore/core/SyncEngine;->stopListening(Lcom/google/firebase/firestore/core/Query;)V

    :cond_0
    return-void
.end method

.method public removeSnapshotsInSyncListener(Lcom/google/firebase/firestore/EventListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/EventListener<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/core/EventManager;->snapshotsInSyncListeners:Ljava/util/Set;

    .line 131
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method
