.class public Lcom/google/firebase/firestore/core/UserData$ParseContext;
.super Ljava/lang/Object;
.source "UserData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/core/UserData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ParseContext"
.end annotation


# static fields
.field private static final RESERVED_FIELD_DESIGNATOR:Ljava/lang/String; = "__"


# instance fields
.field private final accumulator:Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;

.field private final arrayElement:Z

.field private final path:Lcom/google/firebase/firestore/model/FieldPath;


# direct methods
.method private constructor <init>(Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;Lcom/google/firebase/firestore/model/FieldPath;Z)V
    .locals 0

    .line 220
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->accumulator:Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;

    iput-object p2, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->path:Lcom/google/firebase/firestore/model/FieldPath;

    iput-boolean p3, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->arrayElement:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;Lcom/google/firebase/firestore/model/FieldPath;ZLcom/google/firebase/firestore/core/UserData$1;)V
    .locals 0

    .line 196
    invoke-direct {p0, p1, p2, p3}, Lcom/google/firebase/firestore/core/UserData$ParseContext;-><init>(Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;Lcom/google/firebase/firestore/model/FieldPath;Z)V

    return-void
.end method

.method private validatePath()V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->path:Lcom/google/firebase/firestore/model/FieldPath;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->path:Lcom/google/firebase/firestore/model/FieldPath;

    .line 304
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/FieldPath;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->path:Lcom/google/firebase/firestore/model/FieldPath;

    .line 305
    invoke-virtual {v1, v0}, Lcom/google/firebase/firestore/model/FieldPath;->getSegment(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/firebase/firestore/core/UserData$ParseContext;->validatePathSegment(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private validatePathSegment(Ljava/lang/String;)V
    .locals 2

    .line 312
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 316
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/UserData$ParseContext;->isWrite()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "__"

    .line 317
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 318
    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const-string p1, "Document fields cannot begin and end with \"__\""

    .line 319
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/core/UserData$ParseContext;->createError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p1

    throw p1

    :cond_1
    :goto_0
    return-void

    :cond_2
    const-string p1, "Document fields must not be empty"

    .line 313
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/core/UserData$ParseContext;->createError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p1

    throw p1
.end method


# virtual methods
.method public addToFieldMask(Lcom/google/firebase/firestore/model/FieldPath;)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->accumulator:Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;

    .line 282
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->addToFieldMask(Lcom/google/firebase/firestore/model/FieldPath;)V

    return-void
.end method

.method public addToFieldTransforms(Lcom/google/firebase/firestore/model/FieldPath;Lcom/google/firebase/firestore/model/mutation/TransformOperation;)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->accumulator:Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;

    .line 287
    invoke-virtual {v0, p1, p2}, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->addToFieldTransforms(Lcom/google/firebase/firestore/model/FieldPath;Lcom/google/firebase/firestore/model/mutation/TransformOperation;)V

    return-void
.end method

.method public childContext(I)Lcom/google/firebase/firestore/core/UserData$ParseContext;
    .locals 3

    .line 277
    new-instance p1, Lcom/google/firebase/firestore/core/UserData$ParseContext;

    iget-object v0, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->accumulator:Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p1, v0, v1, v2}, Lcom/google/firebase/firestore/core/UserData$ParseContext;-><init>(Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;Lcom/google/firebase/firestore/model/FieldPath;Z)V

    return-object p1
.end method

.method public childContext(Lcom/google/firebase/firestore/model/FieldPath;)Lcom/google/firebase/firestore/core/UserData$ParseContext;
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->path:Lcom/google/firebase/firestore/model/FieldPath;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 268
    :cond_0
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/model/FieldPath;->append(Lcom/google/firebase/firestore/model/BasePath;)Lcom/google/firebase/firestore/model/BasePath;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/model/FieldPath;

    .line 269
    :goto_0
    new-instance v0, Lcom/google/firebase/firestore/core/UserData$ParseContext;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->accumulator:Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, v2}, Lcom/google/firebase/firestore/core/UserData$ParseContext;-><init>(Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;Lcom/google/firebase/firestore/model/FieldPath;Z)V

    .line 270
    invoke-direct {v0}, Lcom/google/firebase/firestore/core/UserData$ParseContext;->validatePath()V

    return-object v0
.end method

.method public childContext(Ljava/lang/String;)Lcom/google/firebase/firestore/core/UserData$ParseContext;
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->path:Lcom/google/firebase/firestore/model/FieldPath;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 261
    :cond_0
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/model/FieldPath;->append(Ljava/lang/String;)Lcom/google/firebase/firestore/model/BasePath;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/model/FieldPath;

    .line 262
    :goto_0
    new-instance v1, Lcom/google/firebase/firestore/core/UserData$ParseContext;

    iget-object v2, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->accumulator:Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v0, v3}, Lcom/google/firebase/firestore/core/UserData$ParseContext;-><init>(Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;Lcom/google/firebase/firestore/model/FieldPath;Z)V

    .line 263
    invoke-direct {v1, p1}, Lcom/google/firebase/firestore/core/UserData$ParseContext;->validatePathSegment(Ljava/lang/String;)V

    return-object v1
.end method

.method public createError(Ljava/lang/String;)Ljava/lang/RuntimeException;
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->path:Lcom/google/firebase/firestore/model/FieldPath;

    if-eqz v0, :cond_1

    .line 293
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldPath;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 295
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, " (found in field "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->path:Lcom/google/firebase/firestore/model/FieldPath;

    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/FieldPath;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_1
    :goto_0
    const-string v0, ""

    .line 296
    :goto_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid data. "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    return-object v1
.end method

.method public getDataSource()Lcom/google/firebase/firestore/core/UserData$Source;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->accumulator:Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;

    .line 236
    invoke-static {v0}, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->access$100(Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;)Lcom/google/firebase/firestore/core/UserData$Source;

    move-result-object v0

    return-object v0
.end method

.method public getPath()Lcom/google/firebase/firestore/model/FieldPath;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->path:Lcom/google/firebase/firestore/model/FieldPath;

    return-object v0
.end method

.method public isArrayElement()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->arrayElement:Z

    return v0
.end method

.method public isWrite()Z
    .locals 4

    .line 246
    sget-object v0, Lcom/google/firebase/firestore/core/UserData$1;->$SwitchMap$com$google$firebase$firestore$core$UserData$Source:[I

    iget-object v1, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->accumulator:Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;

    invoke-static {v1}, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->access$100(Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;)Lcom/google/firebase/firestore/core/UserData$Source;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/firestore/core/UserData$Source;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v2, 0x2

    if-eq v0, v2, :cond_2

    const/4 v2, 0x3

    if-eq v0, v2, :cond_2

    const/4 v2, 0x4

    const/4 v3, 0x0

    if-eq v0, v2, :cond_1

    const/4 v2, 0x5

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    new-array v0, v1, [Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/UserData$ParseContext;->accumulator:Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;

    .line 256
    invoke-static {v1}, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->access$100(Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;)Lcom/google/firebase/firestore/core/UserData$Source;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/firestore/core/UserData$Source;->name()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    const-string v1, "Unexpected case for UserDataSource: %s"

    .line 255
    invoke-static {v1, v0}, Lcom/google/firebase/firestore/util/Assert;->fail(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/AssertionError;

    move-result-object v0

    throw v0

    :cond_1
    :goto_0
    return v3

    :cond_2
    return v1
.end method
