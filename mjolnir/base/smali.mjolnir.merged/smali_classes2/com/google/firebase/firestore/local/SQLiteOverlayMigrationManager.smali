.class public Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager;
.super Ljava/lang/Object;
.source "SQLiteOverlayMigrationManager.java"

# interfaces
.implements Lcom/google/firebase/firestore/local/OverlayMigrationManager;


# instance fields
.field private final db:Lcom/google/firebase/firestore/local/SQLitePersistence;


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/local/SQLitePersistence;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    return-void
.end method

.method private buildOverlays()V
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    .line 46
    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager$$ExternalSyntheticLambda0;-><init>(Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager;)V

    const-string v2, "build overlays"

    invoke-virtual {v0, v2, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence;->runTransaction(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method private getAllUserIds()Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 82
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const-string v2, "SELECT DISTINCT uid FROM mutation_queues"

    .line 83
    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence;->query(Ljava/lang/String;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v1

    new-instance v2, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager$$ExternalSyntheticLambda2;

    invoke-direct {v2, v0}, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager$$ExternalSyntheticLambda2;-><init>(Ljava/util/Set;)V

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    return-object v0
.end method

.method static synthetic lambda$getAllUserIds$1(Ljava/util/Set;Landroid/database/Cursor;)V
    .locals 1

    const/4 v0, 0x0

    .line 83
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method static synthetic lambda$hasPendingOverlayMigration$2([Ljava/lang/Boolean;Landroid/database/Cursor;)V
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 94
    :try_start_0
    sget-object v2, Lcom/google/firebase/firestore/local/Persistence;->DATA_MIGRATION_BUILD_OVERLAYS:Ljava/lang/String;

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 95
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, p0, v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception p0

    new-array p1, v0, [Ljava/lang/Object;

    aput-object p0, p1, v1

    const-string p0, "SQLitePersistence.DataMigration failed to parse: %s"

    .line 99
    invoke-static {p0, p1}, Lcom/google/firebase/firestore/util/Assert;->fail(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/AssertionError;

    move-result-object p0

    throw p0
.end method

.method private removePendingOverlayMigrations()V
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 106
    sget-object v3, Lcom/google/firebase/firestore/local/Persistence;->DATA_MIGRATION_BUILD_OVERLAYS:Ljava/lang/String;

    aput-object v3, v1, v2

    const-string v2, "DELETE FROM data_migrations WHERE migration_name = ?"

    invoke-virtual {v0, v2, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence;->execute(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method hasPendingOverlayMigration()Z
    .locals 4

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Boolean;

    const/4 v1, 0x0

    .line 89
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v0, v1

    iget-object v2, p0, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    const-string v3, "SELECT migration_name FROM data_migrations"

    .line 90
    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/local/SQLitePersistence;->query(Ljava/lang/String;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v2

    new-instance v3, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager$$ExternalSyntheticLambda1;

    invoke-direct {v3, v0}, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager$$ExternalSyntheticLambda1;-><init>([Ljava/lang/Boolean;)V

    .line 91
    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    aget-object v0, v0, v1

    .line 102
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method synthetic lambda$buildOverlays$0$com-google-firebase-firestore-local-SQLiteOverlayMigrationManager()V
    .locals 8

    .line 49
    invoke-virtual {p0}, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager;->hasPendingOverlayMigration()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 53
    :cond_0
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager;->getAllUserIds()Ljava/util/Set;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    .line 54
    invoke-virtual {v1}, Lcom/google/firebase/firestore/local/SQLitePersistence;->getRemoteDocumentCache()Lcom/google/firebase/firestore/local/RemoteDocumentCache;

    move-result-object v1

    .line 55
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 56
    new-instance v3, Lcom/google/firebase/firestore/auth/User;

    invoke-direct {v3, v2}, Lcom/google/firebase/firestore/auth/User;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    .line 57
    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/local/SQLitePersistence;->getIndexManager(Lcom/google/firebase/firestore/auth/User;)Lcom/google/firebase/firestore/local/IndexManager;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/google/firebase/firestore/local/SQLitePersistence;->getMutationQueue(Lcom/google/firebase/firestore/auth/User;Lcom/google/firebase/firestore/local/IndexManager;)Lcom/google/firebase/firestore/local/MutationQueue;

    move-result-object v2

    .line 60
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 61
    invoke-interface {v2}, Lcom/google/firebase/firestore/local/MutationQueue;->getAllMutationBatches()Ljava/util/List;

    move-result-object v5

    .line 62
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/firebase/firestore/model/mutation/MutationBatch;

    .line 63
    invoke-virtual {v6}, Lcom/google/firebase/firestore/model/mutation/MutationBatch;->getKeys()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    :cond_1
    iget-object v5, p0, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    .line 67
    invoke-virtual {v5, v3}, Lcom/google/firebase/firestore/local/SQLitePersistence;->getDocumentOverlayCache(Lcom/google/firebase/firestore/auth/User;)Lcom/google/firebase/firestore/local/DocumentOverlayCache;

    move-result-object v5

    .line 68
    new-instance v6, Lcom/google/firebase/firestore/local/LocalDocumentsView;

    iget-object v7, p0, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager;->db:Lcom/google/firebase/firestore/local/SQLitePersistence;

    .line 73
    invoke-virtual {v7, v3}, Lcom/google/firebase/firestore/local/SQLitePersistence;->getIndexManager(Lcom/google/firebase/firestore/auth/User;)Lcom/google/firebase/firestore/local/IndexManager;

    move-result-object v3

    invoke-direct {v6, v1, v2, v5, v3}, Lcom/google/firebase/firestore/local/LocalDocumentsView;-><init>(Lcom/google/firebase/firestore/local/RemoteDocumentCache;Lcom/google/firebase/firestore/local/MutationQueue;Lcom/google/firebase/firestore/local/DocumentOverlayCache;Lcom/google/firebase/firestore/local/IndexManager;)V

    .line 74
    invoke-virtual {v6, v4}, Lcom/google/firebase/firestore/local/LocalDocumentsView;->recalculateAndSaveOverlays(Ljava/util/Set;)V

    goto :goto_0

    .line 77
    :cond_2
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager;->removePendingOverlayMigrations()V

    return-void
.end method

.method public run()V
    .locals 0

    .line 42
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteOverlayMigrationManager;->buildOverlays()V

    return-void
.end method
