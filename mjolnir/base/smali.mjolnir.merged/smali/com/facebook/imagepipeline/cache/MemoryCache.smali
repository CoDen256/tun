.class public interface abstract Lcom/facebook/imagepipeline/cache/MemoryCache;
.super Ljava/lang/Object;
.source "MemoryCache.kt"

# interfaces
.implements Lcom/facebook/common/memory/MemoryTrimmable;
.implements Lcom/facebook/cache/common/HasDebugData;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/facebook/common/memory/MemoryTrimmable;",
        "Lcom/facebook/cache/common/HasDebugData;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0008f\u0018\u0000*\u0004\u0008\u0000\u0010\u0001*\u0004\u0008\u0001\u0010\u00022\u00020\u00032\u00020\u0004:\u0001\u001dJ+\u0010\u000b\u001a\n\u0012\u0004\u0012\u00028\u0001\u0018\u00010\u000c2\u0006\u0010\r\u001a\u00028\u00002\u000c\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00028\u00010\u000cH&\u00a2\u0006\u0002\u0010\u000fJ\u0016\u0010\u0010\u001a\u00020\u00112\u0006\u0010\r\u001a\u00028\u0000H\u00a6\u0002\u00a2\u0006\u0002\u0010\u0012J\u0017\u0010\u0010\u001a\u00020\u00112\u000c\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0014H\u00a6\u0002J\u001e\u0010\u0015\u001a\n\u0012\u0004\u0012\u00028\u0001\u0018\u00010\u000c2\u0006\u0010\r\u001a\u00028\u0000H\u00a6\u0002\u00a2\u0006\u0002\u0010\u0016J\u0017\u0010\u0017\u001a\u0004\u0018\u00018\u00012\u0006\u0010\r\u001a\u00028\u0000H&\u00a2\u0006\u0002\u0010\u0018J\u0015\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\r\u001a\u00028\u0000H&\u00a2\u0006\u0002\u0010\u001bJ\u0016\u0010\u001c\u001a\u00020\u00062\u000c\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0014H&R\u0012\u0010\u0005\u001a\u00020\u0006X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0007\u0010\u0008R\u0012\u0010\t\u001a\u00020\u0006X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\n\u0010\u0008\u00a8\u0006\u001e"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/cache/MemoryCache;",
        "K",
        "V",
        "Lcom/facebook/common/memory/MemoryTrimmable;",
        "Lcom/facebook/cache/common/HasDebugData;",
        "count",
        "",
        "getCount",
        "()I",
        "sizeInBytes",
        "getSizeInBytes",
        "cache",
        "Lcom/facebook/common/references/CloseableReference;",
        "key",
        "value",
        "(Ljava/lang/Object;Lcom/facebook/common/references/CloseableReference;)Lcom/facebook/common/references/CloseableReference;",
        "contains",
        "",
        "(Ljava/lang/Object;)Z",
        "predicate",
        "Lcom/facebook/common/internal/Predicate;",
        "get",
        "(Ljava/lang/Object;)Lcom/facebook/common/references/CloseableReference;",
        "inspect",
        "(Ljava/lang/Object;)Ljava/lang/Object;",
        "probe",
        "",
        "(Ljava/lang/Object;)V",
        "removeAll",
        "CacheTrimStrategy",
        "imagepipeline-base_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# virtual methods
.method public abstract cache(Ljava/lang/Object;Lcom/facebook/common/references/CloseableReference;)Lcom/facebook/common/references/CloseableReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Lcom/facebook/common/references/CloseableReference<",
            "TV;>;)",
            "Lcom/facebook/common/references/CloseableReference<",
            "TV;>;"
        }
    .end annotation
.end method

.method public abstract contains(Lcom/facebook/common/internal/Predicate;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/internal/Predicate<",
            "TK;>;)Z"
        }
    .end annotation
.end method

.method public abstract contains(Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation
.end method

.method public abstract get(Ljava/lang/Object;)Lcom/facebook/common/references/CloseableReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Lcom/facebook/common/references/CloseableReference<",
            "TV;>;"
        }
    .end annotation
.end method

.method public abstract getCount()I
.end method

.method public abstract getSizeInBytes()I
.end method

.method public abstract inspect(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation
.end method

.method public abstract probe(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation
.end method

.method public abstract removeAll(Lcom/facebook/common/internal/Predicate;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/internal/Predicate<",
            "TK;>;)I"
        }
    .end annotation
.end method
