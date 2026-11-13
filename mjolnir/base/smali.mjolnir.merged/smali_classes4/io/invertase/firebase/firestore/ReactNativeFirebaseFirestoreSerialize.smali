.class public Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;
.super Ljava/lang/Object;
.source "ReactNativeFirebaseFirestoreSerialize.java"


# static fields
.field private static final CHANGE_ADDED:Ljava/lang/String; = "a"

.field private static final CHANGE_MODIFIED:Ljava/lang/String; = "m"

.field private static final CHANGE_REMOVED:Ljava/lang/String; = "r"

.field private static final INT_ARRAY:I = 0xa

.field private static final INT_BLOB:I = 0xe

.field private static final INT_BOOLEAN_FALSE:I = 0x6

.field private static final INT_BOOLEAN_TRUE:I = 0x5

.field private static final INT_DOCUMENTID:I = 0x4

.field private static final INT_DOUBLE:I = 0x7

.field private static final INT_FIELDVALUE:I = 0xf

.field private static final INT_GEOPOINT:I = 0xc

.field private static final INT_INTEGER:I = 0x11

.field private static final INT_NAN:I = 0x0

.field private static final INT_NEGATIVE_INFINITY:I = 0x1

.field private static final INT_NEGATIVE_ZERO:I = 0x12

.field private static final INT_NULL:I = 0x3

.field private static final INT_OBJECT:I = 0x10

.field private static final INT_POSITIVE_INFINITY:I = 0x2

.field private static final INT_REFERENCE:I = 0xb

.field private static final INT_STRING:I = 0x8

.field private static final INT_STRING_EMPTY:I = 0x9

.field private static final INT_TIMESTAMP:I = 0xd

.field private static final INT_UNKNOWN:I = -0x3e7

.field private static final KEY_CHANGES:Ljava/lang/String; = "changes"

.field private static final KEY_DATA:Ljava/lang/String; = "data"

.field private static final KEY_DOCUMENTS:Ljava/lang/String; = "documents"

.field private static final KEY_DOC_CHANGE_DOCUMENT:Ljava/lang/String; = "doc"

.field private static final KEY_DOC_CHANGE_NEW_INDEX:Ljava/lang/String; = "ni"

.field private static final KEY_DOC_CHANGE_OLD_INDEX:Ljava/lang/String; = "oi"

.field private static final KEY_DOC_CHANGE_TYPE:Ljava/lang/String; = "type"

.field private static final KEY_EXISTS:Ljava/lang/String; = "exists"

.field private static final KEY_META:Ljava/lang/String; = "metadata"

.field private static final KEY_OPTIONS:Ljava/lang/String; = "options"

.field private static final KEY_PATH:Ljava/lang/String; = "path"

.field private static final TAG:Ljava/lang/String; = "FirestoreSerialize"

