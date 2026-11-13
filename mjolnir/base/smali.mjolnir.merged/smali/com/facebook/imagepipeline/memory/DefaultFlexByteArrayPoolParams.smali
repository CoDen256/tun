.class public final Lcom/facebook/imagepipeline/memory/DefaultFlexByteArrayPoolParams;
.super Ljava/lang/Object;
.source "DefaultFlexByteArrayPoolParams.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J \u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u00042\u0006\u0010\u000c\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\u0004H\u0007J\u0008\u0010\u000e\u001a\u00020\u000fH\u0007R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u000e\u0010\u0008\u001a\u00020\u0004X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/memory/DefaultFlexByteArrayPoolParams;",
        "",
        "()V",
        "DEFAULT_MAX_BYTE_ARRAY_SIZE",
        "",
        "DEFAULT_MAX_NUM_THREADS",
        "getDEFAULT_MAX_NUM_THREADS",
        "()I",
        "DEFAULT_MIN_BYTE_ARRAY_SIZE",
        "generateBuckets",
        "Landroid/util/SparseIntArray;",
        "min",
        "max",
        "numThreads",
        "get",
        "Lcom/facebook/imagepipeline/memory/PoolParams;",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final DEFAULT_MAX_BYTE_ARRAY_SIZE:I = 0x400000

.field private static final DEFAULT_MAX_NUM_THREADS:I

.field private static final DEFAULT_MIN_BYTE_ARRAY_SIZE:I = 0x20000

.field public static final INSTANCE:Lcom/facebook/imagepipeline/memory/DefaultFlexByteArrayPoolParams;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/imagepipeline/memory/DefaultFlexByteArrayPoolParams;

    invoke-direct {v0}, Lcom/facebook/imagepipeline/memory/DefaultFlexByteArrayPoolParams;-><init>()V

    sput-object v0, Lcom/facebook/imagepipeline/memory/DefaultFlexByteArrayPoolParams;->INSTANCE:Lcom/facebook/imagepipeline/memory/DefaultFlexByteArrayPoolParams;

    .line 23
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    sput v0, Lcom/facebook/imagepipeline/memory/DefaultFlexByteArrayPoolParams;->DEFAULT_MAX_NUM_THREADS:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final generateBuckets(III)Landroid/util/SparseIntArray;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 27
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    :goto_0
    if-gt p0, p1, :cond_0

    .line 30
    invoke-virtual {v0, p0, p2}, Landroid/util/SparseIntArray;->put(II)V

    mul-int/lit8 p0, p0, 0x2

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static final get()Lcom/facebook/imagepipeline/memory/PoolParams;
    .locals 8
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 38
    new-instance v7, Lcom/facebook/imagepipeline/memory/PoolParams;

    const/high16 v1, 0x400000

    sget v6, Lcom/facebook/imagepipeline/memory/DefaultFlexByteArrayPoolParams;->DEFAULT_MAX_NUM_THREADS:I

    const/high16 v0, 0x400000

    mul-int v2, v6, v0

    const/high16 v3, 0x20000

    .line 42
    invoke-static {v3, v0, v6}, Lcom/facebook/imagepipeline/memory/DefaultFlexByteArrayPoolParams;->generateBuckets(III)Landroid/util/SparseIntArray;

    move-result-object v3

    const/high16 v4, 0x20000

    const/high16 v5, 0x400000

    move-object v0, v7

    .line 38
    invoke-direct/range {v0 .. v6}, Lcom/facebook/imagepipeline/memory/PoolParams;-><init>(IILandroid/util/SparseIntArray;III)V

    return-object v7
.end method


# virtual methods
.method public final getDEFAULT_MAX_NUM_THREADS()I
    .locals 1

    sget v0, Lcom/facebook/imagepipeline/memory/DefaultFlexByteArrayPoolParams;->DEFAULT_MAX_NUM_THREADS:I

    return v0
.end method
