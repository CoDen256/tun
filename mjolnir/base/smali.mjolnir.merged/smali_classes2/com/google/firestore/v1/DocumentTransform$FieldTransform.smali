.class public final Lcom/google/firestore/v1/DocumentTransform$FieldTransform;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "DocumentTransform.java"

# interfaces
.implements Lcom/google/firestore/v1/DocumentTransform$FieldTransformOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/DocumentTransform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FieldTransform"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/DocumentTransform$FieldTransform$Builder;,
        Lcom/google/firestore/v1/DocumentTransform$FieldTransform$TransformTypeCase;,
        Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/DocumentTransform$FieldTransform;",
        "Lcom/google/firestore/v1/DocumentTransform$FieldTransform$Builder;",
        ">;",
        "Lcom/google/firestore/v1/DocumentTransform$FieldTransformOrBuilder;"
    }
.end annotation


# static fields
.field public static final APPEND_MISSING_ELEMENTS_FIELD_NUMBER:I = 0x6

.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

.field public static final FIELD_PATH_FIELD_NUMBER:I = 0x1

.field public static final INCREMENT_FIELD_NUMBER:I = 0x3

.field public static final MAXIMUM_FIELD_NUMBER:I = 0x4

.field public static final MINIMUM_FIELD_NUMBER:I = 0x5

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/DocumentTransform$FieldTransform;",
            ">;"
        }
    .end annotation
.end field

.field public static final REMOVE_ALL_FROM_ARRAY_FIELD_NUMBER:I = 0x7

.field public static final SET_TO_SERVER_VALUE_FIELD_NUMBER:I = 0x2


# instance fields
.field private fieldPath_:Ljava/lang/String;

.field private transformTypeCase_:I

.field private transformType_:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 2112
    new-instance v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    invoke-direct {v0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    const-class v1, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 2116
    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 273
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const-string v0, ""

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->fieldPath_:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firestore/v1/DocumentTransform$FieldTransform;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;)V
    .locals 0

    .line 268
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->clearTransformType()V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;)V
    .locals 0

    .line 268
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->clearIncrement()V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;Lcom/google/firestore/v1/Value;)V
    .locals 0

    .line 268
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->setMaximum(Lcom/google/firestore/v1/Value;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;Lcom/google/firestore/v1/Value;)V
    .locals 0

    .line 268
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->mergeMaximum(Lcom/google/firestore/v1/Value;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;)V
    .locals 0

    .line 268
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->clearMaximum()V

    return-void
.end method

.method static synthetic access$1400(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;Lcom/google/firestore/v1/Value;)V
    .locals 0

    .line 268
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->setMinimum(Lcom/google/firestore/v1/Value;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;Lcom/google/firestore/v1/Value;)V
    .locals 0

    .line 268
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->mergeMinimum(Lcom/google/firestore/v1/Value;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;)V
    .locals 0

    .line 268
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->clearMinimum()V

    return-void
.end method

.method static synthetic access$1700(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;Lcom/google/firestore/v1/ArrayValue;)V
    .locals 0

    .line 268
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->setAppendMissingElements(Lcom/google/firestore/v1/ArrayValue;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;Lcom/google/firestore/v1/ArrayValue;)V
    .locals 0

    .line 268
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->mergeAppendMissingElements(Lcom/google/firestore/v1/ArrayValue;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;)V
    .locals 0

    .line 268
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->clearAppendMissingElements()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;Ljava/lang/String;)V
    .locals 0

    .line 268
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->setFieldPath(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;Lcom/google/firestore/v1/ArrayValue;)V
    .locals 0

    .line 268
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->setRemoveAllFromArray(Lcom/google/firestore/v1/ArrayValue;)V

    return-void
.end method

.method static synthetic access$2100(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;Lcom/google/firestore/v1/ArrayValue;)V
    .locals 0

    .line 268
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->mergeRemoveAllFromArray(Lcom/google/firestore/v1/ArrayValue;)V

    return-void
.end method

