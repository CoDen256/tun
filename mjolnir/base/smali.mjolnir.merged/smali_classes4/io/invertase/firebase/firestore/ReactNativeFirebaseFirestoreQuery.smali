.class public Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;
.super Ljava/lang/Object;
.source "ReactNativeFirebaseFirestoreQuery.java"


# instance fields
.field appName:Ljava/lang/String;

.field query:Lcom/google/firebase/firestore/Query;


# direct methods
.method public static synthetic $r8$lambda$oXUbbiA4ySvcYm5swVsULoge-XU(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;Lcom/google/firebase/firestore/Source;)Lcom/facebook/react/bridge/WritableMap;
    .locals 0

    invoke-direct {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->lambda$get$0(Lcom/google/firebase/firestore/Source;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p0

    return-object p0
.end method

.method constructor <init>(Ljava/lang/String;Lcom/google/firebase/firestore/Query;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->appName:Ljava/lang/String;

    iput-object p2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 50
    invoke-direct {p0, p3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->applyFilters(Lcom/facebook/react/bridge/ReadableArray;)V

    .line 51
    invoke-direct {p0, p4}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->applyOrders(Lcom/facebook/react/bridge/ReadableArray;)V

    .line 52
    invoke-direct {p0, p5}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->applyOptions(Lcom/facebook/react/bridge/ReadableMap;)V

    return-void
.end method

.method private applyFilters(Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 7

    const/4 v0, 0x0

    move v1, v0

    .line 65
    :goto_0
    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_a

    .line 66
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableArray;->getMap(I)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v2

    .line 68
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/react/bridge/ReadableMap;

    const-string v4, "fieldPath"

    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v3

    invoke-interface {v3}, Lcom/facebook/react/bridge/ReadableArray;->toArrayList()Ljava/util/ArrayList;

    move-result-object v3

    new-array v4, v0, [Ljava/lang/String;

    .line 69
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    .line 71
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    invoke-static {v3}, Lcom/google/firebase/firestore/FieldPath;->of([Ljava/lang/String;)Lcom/google/firebase/firestore/FieldPath;

    move-result-object v3

    const-string v4, "operator"

    .line 72
    invoke-interface {v2, v4}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "value"

    .line 73
    invoke-interface {v2, v5}, Lcom/facebook/react/bridge/ReadableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v2

    iget-object v5, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 74
    invoke-virtual {v5}, Lcom/google/firebase/firestore/Query;->getFirestore()Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v5

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/react/bridge/ReadableArray;

    invoke-static {v5, v2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->parseTypeMap(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableArray;)Ljava/lang/Object;

    move-result-object v2

    .line 76
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v5

    const/4 v6, -0x1

    sparse-switch v5, :sswitch_data_0

    goto/16 :goto_1

    :sswitch_0
    const-string v5, "NOT_EQUAL"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    goto/16 :goto_1

    :cond_0
    const/16 v6, 0x9

    goto/16 :goto_1

    :sswitch_1
    const-string v5, "GREATER_THAN_OR_EQUAL"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    goto/16 :goto_1

    :cond_1
    const/16 v6, 0x8

    goto/16 :goto_1

    :sswitch_2
    const-string v5, "GREATER_THAN"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    goto :goto_1

    :cond_2
    const/4 v6, 0x7

    goto :goto_1

    :sswitch_3
    const-string v5, "ARRAY_CONTAINS"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    goto :goto_1

    :cond_3
    const/4 v6, 0x6

    goto :goto_1

    :sswitch_4
    const-string v5, "EQUAL"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    goto :goto_1

    :cond_4
    const/4 v6, 0x5

    goto :goto_1

    :sswitch_5
    const-string v5, "IN"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    goto :goto_1

    :cond_5
    const/4 v6, 0x4

    goto :goto_1

    :sswitch_6
    const-string v5, "ARRAY_CONTAINS_ANY"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    goto :goto_1

    :cond_6
    const/4 v6, 0x3

    goto :goto_1

    :sswitch_7
    const-string v5, "LESS_THAN"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    goto :goto_1

    :cond_7
    const/4 v6, 0x2

    goto :goto_1

    :sswitch_8
    const-string v5, "NOT_IN"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8

    goto :goto_1

    :cond_8
    const/4 v6, 0x1

    goto :goto_1

    :sswitch_9
    const-string v5, "LESS_THAN_OR_EQUAL"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    goto :goto_1

    :cond_9
    move v6, v0

    :goto_1
    packed-switch v6, :pswitch_data_0

    goto/16 :goto_2

    :pswitch_0
    iget-object v4, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 81
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/FieldPath;

    invoke-virtual {v4, v3, v2}, Lcom/google/firebase/firestore/Query;->whereNotEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    iput-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    goto/16 :goto_2

    :pswitch_1
    iget-object v4, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 91
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/FieldPath;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 90
    invoke-virtual {v4, v3, v2}, Lcom/google/firebase/firestore/Query;->whereGreaterThanOrEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    iput-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    goto/16 :goto_2

    :pswitch_2
    iget-object v4, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 86
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/FieldPath;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 85
    invoke-virtual {v4, v3, v2}, Lcom/google/firebase/firestore/Query;->whereGreaterThan(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    iput-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    goto/16 :goto_2

    :pswitch_3
    iget-object v4, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 105
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/FieldPath;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 104
    invoke-virtual {v4, v3, v2}, Lcom/google/firebase/firestore/Query;->whereArrayContains(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    iput-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    goto/16 :goto_2

    :pswitch_4
    iget-object v4, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 78
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/FieldPath;

    invoke-virtual {v4, v3, v2}, Lcom/google/firebase/firestore/Query;->whereEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    iput-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    goto :goto_2

    :pswitch_5
    iget-object v4, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 115
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/FieldPath;

    check-cast v2, Ljava/util/List;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 114
    invoke-virtual {v4, v3, v2}, Lcom/google/firebase/firestore/Query;->whereIn(Lcom/google/firebase/firestore/FieldPath;Ljava/util/List;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    iput-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    goto :goto_2

    :pswitch_6
    iget-object v4, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 110
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/FieldPath;

    check-cast v2, Ljava/util/List;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 109
    invoke-virtual {v4, v3, v2}, Lcom/google/firebase/firestore/Query;->whereArrayContainsAny(Lcom/google/firebase/firestore/FieldPath;Ljava/util/List;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    iput-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    goto :goto_2

    :pswitch_7
    iget-object v4, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 95
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/FieldPath;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v4, v3, v2}, Lcom/google/firebase/firestore/Query;->whereLessThan(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    iput-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    goto :goto_2

    :pswitch_8
    iget-object v4, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 120
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/FieldPath;

    check-cast v2, Ljava/util/List;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 119
    invoke-virtual {v4, v3, v2}, Lcom/google/firebase/firestore/Query;->whereNotIn(Lcom/google/firebase/firestore/FieldPath;Ljava/util/List;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    iput-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    goto :goto_2

    :pswitch_9
    iget-object v4, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 100
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/FieldPath;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 99
    invoke-virtual {v4, v3, v2}, Lcom/google/firebase/firestore/Query;->whereLessThanOrEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    iput-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_a
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7c157d90 -> :sswitch_9
        -0x766521cf -> :sswitch_8
        -0x42548379 -> :sswitch_7
        -0x1bd1800e -> :sswitch_6
        0x925 -> :sswitch_5
        0x3f26f14 -> :sswitch_4
        0x4018d65 -> :sswitch_3
        0x39f1dee6 -> :sswitch_2
        0x3af35af1 -> :sswitch_1
        0x3cf0ee88 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private applyOptions(Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 4

    const-string v0, "limit"

    .line 140
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 141
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    int-to-long v2, v0

    .line 142
    invoke-virtual {v1, v2, v3}, Lcom/google/firebase/firestore/Query;->limit(J)Lcom/google/firebase/firestore/Query;

    move-result-object v0

    iput-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    :cond_0
    const-string v0, "limitToLast"

    .line 145
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 146
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->getInt(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    int-to-long v2, v0

    .line 147
    invoke-virtual {v1, v2, v3}, Lcom/google/firebase/firestore/Query;->limitToLast(J)Lcom/google/firebase/firestore/Query;

    move-result-object v0

    iput-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    :cond_1
    const-string v0, "startAt"

    .line 150
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 152
    invoke-virtual {v1}, Lcom/google/firebase/firestore/Query;->getFirestore()Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v1

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v0

    invoke-static {v1, v0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->parseReadableArray(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableArray;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 153
    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    invoke-virtual {v1, v0}, Lcom/google/firebase/firestore/Query;->startAt([Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v0

    iput-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    :cond_2
    const-string v0, "startAfter"

    .line 156
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 158
    invoke-virtual {v1}, Lcom/google/firebase/firestore/Query;->getFirestore()Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v1

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v0

    invoke-static {v1, v0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->parseReadableArray(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableArray;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 159
    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    invoke-virtual {v1, v0}, Lcom/google/firebase/firestore/Query;->startAfter([Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v0

    iput-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    :cond_3
    const-string v0, "endAt"

    .line 162
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 163
    invoke-virtual {v1}, Lcom/google/firebase/firestore/Query;->getFirestore()Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v1

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v0

    invoke-static {v1, v0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->parseReadableArray(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableArray;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 164
    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    invoke-virtual {v1, v0}, Lcom/google/firebase/firestore/Query;->endAt([Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v0

    iput-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    :cond_4
    const-string v0, "endBefore"

    .line 167
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 169
    invoke-virtual {v1}, Lcom/google/firebase/firestore/Query;->getFirestore()Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v1

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object p1

    invoke-static {v1, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->parseReadableArray(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableArray;)Ljava/util/List;

    move-result-object p1

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 170
    invoke-interface {p1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/Query;->endBefore([Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object p1

    iput-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    :cond_5
    return-void
.end method

.method private applyOrders(Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 3

    .line 127
    invoke-static {p1}, Lio/invertase/firebase/common/RCTConvertFirebase;->toArrayList(Lcom/facebook/react/bridge/ReadableArray;)Ljava/util/List;

    move-result-object p1

    .line 129
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 130
    check-cast v0, Ljava/util/Map;

    const-string v1, "fieldPath"

    .line 132
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "direction"

    .line 133
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 135
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v0}, Lcom/google/firebase/firestore/Query$Direction;->valueOf(Ljava/lang/String;)Lcom/google/firebase/firestore/Query$Direction;

    move-result-object v0

    invoke-virtual {v2, v1, v0}, Lcom/google/firebase/firestore/Query;->orderBy(Ljava/lang/String;Lcom/google/firebase/firestore/Query$Direction;)Lcom/google/firebase/firestore/Query;

    move-result-object v0

    iput-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    goto :goto_0

    :cond_0
    return-void
.end method

.method private synthetic lambda$get$0(Lcom/google/firebase/firestore/Source;)Lcom/facebook/react/bridge/WritableMap;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->query:Lcom/google/firebase/firestore/Query;

    .line 59
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/Query;->get(Lcom/google/firebase/firestore/Source;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/QuerySnapshot;

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;->appName:Ljava/lang/String;

    const-string v1, "get"

    const/4 v2, 0x0

    .line 60
    invoke-static {v0, v1, p1, v2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->snapshotToWritableMap(Ljava/lang/String;Ljava/lang/String;Lcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/MetadataChanges;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public get(Ljava/util/concurrent/Executor;Lcom/google/firebase/firestore/Source;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Lcom/google/firebase/firestore/Source;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/facebook/react/bridge/WritableMap;",
            ">;"
        }
    .end annotation

    .line 56
    new-instance v0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery$$ExternalSyntheticLambda0;-><init>(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreQuery;Lcom/google/firebase/firestore/Source;)V

    invoke-static {p1, v0}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
