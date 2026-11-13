.class public Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;
.super Ljava/lang/Object;
.source "FirestoreIndexValueWriter.java"


# static fields
.field public static final DOCUMENT_NAME_OFFSET:I = 0x5

.field public static final INDEX_TYPE_ARRAY:I = 0x32

.field public static final INDEX_TYPE_BLOB:I = 0x1e

.field public static final INDEX_TYPE_BOOLEAN:I = 0xa

.field public static final INDEX_TYPE_GEOPOINT:I = 0x2d

.field public static final INDEX_TYPE_MAP:I = 0x37

.field public static final INDEX_TYPE_NAN:I = 0xd

.field public static final INDEX_TYPE_NULL:I = 0x5

.field public static final INDEX_TYPE_NUMBER:I = 0xf

.field public static final INDEX_TYPE_REFERENCE:I = 0x25

.field public static final INDEX_TYPE_REFERENCE_SEGMENT:I = 0x3c

.field public static final INDEX_TYPE_STRING:I = 0x19

.field public static final INDEX_TYPE_TIMESTAMP:I = 0x14

.field public static final INSTANCE:Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;

.field public static final NOT_TRUNCATED:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 51
    new-instance v0, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;

    invoke-direct {v0}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;-><init>()V

    sput-object v0, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->INSTANCE:Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private writeIndexArray(Lcom/google/firestore/v1/ArrayValue;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V
    .locals 1

    const/16 v0, 0x32

    .line 152
    invoke-direct {p0, p2, v0}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeValueTypeLabel(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;I)V

    .line 153
    invoke-virtual {p1}, Lcom/google/firestore/v1/ArrayValue;->getValuesList()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/Value;

    .line 154
    invoke-direct {p0, v0, p2}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeIndexValueAux(Lcom/google/firestore/v1/Value;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private writeIndexEntityRef(Ljava/lang/String;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V
    .locals 4

    const/16 v0, 0x25

    .line 159
    invoke-direct {p0, p2, v0}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeValueTypeLabel(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;I)V

    .line 161
    invoke-static {p1}, Lcom/google/firebase/firestore/model/ResourcePath;->fromString(Ljava/lang/String;)Lcom/google/firebase/firestore/model/ResourcePath;

    move-result-object p1

    .line 162
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/ResourcePath;->length()I

    move-result v0

    const/4 v1, 0x5

    :goto_0
    if-ge v1, v0, :cond_0

    .line 164
    invoke-virtual {p1, v1}, Lcom/google/firebase/firestore/model/ResourcePath;->getSegment(I)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3c

    .line 165
    invoke-direct {p0, p2, v3}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeValueTypeLabel(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;I)V

    .line 166
    invoke-direct {p0, v2, p2}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeUnlabeledIndexString(Ljava/lang/String;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private writeIndexMap(Lcom/google/firestore/v1/MapValue;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V
    .locals 2

    const/16 v0, 0x37

    .line 142
    invoke-direct {p0, p2, v0}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeValueTypeLabel(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;I)V

    .line 143
    invoke-virtual {p1}, Lcom/google/firestore/v1/MapValue;->getFieldsMap()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 144
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 145
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/Value;

    .line 146
    invoke-direct {p0, v1, p2}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeIndexString(Ljava/lang/String;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    .line 147
    invoke-direct {p0, v0, p2}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeIndexValueAux(Lcom/google/firestore/v1/Value;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private writeIndexString(Ljava/lang/String;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V
    .locals 1

    const/16 v0, 0x19

    .line 132
    invoke-direct {p0, p2, v0}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeValueTypeLabel(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;I)V

    .line 133
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeUnlabeledIndexString(Ljava/lang/String;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    return-void
.end method

.method private writeIndexValueAux(Lcom/google/firestore/v1/Value;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V
    .locals 4

    .line 63
    sget-object v0, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter$1;->$SwitchMap$com$google$firestore$v1$Value$ValueTypeCase:[I

    invoke-virtual {p1}, Lcom/google/firestore/v1/Value;->getValueTypeCase()Lcom/google/firestore/v1/Value$ValueTypeCase;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firestore/v1/Value$ValueTypeCase;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/16 v1, 0xf

    packed-switch v0, :pswitch_data_0

    .line 126
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "unknown index value type "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    invoke-virtual {p1}, Lcom/google/firestore/v1/Value;->getValueTypeCase()Lcom/google/firestore/v1/Value$ValueTypeCase;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 122
    :pswitch_0
    invoke-virtual {p1}, Lcom/google/firestore/v1/Value;->getArrayValue()Lcom/google/firestore/v1/ArrayValue;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeIndexArray(Lcom/google/firestore/v1/ArrayValue;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    .line 123
    invoke-direct {p0, p2}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeTruncationMarker(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    goto/16 :goto_1

    .line 114
    :pswitch_1
    invoke-static {p1}, Lcom/google/firebase/firestore/model/Values;->isMaxValue(Lcom/google/firestore/v1/Value;)Z

    move-result v0

    if-eqz v0, :cond_0

    const p1, 0x7fffffff

    .line 115
    invoke-direct {p0, p2, p1}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeValueTypeLabel(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;I)V

    goto/16 :goto_1

    .line 118
    :cond_0
    invoke-virtual {p1}, Lcom/google/firestore/v1/Value;->getMapValue()Lcom/google/firestore/v1/MapValue;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeIndexMap(Lcom/google/firestore/v1/MapValue;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    .line 119
    invoke-direct {p0, p2}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeTruncationMarker(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    goto/16 :goto_1

    .line 108
    :pswitch_2
    invoke-virtual {p1}, Lcom/google/firestore/v1/Value;->getGeoPointValue()Lcom/google/type/LatLng;

    move-result-object p1

    const/16 v0, 0x2d

    .line 109
    invoke-direct {p0, p2, v0}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeValueTypeLabel(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;I)V

    .line 110
    invoke-virtual {p1}, Lcom/google/type/LatLng;->getLatitude()D

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;->writeDouble(D)V

    .line 111
    invoke-virtual {p1}, Lcom/google/type/LatLng;->getLongitude()D

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;->writeDouble(D)V

    goto/16 :goto_1

    .line 105
    :pswitch_3
    invoke-virtual {p1}, Lcom/google/firestore/v1/Value;->getReferenceValue()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeIndexEntityRef(Ljava/lang/String;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    goto/16 :goto_1

    :pswitch_4
    const/16 v0, 0x1e

    .line 100
    invoke-direct {p0, p2, v0}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeValueTypeLabel(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;I)V

    .line 101
    invoke-virtual {p1}, Lcom/google/firestore/v1/Value;->getBytesValue()Lcom/google/protobuf/ByteString;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;->writeBytes(Lcom/google/protobuf/ByteString;)V

    .line 102
    invoke-direct {p0, p2}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeTruncationMarker(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    goto/16 :goto_1

    .line 96
    :pswitch_5
    invoke-virtual {p1}, Lcom/google/firestore/v1/Value;->getStringValue()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeIndexString(Ljava/lang/String;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    .line 97
    invoke-direct {p0, p2}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeTruncationMarker(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    goto :goto_1

    .line 90
    :pswitch_6
    invoke-virtual {p1}, Lcom/google/firestore/v1/Value;->getTimestampValue()Lcom/google/protobuf/Timestamp;

    move-result-object p1

    const/16 v0, 0x14

    .line 91
    invoke-direct {p0, p2, v0}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeValueTypeLabel(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;I)V

    .line 92
    invoke-virtual {p1}, Lcom/google/protobuf/Timestamp;->getSeconds()J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;->writeLong(J)V

    .line 93
    invoke-virtual {p1}, Lcom/google/protobuf/Timestamp;->getNanos()I

    move-result p1

    int-to-long v0, p1

    invoke-virtual {p2, v0, v1}, Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;->writeLong(J)V

    goto :goto_1

    .line 85
    :pswitch_7
    invoke-direct {p0, p2, v1}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeValueTypeLabel(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;I)V

    .line 87
    invoke-virtual {p1}, Lcom/google/firestore/v1/Value;->getIntegerValue()J

    move-result-wide v0

    long-to-double v0, v0

    invoke-virtual {p2, v0, v1}, Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;->writeDouble(D)V

    goto :goto_1

    .line 72
    :pswitch_8
    invoke-virtual {p1}, Lcom/google/firestore/v1/Value;->getDoubleValue()D

    move-result-wide v2

    .line 73
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 p1, 0xd

    .line 74
    invoke-direct {p0, p2, p1}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeValueTypeLabel(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;I)V

    goto :goto_1

    .line 77
    :cond_1
    invoke-direct {p0, p2, v1}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeValueTypeLabel(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;I)V

    const-wide/high16 v0, -0x8000000000000000L

    cmpl-double p1, v2, v0

    if-nez p1, :cond_2

    const-wide/16 v0, 0x0

    .line 79
    invoke-virtual {p2, v0, v1}, Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;->writeDouble(D)V

    goto :goto_1

    .line 81
    :cond_2
    invoke-virtual {p2, v2, v3}, Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;->writeDouble(D)V

    goto :goto_1

    :pswitch_9
    const/16 v0, 0xa

    .line 68
    invoke-direct {p0, p2, v0}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeValueTypeLabel(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;I)V

    .line 69
    invoke-virtual {p1}, Lcom/google/firestore/v1/Value;->getBooleanValue()Z

    move-result p1

    if-eqz p1, :cond_3

    const-wide/16 v0, 0x1

    goto :goto_0

    :cond_3
    const-wide/16 v0, 0x0

    :goto_0
    invoke-virtual {p2, v0, v1}, Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;->writeLong(J)V

    goto :goto_1

    :pswitch_a
    const/4 p1, 0x5

    .line 65
    invoke-direct {p0, p2, p1}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeValueTypeLabel(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;I)V

    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
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

.method private writeTruncationMarker(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V
    .locals 2

    const-wide/16 v0, 0x2

    .line 177
    invoke-virtual {p1, v0, v1}, Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;->writeLong(J)V

    return-void
.end method

.method private writeUnlabeledIndexString(Ljava/lang/String;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V
    .locals 0

    .line 138
    invoke-virtual {p2, p1}, Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;->writeString(Ljava/lang/String;)V

    return-void
.end method

.method private writeValueTypeLabel(Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;I)V
    .locals 2

    int-to-long v0, p2

    .line 171
    invoke-virtual {p1, v0, v1}, Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;->writeLong(J)V

    return-void
.end method


# virtual methods
.method public writeIndexValue(Lcom/google/firestore/v1/Value;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V
    .locals 0

    .line 57
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/index/FirestoreIndexValueWriter;->writeIndexValueAux(Lcom/google/firestore/v1/Value;Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;)V

    .line 59
    invoke-virtual {p2}, Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;->writeInfinity()V

    return-void
.end method
