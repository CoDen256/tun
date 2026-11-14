.class public final Lcom/google/firestore/v1/Cursor$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;
.source "Cursor.java"

# interfaces
.implements Lcom/google/firestore/v1/CursorOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/Cursor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$Builder<",
        "Lcom/google/firestore/v1/Cursor;",
        "Lcom/google/firestore/v1/Cursor$Builder;",
        ">;",
        "Lcom/google/firestore/v1/CursorOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 317
    invoke-static {}, Lcom/google/firestore/v1/Cursor;->access$000()Lcom/google/firestore/v1/Cursor;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/firestore/v1/Cursor$1;)V
    .locals 0

    .line 310
    invoke-direct {p0}, Lcom/google/firestore/v1/Cursor$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllValues(Ljava/lang/Iterable;)Lcom/google/firestore/v1/Cursor$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/google/firestore/v1/Value;",
            ">;)",
            "Lcom/google/firestore/v1/Cursor$Builder;"
        }
    .end annotation

    .line 462
    invoke-virtual {p0}, Lcom/google/firestore/v1/Cursor$Builder;->copyOnWrite()V

    .line 463
    iget-object v0, p0, Lcom/google/firestore/v1/Cursor$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/Cursor;

    invoke-static {v0, p1}, Lcom/google/firestore/v1/Cursor;->access$400(Lcom/google/firestore/v1/Cursor;Ljava/lang/Iterable;)V

    return-object p0
.end method

.method public addValues(ILcom/google/firestore/v1/Value$Builder;)Lcom/google/firestore/v1/Cursor$Builder;
    .locals 1

    .line 446
    invoke-virtual {p0}, Lcom/google/firestore/v1/Cursor$Builder;->copyOnWrite()V

    .line 447
    iget-object v0, p0, Lcom/google/firestore/v1/Cursor$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/Cursor;

    .line 448
    invoke-virtual {p2}, Lcom/google/firestore/v1/Value$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/google/firestore/v1/Value;

    .line 447
    invoke-static {v0, p1, p2}, Lcom/google/firestore/v1/Cursor;->access$300(Lcom/google/firestore/v1/Cursor;ILcom/google/firestore/v1/Value;)V

    return-object p0
.end method

.method public addValues(ILcom/google/firestore/v1/Value;)Lcom/google/firestore/v1/Cursor$Builder;
    .locals 1

    .line 416
    invoke-virtual {p0}, Lcom/google/firestore/v1/Cursor$Builder;->copyOnWrite()V

    .line 417
    iget-object v0, p0, Lcom/google/firestore/v1/Cursor$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/Cursor;

    invoke-static {v0, p1, p2}, Lcom/google/firestore/v1/Cursor;->access$300(Lcom/google/firestore/v1/Cursor;ILcom/google/firestore/v1/Value;)V

    return-object p0
.end method

.method public addValues(Lcom/google/firestore/v1/Value$Builder;)Lcom/google/firestore/v1/Cursor$Builder;
    .locals 1

    .line 431
    invoke-virtual {p0}, Lcom/google/firestore/v1/Cursor$Builder;->copyOnWrite()V

    .line 432
    iget-object v0, p0, Lcom/google/firestore/v1/Cursor$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/Cursor;

    invoke-virtual {p1}, Lcom/google/firestore/v1/Value$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Value;

    invoke-static {v0, p1}, Lcom/google/firestore/v1/Cursor;->access$200(Lcom/google/firestore/v1/Cursor;Lcom/google/firestore/v1/Value;)V

    return-object p0
.end method

.method public addValues(Lcom/google/firestore/v1/Value;)Lcom/google/firestore/v1/Cursor$Builder;
    .locals 1

    .line 401
    invoke-virtual {p0}, Lcom/google/firestore/v1/Cursor$Builder;->copyOnWrite()V

    .line 402
    iget-object v0, p0, Lcom/google/firestore/v1/Cursor$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/Cursor;

    invoke-static {v0, p1}, Lcom/google/firestore/v1/Cursor;->access$200(Lcom/google/firestore/v1/Cursor;Lcom/google/firestore/v1/Value;)V

    return-object p0
.end method

.method public clearBefore()Lcom/google/firestore/v1/Cursor$Builder;
    .locals 1

    .line 533
    invoke-virtual {p0}, Lcom/google/firestore/v1/Cursor$Builder;->copyOnWrite()V

    .line 534
    iget-object v0, p0, Lcom/google/firestore/v1/Cursor$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/Cursor;

    invoke-static {v0}, Lcom/google/firestore/v1/Cursor;->access$800(Lcom/google/firestore/v1/Cursor;)V

    return-object p0
