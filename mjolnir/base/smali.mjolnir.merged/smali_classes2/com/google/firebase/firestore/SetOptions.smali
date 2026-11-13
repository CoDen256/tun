.class public final Lcom/google/firebase/firestore/SetOptions;
.super Ljava/lang/Object;
.source "SetOptions.java"


# static fields
.field private static final MERGE_ALL_FIELDS:Lcom/google/firebase/firestore/SetOptions;

.field static final OVERWRITE:Lcom/google/firebase/firestore/SetOptions;


# instance fields
.field private final fieldMask:Lcom/google/firebase/firestore/model/mutation/FieldMask;

.field private final merge:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 36
    new-instance v0, Lcom/google/firebase/firestore/SetOptions;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/firestore/SetOptions;-><init>(ZLcom/google/firebase/firestore/model/mutation/FieldMask;)V

    sput-object v0, Lcom/google/firebase/firestore/SetOptions;->OVERWRITE:Lcom/google/firebase/firestore/SetOptions;

    .line 37
    new-instance v0, Lcom/google/firebase/firestore/SetOptions;

    const/4 v1, 0x1

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/firestore/SetOptions;-><init>(ZLcom/google/firebase/firestore/model/mutation/FieldMask;)V

    sput-object v0, Lcom/google/firebase/firestore/SetOptions;->MERGE_ALL_FIELDS:Lcom/google/firebase/firestore/SetOptions;

    return-void
.end method

.method private constructor <init>(ZLcom/google/firebase/firestore/model/mutation/FieldMask;)V
    .locals 3

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    if-eqz p2, :cond_1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    const-string v2, "Cannot specify a fieldMask for non-merge sets()"

    new-array v0, v0, [Ljava/lang/Object;

    .line 43
    invoke-static {v1, v2, v0}, Lcom/google/firebase/firestore/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    iput-boolean p1, p0, Lcom/google/firebase/firestore/SetOptions;->merge:Z

    iput-object p2, p0, Lcom/google/firebase/firestore/SetOptions;->fieldMask:Lcom/google/firebase/firestore/model/mutation/FieldMask;

    return-void
.end method

.method public static merge()Lcom/google/firebase/firestore/SetOptions;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/SetOptions;->MERGE_ALL_FIELDS:Lcom/google/firebase/firestore/SetOptions;

    return-object v0
.end method

.method public static mergeFieldPaths(Ljava/util/List;)Lcom/google/firebase/firestore/SetOptions;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/FieldPath;",
            ">;)",
            "Lcom/google/firebase/firestore/SetOptions;"
        }
    .end annotation

    .line 124
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 126
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/FieldPath;

    .line 127
    invoke-virtual {v1}, Lcom/google/firebase/firestore/FieldPath;->getInternalPath()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 130
    :cond_0
    new-instance p0, Lcom/google/firebase/firestore/SetOptions;

    const/4 v1, 0x1

    invoke-static {v0}, Lcom/google/firebase/firestore/model/mutation/FieldMask;->fromSet(Ljava/util/Set;)Lcom/google/firebase/firestore/model/mutation/FieldMask;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lcom/google/firebase/firestore/SetOptions;-><init>(ZLcom/google/firebase/firestore/model/mutation/FieldMask;)V

    return-object p0
.end method

.method public static mergeFields(Ljava/util/List;)Lcom/google/firebase/firestore/SetOptions;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/firebase/firestore/SetOptions;"
        }
    .end annotation

    .line 83
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 85
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 86
    invoke-static {v1}, Lcom/google/firebase/firestore/FieldPath;->fromDotSeparatedPath(Ljava/lang/String;)Lcom/google/firebase/firestore/FieldPath;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/firestore/FieldPath;->getInternalPath()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 89
    :cond_0
    new-instance p0, Lcom/google/firebase/firestore/SetOptions;

    const/4 v1, 0x1

    invoke-static {v0}, Lcom/google/firebase/firestore/model/mutation/FieldMask;->fromSet(Ljava/util/Set;)Lcom/google/firebase/firestore/model/mutation/FieldMask;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lcom/google/firebase/firestore/SetOptions;-><init>(ZLcom/google/firebase/firestore/model/mutation/FieldMask;)V

    return-object p0
.end method

.method public static varargs mergeFields([Ljava/lang/String;)Lcom/google/firebase/firestore/SetOptions;
    .locals 4

    .line 104
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 106
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p0, v2

    .line 107
    invoke-static {v3}, Lcom/google/firebase/firestore/FieldPath;->fromDotSeparatedPath(Ljava/lang/String;)Lcom/google/firebase/firestore/FieldPath;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/firebase/firestore/FieldPath;->getInternalPath()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 110
    :cond_0
    new-instance p0, Lcom/google/firebase/firestore/SetOptions;

    invoke-static {v0}, Lcom/google/firebase/firestore/model/mutation/FieldMask;->fromSet(Ljava/util/Set;)Lcom/google/firebase/firestore/model/mutation/FieldMask;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v1, v0}, Lcom/google/firebase/firestore/SetOptions;-><init>(ZLcom/google/firebase/firestore/model/mutation/FieldMask;)V

    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_5

    .line 138
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 142
    :cond_1
    check-cast p1, Lcom/google/firebase/firestore/SetOptions;

    iget-boolean v2, p0, Lcom/google/firebase/firestore/SetOptions;->merge:Z

    .line 144
    iget-boolean v3, p1, Lcom/google/firebase/firestore/SetOptions;->merge:Z

    if-eq v2, v3, :cond_2

    return v1

    :cond_2
    iget-object v2, p0, Lcom/google/firebase/firestore/SetOptions;->fieldMask:Lcom/google/firebase/firestore/model/mutation/FieldMask;

    .line 147
    iget-object p1, p1, Lcom/google/firebase/firestore/SetOptions;->fieldMask:Lcom/google/firebase/firestore/model/mutation/FieldMask;

    if-eqz v2, :cond_3

    invoke-virtual {v2, p1}, Lcom/google/firebase/firestore/model/mutation/FieldMask;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_3
    if-nez p1, :cond_4

    goto :goto_0

    :cond_4
    move v0, v1

    :goto_0
    return v0

    :cond_5
    :goto_1
    return v1
.end method

.method public getFieldMask()Lcom/google/firebase/firestore/model/mutation/FieldMask;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/SetOptions;->fieldMask:Lcom/google/firebase/firestore/model/mutation/FieldMask;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-boolean v0, p0, Lcom/google/firebase/firestore/SetOptions;->merge:Z

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/firebase/firestore/SetOptions;->fieldMask:Lcom/google/firebase/firestore/model/mutation/FieldMask;

    if-eqz v1, :cond_0

    .line 153
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/mutation/FieldMask;->hashCode()I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method isMerge()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/firebase/firestore/SetOptions;->merge:Z

    return v0
.end method
