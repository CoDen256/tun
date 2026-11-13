.class public Lcom/google/firebase/firestore/bundle/BundleLoader;
.super Ljava/lang/Object;
.source "BundleLoader.java"


# instance fields
.field private final bundleCallback:Lcom/google/firebase/firestore/bundle/BundleCallback;

.field private final bundleMetadata:Lcom/google/firebase/firestore/bundle/BundleMetadata;

.field private bytesLoaded:J

.field private currentMetadata:Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;

.field private documents:Lcom/google/firebase/database/collection/ImmutableSortedMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/database/collection/ImmutableSortedMap<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Lcom/google/firebase/firestore/model/MutableDocument;",
            ">;"
        }
    .end annotation
.end field

.field private final documentsMetadata:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;",
            ">;"
        }
    .end annotation
.end field

.field private final queries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/bundle/NamedQuery;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/bundle/BundleCallback;Lcom/google/firebase/firestore/bundle/BundleMetadata;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->bundleCallback:Lcom/google/firebase/firestore/bundle/BundleCallback;

    iput-object p2, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->bundleMetadata:Lcom/google/firebase/firestore/bundle/BundleMetadata;

    .line 49
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->queries:Ljava/util/List;

    .line 50
    invoke-static {}, Lcom/google/firebase/firestore/model/DocumentCollections;->emptyMutableDocumentMap()Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->documents:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 51
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->documentsMetadata:Ljava/util/Map;

    return-void
.end method

.method private getQueryDocumentMapping()Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;>;"
        }
    .end annotation

    .line 133
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->queries:Ljava/util/List;

    .line 134
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/bundle/NamedQuery;

    .line 135
    invoke-virtual {v2}, Lcom/google/firebase/firestore/bundle/NamedQuery;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/google/firebase/firestore/model/DocumentKey;->emptyKeySet()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->documentsMetadata:Ljava/util/Map;

    .line 137
    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;

    .line 138
    invoke-virtual {v2}, Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;->getQueries()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 139
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/firebase/database/collection/ImmutableSortedSet;

    .line 140
    invoke-virtual {v2}, Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    return-object v0
.end method


