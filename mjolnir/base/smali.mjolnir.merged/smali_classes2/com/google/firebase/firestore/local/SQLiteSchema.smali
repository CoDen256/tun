.class Lcom/google/firebase/firestore/local/SQLiteSchema;
.super Ljava/lang/Object;
.source "SQLiteSchema.java"


# static fields
.field static final MIGRATION_BATCH_SIZE:I = 0x64

.field static final VERSION:I = 0x10


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;

.field private final serializer:Lcom/google/firebase/firestore/local/LocalSerializer;


# direct methods
.method constructor <init>(Landroid/database/sqlite/SQLiteDatabase;Lcom/google/firebase/firestore/local/LocalSerializer;)V
    .locals 0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    iput-object p2, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->serializer:Lcom/google/firebase/firestore/local/LocalSerializer;

    return-void
.end method

.method private addPathLength()V
    .locals 2

    const-string v0, "remote_documents"

    const-string v1, "path_length"

    .line 441
    invoke-direct {p0, v0, v1}, Lcom/google/firebase/firestore/local/SQLiteSchema;->tableContainsColumn(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "ALTER TABLE remote_documents ADD COLUMN path_length INTEGER"

    .line 443
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private addPendingDataMigration(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "INSERT OR IGNORE INTO data_migrations (migration_name) VALUES (?)"

    .line 710
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private addReadTime()V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "ALTER TABLE remote_documents ADD COLUMN read_time_seconds INTEGER"

    .line 459
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "ALTER TABLE remote_documents ADD COLUMN read_time_nanos INTEGER"

    .line 460
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method private addSequenceNumber()V
    .locals 2

    const-string v0, "target_documents"

    const-string v1, "sequence_number"

    .line 435
    invoke-direct {p0, v0, v1}, Lcom/google/firebase/firestore/local/SQLiteSchema;->tableContainsColumn(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "ALTER TABLE target_documents ADD COLUMN sequence_number INTEGER"

    .line 436
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private addTargetCount()V
    .locals 5

    const-string v0, "target_globals"

    const-string v1, "target_count"

    .line 424
    invoke-direct {p0, v0, v1}, Lcom/google/firebase/firestore/local/SQLiteSchema;->tableContainsColumn(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "ALTER TABLE target_globals ADD COLUMN target_count INTEGER"

    .line 425
    invoke-virtual {v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_0
    iget-object v2, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "targets"

    .line 428
    invoke-static {v2, v3}, Landroid/database/DatabaseUtils;->queryNumEntries(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J

    move-result-wide v2

    .line 429
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 430
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v4, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v2, 0x0

    .line 431
    invoke-virtual {v1, v0, v4, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method private createBundleCache()V
    .locals 2

    const-string v0, "bundles"

    const-string v1, "named_queries"

    .line 658
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda16;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda16;-><init>(Lcom/google/firebase/firestore/local/SQLiteSchema;)V

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/firestore/local/SQLiteSchema;->ifTablesDontExist([Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method private createDataMigrationTable()V
    .locals 2

    const-string v0, "data_migrations"

    .line 699
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda11;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda11;-><init>(Lcom/google/firebase/firestore/local/SQLiteSchema;)V

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/firestore/local/SQLiteSchema;->ifTablesDontExist([Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method private createFieldIndex()V
    .locals 3

    const-string v0, "index_state"

    const-string v1, "index_entries"

    const-string v2, "index_configuration"

    .line 372
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda13;-><init>(Lcom/google/firebase/firestore/local/SQLiteSchema;)V

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/firestore/local/SQLiteSchema;->ifTablesDontExist([Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method private createOverlays()V
    .locals 2

    const-string v0, "document_overlays"

    .line 680
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda12;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda12;-><init>(Lcom/google/firebase/firestore/local/SQLiteSchema;)V

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/firestore/local/SQLiteSchema;->ifTablesDontExist([Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method private createV1MutationQueue()V
    .locals 3

    const-string v0, "mutations"

    const-string v1, "document_mutations"

    const-string v2, "mutation_queues"

    .line 236
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda3;-><init>(Lcom/google/firebase/firestore/local/SQLiteSchema;)V

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/firestore/local/SQLiteSchema;->ifTablesDontExist([Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method private createV1RemoteDocumentCache()V
    .locals 2

    const-string v0, "remote_documents"

    .line 351
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda14;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda14;-><init>(Lcom/google/firebase/firestore/local/SQLiteSchema;)V

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/firestore/local/SQLiteSchema;->ifTablesDontExist([Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method private createV1TargetCache()V
    .locals 3

    const-string v0, "target_globals"

    const-string v1, "target_documents"

    const-string v2, "targets"

    .line 300
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda9;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda9;-><init>(Lcom/google/firebase/firestore/local/SQLiteSchema;)V

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/firestore/local/SQLiteSchema;->ifTablesDontExist([Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method private createV8CollectionParentsIndex()V
    .locals 4

    const-string v0, "collection_parents"

    .line 526
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda4;-><init>(Lcom/google/firebase/firestore/local/SQLiteSchema;)V

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/firestore/local/SQLiteSchema;->ifTablesDontExist([Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 541
    new-instance v0, Lcom/google/firebase/firestore/local/MemoryIndexManager$MemoryCollectionParentIndex;

    invoke-direct {v0}, Lcom/google/firebase/firestore/local/MemoryIndexManager$MemoryCollectionParentIndex;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "INSERT OR REPLACE INTO collection_parents (collection_id, parent) VALUES (?, ?)"

    .line 544
    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 546
    new-instance v2, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda5;

    invoke-direct {v2, v0, v1}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda5;-><init>(Lcom/google/firebase/firestore/local/MemoryIndexManager$MemoryCollectionParentIndex;Landroid/database/sqlite/SQLiteStatement;)V

    .line 559
    new-instance v0, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "SELECT path FROM remote_documents"

    invoke-direct {v0, v1, v3}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;-><init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 561
    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda6;

    invoke-direct {v1, v2}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda6;-><init>(Lcom/google/firebase/firestore/util/Consumer;)V

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    .line 568
    new-instance v0, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "SELECT path FROM document_mutations"

    invoke-direct {v0, v1, v3}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;-><init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 570
    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda7;

    invoke-direct {v1, v2}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda7;-><init>(Lcom/google/firebase/firestore/util/Consumer;)V

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    return-void
.end method

.method private dropLastLimboFreeSnapshotVersion()V
    .locals 3

    .line 464
    new-instance v0, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "SELECT target_id, target_proto FROM targets"

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;-><init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda17;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda17;-><init>(Lcom/google/firebase/firestore/local/SQLiteSchema;)V

    .line 465
    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    return-void
.end method

.method private dropV1TargetCache()V
    .locals 2

    const-string v0, "targets"

    .line 339
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->tableExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "DROP TABLE targets"

    .line 340
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_0
    const-string v0, "target_globals"

    .line 342
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->tableExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "DROP TABLE target_globals"

    .line 343
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_1
    const-string v0, "target_documents"

    .line 345
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->tableExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "DROP TABLE target_documents"

    .line 346
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method private ensurePathLength()V
    .locals 5

    .line 624
    new-instance v0, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "SELECT path FROM remote_documents WHERE path_length IS NULL LIMIT ?"

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;-><init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/16 v3, 0x64

    .line 627
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->binding([Ljava/lang/Object;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v0

    iget-object v2, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "UPDATE remote_documents SET path_length = ? WHERE path = ?"

    .line 629
    invoke-virtual {v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v2

    new-array v1, v1, [Z

    :cond_0
    aput-boolean v4, v1, v4

    .line 636
    new-instance v3, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda8;

    invoke-direct {v3, v1, v2}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda8;-><init>([ZLandroid/database/sqlite/SQLiteStatement;)V

    invoke-virtual {v0, v3}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    aget-boolean v3, v1, v4

    if-nez v3, :cond_0

    return-void
.end method

.method private ensureReadTime()V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "UPDATE remote_documents SET read_time_seconds = 0, read_time_nanos = 0 WHERE read_time_seconds IS NULL"

    .line 653
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method private ensureSequenceNumbers()V
    .locals 8

    .line 489
    new-instance v0, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "SELECT highest_listen_sequence_number FROM target_globals LIMIT 1"

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;-><init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 492
    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda1;-><init>()V

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->firstValue(Lcom/google/firebase/firestore/util/Function;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    const-string v4, "Missing highest sequence number"

    new-array v5, v2, [Ljava/lang/Object;

    .line 493
    invoke-static {v3, v4, v5}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 495
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v5, "INSERT INTO target_documents (target_id, path, sequence_number) VALUES (0, ?, ?)"

    .line 497
    invoke-virtual {v0, v5}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 500
    new-instance v5, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    iget-object v6, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v7, "SELECT RD.path FROM remote_documents AS RD WHERE NOT EXISTS (SELECT TD.path FROM target_documents AS TD WHERE RD.path = TD.path AND TD.target_id = 0) LIMIT ?"

    invoke-direct {v5, v6, v7}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;-><init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    new-array v6, v1, [Ljava/lang/Object;

    const/16 v7, 0x64

    .line 507
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-virtual {v5, v6}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->binding([Ljava/lang/Object;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object v5

    new-array v1, v1, [Z

    :cond_1
    aput-boolean v2, v1, v2

    .line 514
    new-instance v6, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda2;

    invoke-direct {v6, v1, v0, v3, v4}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda2;-><init>([ZLandroid/database/sqlite/SQLiteStatement;J)V

    invoke-virtual {v5, v6}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    aget-boolean v6, v1, v2

    if-nez v6, :cond_1

    return-void
.end method

.method private ensureTargetGlobal()V
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "target_globals"

    .line 413
    invoke-static {v0, v1}, Landroid/database/DatabaseUtils;->queryNumEntries(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "INSERT INTO target_globals (highest_target_id, highest_listen_sequence_number, last_remote_snapshot_version_seconds, last_remote_snapshot_version_nanos) VALUES (?, ?, ?, ?)"

    const-string v2, "0"

    .line 415
    filled-new-array {v2, v2, v2, v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method private hasReadTime()Z
    .locals 7

    const-string v0, "read_time_seconds"

    const-string v1, "remote_documents"

    .line 448
    invoke-direct {p0, v1, v0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->tableContainsColumn(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const-string v2, "read_time_nanos"

    .line 449
    invoke-direct {p0, v1, v2}, Lcom/google/firebase/firestore/local/SQLiteSchema;->tableContainsColumn(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_0

    move v4, v2

    goto :goto_0

    :cond_0
    move v4, v3

    :goto_0
    const-string v5, "Table contained just one of read_time_seconds or read_time_nanos"

    new-array v6, v3, [Ljava/lang/Object;

    .line 451
    invoke-static {v4, v5, v6}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    move v2, v3

    :goto_1
    return v2
.end method

.method private ifTablesDontExist([Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 6

    .line 211
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ", "

    invoke-static {v1, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    .line 212
    :goto_0
    array-length v4, p1

    if-ge v2, v4, :cond_3

    .line 213
    aget-object v4, p1, v2

    .line 214
    invoke-direct {p0, v4}, Lcom/google/firebase/firestore/local/SQLiteSchema;->tableExists(Ljava/lang/String;)Z

    move-result v5

    if-nez v2, :cond_0

    move v3, v5

    goto :goto_2

    :cond_0
    if-eq v5, v3, :cond_2

    .line 218
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v2, "Expected all of "

    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " to either exist or not, but "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    if-eqz v3, :cond_1

    .line 220
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object p1, p1, v1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " exists and "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " does not"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 222
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object p1, p1, v1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " does not exist and "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " does"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 224
    :goto_1
    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    if-nez v3, :cond_4

    .line 228
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    goto :goto_3

    .line 230
    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Skipping migration because all of "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " already exist"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array p2, v1, [Ljava/lang/Object;

    const-string v0, "SQLiteSchema"

    invoke-static {v0, p1, p2}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_3
    return-void
.end method

.method static synthetic lambda$createV8CollectionParentsIndex$10(Lcom/google/firebase/firestore/local/MemoryIndexManager$MemoryCollectionParentIndex;Landroid/database/sqlite/SQLiteStatement;Lcom/google/firebase/firestore/model/ResourcePath;)V
    .locals 1

    .line 548
    invoke-virtual {p0, p2}, Lcom/google/firebase/firestore/local/MemoryIndexManager$MemoryCollectionParentIndex;->add(Lcom/google/firebase/firestore/model/ResourcePath;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 549
    invoke-virtual {p2}, Lcom/google/firebase/firestore/model/ResourcePath;->getLastSegment()Ljava/lang/String;

    move-result-object p0

    .line 550
    invoke-virtual {p2}, Lcom/google/firebase/firestore/model/ResourcePath;->popLast()Lcom/google/firebase/firestore/model/BasePath;

    move-result-object p2

    check-cast p2, Lcom/google/firebase/firestore/model/ResourcePath;

    .line 551
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->clearBindings()V

    const/4 v0, 0x1

    .line 552
    invoke-virtual {p1, v0, p0}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    const/4 p0, 0x2

    .line 553
    invoke-static {p2}, Lcom/google/firebase/firestore/local/EncodedPath;->encode(Lcom/google/firebase/firestore/model/BasePath;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p0, p2}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 554
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    :cond_0
    return-void
.end method

.method static synthetic lambda$createV8CollectionParentsIndex$11(Lcom/google/firebase/firestore/util/Consumer;Landroid/database/Cursor;)V
    .locals 1

    const/4 v0, 0x0

    .line 563
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/firebase/firestore/local/EncodedPath;->decodeResourcePath(Ljava/lang/String;)Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object p1

    .line 564
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/ResourcePath;->popLast()Lcom/google/firebase/firestore/model/BasePath;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/model/ResourcePath;

    invoke-interface {p0, p1}, Lcom/google/firebase/firestore/util/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$createV8CollectionParentsIndex$12(Lcom/google/firebase/firestore/util/Consumer;Landroid/database/Cursor;)V
    .locals 1

    const/4 v0, 0x0

    .line 572
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/firebase/firestore/local/EncodedPath;->decodeResourcePath(Ljava/lang/String;)Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object p1

    .line 573
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/ResourcePath;->popLast()Lcom/google/firebase/firestore/model/BasePath;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/model/ResourcePath;

    invoke-interface {p0, p1}, Lcom/google/firebase/firestore/util/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$ensurePathLength$14([ZLandroid/database/sqlite/SQLiteStatement;Landroid/database/Cursor;)V
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 638
    aput-boolean v1, p0, v0

    .line 640
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 641
    invoke-static {p0}, Lcom/google/firebase/firestore/local/EncodedPath;->decodeResourcePath(Ljava/lang/String;)Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object p2

    .line 643
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->clearBindings()V

    .line 644
    invoke-virtual {p2}, Lcom/google/firebase/firestore/model/ResourcePath;->length()I

    move-result p2

    int-to-long v2, p2

    invoke-virtual {p1, v1, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/4 p2, 0x2

    .line 645
    invoke-virtual {p1, p2, p0}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 646
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->executeUpdateDelete()I

    move-result p0

    const/4 p1, -0x1

    if-eq p0, p1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    const-string p0, "Failed to update document path"

    new-array p1, v0, [Ljava/lang/Object;

    invoke-static {v1, p0, p1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$ensureSequenceNumbers$7(Landroid/database/Cursor;)Ljava/lang/Long;
    .locals 2

    const/4 v0, 0x0

    .line 492
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$ensureSequenceNumbers$8([ZLandroid/database/sqlite/SQLiteStatement;JLandroid/database/Cursor;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 516
    aput-boolean v1, p0, v0

    .line 517
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->clearBindings()V

    .line 518
    invoke-interface {p4, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, v1, p0}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    const/4 p0, 0x2

    .line 519
    invoke-virtual {p1, p0, p2, p3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 520
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    move-result-wide p0

    const-wide/16 p2, -0x1

    cmp-long p0, p0, p2

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    const-string p0, "Failed to insert a sentinel row"

    new-array p1, v0, [Ljava/lang/Object;

    invoke-static {v1, p0, p1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private removeAcknowledgedMutations()V
    .locals 3

    .line 268
    new-instance v0, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "SELECT uid, last_acknowledged_batch_id FROM mutation_queues"

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;-><init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 272
    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda15;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda15;-><init>(Lcom/google/firebase/firestore/local/SQLiteSchema;)V

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    return-void
.end method

.method private removeMutationBatch(Ljava/lang/String;I)V
    .locals 6

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "DELETE FROM mutations WHERE uid = ? AND batch_id = ?"

    .line 287
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    const/4 v1, 0x1

    .line 288
    invoke-virtual {v0, v1, p1}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    int-to-long v2, p2

    const/4 v4, 0x2

    .line 289
    invoke-virtual {v0, v4, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 290
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->executeUpdateDelete()I

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    new-array v3, v4, [Ljava/lang/Object;

    aput-object p1, v3, v2

    .line 291
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v1

    const-string v5, "Mutation batch (%s, %d) did not exist"

    invoke-static {v0, v5, v3}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    new-array v3, v4, [Ljava/lang/Object;

    aput-object p1, v3, v2

    .line 296
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v1

    const-string p1, "DELETE FROM document_mutations WHERE uid = ? AND batch_id = ?"

    .line 294
    invoke-virtual {v0, p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private rewriteCanonicalIds()V
    .locals 3

    .line 603
    new-instance v0, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "SELECT target_id, target_proto FROM targets"

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;-><init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    new-instance v1, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda10;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda10;-><init>(Lcom/google/firebase/firestore/local/SQLiteSchema;)V

    .line 604
    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    return-void
.end method

.method private tableContainsColumn(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 578
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/local/SQLiteSchema;->getTableColumns(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    .line 579
    invoke-interface {p1, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private tableExists(Ljava/lang/String;)Z
    .locals 4

    .line 716
    new-instance v0, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    iget-object v1, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "SELECT 1=1 FROM sqlite_master WHERE tbl_name = ?"

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;-><init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    .line 717
    invoke-virtual {v0, v2}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->binding([Ljava/lang/Object;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object p1

    .line 718
    invoke-virtual {p1}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v1

    return p1
.end method


# virtual methods
.method getTableColumns(Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "PRAGMA table_info("

    .line 587
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    :try_start_0
    iget-object v3, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 589
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    const-string p1, "name"

    .line 590
    invoke-interface {v2, p1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p1

    .line 591
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 592
    invoke-interface {v2, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    if-eqz v2, :cond_1

    .line 596
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_1
    return-object v1

    :catchall_0
    move-exception p1

    if-eqz v2, :cond_2

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 598
    :cond_2
    throw p1
.end method

.method synthetic lambda$createBundleCache$15$com-google-firebase-firestore-local-SQLiteSchema()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE bundles (bundle_id TEXT PRIMARY KEY, create_time_seconds INTEGER, create_time_nanos INTEGER, schema_version INTEGER, total_documents INTEGER, total_bytes INTEGER)"

    .line 661
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE named_queries (name TEXT PRIMARY KEY, read_time_seconds INTEGER, read_time_nanos INTEGER, bundled_query_proto BLOB)"

    .line 670
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$createDataMigrationTable$17$com-google-firebase-firestore-local-SQLiteSchema()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE data_migrations (migration_name TEXT, PRIMARY KEY (migration_name))"

    .line 702
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$createFieldIndex$5$com-google-firebase-firestore-local-SQLiteSchema()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE index_configuration (index_id INTEGER, collection_group TEXT, index_proto BLOB, PRIMARY KEY (index_id))"

    .line 376
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE index_state (index_id INTEGER, uid TEXT, sequence_number INTEGER, read_time_seconds INTEGER, read_time_nanos INTEGER, document_key TEXT, largest_batch_id INTEGER, PRIMARY KEY (index_id, uid))"

    .line 384
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE index_entries (index_id INTEGER, uid TEXT, array_value BLOB, directional_value BLOB, document_key TEXT, PRIMARY KEY (index_id, uid, array_value, directional_value, document_key))"

    .line 397
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE INDEX read_time ON remote_documents(read_time_seconds, read_time_nanos)"

    .line 406
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$createOverlays$16$com-google-firebase-firestore-local-SQLiteSchema()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE document_overlays (uid TEXT, collection_path TEXT, document_id TEXT, collection_group TEXT, largest_batch_id INTEGER, overlay_mutation BLOB, PRIMARY KEY (uid, collection_path, document_id))"

    .line 683
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE INDEX batch_id_overlay ON document_overlays (uid, largest_batch_id)"

    .line 692
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE INDEX collection_group_overlay ON document_overlays (uid, collection_group)"

    .line 693
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$createV1MutationQueue$0$com-google-firebase-firestore-local-SQLiteSchema()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE mutation_queues (uid TEXT PRIMARY KEY, last_acknowledged_batch_id INTEGER, last_stream_token BLOB)"

    .line 240
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE mutations (uid TEXT, batch_id INTEGER, mutations BLOB, PRIMARY KEY (uid, batch_id))"

    .line 247
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE document_mutations (uid TEXT, path TEXT, batch_id INTEGER, PRIMARY KEY (uid, path, batch_id))"

    .line 257
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$createV1RemoteDocumentCache$4$com-google-firebase-firestore-local-SQLiteSchema()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE remote_documents (path TEXT PRIMARY KEY, contents BLOB)"

    .line 355
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$createV1TargetCache$3$com-google-firebase-firestore-local-SQLiteSchema()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE targets (target_id INTEGER PRIMARY KEY, canonical_id TEXT, snapshot_version_seconds INTEGER, snapshot_version_nanos INTEGER, resume_token BLOB, last_listen_sequence_number INTEGER,target_proto BLOB)"

    .line 304
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE INDEX query_targets ON targets (canonical_id, target_id)"

    .line 314
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE target_globals (highest_target_id INTEGER, highest_listen_sequence_number INTEGER, last_remote_snapshot_version_seconds INTEGER, last_remote_snapshot_version_nanos INTEGER)"

    .line 317
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE target_documents (target_id INTEGER, path TEXT, PRIMARY KEY (target_id, path))"

    .line 325
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE INDEX document_targets ON target_documents (path, target_id)"

    .line 332
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$createV8CollectionParentsIndex$9$com-google-firebase-firestore-local-SQLiteSchema()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE collection_parents (collection_id TEXT, parent TEXT, PRIMARY KEY(collection_id, parent))"

    .line 533
    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$dropLastLimboFreeSnapshotVersion$6$com-google-firebase-firestore-local-SQLiteSchema(Landroid/database/Cursor;)V
    .locals 6

    .line 0
    const/4 v0, 0x0

    .line 467
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const/4 v2, 0x1

    .line 468
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object p1

    .line 471
    :try_start_0
    invoke-static {p1}, Lcom/google/firebase/firestore/proto/Target;->parseFrom([B)Lcom/google/firebase/firestore/proto/Target;

    move-result-object p1

    .line 472
    invoke-virtual {p1}, Lcom/google/firebase/firestore/proto/Target;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/proto/Target$Builder;

    invoke-virtual {p1}, Lcom/google/firebase/firestore/proto/Target$Builder;->clearLastLimboFreeSnapshotVersion()Lcom/google/firebase/firestore/proto/Target$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/firestore/proto/Target$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/proto/Target;

    iget-object v3, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v4, "UPDATE targets SET target_proto = ? WHERE target_id = ?"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    .line 475
    invoke-virtual {p1}, Lcom/google/firebase/firestore/proto/Target;->toByteArray()[B

    move-result-object p1

    aput-object p1, v5, v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v5, v2

    .line 473
    invoke-virtual {v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    new-array p1, v2, [Ljava/lang/Object;

    .line 477
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, p1, v0

    const-string v0, "Failed to decode Query data for target %s"

    invoke-static {v0, p1}, Lcom/google/firebase/firestore/util/Assert;->fail(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/AssertionError;

    move-result-object p1

    throw p1
.end method

.method synthetic lambda$removeAcknowledgedMutations$1$com-google-firebase-firestore-local-SQLiteSchema(Ljava/lang/String;Landroid/database/Cursor;)V
    .locals 1

    .line 0
    const/4 v0, 0x0

    .line 281
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/local/SQLiteSchema;->removeMutationBatch(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic lambda$removeAcknowledgedMutations$2$com-google-firebase-firestore-local-SQLiteSchema(Landroid/database/Cursor;)V
    .locals 7

    .line 0
    const/4 v0, 0x0

    .line 274
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    .line 275
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    .line 277
    new-instance p1, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    iget-object v5, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v6, "SELECT batch_id FROM mutations WHERE uid = ? AND batch_id <= ?"

    invoke-direct {p1, v5, v6}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;-><init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v0

    .line 280
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v5, v2

    invoke-virtual {p1, v5}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->binding([Ljava/lang/Object;)Lcom/google/firebase/firestore/local/SQLitePersistence$Query;

    move-result-object p1

    .line 281
    new-instance v0, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, v1}, Lcom/google/firebase/firestore/local/SQLiteSchema$$ExternalSyntheticLambda0;-><init>(Lcom/google/firebase/firestore/local/SQLiteSchema;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/google/firebase/firestore/local/SQLitePersistence$Query;->forEach(Lcom/google/firebase/firestore/util/Consumer;)I

    return-void
.end method

.method synthetic lambda$rewriteCanonicalIds$13$com-google-firebase-firestore-local-SQLiteSchema(Landroid/database/Cursor;)V
    .locals 6

    .line 0
    const/4 v0, 0x0

    .line 606
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const/4 v2, 0x1

    .line 607
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object p1

    .line 610
    :try_start_0
    invoke-static {p1}, Lcom/google/firebase/firestore/proto/Target;->parseFrom([B)Lcom/google/firebase/firestore/proto/Target;

    move-result-object p1

    iget-object v3, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->serializer:Lcom/google/firebase/firestore/local/LocalSerializer;

    .line 611
    invoke-virtual {v3, p1}, Lcom/google/firebase/firestore/local/LocalSerializer;->decodeTargetData(Lcom/google/firebase/firestore/proto/Target;)Lcom/google/firebase/firestore/local/TargetData;

    move-result-object p1

    .line 612
    invoke-virtual {p1}, Lcom/google/firebase/firestore/local/TargetData;->getTarget()Lcom/google/firebase/firestore/core/Target;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/Target;->getCanonicalId()Ljava/lang/String;

    move-result-object p1

    iget-object v3, p0, Lcom/google/firebase/firestore/local/SQLiteSchema;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v4, "UPDATE targets SET canonical_id  = ? WHERE target_id = ?"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v0

    .line 615
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v5, v2

    .line 613
    invoke-virtual {v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    new-array p1, v2, [Ljava/lang/Object;

    .line 617
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, p1, v0

    const-string v0, "Failed to decode Query data for target %s"

    invoke-static {v0, p1}, Lcom/google/firebase/firestore/util/Assert;->fail(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/AssertionError;

    move-result-object p1

    throw p1
.end method

.method runSchemaUpgrades()V
    .locals 1

    const/4 v0, 0x0

    .line 72
    invoke-virtual {p0, v0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->runSchemaUpgrades(I)V

    return-void
.end method

.method runSchemaUpgrades(I)V
    .locals 1

    const/16 v0, 0x10

    .line 76
    invoke-virtual {p0, p1, v0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->runSchemaUpgrades(II)V

    return-void
.end method

.method runSchemaUpgrades(II)V
    .locals 6

    .line 93
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const/4 v2, 0x1

    if-ge p1, v2, :cond_0

    if-lt p2, v2, :cond_0

    .line 96
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->createV1MutationQueue()V

    .line 97
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->createV1TargetCache()V

    .line 98
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->createV1RemoteDocumentCache()V

    :cond_0
    const/4 v3, 0x3

    if-ge p1, v3, :cond_1

    if-lt p2, v3, :cond_1

    if-eqz p1, :cond_1

    .line 108
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->dropV1TargetCache()V

    .line 109
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->createV1TargetCache()V

    :cond_1
    const/4 v4, 0x4

    if-ge p1, v4, :cond_2

    if-lt p2, v4, :cond_2

    .line 114
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->ensureTargetGlobal()V

    .line 115
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->addTargetCount()V

    :cond_2
    const/4 v4, 0x5

    if-ge p1, v4, :cond_3

    if-lt p2, v4, :cond_3

    .line 119
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->addSequenceNumber()V

    :cond_3
    const/4 v4, 0x6

    if-ge p1, v4, :cond_4

    if-lt p2, v4, :cond_4

    .line 123
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->removeAcknowledgedMutations()V

    :cond_4
    const/4 v4, 0x7

    if-ge p1, v4, :cond_5

    if-lt p2, v4, :cond_5

    .line 127
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->ensureSequenceNumbers()V

    :cond_5
    const/16 v4, 0x8

    if-ge p1, v4, :cond_6

    if-lt p2, v4, :cond_6

    .line 131
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->createV8CollectionParentsIndex()V

    :cond_6
    const/16 v4, 0x9

    if-ge p1, v4, :cond_8

    if-lt p2, v4, :cond_8

    .line 135
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->hasReadTime()Z

    move-result v5

    if-nez v5, :cond_7

    .line 136
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->addReadTime()V

    goto :goto_0

    .line 143
    :cond_7
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->dropLastLimboFreeSnapshotVersion()V

    :cond_8
    :goto_0
    if-ne p1, v4, :cond_9

    const/16 v4, 0xa

    if-lt p2, v4, :cond_9

    .line 151
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->dropLastLimboFreeSnapshotVersion()V

    :cond_9
    const/16 v4, 0xb

    if-ge p1, v4, :cond_a

    if-lt p2, v4, :cond_a

    .line 156
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->rewriteCanonicalIds()V

    :cond_a
    const/16 v4, 0xc

    if-ge p1, v4, :cond_b

    if-lt p2, v4, :cond_b

    .line 160
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->createBundleCache()V

    :cond_b
    const/16 v4, 0xd

    if-ge p1, v4, :cond_c

    if-lt p2, v4, :cond_c

    .line 164
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->addPathLength()V

    .line 165
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->ensurePathLength()V

    :cond_c
    const/16 v4, 0xe

    if-ge p1, v4, :cond_d

    if-lt p2, v4, :cond_d

    .line 169
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->createOverlays()V

    .line 170
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->createDataMigrationTable()V

    .line 171
    sget-object v4, Lcom/google/firebase/firestore/local/Persistence;->DATA_MIGRATION_BUILD_OVERLAYS:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/google/firebase/firestore/local/SQLiteSchema;->addPendingDataMigration(Ljava/lang/String;)V

    :cond_d
    const/16 v4, 0xf

    if-ge p1, v4, :cond_e

    if-lt p2, v4, :cond_e

    .line 175
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->ensureReadTime()V

    :cond_e
    const/16 v4, 0x10

    if-ge p1, v4, :cond_f

    if-lt p2, v4, :cond_f

    .line 179
    invoke-direct {p0}, Lcom/google/firebase/firestore/local/SQLiteSchema;->createFieldIndex()V

    :cond_f
    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    .line 198
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v4

    .line 199
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v2

    .line 200
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    sub-long/2addr p1, v0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v3, p2

    const-string p1, "SQLiteSchema"

    const-string p2, "Migration from version %s to %s took %s milliseconds"

    .line 195
    invoke-static {p1, p2, v3}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method
