.class public final Lcom/facebook/imagepipeline/memory/PoolStatsTracker$Companion;
.super Ljava/lang/Object;
.source "PoolStatsTracker.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/memory/PoolStatsTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0007\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/memory/PoolStatsTracker$Companion;",
        "",
        "()V",
        "BUCKETS_USED_PREFIX",
        "",
        "FREE_BYTES",
        "FREE_COUNT",
        "HARD_CAP",
        "SOFT_CAP",
        "USED_BYTES",
        "USED_COUNT",
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
.field static final synthetic $$INSTANCE:Lcom/facebook/imagepipeline/memory/PoolStatsTracker$Companion;

.field public static final BUCKETS_USED_PREFIX:Ljava/lang/String; = "buckets_used_"

.field public static final FREE_BYTES:Ljava/lang/String; = "free_bytes"

.field public static final FREE_COUNT:Ljava/lang/String; = "free_count"

.field public static final HARD_CAP:Ljava/lang/String; = "hard_cap"

.field public static final SOFT_CAP:Ljava/lang/String; = "soft_cap"

.field public static final USED_BYTES:Ljava/lang/String; = "used_bytes"

.field public static final USED_COUNT:Ljava/lang/String; = "used_count"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/imagepipeline/memory/PoolStatsTracker$Companion;

    invoke-direct {v0}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker$Companion;-><init>()V

    sput-object v0, Lcom/facebook/imagepipeline/memory/PoolStatsTracker$Companion;->$$INSTANCE:Lcom/facebook/imagepipeline/memory/PoolStatsTracker$Companion;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