.end method

.method public clearValues()Lcom/google/firestore/v1/Cursor$Builder;
    .locals 1

    .line 476
    invoke-virtual {p0}, Lcom/google/firestore/v1/Cursor$Builder;->copyOnWrite()V

    .line 477
    iget-object v0, p0, Lcom/google/firestore/v1/Cursor$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/Cursor;

    invoke-static {v0}, Lcom/google/firestore/v1/Cursor;->access$500(Lcom/google/firestore/v1/Cursor;)V

    return-object p0
.end method

.method public getBefore()Z
    .locals 1

    .line 506
    iget-object v0, p0, Lcom/google/firestore/v1/Cursor$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/Cursor;

    invoke-virtual {v0}, Lcom/google/firestore/v1/Cursor;->getBefore()Z

    move-result v0

    return v0
.end method

.method public getValues(I)Lcom/google/firestore/v1/Value;
    .locals 1

    .line 358
    iget-object v0, p0, Lcom/google/firestore/v1/Cursor$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/Cursor;

    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/Cursor;->getValues(I)Lcom/google/firestore/v1/Value;

    move-result-object p1

    return-object p1
.end method

.method public getValuesCount()I
    .locals 1

    .line 346
    iget-object v0, p0, Lcom/google/firestore/v1/Cursor$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/Cursor;

    invoke-virtual {v0}, Lcom/google/firestore/v1/Cursor;->getValuesCount()I

    move-result v0

    return v0
.end method

.method public getValuesList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firestore/v1/Value;",
            ">;"
        }
    .end annotation

    .line 332
    iget-object v0, p0, Lcom/google/firestore/v1/Cursor$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/Cursor;

    .line 333
    invoke-virtual {v0}, Lcom/google/firestore/v1/Cursor;->getValuesList()Ljava/util/List;

    move-result-object v0

    .line 332
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public removeValues(I)Lcom/google/firestore/v1/Cursor$Builder;
    .locals 1

    .line 490
    invoke-virtual {p0}, Lcom/google/firestore/v1/Cursor$Builder;->copyOnWrite()V

    .line 491
    iget-object v0, p0, Lcom/google/firestore/v1/Cursor$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/Cursor;

    invoke-static {v0, p1}, Lcom/google/firestore/v1/Cursor;->access$600(Lcom/google/firestore/v1/Cursor;I)V

    return-object p0
.end method

.method public setBefore(Z)Lcom/google/firestore/v1/Cursor$Builder;
    .locals 1

    .line 519
    invoke-virtual {p0}, Lcom/google/firestore/v1/Cursor$Builder;->copyOnWrite()V

    .line 520
    iget-object v0, p0, Lcom/google/firestore/v1/Cursor$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/Cursor;

    invoke-static {v0, p1}, Lcom/google/firestore/v1/Cursor;->access$700(Lcom/google/firestore/v1/Cursor;Z)V

    return-object p0
.end method

.method public setValues(ILcom/google/firestore/v1/Value$Builder;)Lcom/google/firestore/v1/Cursor$Builder;
    .locals 1

    .line 386
    invoke-virtual {p0}, Lcom/google/firestore/v1/Cursor$Builder;->copyOnWrite()V

    .line 387
    iget-object v0, p0, Lcom/google/firestore/v1/Cursor$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/Cursor;

    .line 388
    invoke-virtual {p2}, Lcom/google/firestore/v1/Value$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/google/firestore/v1/Value;

    .line 387
    invoke-static {v0, p1, p2}, Lcom/google/firestore/v1/Cursor;->access$100(Lcom/google/firestore/v1/Cursor;ILcom/google/firestore/v1/Value;)V

    return-object p0
.end method

.method public setValues(ILcom/google/firestore/v1/Value;)Lcom/google/firestore/v1/Cursor$Builder;
    .locals 1

    .line 371
    invoke-virtual {p0}, Lcom/google/firestore/v1/Cursor$Builder;->copyOnWrite()V

    .line 372
    iget-object v0, p0, Lcom/google/firestore/v1/Cursor$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/Cursor;

    invoke-static {v0, p1, p2}, Lcom/google/firestore/v1/Cursor;->access$100(Lcom/google/firestore/v1/Cursor;ILcom/google/firestore/v1/Value;)V

    return-object p0
.end method
