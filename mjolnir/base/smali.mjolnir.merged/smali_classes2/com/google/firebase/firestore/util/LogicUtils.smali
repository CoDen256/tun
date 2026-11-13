.class public Lcom/google/firebase/firestore/util/LogicUtils;
.super Ljava/lang/Object;
.source "LogicUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static applyAssociation(Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Filter;
    .locals 7

    .line 103
    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->assertFieldFilterOrCompositeFilter(Lcom/google/firebase/firestore/core/Filter;)V

    .line 105
    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->isSingleFieldFilter(Lcom/google/firebase/firestore/core/Filter;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    .line 109
    :cond_0
    check-cast p0, Lcom/google/firebase/firestore/core/CompositeFilter;

    .line 112
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->getFilters()Ljava/util/List;

    move-result-object v0

    .line 115
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_1

    .line 116
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/core/Filter;

    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->applyAssociation(Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Filter;

    move-result-object p0

    return-object p0

    .line 120
    :cond_1
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->isFlat()Z

    move-result v1

    if-eqz v1, :cond_2

    return-object p0

    .line 126
    :cond_2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 127
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/firebase/firestore/core/Filter;

    .line 128
    invoke-static {v4}, Lcom/google/firebase/firestore/util/LogicUtils;->applyAssociation(Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Filter;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 138
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 139
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/firebase/firestore/core/Filter;

    .line 140
    instance-of v5, v4, Lcom/google/firebase/firestore/core/FieldFilter;

    if-eqz v5, :cond_5

    .line 141
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 142
    :cond_5
    instance-of v5, v4, Lcom/google/firebase/firestore/core/CompositeFilter;

    if-eqz v5, :cond_4

    .line 143
    check-cast v4, Lcom/google/firebase/firestore/core/CompositeFilter;

    .line 144
    invoke-virtual {v4}, Lcom/google/firebase/firestore/core/CompositeFilter;->getOperator()Lcom/google/firebase/firestore/core/CompositeFilter$Operator;

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->getOperator()Lcom/google/firebase/firestore/core/CompositeFilter$Operator;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/firebase/firestore/core/CompositeFilter$Operator;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 148
    invoke-virtual {v4}, Lcom/google/firebase/firestore/core/CompositeFilter;->getFilters()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 153
    :cond_6
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 157
    :cond_7
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v3, :cond_8

    .line 158
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/core/Filter;

    return-object p0

    .line 160
    :cond_8
    new-instance v1, Lcom/google/firebase/firestore/core/CompositeFilter;

    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->getOperator()Lcom/google/firebase/firestore/core/CompositeFilter$Operator;

    move-result-object p0

    invoke-direct {v1, v0, p0}, Lcom/google/firebase/firestore/core/CompositeFilter;-><init>(Ljava/util/List;Lcom/google/firebase/firestore/core/CompositeFilter$Operator;)V

    return-object v1
.end method

.method private static applyDistribution(Lcom/google/firebase/firestore/core/CompositeFilter;Lcom/google/firebase/firestore/core/CompositeFilter;)Lcom/google/firebase/firestore/core/Filter;
    .locals 3

    .line 225
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->getFilters()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/CompositeFilter;->getFilters()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const-string v2, "Found an empty composite filter"

    new-array v1, v1, [Ljava/lang/Object;

    .line 224
    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 235
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->isConjunction()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/CompositeFilter;->isConjunction()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 236
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/CompositeFilter;->getFilters()Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/core/CompositeFilter;->withAddedFilters(Ljava/util/List;)Lcom/google/firebase/firestore/core/CompositeFilter;

    move-result-object p0

    return-object p0

    .line 242
    :cond_1
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->isDisjunction()Z

    move-result v0

    if-eqz v0, :cond_2

    move-object v0, p0

    goto :goto_1

    :cond_2
    move-object v0, p1

    .line 243
    :goto_1
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->isDisjunction()Z

    move-result v1

    if-eqz v1, :cond_3

    move-object p0, p1

    .line 244
    :cond_3
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 245
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/CompositeFilter;->getFilters()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/core/Filter;

    .line 246
    invoke-static {v1, p0}, Lcom/google/firebase/firestore/util/LogicUtils;->applyDistribution(Lcom/google/firebase/firestore/core/Filter;Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Filter;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 248
    :cond_4
    new-instance p0, Lcom/google/firebase/firestore/core/CompositeFilter;

    sget-object v0, Lcom/google/firebase/firestore/core/CompositeFilter$Operator;->OR:Lcom/google/firebase/firestore/core/CompositeFilter$Operator;

    invoke-direct {p0, p1, v0}, Lcom/google/firebase/firestore/core/CompositeFilter;-><init>(Ljava/util/List;Lcom/google/firebase/firestore/core/CompositeFilter$Operator;)V

    return-object p0
.end method

.method private static applyDistribution(Lcom/google/firebase/firestore/core/FieldFilter;Lcom/google/firebase/firestore/core/CompositeFilter;)Lcom/google/firebase/firestore/core/Filter;
    .locals 2

    .line 210
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/CompositeFilter;->isConjunction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 212
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->withAddedFilters(Ljava/util/List;)Lcom/google/firebase/firestore/core/CompositeFilter;

    move-result-object p0

    return-object p0

    .line 215
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 216
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/CompositeFilter;->getFilters()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/core/Filter;

    .line 217
    invoke-static {p0, v1}, Lcom/google/firebase/firestore/util/LogicUtils;->applyDistribution(Lcom/google/firebase/firestore/core/Filter;Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Filter;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 219
    :cond_1
    new-instance p0, Lcom/google/firebase/firestore/core/CompositeFilter;

    sget-object p1, Lcom/google/firebase/firestore/core/CompositeFilter$Operator;->OR:Lcom/google/firebase/firestore/core/CompositeFilter$Operator;

    invoke-direct {p0, v0, p1}, Lcom/google/firebase/firestore/core/CompositeFilter;-><init>(Ljava/util/List;Lcom/google/firebase/firestore/core/CompositeFilter$Operator;)V

    return-object p0
.end method

.method private static applyDistribution(Lcom/google/firebase/firestore/core/FieldFilter;Lcom/google/firebase/firestore/core/FieldFilter;)Lcom/google/firebase/firestore/core/Filter;
    .locals 3

    .line 202
    new-instance v0, Lcom/google/firebase/firestore/core/CompositeFilter;

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/google/firebase/firestore/core/Filter;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 p0, 0x1

    aput-object p1, v1, p0

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    sget-object p1, Lcom/google/firebase/firestore/core/CompositeFilter$Operator;->AND:Lcom/google/firebase/firestore/core/CompositeFilter$Operator;

    invoke-direct {v0, p0, p1}, Lcom/google/firebase/firestore/core/CompositeFilter;-><init>(Ljava/util/List;Lcom/google/firebase/firestore/core/CompositeFilter$Operator;)V

    return-object v0
.end method

.method protected static applyDistribution(Lcom/google/firebase/firestore/core/Filter;Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Filter;
    .locals 2

    .line 182
    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->assertFieldFilterOrCompositeFilter(Lcom/google/firebase/firestore/core/Filter;)V

    .line 183
    invoke-static {p1}, Lcom/google/firebase/firestore/util/LogicUtils;->assertFieldFilterOrCompositeFilter(Lcom/google/firebase/firestore/core/Filter;)V

    .line 185
    instance-of v0, p0, Lcom/google/firebase/firestore/core/FieldFilter;

    if-eqz v0, :cond_0

    instance-of v1, p1, Lcom/google/firebase/firestore/core/FieldFilter;

    if-eqz v1, :cond_0

    .line 186
    check-cast p0, Lcom/google/firebase/firestore/core/FieldFilter;

    check-cast p1, Lcom/google/firebase/firestore/core/FieldFilter;

    invoke-static {p0, p1}, Lcom/google/firebase/firestore/util/LogicUtils;->applyDistribution(Lcom/google/firebase/firestore/core/FieldFilter;Lcom/google/firebase/firestore/core/FieldFilter;)Lcom/google/firebase/firestore/core/Filter;

    move-result-object p0

    goto :goto_0

    :cond_0
    if-eqz v0, :cond_1

    .line 187
    instance-of v0, p1, Lcom/google/firebase/firestore/core/CompositeFilter;

    if-eqz v0, :cond_1

    .line 188
    check-cast p0, Lcom/google/firebase/firestore/core/FieldFilter;

    check-cast p1, Lcom/google/firebase/firestore/core/CompositeFilter;

    invoke-static {p0, p1}, Lcom/google/firebase/firestore/util/LogicUtils;->applyDistribution(Lcom/google/firebase/firestore/core/FieldFilter;Lcom/google/firebase/firestore/core/CompositeFilter;)Lcom/google/firebase/firestore/core/Filter;

    move-result-object p0

    goto :goto_0

    .line 189
    :cond_1
    instance-of v0, p0, Lcom/google/firebase/firestore/core/CompositeFilter;

    if-eqz v0, :cond_2

    instance-of v0, p1, Lcom/google/firebase/firestore/core/FieldFilter;

    if-eqz v0, :cond_2

    .line 190
    check-cast p1, Lcom/google/firebase/firestore/core/FieldFilter;

    check-cast p0, Lcom/google/firebase/firestore/core/CompositeFilter;

    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/LogicUtils;->applyDistribution(Lcom/google/firebase/firestore/core/FieldFilter;Lcom/google/firebase/firestore/core/CompositeFilter;)Lcom/google/firebase/firestore/core/Filter;

    move-result-object p0

    goto :goto_0

    .line 192
    :cond_2
    check-cast p0, Lcom/google/firebase/firestore/core/CompositeFilter;

    check-cast p1, Lcom/google/firebase/firestore/core/CompositeFilter;

    invoke-static {p0, p1}, Lcom/google/firebase/firestore/util/LogicUtils;->applyDistribution(Lcom/google/firebase/firestore/core/CompositeFilter;Lcom/google/firebase/firestore/core/CompositeFilter;)Lcom/google/firebase/firestore/core/Filter;

    move-result-object p0

    .line 197
    :goto_0
    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->applyAssociation(Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Filter;

    move-result-object p0

    return-object p0
.end method

.method private static assertFieldFilterOrCompositeFilter(Lcom/google/firebase/firestore/core/Filter;)V
    .locals 2

    .line 37
    instance-of v0, p0, Lcom/google/firebase/firestore/core/FieldFilter;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    instance-of p0, p0, Lcom/google/firebase/firestore/core/CompositeFilter;

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    move p0, v1

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    const-string v0, "Only field filters and composite filters are accepted."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0, v0, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method protected static computeDistributedNormalForm(Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Filter;
    .locals 5

    .line 252
    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->assertFieldFilterOrCompositeFilter(Lcom/google/firebase/firestore/core/Filter;)V

    .line 254
    instance-of v0, p0, Lcom/google/firebase/firestore/core/FieldFilter;

    if-eqz v0, :cond_0

    return-object p0

    .line 258
    :cond_0
    move-object v0, p0

    check-cast v0, Lcom/google/firebase/firestore/core/CompositeFilter;

    .line 260
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/CompositeFilter;->getFilters()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v1, v2, :cond_1

    .line 261
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Filter;->getFilters()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/core/Filter;

    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->computeDistributedNormalForm(Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Filter;

    move-result-object p0

    return-object p0

    .line 265
    :cond_1
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 266
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/CompositeFilter;->getFilters()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/firebase/firestore/core/Filter;

    .line 267
    invoke-static {v4}, Lcom/google/firebase/firestore/util/LogicUtils;->computeDistributedNormalForm(Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Filter;

    move-result-object v4

    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 269
    :cond_2
    new-instance v1, Lcom/google/firebase/firestore/core/CompositeFilter;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/CompositeFilter;->getOperator()Lcom/google/firebase/firestore/core/CompositeFilter$Operator;

    move-result-object v0

    invoke-direct {v1, p0, v0}, Lcom/google/firebase/firestore/core/CompositeFilter;-><init>(Ljava/util/List;Lcom/google/firebase/firestore/core/CompositeFilter$Operator;)V

    .line 270
    invoke-static {v1}, Lcom/google/firebase/firestore/util/LogicUtils;->applyAssociation(Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Filter;

    move-result-object p0

    .line 272
    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->isDisjunctiveNormalForm(Lcom/google/firebase/firestore/core/Filter;)Z

    move-result v0

    if-eqz v0, :cond_3

    return-object p0

    .line 276
    :cond_3
    instance-of v0, p0, Lcom/google/firebase/firestore/core/CompositeFilter;

    const-string v1, "field filters are already in DNF form."

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v0, v1, v4}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 277
    check-cast p0, Lcom/google/firebase/firestore/core/CompositeFilter;

    .line 279
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->isConjunction()Z

    move-result v0

    const-string v1, "Disjunction of filters all of which are already in DNF form is itself in DNF form."

    new-array v4, v3, [Ljava/lang/Object;

    .line 278
    invoke-static {v0, v1, v4}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 282
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->getFilters()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, v2, :cond_4

    move v0, v2

    goto :goto_1

    :cond_4
    move v0, v3

    :goto_1
    const-string v1, "Single-filter composite filters are already in DNF form."

    new-array v4, v3, [Ljava/lang/Object;

    .line 281
    invoke-static {v0, v1, v4}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 284
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->getFilters()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/core/Filter;

    .line 285
    :goto_2
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->getFilters()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v2, v1, :cond_5

    .line 286
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->getFilters()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/core/Filter;

    invoke-static {v0, v1}, Lcom/google/firebase/firestore/util/LogicUtils;->applyDistribution(Lcom/google/firebase/firestore/core/Filter;Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Filter;

    move-result-object v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_5
    return-object v0
.end method

.method protected static computeInExpansion(Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Filter;
    .locals 5

    .line 297
    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->assertFieldFilterOrCompositeFilter(Lcom/google/firebase/firestore/core/Filter;)V

    .line 299
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 301
    instance-of v1, p0, Lcom/google/firebase/firestore/core/FieldFilter;

    if-eqz v1, :cond_2

    .line 302
    instance-of v1, p0, Lcom/google/firebase/firestore/core/InFilter;

    if-eqz v1, :cond_1

    .line 304
    check-cast p0, Lcom/google/firebase/firestore/core/InFilter;

    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/InFilter;->getValue()Lcom/google/firestore/v1/Value;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firestore/v1/Value;->getArrayValue()Lcom/google/firestore/v1/ArrayValue;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firestore/v1/ArrayValue;->getValuesList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firestore/v1/Value;

    .line 307
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/InFilter;->getField()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v3

    sget-object v4, Lcom/google/firebase/firestore/core/FieldFilter$Operator;->EQUAL:Lcom/google/firebase/firestore/core/FieldFilter$Operator;

    .line 306
    invoke-static {v3, v4, v2}, Lcom/google/firebase/firestore/core/FieldFilter;->create(Lcom/google/firebase/firestore/model/FieldPath;Lcom/google/firebase/firestore/core/FieldFilter$Operator;Lcom/google/firestore/v1/Value;)Lcom/google/firebase/firestore/core/FieldFilter;

    move-result-object v2

    .line 305
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 309
    :cond_0
    new-instance p0, Lcom/google/firebase/firestore/core/CompositeFilter;

    sget-object v1, Lcom/google/firebase/firestore/core/CompositeFilter$Operator;->OR:Lcom/google/firebase/firestore/core/CompositeFilter$Operator;

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/firestore/core/CompositeFilter;-><init>(Ljava/util/List;Lcom/google/firebase/firestore/core/CompositeFilter$Operator;)V

    :cond_1
    return-object p0

    .line 317
    :cond_2
    check-cast p0, Lcom/google/firebase/firestore/core/CompositeFilter;

    .line 318
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->getFilters()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/core/Filter;

    .line 319
    invoke-static {v2}, Lcom/google/firebase/firestore/util/LogicUtils;->computeInExpansion(Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Filter;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 321
    :cond_3
    new-instance v1, Lcom/google/firebase/firestore/core/CompositeFilter;

    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->getOperator()Lcom/google/firebase/firestore/core/CompositeFilter$Operator;

    move-result-object p0

    invoke-direct {v1, v0, p0}, Lcom/google/firebase/firestore/core/CompositeFilter;-><init>(Ljava/util/List;Lcom/google/firebase/firestore/core/CompositeFilter$Operator;)V

    return-object v1
.end method

.method public static getDnfTerms(Lcom/google/firebase/firestore/core/CompositeFilter;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/core/CompositeFilter;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/core/Filter;",
            ">;"
        }
    .end annotation

    .line 336
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->getFilters()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 337
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 342
    :cond_0
    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->computeInExpansion(Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Filter;

    move-result-object p0

    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->computeDistributedNormalForm(Lcom/google/firebase/firestore/core/Filter;)Lcom/google/firebase/firestore/core/Filter;

    move-result-object p0

    .line 345
    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->isDisjunctiveNormalForm(Lcom/google/firebase/firestore/core/Filter;)Z

    move-result v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "computeDistributedNormalForm did not result in disjunctive normal form"

    .line 344
    invoke-static {v0, v2, v1}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 348
    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->isSingleFieldFilter(Lcom/google/firebase/firestore/core/Filter;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->isFlatConjunction(Lcom/google/firebase/firestore/core/Filter;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 352
    :cond_1
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/Filter;->getFilters()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 349
    :cond_2
    :goto_0
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private static isDisjunctionOfFieldFiltersAndFlatConjunctions(Lcom/google/firebase/firestore/core/Filter;)Z
    .locals 3

    .line 60
    instance-of v0, p0, Lcom/google/firebase/firestore/core/CompositeFilter;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 61
    check-cast p0, Lcom/google/firebase/firestore/core/CompositeFilter;

    .line 62
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->isDisjunction()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 63
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->getFilters()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/core/Filter;

    .line 64
    invoke-static {v0}, Lcom/google/firebase/firestore/util/LogicUtils;->isSingleFieldFilter(Lcom/google/firebase/firestore/core/Filter;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v0}, Lcom/google/firebase/firestore/util/LogicUtils;->isFlatConjunction(Lcom/google/firebase/firestore/core/Filter;)Z

    move-result v0

    if-nez v0, :cond_0

    return v1

    :cond_1
    const/4 p0, 0x1

    return p0

    :cond_2
    return v1
.end method

.method private static isDisjunctiveNormalForm(Lcom/google/firebase/firestore/core/Filter;)Z
    .locals 1

    .line 87
    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->isSingleFieldFilter(Lcom/google/firebase/firestore/core/Filter;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 88
    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->isFlatConjunction(Lcom/google/firebase/firestore/core/Filter;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 89
    invoke-static {p0}, Lcom/google/firebase/firestore/util/LogicUtils;->isDisjunctionOfFieldFiltersAndFlatConjunctions(Lcom/google/firebase/firestore/core/Filter;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static isFlatConjunction(Lcom/google/firebase/firestore/core/Filter;)Z
    .locals 1

    .line 52
    instance-of v0, p0, Lcom/google/firebase/firestore/core/CompositeFilter;

    if-eqz v0, :cond_0

    check-cast p0, Lcom/google/firebase/firestore/core/CompositeFilter;

    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/CompositeFilter;->isFlatConjunction()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static isSingleFieldFilter(Lcom/google/firebase/firestore/core/Filter;)Z
    .locals 0

    .line 44
    instance-of p0, p0, Lcom/google/firebase/firestore/core/FieldFilter;

    return p0
.end method
