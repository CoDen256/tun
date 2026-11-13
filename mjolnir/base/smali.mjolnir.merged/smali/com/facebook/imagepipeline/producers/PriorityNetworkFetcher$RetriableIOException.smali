.class public Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$RetriableIOException;
.super Ljava/io/IOException;
.source "PriorityNetworkFetcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RetriableIOException"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0

    .line 555
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 560
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$RetriableIOException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 561
    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$RetriableIOException;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method