.method static synthetic access$2200(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;)V
    .locals 0

    .line 268
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->clearRemoveAllFromArray()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;)V
    .locals 0

    .line 268
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->clearFieldPath()V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 268
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->setFieldPathBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;I)V
    .locals 0

    .line 268
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->setSetToServerValueValue(I)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;)V
    .locals 0

    .line 268
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->setSetToServerValue(Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;)V
    .locals 0

    .line 268
    invoke-direct {p0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->clearSetToServerValue()V

    return-void
.end method

.method static synthetic access$800(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;Lcom/google/firestore/v1/Value;)V
    .locals 0

    .line 268
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->setIncrement(Lcom/google/firestore/v1/Value;)V

    return-void
.end method

.method static synthetic access$900(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;Lcom/google/firestore/v1/Value;)V
    .locals 0

    .line 268
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->mergeIncrement(Lcom/google/firestore/v1/Value;)V

    return-void
.end method

.method private clearAppendMissingElements()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearFieldPath()V
    .locals 1

    .line 492
    invoke-static {}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->getDefaultInstance()Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->getFieldPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->fieldPath_:Ljava/lang/String;

    return-void
.end method

.method private clearIncrement()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearMaximum()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearMinimum()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearRemoveAllFromArray()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearSetToServerValue()V
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearTransformType()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/DocumentTransform$FieldTransform;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    return-object v0
.end method

.method private mergeAppendMissingElements(Lcom/google/firestore/v1/ArrayValue;)V
    .locals 3

    .line 1024
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 1026
    invoke-static {}, Lcom/google/firestore/v1/ArrayValue;->getDefaultInstance()Lcom/google/firestore/v1/ArrayValue;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 1027
    check-cast v0, Lcom/google/firestore/v1/ArrayValue;

    invoke-static {v0}, Lcom/google/firestore/v1/ArrayValue;->newBuilder(Lcom/google/firestore/v1/ArrayValue;)Lcom/google/firestore/v1/ArrayValue$Builder;

    move-result-object v0

    .line 1028
    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/ArrayValue$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/ArrayValue$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/ArrayValue$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    return-void
.end method

.method private mergeIncrement(Lcom/google/firestore/v1/Value;)V
    .locals 3

    .line 670
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 672
    invoke-static {}, Lcom/google/firestore/v1/Value;->getDefaultInstance()Lcom/google/firestore/v1/Value;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 673
    check-cast v0, Lcom/google/firestore/v1/Value;

    invoke-static {v0}, Lcom/google/firestore/v1/Value;->newBuilder(Lcom/google/firestore/v1/Value;)Lcom/google/firestore/v1/Value$Builder;

    move-result-object v0

    .line 674
    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/Value$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Value$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/Value$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    return-void
.end method

.method private mergeMaximum(Lcom/google/firestore/v1/Value;)V
    .locals 3

    .line 788
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 790
    invoke-static {}, Lcom/google/firestore/v1/Value;->getDefaultInstance()Lcom/google/firestore/v1/Value;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 791
    check-cast v0, Lcom/google/firestore/v1/Value;

    invoke-static {v0}, Lcom/google/firestore/v1/Value;->newBuilder(Lcom/google/firestore/v1/Value;)Lcom/google/firestore/v1/Value$Builder;

    move-result-object v0

    .line 792
    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/Value$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Value$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/Value$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    return-void
.end method

.method private mergeMinimum(Lcom/google/firestore/v1/Value;)V
    .locals 3

    .line 908
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 910
    invoke-static {}, Lcom/google/firestore/v1/Value;->getDefaultInstance()Lcom/google/firestore/v1/Value;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 911
    check-cast v0, Lcom/google/firestore/v1/Value;

    invoke-static {v0}, Lcom/google/firestore/v1/Value;->newBuilder(Lcom/google/firestore/v1/Value;)Lcom/google/firestore/v1/Value$Builder;

    move-result-object v0

    .line 912
    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/Value$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Value$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/Value$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    return-void
.end method

.method private mergeRemoveAllFromArray(Lcom/google/firestore/v1/ArrayValue;)V
    .locals 3

    .line 1131
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 1133
    invoke-static {}, Lcom/google/firestore/v1/ArrayValue;->getDefaultInstance()Lcom/google/firestore/v1/ArrayValue;

    move-result-object v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 1134
    check-cast v0, Lcom/google/firestore/v1/ArrayValue;

    invoke-static {v0}, Lcom/google/firestore/v1/ArrayValue;->newBuilder(Lcom/google/firestore/v1/ArrayValue;)Lcom/google/firestore/v1/ArrayValue$Builder;

    move-result-object v0

    .line 1135
    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/ArrayValue$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/ArrayValue$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/ArrayValue$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    :goto_0
    iput v1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    return-void
.end method

.method public static newBuilder()Lcom/google/firestore/v1/DocumentTransform$FieldTransform$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 1237
    invoke-virtual {v0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/DocumentTransform$FieldTransform;)Lcom/google/firestore/v1/DocumentTransform$FieldTransform$Builder;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 1240
    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/DocumentTransform$FieldTransform;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 1214
    invoke-static {v0, p0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentTransform$FieldTransform;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 1220
    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/DocumentTransform$FieldTransform;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 1178
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentTransform$FieldTransform;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 1185
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/DocumentTransform$FieldTransform;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 1225
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentTransform$FieldTransform;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 1232
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/DocumentTransform$FieldTransform;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 1202
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentTransform$FieldTransform;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 1209
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/DocumentTransform$FieldTransform;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 1165
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentTransform$FieldTransform;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 1172
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/DocumentTransform$FieldTransform;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 1190
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/DocumentTransform$FieldTransform;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 1197
    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/DocumentTransform$FieldTransform;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 2127
    invoke-virtual {v0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setAppendMissingElements(Lcom/google/firestore/v1/ArrayValue;)V
    .locals 0

    .line 1003
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    const/4 p1, 0x6

    iput p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    return-void
.end method

.method private setFieldPath(Ljava/lang/String;)V
    .locals 0

    .line 478
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->fieldPath_:Ljava/lang/String;

    return-void
.end method

.method private setFieldPathBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 505
    invoke-static {p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 506
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->fieldPath_:Ljava/lang/String;

    return-void
.end method

.method private setIncrement(Lcom/google/firestore/v1/Value;)V
    .locals 0

    .line 650
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    const/4 p1, 0x3

    iput p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    return-void
.end method

.method private setMaximum(Lcom/google/firestore/v1/Value;)V
    .locals 0

    .line 766
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    const/4 p1, 0x4

    iput p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    return-void
.end method

.method private setMinimum(Lcom/google/firestore/v1/Value;)V
    .locals 0

    .line 886
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    const/4 p1, 0x5

    iput p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    return-void
.end method

.method private setRemoveAllFromArray(Lcom/google/firestore/v1/ArrayValue;)V
    .locals 0

    .line 1112
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    const/4 p1, 0x7

    iput p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    return-void
.end method

.method private setSetToServerValue(Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;)V
    .locals 0

    .line 575
    invoke-virtual {p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->getNumber()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    const/4 p1, 0x2

    iput p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    return-void
.end method

.method private setSetToServerValueValue(I)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    .line 564
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 2056
    sget-object p2, Lcom/google/firestore/v1/DocumentTransform$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 2105
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 2099
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    const-class p2, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 2086
    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 2089
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->PARSER:Lcom/google/protobuf/Parser;

    .line 2094
    :cond_0
    monitor-exit p2

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_1
    :goto_0
    return-object p1

    :pswitch_3
    sget-object p1, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    return-object p1

    :pswitch_4
    const/16 p1, 0x8

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "transformType_"

    aput-object v0, p1, p3

    const-string p3, "transformTypeCase_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "fieldPath_"

    aput-object p3, p1, p2

    const/4 p2, 0x3

    .line 2064
    const-class p3, Lcom/google/firestore/v1/Value;

    aput-object p3, p1, p2

    const/4 p2, 0x4

    const-class p3, Lcom/google/firestore/v1/Value;

    aput-object p3, p1, p2

    const/4 p2, 0x5

    const-class p3, Lcom/google/firestore/v1/Value;

    aput-object p3, p1, p2

    const/4 p2, 0x6

    const-class p3, Lcom/google/firestore/v1/ArrayValue;

    aput-object p3, p1, p2

    const/4 p2, 0x7

    const-class p3, Lcom/google/firestore/v1/ArrayValue;

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0007\u0001\u0000\u0001\u0007\u0007\u0000\u0000\u0000\u0001\u0208\u0002?\u0000\u0003<\u0000\u0004<\u0000\u0005<\u0000\u0006<\u0000\u0007<\u0000"

    sget-object p3, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    .line 2077
    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 2061
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$Builder;-><init>(Lcom/google/firestore/v1/DocumentTransform$1;)V

    return-object p1

    .line 2058
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;

    invoke-direct {p1}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;-><init>()V

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getAppendMissingElements()Lcom/google/firestore/v1/ArrayValue;
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 982
    check-cast v0, Lcom/google/firestore/v1/ArrayValue;

    return-object v0

    .line 984
    :cond_0
    invoke-static {}, Lcom/google/firestore/v1/ArrayValue;->getDefaultInstance()Lcom/google/firestore/v1/ArrayValue;

    move-result-object v0

    return-object v0
.end method

.method public getFieldPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->fieldPath_:Ljava/lang/String;

    return-object v0
.end method

.method public getFieldPathBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->fieldPath_:Ljava/lang/String;

    .line 465
    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getIncrement()Lcom/google/firestore/v1/Value;
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 630
    check-cast v0, Lcom/google/firestore/v1/Value;

    return-object v0

    .line 632
    :cond_0
    invoke-static {}, Lcom/google/firestore/v1/Value;->getDefaultInstance()Lcom/google/firestore/v1/Value;

    move-result-object v0

    return-object v0
.end method

.method public getMaximum()Lcom/google/firestore/v1/Value;
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 744
    check-cast v0, Lcom/google/firestore/v1/Value;

    return-object v0

    .line 746
    :cond_0
    invoke-static {}, Lcom/google/firestore/v1/Value;->getDefaultInstance()Lcom/google/firestore/v1/Value;

    move-result-object v0

    return-object v0
.end method

.method public getMinimum()Lcom/google/firestore/v1/Value;
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 864
    check-cast v0, Lcom/google/firestore/v1/Value;

    return-object v0

    .line 866
    :cond_0
    invoke-static {}, Lcom/google/firestore/v1/Value;->getDefaultInstance()Lcom/google/firestore/v1/Value;

    move-result-object v0

    return-object v0
.end method

.method public getRemoveAllFromArray()Lcom/google/firestore/v1/ArrayValue;
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 1093
    check-cast v0, Lcom/google/firestore/v1/ArrayValue;

    return-object v0

    .line 1095
    :cond_0
    invoke-static {}, Lcom/google/firestore/v1/ArrayValue;->getDefaultInstance()Lcom/google/firestore/v1/ArrayValue;

    move-result-object v0

    return-object v0
.end method

.method public getSetToServerValue()Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 549
    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->forNumber(I)Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    move-result-object v0

    if-nez v0, :cond_0

    .line 550
    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->UNRECOGNIZED:Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    :cond_0
    return-object v0

    .line 552
    :cond_1
    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->SERVER_VALUE_UNSPECIFIED:Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    return-object v0
.end method

.method public getSetToServerValueValue()I
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformType_:Ljava/lang/Object;

    .line 534
    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getTransformTypeCase()Lcom/google/firestore/v1/DocumentTransform$FieldTransform$TransformTypeCase;
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    .line 429
    invoke-static {v0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$TransformTypeCase;->forNumber(I)Lcom/google/firestore/v1/DocumentTransform$FieldTransform$TransformTypeCase;

    move-result-object v0

    return-object v0
.end method

.method public hasAppendMissingElements()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasIncrement()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasMaximum()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasMinimum()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasRemoveAllFromArray()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasSetToServerValue()Z
    .locals 2

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform;->transformTypeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
