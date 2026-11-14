.class public final synthetic Lexpo/modules/storereview/StoreReviewModule$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic f$0:Lexpo/modules/kotlin/Promise;

.field public final synthetic f$1:Lcom/google/android/play/core/review/ReviewManager;

.field public final synthetic f$2:Lexpo/modules/storereview/StoreReviewModule;


# direct methods
.method public synthetic constructor <init>(Lexpo/modules/kotlin/Promise;Lcom/google/android/play/core/review/ReviewManager;Lexpo/modules/storereview/StoreReviewModule;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/storereview/StoreReviewModule$$ExternalSyntheticLambda0;->f$0:Lexpo/modules/kotlin/Promise;

    iput-object p2, p0, Lexpo/modules/storereview/StoreReviewModule$$ExternalSyntheticLambda0;->f$1:Lcom/google/android/play/core/review/ReviewManager;

    iput-object p3, p0, Lexpo/modules/storereview/StoreReviewModule$$ExternalSyntheticLambda0;->f$2:Lexpo/modules/storereview/StoreReviewModule;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 3

    iget-object v0, p0, Lexpo/modules/storereview/StoreReviewModule$$ExternalSyntheticLambda0;->f$0:Lexpo/modules/kotlin/Promise;

    iget-object v1, p0, Lexpo/modules/storereview/StoreReviewModule$$ExternalSyntheticLambda0;->f$1:Lcom/google/android/play/core/review/ReviewManager;

    iget-object v2, p0, Lexpo/modules/storereview/StoreReviewModule$$ExternalSyntheticLambda0;->f$2:Lexpo/modules/storereview/StoreReviewModule;

    invoke-static {v0, v1, v2, p1}, Lexpo/modules/storereview/StoreReviewModule;->$r8$lambda$x91LYfv8pJChnEaGv1uOqLhuEsY(Lexpo/modules/kotlin/Promise;Lcom/google/android/play/core/review/ReviewManager;Lexpo/modules/storereview/StoreReviewModule;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