# virtual methods
.method public addElement(Lcom/google/firebase/firestore/bundle/BundleElement;J)Lcom/google/firebase/firestore/LoadBundleTaskProgress;
    .locals 12

    .line 61
    instance-of v0, p1, Lcom/google/firebase/firestore/bundle/BundleMetadata;

    xor-int/lit8 v0, v0, 0x1

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "Unexpected bundle metadata element."

    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->documents:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 64
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->size()I

    move-result v0

    .line 66
    instance-of v1, p1, Lcom/google/firebase/firestore/bundle/NamedQuery;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->queries:Ljava/util/List;

    .line 67
    check-cast p1, Lcom/google/firebase/firestore/bundle/NamedQuery;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 68
    :cond_0
    instance-of v1, p1, Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;

    if-eqz v1, :cond_1

    .line 69
    check-cast p1, Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;

    iget-object v1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->documentsMetadata:Ljava/util/Map;

    .line 70
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v3

    invoke-interface {v1, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->currentMetadata:Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;

    .line 72
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;->exists()Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->documents:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 75
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v3

    .line 77
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v4

    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;->getReadTime()Lcom/google/firebase/firestore/model/SnapshotVersion;

    move-result-object v5

    .line 76
    invoke-static {v4, v5}, Lcom/google/firebase/firestore/model/MutableDocument;->newNoDocument(Lcom/google/firebase/firestore/model/DocumentKey;Lcom/google/firebase/firestore/model/SnapshotVersion;)Lcom/google/firebase/firestore/model/MutableDocument;

    move-result-object v4

    .line 78
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;->getReadTime()Lcom/google/firebase/firestore/model/SnapshotVersion;

    move-result-object p1

    invoke-virtual {v4, p1}, Lcom/google/firebase/firestore/model/MutableDocument;->setReadTime(Lcom/google/firebase/firestore/model/SnapshotVersion;)Lcom/google/firebase/firestore/model/MutableDocument;

    move-result-object p1

    .line 74
    invoke-virtual {v1, v3, p1}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->insert(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->documents:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    iput-object v2, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->currentMetadata:Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;

    goto :goto_0

    .line 81
    :cond_1
    instance-of v1, p1, Lcom/google/firebase/firestore/bundle/BundleDocument;

    if-eqz v1, :cond_3

    .line 82
    check-cast p1, Lcom/google/firebase/firestore/bundle/BundleDocument;

    iget-object v1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->currentMetadata:Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;

    if-eqz v1, :cond_2

    .line 83
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundleDocument;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v1

    iget-object v3, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->currentMetadata:Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;

    invoke-virtual {v3}, Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/google/firebase/firestore/model/DocumentKey;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->documents:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 89
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundleDocument;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v3

    .line 90
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundleDocument;->getDocument()Lcom/google/firebase/firestore/model/MutableDocument;

    move-result-object p1

    iget-object v4, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->currentMetadata:Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;

    invoke-virtual {v4}, Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;->getReadTime()Lcom/google/firebase/firestore/model/SnapshotVersion;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/google/firebase/firestore/model/MutableDocument;->setReadTime(Lcom/google/firebase/firestore/model/SnapshotVersion;)Lcom/google/firebase/firestore/model/MutableDocument;

    move-result-object p1

    .line 88
    invoke-virtual {v1, v3, p1}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->insert(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->documents:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    iput-object v2, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->currentMetadata:Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;

    goto :goto_0

    .line 84
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The document being added does not match the stored metadata."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    :goto_0
    iget-wide v3, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->bytesLoaded:J

    add-long/2addr v3, p2

    iput-wide v3, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->bytesLoaded:J

    iget-object p1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->documents:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 96
    invoke-virtual {p1}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->size()I

    move-result p1

    if-eq v0, p1, :cond_4

    .line 97
    new-instance v2, Lcom/google/firebase/firestore/LoadBundleTaskProgress;

    iget-object p1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->documents:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 98
    invoke-virtual {p1}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->size()I

    move-result v4

    iget-object p1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->bundleMetadata:Lcom/google/firebase/firestore/bundle/BundleMetadata;

    .line 99
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundleMetadata;->getTotalDocuments()I

    move-result v5

    iget-wide v6, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->bytesLoaded:J

    iget-object p1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->bundleMetadata:Lcom/google/firebase/firestore/bundle/BundleMetadata;

    .line 101
    invoke-virtual {p1}, Lcom/google/firebase/firestore/bundle/BundleMetadata;->getTotalBytes()J

    move-result-wide v8

    const/4 v10, 0x0

    sget-object v11, Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;->RUNNING:Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;

    move-object v3, v2

    invoke-direct/range {v3 .. v11}, Lcom/google/firebase/firestore/LoadBundleTaskProgress;-><init>(IIJJLjava/lang/Exception;Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;)V

    :cond_4
    return-object v2
.end method

.method public applyChanges()Lcom/google/firebase/database/collection/ImmutableSortedMap;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/database/collection/ImmutableSortedMap<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->currentMetadata:Lcom/google/firebase/firestore/bundle/BundledDocumentMetadata;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    const-string v3, "Bundled documents end with a document metadata element instead of a document."

    new-array v4, v2, [Ljava/lang/Object;

    .line 109
    invoke-static {v0, v3, v4}, Lcom/google/firebase/firestore/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->bundleMetadata:Lcom/google/firebase/firestore/bundle/BundleMetadata;

    .line 112
    invoke-virtual {v0}, Lcom/google/firebase/firestore/bundle/BundleMetadata;->getBundleId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    move v0, v1

    goto :goto_1

    :cond_1
    move v0, v2

    :goto_1
    const-string v3, "Bundle ID must be set"

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {v0, v3, v4}, Lcom/google/firebase/firestore/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->documents:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 114
    invoke-virtual {v0}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->size()I

    move-result v0

    iget-object v3, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->bundleMetadata:Lcom/google/firebase/firestore/bundle/BundleMetadata;

    invoke-virtual {v3}, Lcom/google/firebase/firestore/bundle/BundleMetadata;->getTotalDocuments()I

    move-result v3

    if-ne v0, v3, :cond_2

    move v0, v1

    goto :goto_2

    :cond_2
    move v0, v2

    :goto_2
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->bundleMetadata:Lcom/google/firebase/firestore/bundle/BundleMetadata;

    .line 116
    invoke-virtual {v4}, Lcom/google/firebase/firestore/bundle/BundleMetadata;->getTotalDocuments()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v2

    iget-object v2, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->documents:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    .line 117
    invoke-virtual {v2}, Lcom/google/firebase/database/collection/ImmutableSortedMap;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v3, v1

    const-string v1, "Expected %s documents, but loaded %s."

    .line 113
    invoke-static {v0, v1, v3}, Lcom/google/firebase/firestore/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->bundleCallback:Lcom/google/firebase/firestore/bundle/BundleCallback;

    iget-object v1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->documents:Lcom/google/firebase/database/collection/ImmutableSortedMap;

    iget-object v2, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->bundleMetadata:Lcom/google/firebase/firestore/bundle/BundleMetadata;

    .line 120
    invoke-virtual {v2}, Lcom/google/firebase/firestore/bundle/BundleMetadata;->getBundleId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/google/firebase/firestore/bundle/BundleCallback;->applyBundledDocuments(Lcom/google/firebase/database/collection/ImmutableSortedMap;Ljava/lang/String;)Lcom/google/firebase/database/collection/ImmutableSortedMap;

    move-result-object v0

    .line 122
    invoke-direct {p0}, Lcom/google/firebase/firestore/bundle/BundleLoader;->getQueryDocumentMapping()Ljava/util/Map;

    move-result-object v1

    iget-object v2, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->queries:Ljava/util/List;

    .line 123
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/bundle/NamedQuery;

    iget-object v4, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->bundleCallback:Lcom/google/firebase/firestore/bundle/BundleCallback;

    .line 124
    invoke-virtual {v3}, Lcom/google/firebase/firestore/bundle/NamedQuery;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/firebase/database/collection/ImmutableSortedSet;

    invoke-interface {v4, v3, v5}, Lcom/google/firebase/firestore/bundle/BundleCallback;->saveNamedQuery(Lcom/google/firebase/firestore/bundle/NamedQuery;Lcom/google/firebase/database/collection/ImmutableSortedSet;)V

    goto :goto_3

    :cond_3
    iget-object v1, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->bundleCallback:Lcom/google/firebase/firestore/bundle/BundleCallback;

    iget-object v2, p0, Lcom/google/firebase/firestore/bundle/BundleLoader;->bundleMetadata:Lcom/google/firebase/firestore/bundle/BundleMetadata;

    .line 127
    invoke-interface {v1, v2}, Lcom/google/firebase/firestore/bundle/BundleCallback;->saveBundle(Lcom/google/firebase/firestore/bundle/BundleMetadata;)V

    return-object v0
.end method
