.class Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation$2;
.super Ljava/lang/Object;
.source "DefaultDevLoadingViewImplementation.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation;->updateProgress(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation;

.field final synthetic val$done:Ljava/lang/Integer;

.field final synthetic val$status:Ljava/lang/String;

.field final synthetic val$total:Ljava/lang/Integer;


# direct methods
.method constructor <init>(Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation$2;->this$0:Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation;

    iput-object p2, p0, Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation$2;->val$status:Ljava/lang/String;

    iput-object p3, p0, Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation$2;->val$done:Ljava/lang/Integer;

    iput-object p4, p0, Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation$2;->val$total:Ljava/lang/Integer;

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation$2;->val$status:Ljava/lang/String;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "Loading"

    .line 74
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation$2;->val$done:Ljava/lang/Integer;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation$2;->val$total:Ljava/lang/Integer;

    if-eqz v1, :cond_1

    .line 75
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-lez v1, :cond_1

    .line 77
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation$2;->val$done:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation$2;->val$total:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    const/high16 v4, 0x42c80000    # 100.0f

    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, " %.1f%%"

    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    const-string/jumbo v1, "\u2026"

    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation$2;->this$0:Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation;

    .line 80
    invoke-static {v1}, Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation;->-$$Nest$fgetmDevLoadingView(Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation;)Landroid/widget/TextView;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation$2;->this$0:Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation;

    .line 81
    invoke-static {v1}, Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation;->-$$Nest$fgetmDevLoadingView(Lcom/facebook/react/devsupport/DefaultDevLoadingViewImplementation;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    return-void
.end method