.field private static final TYPE:Ljava/lang/String; = "type"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buildTypeMap(Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableArray;
    .locals 6

    .line 287
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v0

    if-nez p0, :cond_0

    const/4 p0, 0x3

    .line 290
    invoke-interface {v0, p0}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    return-object v0

    .line 294
    :cond_0
    instance-of v1, p0, Ljava/lang/Boolean;

    if-eqz v1, :cond_2

    .line 295
    check-cast p0, Ljava/lang/Boolean;

    .line 296
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x5

    .line 297
    invoke-interface {v0, p0}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    goto :goto_0

    :cond_1
    const/4 p0, 0x6

    .line 299
    invoke-interface {v0, p0}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    :goto_0
    return-object v0

    .line 304
    :cond_2
    instance-of v1, p0, Ljava/lang/Integer;

    const/4 v2, 0x7

    if-eqz v1, :cond_3

    .line 305
    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    .line 306
    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->doubleValue()D

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableArray;->pushDouble(D)V

    return-object v0

    .line 310
    :cond_3
    instance-of v1, p0, Ljava/lang/Double;

    const/4 v3, 0x2

    if-eqz v1, :cond_7

    .line 311
    check-cast p0, Ljava/lang/Double;

    .line 313
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v1

    if-eqz v1, :cond_5

    const-wide/high16 v4, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    .line 314
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/Double;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/4 p0, 0x1

    .line 315
    invoke-interface {v0, p0}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    return-object v0

    :cond_4
    const-wide/high16 v4, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 319
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/Double;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 320
    invoke-interface {v0, v3}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    return-object v0

    .line 325
    :cond_5
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-eqz v1, :cond_6

    const/4 p0, 0x0

    .line 326
    invoke-interface {v0, p0}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    return-object v0

    .line 330
    :cond_6
    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    .line 331
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableArray;->pushDouble(D)V

    return-object v0

    .line 335
    :cond_7
    instance-of v1, p0, Ljava/lang/Float;

    if-eqz v1, :cond_8

    .line 336
    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    .line 337
    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->doubleValue()D

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableArray;->pushDouble(D)V

    return-object v0

    .line 341
    :cond_8
    instance-of v1, p0, Ljava/lang/Long;

    if-eqz v1, :cond_9

    .line 342
    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    .line 343
    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->doubleValue()D

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableArray;->pushDouble(D)V

    return-object v0

    .line 347
    :cond_9
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_b

    const-string v1, ""

    if-ne p0, v1, :cond_a

    const/16 p0, 0x9

    .line 349
    invoke-interface {v0, p0}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    goto :goto_1

    :cond_a
    const/16 v1, 0x8

    .line 351
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    .line 352
    check-cast p0, Ljava/lang/String;

    invoke-interface {v0, p0}, Lcom/facebook/react/bridge/WritableArray;->pushString(Ljava/lang/String;)V

    :goto_1
    return-object v0

    .line 357
    :cond_b
    const-class v1, Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_c

    const/16 v1, 0x10

    .line 358
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    .line 359
    check-cast p0, Ljava/util/Map;

    invoke-static {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->objectMapToWritable(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p0

    invoke-interface {v0, p0}, Lcom/facebook/react/bridge/WritableArray;->pushMap(Lcom/facebook/react/bridge/ReadableMap;)V

    return-object v0

    .line 363
    :cond_c
    const-class v1, Ljava/util/List;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_d

    const/16 v1, 0xa

    .line 364
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    .line 365
    check-cast p0, Ljava/util/List;

    .line 366
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-interface {p0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    .line 367
    invoke-static {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->objectArrayToWritable([Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object p0

    invoke-interface {v0, p0}, Lcom/facebook/react/bridge/WritableArray;->pushArray(Lcom/facebook/react/bridge/ReadableArray;)V

    return-object v0

    .line 371
    :cond_d
    instance-of v1, p0, Lcom/google/firebase/firestore/DocumentReference;

    if-eqz v1, :cond_e

    const/16 v1, 0xb

    .line 372
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    .line 373
    check-cast p0, Lcom/google/firebase/firestore/DocumentReference;

    invoke-virtual {p0}, Lcom/google/firebase/firestore/DocumentReference;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Lcom/facebook/react/bridge/WritableArray;->pushString(Ljava/lang/String;)V

    return-object v0

    .line 377
    :cond_e
    instance-of v1, p0, Lcom/google/firebase/Timestamp;

    if-eqz v1, :cond_f

    const/16 v1, 0xd

    .line 378
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    .line 379
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v1

    .line 380
    check-cast p0, Lcom/google/firebase/Timestamp;

    invoke-virtual {p0}, Lcom/google/firebase/Timestamp;->getSeconds()J

    move-result-wide v2

    long-to-double v2, v2

    invoke-interface {v1, v2, v3}, Lcom/facebook/react/bridge/WritableArray;->pushDouble(D)V

    .line 381
    invoke-virtual {p0}, Lcom/google/firebase/Timestamp;->getNanoseconds()I

    move-result p0

    invoke-interface {v1, p0}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    .line 382
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/WritableArray;->pushArray(Lcom/facebook/react/bridge/ReadableArray;)V

    return-object v0

    .line 386
    :cond_f
    instance-of v1, p0, Lcom/google/firebase/firestore/GeoPoint;

    if-eqz v1, :cond_10

    const/16 v1, 0xc

    .line 387
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    .line 388
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v1

    .line 389
    check-cast p0, Lcom/google/firebase/firestore/GeoPoint;

    invoke-virtual {p0}, Lcom/google/firebase/firestore/GeoPoint;->getLatitude()D

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/facebook/react/bridge/WritableArray;->pushDouble(D)V

    .line 390
    invoke-virtual {p0}, Lcom/google/firebase/firestore/GeoPoint;->getLongitude()D

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/facebook/react/bridge/WritableArray;->pushDouble(D)V

    .line 391
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/WritableArray;->pushArray(Lcom/facebook/react/bridge/ReadableArray;)V

    return-object v0

    .line 395
    :cond_10
    instance-of v1, p0, Lcom/google/firebase/firestore/Blob;

    if-eqz v1, :cond_11

    const/16 v1, 0xe

    .line 396
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    .line 397
    check-cast p0, Lcom/google/firebase/firestore/Blob;

    invoke-virtual {p0}, Lcom/google/firebase/firestore/Blob;->toBytes()[B

    move-result-object p0

    invoke-static {p0, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Lcom/facebook/react/bridge/WritableArray;->pushString(Ljava/lang/String;)V

    return-object v0

    .line 401
    :cond_11
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown object of type "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "FirestoreSerialize"

    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/16 p0, -0x3e7

    .line 403
    invoke-interface {v0, p0}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    return-object v0
.end method

.method private static documentChangeToWritableMap(Ljava/lang/String;Lcom/google/firebase/firestore/DocumentChange;Z)Lcom/facebook/react/bridge/WritableMap;
    .locals 3

    .line 228
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "isMetadataChange"

    .line 229
    invoke-interface {v0, v1, p2}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    .line 231
    sget-object p2, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize$1;->$SwitchMap$com$google$firebase$firestore$DocumentChange$Type:[I

    invoke-virtual {p1}, Lcom/google/firebase/firestore/DocumentChange;->getType()Lcom/google/firebase/firestore/DocumentChange$Type;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/firestore/DocumentChange$Type;->ordinal()I

    move-result v1

    aget p2, p2, v1

    const/4 v1, 0x1

    const-string v2, "type"

    if-eq p2, v1, :cond_2

    const/4 v1, 0x2

    if-eq p2, v1, :cond_1

    const/4 v1, 0x3

    if-eq p2, v1, :cond_0

    goto :goto_0

    :cond_0
    const-string p2, "r"

    .line 239
    invoke-interface {v0, v2, p2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string p2, "m"

    .line 236
    invoke-interface {v0, v2, p2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string p2, "a"

    .line 233
    invoke-interface {v0, v2, p2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    :goto_0
    invoke-virtual {p1}, Lcom/google/firebase/firestore/DocumentChange;->getDocument()Lcom/google/firebase/firestore/QueryDocumentSnapshot;

    move-result-object p2

    invoke-static {p0, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->snapshotToWritableMap(Ljava/lang/String;Lcom/google/firebase/firestore/DocumentSnapshot;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p0

    const-string p2, "doc"

    .line 243
    invoke-interface {v0, p2, p0}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    const-string p0, "ni"

    .line 246
    invoke-virtual {p1}, Lcom/google/firebase/firestore/DocumentChange;->getNewIndex()I

    move-result p2

    invoke-interface {v0, p0, p2}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    const-string p0, "oi"

    .line 247
    invoke-virtual {p1}, Lcom/google/firebase/firestore/DocumentChange;->getOldIndex()I

    move-result p1

    invoke-interface {v0, p0, p1}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    return-object v0
.end method

.method private static documentChangesToWritableArray(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)Lcom/facebook/react/bridge/WritableArray;
    .locals 7
    .param p2    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/DocumentChange;",
            ">;",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/DocumentChange;",
            ">;)",
            "Lcom/facebook/react/bridge/WritableArray;"
        }
    .end annotation

    .line 194
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p2, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    .line 198
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/firebase/firestore/DocumentChange;

    if-eqz v3, :cond_1

    .line 201
    invoke-virtual {v4}, Lcom/google/firebase/firestore/DocumentChange;->hashCode()I

    move-result v5

    .line 202
    new-instance v6, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize$$ExternalSyntheticLambda0;

    invoke-direct {v6, v5}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize$$ExternalSyntheticLambda0;-><init>(I)V

    .line 203
    invoke-static {p2, v6}, Lcom/google/common/collect/Iterables;->tryFind(Ljava/lang/Iterable;Lcom/google/common/base/Predicate;)Lcom/google/common/base/Optional;

    move-result-object v5

    .line 205
    invoke-virtual {v5}, Lcom/google/common/base/Optional;->orNull()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/firebase/firestore/DocumentChange;

    if-nez v5, :cond_1

    move v5, v1

    goto :goto_2

    :cond_1
    move v5, v2

    .line 214
    :goto_2
    invoke-static {p0, v4, v5}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->documentChangeToWritableMap(Ljava/lang/String;Lcom/google/firebase/firestore/DocumentChange;Z)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v4

    .line 213
    invoke-interface {v0, v4}, Lcom/facebook/react/bridge/WritableArray;->pushMap(Lcom/facebook/react/bridge/ReadableMap;)V

    goto :goto_1

    :cond_2
    return-object v0
.end method

.method static synthetic lambda$documentChangesToWritableArray$0(ILcom/google/firebase/firestore/DocumentChange;)Z
    .locals 0

    .line 204
    invoke-virtual {p1}, Lcom/google/firebase/firestore/DocumentChange;->hashCode()I

    move-result p1

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static objectArrayToWritable([Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableArray;
    .locals 4

    .line 276
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v0

    .line 278
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p0, v2

    .line 279
    invoke-static {v3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->buildTypeMap(Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object v3

    .line 280
    invoke-interface {v0, v3}, Lcom/facebook/react/bridge/WritableArray;->pushArray(Lcom/facebook/react/bridge/ReadableArray;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private static objectMapToWritable(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/facebook/react/bridge/WritableMap;"
        }
    .end annotation

    .line 259
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 261
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 262
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->buildTypeMap(Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object v2

    .line 263
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method static parseDocumentBatches(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableArray;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/FirebaseFirestore;",
            "Lcom/facebook/react/bridge/ReadableArray;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 532
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    .line 534
    :goto_0
    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 535
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 536
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableArray;->getMap(I)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v3

    const-string v4, "type"

    .line 538
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "path"

    .line 539
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "data"

    .line 541
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 542
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v5

    invoke-static {p0, v5}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->parseReadableMap(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableMap;)Ljava/util/Map;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const-string v4, "options"

    .line 545
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 546
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v3

    invoke-static {v3}, Lio/invertase/firebase/common/RCTConvertFirebase;->toHashMap(Lcom/facebook/react/bridge/ReadableMap;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 549
    :cond_1
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method static parseReadableArray(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableArray;)Ljava/util/List;
    .locals 3
    .param p1    # Lcom/facebook/react/bridge/ReadableArray;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/FirebaseFirestore;",
            "Lcom/facebook/react/bridge/ReadableArray;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 438
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    const/4 v1, 0x0

    .line 441
    :goto_0
    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 442
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableArray;->getArray(I)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v2

    invoke-static {p0, v2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->parseTypeMap(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableArray;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static parseReadableMap(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableMap;)Ljava/util/Map;
    .locals 4
    .param p1    # Lcom/facebook/react/bridge/ReadableMap;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/FirebaseFirestore;",
            "Lcom/facebook/react/bridge/ReadableMap;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 417
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    if-nez p1, :cond_0

    return-object v0

    .line 420
    :cond_0
    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableMap;->keySetIterator()Lcom/facebook/react/bridge/ReadableMapKeySetIterator;

    move-result-object v1

    .line 421
    :goto_0
    invoke-interface {v1}, Lcom/facebook/react/bridge/ReadableMapKeySetIterator;->hasNextKey()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 422
    invoke-interface {v1}, Lcom/facebook/react/bridge/ReadableMapKeySetIterator;->nextKey()Ljava/lang/String;

    move-result-object v2

    .line 423
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v3

    invoke-static {p0, v3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->parseTypeMap(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableArray;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method static parseTypeMap(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableArray;)Ljava/lang/Object;
    .locals 5

    const/4 v0, 0x0

    .line 449
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableArray;->getInt(I)I

    move-result v1

    const/4 v2, 0x1

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    const/4 p0, 0x0

    return-object p0

    :pswitch_1
    const-wide/high16 p0, -0x8000000000000000L

    .line 467
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    return-object p0

    .line 469
    :pswitch_2
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getDouble(I)D

    move-result-wide p0

    double-to-long p0, p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    .line 491
    :pswitch_3
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getArray(I)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v1

    .line 492
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/react/bridge/ReadableArray;

    invoke-interface {v3, v0}, Lcom/facebook/react/bridge/ReadableArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 494
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "timestamp"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 495
    invoke-static {}, Lcom/google/firebase/firestore/FieldValue;->serverTimestamp()Lcom/google/firebase/firestore/FieldValue;

    move-result-object p0

    return-object p0

    .line 498
    :cond_0
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "increment"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 499
    invoke-interface {v1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getDouble(I)D

    move-result-wide p0

    invoke-static {p0, p1}, Lcom/google/firebase/firestore/FieldValue;->increment(D)Lcom/google/firebase/firestore/FieldValue;

    move-result-object p0

    return-object p0

    .line 502
    :cond_1
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "delete"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 503
    invoke-static {}, Lcom/google/firebase/firestore/FieldValue;->delete()Lcom/google/firebase/firestore/FieldValue;

    move-result-object p0

    return-object p0

    .line 506
    :cond_2
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "array_union"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 507
    invoke-interface {v1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getArray(I)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object p1

    .line 508
    invoke-static {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->parseReadableArray(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableArray;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/firebase/firestore/FieldValue;->arrayUnion([Ljava/lang/Object;)Lcom/google/firebase/firestore/FieldValue;

    move-result-object p0

    return-object p0

    .line 511
    :cond_3
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v3, "array_remove"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 512
    invoke-interface {v1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getArray(I)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object p1

    .line 513
    invoke-static {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->parseReadableArray(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableArray;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/firebase/firestore/FieldValue;->arrayRemove([Ljava/lang/Object;)Lcom/google/firebase/firestore/FieldValue;

    move-result-object p0

    return-object p0

    .line 516
    :cond_4
    :pswitch_4
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getMap(I)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object p1

    invoke-static {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->parseReadableMap(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableMap;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    .line 489
    :pswitch_5
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getString(I)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x2

    invoke-static {p0, p1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    invoke-static {p0}, Lcom/google/firebase/firestore/Blob;->fromBytes([B)Lcom/google/firebase/firestore/Blob;

    move-result-object p0

    return-object p0

    .line 485
    :pswitch_6
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getArray(I)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object p0

    .line 486
    new-instance p1, Lcom/google/firebase/Timestamp;

    .line 487
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/bridge/ReadableArray;

    invoke-interface {v1, v0}, Lcom/facebook/react/bridge/ReadableArray;->getDouble(I)D

    move-result-wide v0

    double-to-long v0, v0

    invoke-interface {p0, v2}, Lcom/facebook/react/bridge/ReadableArray;->getInt(I)I

    move-result p0

    invoke-direct {p1, v0, v1, p0}, Lcom/google/firebase/Timestamp;-><init>(JI)V

    return-object p1

    .line 481
    :pswitch_7
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getArray(I)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object p0

    .line 482
    new-instance p1, Lcom/google/firebase/firestore/GeoPoint;

    .line 483
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/bridge/ReadableArray;

    invoke-interface {v1, v0}, Lcom/facebook/react/bridge/ReadableArray;->getDouble(I)D

    move-result-wide v0

    invoke-interface {p0, v2}, Lcom/facebook/react/bridge/ReadableArray;->getDouble(I)D

    move-result-wide v2

    invoke-direct {p1, v0, v1, v2, v3}, Lcom/google/firebase/firestore/GeoPoint;-><init>(DD)V

    return-object p1

    .line 479
    :pswitch_8
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/FirebaseFirestore;->document(Ljava/lang/String;)Lcom/google/firebase/firestore/DocumentReference;

    move-result-object p0

    return-object p0

    .line 477
    :pswitch_9
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getArray(I)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object p1

    invoke-static {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->parseReadableArray(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableArray;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_a
    const-string p0, ""

    return-object p0

    .line 473
    :pswitch_b
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 471
    :pswitch_c
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getDouble(I)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    return-object p0

    .line 465
    :pswitch_d
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    .line 463
    :pswitch_e
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    .line 461
    :pswitch_f
    invoke-static {}, Lcom/google/firebase/firestore/FieldPath;->documentId()Lcom/google/firebase/firestore/FieldPath;

    move-result-object p0

    return-object p0

    :pswitch_10
    const-wide/high16 p0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 457
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    return-object p0

    :pswitch_11
    const-wide/high16 p0, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    .line 455
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    return-object p0

    :pswitch_12
    const-wide/high16 p0, 0x7ff8000000000000L    # Double.NaN

    .line 453
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_3
        :pswitch_4
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method static snapshotToWritableMap(Ljava/lang/String;Lcom/google/firebase/firestore/DocumentSnapshot;)Lcom/facebook/react/bridge/WritableMap;
    .locals 4

    .line 103
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v0

    .line 104
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    .line 105
    invoke-virtual {p1}, Lcom/google/firebase/firestore/DocumentSnapshot;->getMetadata()Lcom/google/firebase/firestore/SnapshotMetadata;

    move-result-object v2

    .line 108
    invoke-virtual {v2}, Lcom/google/firebase/firestore/SnapshotMetadata;->isFromCache()Z

    move-result v3

    invoke-interface {v0, v3}, Lcom/facebook/react/bridge/WritableArray;->pushBoolean(Z)V

    .line 109
    invoke-virtual {v2}, Lcom/google/firebase/firestore/SnapshotMetadata;->hasPendingWrites()Z

    move-result v2

    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/WritableArray;->pushBoolean(Z)V

    const-string v2, "metadata"

    .line 111
    invoke-interface {v1, v2, v0}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    .line 112
    invoke-virtual {p1}, Lcom/google/firebase/firestore/DocumentSnapshot;->getReference()Lcom/google/firebase/firestore/DocumentReference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/DocumentReference;->getPath()Ljava/lang/String;

    move-result-object v0

    const-string v2, "path"

    invoke-interface {v1, v2, v0}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "exists"

    .line 113
    invoke-virtual {p1}, Lcom/google/firebase/firestore/DocumentSnapshot;->exists()Z

    move-result v2

    invoke-interface {v1, v0, v2}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    .line 116
    invoke-static {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCommon;->getServerTimestampBehavior(Ljava/lang/String;)Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    move-result-object p0

    .line 118
    invoke-virtual {p1}, Lcom/google/firebase/firestore/DocumentSnapshot;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 119
    invoke-virtual {p1, p0}, Lcom/google/firebase/firestore/DocumentSnapshot;->getData(Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 121
    invoke-virtual {p1, p0}, Lcom/google/firebase/firestore/DocumentSnapshot;->getData(Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Ljava/util/Map;

    move-result-object p0

    invoke-static {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->objectMapToWritable(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p0

    const-string p1, "data"

    .line 120
    invoke-interface {v1, p1, p0}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    :cond_0
    return-object v1
.end method

.method static snapshotToWritableMap(Ljava/lang/String;Ljava/lang/String;Lcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/MetadataChanges;)Lcom/facebook/react/bridge/WritableMap;
    .locals 6
    .param p3    # Lcom/google/firebase/firestore/MetadataChanges;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 139
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "source"

    .line 140
    invoke-interface {v0, v1, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object p1

    .line 143
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v1

    .line 145
    invoke-virtual {p2}, Lcom/google/firebase/firestore/QuerySnapshot;->getDocumentChanges()Ljava/util/List;

    move-result-object v2

    const-string v3, "changes"

    const-string v4, "excludesMetadataChanges"

    if-eqz p3, :cond_1

    .line 147
    sget-object v5, Lcom/google/firebase/firestore/MetadataChanges;->EXCLUDE:Lcom/google/firebase/firestore/MetadataChanges;

    if-ne p3, v5, :cond_0

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    .line 157
    invoke-interface {v0, v4, p3}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    .line 158
    sget-object p3, Lcom/google/firebase/firestore/MetadataChanges;->INCLUDE:Lcom/google/firebase/firestore/MetadataChanges;

    .line 159
    invoke-virtual {p2, p3}, Lcom/google/firebase/firestore/QuerySnapshot;->getDocumentChanges(Lcom/google/firebase/firestore/MetadataChanges;)Ljava/util/List;

    move-result-object p3

    .line 162
    invoke-static {p0, p3, v2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->documentChangesToWritableArray(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object p3

    .line 160
    invoke-interface {v0, v3, p3}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p3, 0x1

    .line 150
    invoke-interface {v0, v4, p3}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    const/4 p3, 0x0

    .line 152
    invoke-static {p0, v2, p3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->documentChangesToWritableArray(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object p3

    .line 151
    invoke-interface {v0, v3, p3}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    .line 166
    :goto_1
    invoke-virtual {p2}, Lcom/google/firebase/firestore/QuerySnapshot;->getMetadata()Lcom/google/firebase/firestore/SnapshotMetadata;

    move-result-object p3

    .line 167
    invoke-virtual {p2}, Lcom/google/firebase/firestore/QuerySnapshot;->getDocuments()Ljava/util/List;

    move-result-object p2

    .line 170
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/DocumentSnapshot;

    .line 171
    invoke-static {p0, v2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->snapshotToWritableMap(Ljava/lang/String;Lcom/google/firebase/firestore/DocumentSnapshot;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/facebook/react/bridge/WritableArray;->pushMap(Lcom/facebook/react/bridge/ReadableMap;)V

    goto :goto_2

    :cond_2
    const-string p0, "documents"

    .line 173
    invoke-interface {v0, p0, v1}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    .line 177
    invoke-virtual {p3}, Lcom/google/firebase/firestore/SnapshotMetadata;->isFromCache()Z

    move-result p0

    invoke-interface {p1, p0}, Lcom/facebook/react/bridge/WritableArray;->pushBoolean(Z)V

    .line 178
    invoke-virtual {p3}, Lcom/google/firebase/firestore/SnapshotMetadata;->hasPendingWrites()Z

    move-result p0

    invoke-interface {p1, p0}, Lcom/facebook/react/bridge/WritableArray;->pushBoolean(Z)V

    const-string p0, "metadata"

    .line 179
    invoke-interface {v0, p0, p1}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    return-object v0
.end method
