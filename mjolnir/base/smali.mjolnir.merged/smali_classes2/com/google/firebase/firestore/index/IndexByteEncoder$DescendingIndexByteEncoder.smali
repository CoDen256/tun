.class Lcom/google/firebase/firestore/index/IndexByteEncoder$DescendingIndexByteEncoder;
.super Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;
.source "IndexByteEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/index/IndexByteEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DescendingIndexByteEncoder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/firebase/firestore/index/IndexByteEncoder;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/index/IndexByteEncoder;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/index/IndexByteEncoder$DescendingIndexByteEncoder;->this$0:Lcom/google/firebase/firestore/index/IndexByteEncoder;

    .line 54
    invoke-direct {p0}, Lcom/google/firebase/firestore/index/DirectionalIndexByteEncoder;-><init>()V

    return-void
.end method


# virtual methods
.method public writeBytes(Lcom/google/protobuf/ByteString;)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/index/IndexByteEncoder$DescendingIndexByteEncoder;->this$0:Lcom/google/firebase/firestore/index/IndexByteEncoder;

    .line 58
    invoke-static {v0}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->access$000(Lcom/google/firebase/firestore/index/IndexByteEncoder;)Lcom/google/firebase/firestore/index/OrderedCodeWriter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeBytesDescending(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public writeDouble(D)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/index/IndexByteEncoder$DescendingIndexByteEncoder;->this$0:Lcom/google/firebase/firestore/index/IndexByteEncoder;

    .line 73
    invoke-static {v0}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->access$000(Lcom/google/firebase/firestore/index/IndexByteEncoder;)Lcom/google/firebase/firestore/index/OrderedCodeWriter;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeDoubleDescending(D)V

    return-void
.end method

.method public writeInfinity()V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/index/IndexByteEncoder$DescendingIndexByteEncoder;->this$0:Lcom/google/firebase/firestore/index/IndexByteEncoder;

    .line 78
    invoke-static {v0}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->access$000(Lcom/google/firebase/firestore/index/IndexByteEncoder;)Lcom/google/firebase/firestore/index/OrderedCodeWriter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeInfinityDescending()V

    return-void
.end method

.method public writeLong(J)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/index/IndexByteEncoder$DescendingIndexByteEncoder;->this$0:Lcom/google/firebase/firestore/index/IndexByteEncoder;

    .line 68
    invoke-static {v0}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->access$000(Lcom/google/firebase/firestore/index/IndexByteEncoder;)Lcom/google/firebase/firestore/index/OrderedCodeWriter;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeSignedLongDescending(J)V

    return-void
.end method

.method public writeString(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/index/IndexByteEncoder$DescendingIndexByteEncoder;->this$0:Lcom/google/firebase/firestore/index/IndexByteEncoder;

    .line 63
    invoke-static {v0}, Lcom/google/firebase/firestore/index/IndexByteEncoder;->access$000(Lcom/google/firebase/firestore/index/IndexByteEncoder;)Lcom/google/firebase/firestore/index/OrderedCodeWriter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/index/OrderedCodeWriter;->writeUtf8Descending(Ljava/lang/CharSequence;)V

    return-void
.end method
