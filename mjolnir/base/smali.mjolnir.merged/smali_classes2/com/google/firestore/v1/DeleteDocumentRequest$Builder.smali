.class public final Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;
.source "DeleteDocumentRequest.java"

# interfaces
.implements Lcom/google/firestore/v1/DeleteDocumentRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/DeleteDocumentRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$Builder<",
        "Lcom/google/firestore/v1/DeleteDocumentRequest;",
        "Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;",
        ">;",
        "Lcom/google/firestore/v1/DeleteDocumentRequestOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 259
    invoke-static {}, Lcom/google/firestore/v1/DeleteDocumentRequest;->access$000()Lcom/google/firestore/v1/DeleteDocumentRequest;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/firestore/v1/DeleteDocumentRequest$1;)V
    .locals 0

    .line 252
    invoke-direct {p0}, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearCurrentDocument()Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;
    .locals 1

    .line 409
    invoke-virtual {p0}, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->copyOnWrite()V

    .line 410
    iget-object v0, p0, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/DeleteDocumentRequest;

    invoke-static {v0}, Lcom/google/firestore/v1/DeleteDocumentRequest;->access$600(Lcom/google/firestore/v1/DeleteDocumentRequest;)V

    return-object p0
.end method

.method public clearName()Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;
    .locals 1

    .line 316
    invoke-virtual {p0}, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->copyOnWrite()V

    .line 317
    iget-object v0, p0, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/DeleteDocumentRequest;

    invoke-static {v0}, Lcom/google/firestore/v1/DeleteDocumentRequest;->access$200(Lcom/google/firestore/v1/DeleteDocumentRequest;)V

    return-object p0
.end method

.method public getCurrentDocument()Lcom/google/firestore/v1/Precondition;
    .locals 1

    .line 359
    iget-object v0, p0, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/DeleteDocumentRequest;

    invoke-virtual {v0}, Lcom/google/firestore/v1/DeleteDocumentRequest;->getCurrentDocument()Lcom/google/firestore/v1/Precondition;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 274
    iget-object v0, p0, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/DeleteDocumentRequest;

    invoke-virtual {v0}, Lcom/google/firestore/v1/DeleteDocumentRequest;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    .line 288
    iget-object v0, p0, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/DeleteDocumentRequest;

    invoke-virtual {v0}, Lcom/google/firestore/v1/DeleteDocumentRequest;->getNameBytes()Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public hasCurrentDocument()Z
    .locals 1

    .line 347
    iget-object v0, p0, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/DeleteDocumentRequest;

    invoke-virtual {v0}, Lcom/google/firestore/v1/DeleteDocumentRequest;->hasCurrentDocument()Z

    move-result v0

    return v0
.end method

.method public mergeCurrentDocument(Lcom/google/firestore/v1/Precondition;)Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;
    .locals 1

    .line 397
    invoke-virtual {p0}, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->copyOnWrite()V

    .line 398
    iget-object v0, p0, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/DeleteDocumentRequest;

    invoke-static {v0, p1}, Lcom/google/firestore/v1/DeleteDocumentRequest;->access$500(Lcom/google/firestore/v1/DeleteDocumentRequest;Lcom/google/firestore/v1/Precondition;)V

    return-object p0
.end method

.method public setCurrentDocument(Lcom/google/firestore/v1/Precondition$Builder;)Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;
    .locals 1

    .line 384
    invoke-virtual {p0}, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->copyOnWrite()V

    .line 385
    iget-object v0, p0, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/DeleteDocumentRequest;

    invoke-virtual {p1}, Lcom/google/firestore/v1/Precondition$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Precondition;

    invoke-static {v0, p1}, Lcom/google/firestore/v1/DeleteDocumentRequest;->access$400(Lcom/google/firestore/v1/DeleteDocumentRequest;Lcom/google/firestore/v1/Precondition;)V

    return-object p0
.end method

.method public setCurrentDocument(Lcom/google/firestore/v1/Precondition;)Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;
    .locals 1

    .line 370
    invoke-virtual {p0}, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->copyOnWrite()V

    .line 371
    iget-object v0, p0, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/DeleteDocumentRequest;

    invoke-static {v0, p1}, Lcom/google/firestore/v1/DeleteDocumentRequest;->access$400(Lcom/google/firestore/v1/DeleteDocumentRequest;Lcom/google/firestore/v1/Precondition;)V

    return-object p0
.end method

.method public setName(Ljava/lang/String;)Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;
    .locals 1

    .line 302
    invoke-virtual {p0}, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->copyOnWrite()V

    .line 303
    iget-object v0, p0, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/DeleteDocumentRequest;

    invoke-static {v0, p1}, Lcom/google/firestore/v1/DeleteDocumentRequest;->access$100(Lcom/google/firestore/v1/DeleteDocumentRequest;Ljava/lang/String;)V

    return-object p0
.end method

.method public setNameBytes(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;
    .locals 1

    .line 332
    invoke-virtual {p0}, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->copyOnWrite()V

    .line 333
    iget-object v0, p0, Lcom/google/firestore/v1/DeleteDocumentRequest$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/firestore/v1/DeleteDocumentRequest;

    invoke-static {v0, p1}, Lcom/google/firestore/v1/DeleteDocumentRequest;->access$300(Lcom/google/firestore/v1/DeleteDocumentRequest;Lcom/google/protobuf/ByteString;)V

    return-object p0
.end method
