.class Lcom/google/firebase/firestore/index/IndexByteEncoder$AscendingIndexByteEncoder;
.super Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;
.source "IndexByteEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/index/IndexByteEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AscendingIndexByteEncoder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/firebase/firestore/index/IndexByteEncoder;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/index/IndexByteEncoder;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/index/IndexByteEncoder$AscendingIndexByteEncoder;->this$0:Lcom/google/firebase/firestore/index/IndexByteEncoder;

    .line 26
    invoke-direct {p0}, Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;-><init>()V

    return-void
.end method


# virtual methods
.method public writeBytes(Lcom/google/protobuf/ByteString;)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/index/IndexByteEncoder$AscendingIndexByteEncoder;->this$0:Lcom/google/firebase/firestore/index/IndexByteEncoder;

    .line 30
    invoke-static {v0}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->access$000(Lcom/google/firebase/firestore/index/IndexByteEncoder;)Lcom/google/firebase/firestore/index/OrderedCodeWriter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeBytesAscending(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public writeDouble(D)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/index/IndexByteEncoder$AscendingIndexByteEncoder;->this$0:Lcom/google/firebase/firestore/index/IndexByteEncoder;

    .line 45
    invoke-static {v0}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->access$000(Lcom/google/firebase/firestore/index/IndexByteEncoder;)Lcom/google/firebase/firestore/index/OrderedCodeWriter;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeDoubleAscending(D)V

    return-void
.end method

.method public writeInfinity()V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/index/IndexByteEncoder$AscendingIndexByteEncoder;->this$0:Lcom/google/firebase/firestore/index/IndexByteEncoder;

    .line 50
    invoke-static {v0}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->access$000(Lcom/google/firebase/firestore/index/IndexByteEncoder;)Lcom/google/firebase/firestore/index/OrderedCodeWriter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeInfinityAscending()V

    return-void
.end method

.method public writeLong(J)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/index/IndexByteEncoder$AscendingIndexByteEncoder;->this$0:Lcom/google/firebase/firestore/index/IndexByteEncoder;

    .line 40
    invoke-static {v0}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->access$000(Lcom/google/firebase/firestore/index/IndexByteEncoder;)Lcom/google/firebase/firestore/index/OrderedCodeWriter;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeSignedLongAscending(J)V

    return-void
.end method

.method public writeString(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/index/IndexByteEncoder$AscendingIndexByteEncoder;->this$0:Lcom/google/firebase/firestore/index/IndexByteEncoder;

    .line 35
    invoke-static {v0}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->access$000(Lcom/google/firebase/firestore/index/IndexByteEncoder;)Lcom/google/firebase/firestore/index/OrderedCodeWriter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeUtf8Ascending(Ljava/lang/CharSequence;)V

    return-void
.end method
