.class Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$1;
.super Ljava/lang/Object;
.source "UIManagerModuleWrapper.java"

# interfaces
.implements Lcom/facebook/react/uimanager/UIBlock;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/adapters/react/services/UIManagerModuleWrapper;->addUIBlock(ILexpo/modules/core/interfaces/services/UIManager$UIBlock;Ljava/lang/Class;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lexpo/modules/adapters/react/services/UIManagerModuleWrapper;

.field final synthetic val$block:Lexpo/modules/core/interfaces/services/UIManager$UIBlock;

.field final synthetic val$tClass:Ljava/lang/Class;

.field final synthetic val$tag:I


# direct methods
.method constructor <init>(Lexpo/modules/adapters/react/services/UIManagerModuleWrapper;ILexpo/modules/core/interfaces/services/UIManager$UIBlock;Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$1;->this$0:Lexpo/modules/adapters/react/services/UIManagerModuleWrapper;

    iput p2, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$1;->val$tag:I

    iput-object p3, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$1;->val$block:Lexpo/modules/core/interfaces/services/UIManager$UIBlock;

    iput-object p4, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$1;->val$tClass:Ljava/lang/Class;

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Lcom/facebook/react/uimanager/NativeViewHierarchyManager;)V
    .locals 4

    const-string v0, "Expected view to be of "

    iget v1, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$1;->val$tag:I

    .line 62
    invoke-virtual {p1, v1}, Lcom/facebook/react/uimanager/NativeViewHierarchyManager;->resolveView(I)Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$1;->val$block:Lexpo/modules/core/interfaces/services/UIManager$UIBlock;

    .line 64
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Expected view for this tag not to be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v0}, Lexpo/modules/core/interfaces/services/UIManager$UIBlock;->reject(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    :try_start_0
    iget-object v1, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$1;->val$tClass:Ljava/lang/Class;

    .line 67
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v0, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$1;->val$block:Lexpo/modules/core/interfaces/services/UIManager$UIBlock;

    iget-object v1, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$1;->val$tClass:Ljava/lang/Class;

    .line 68
    invoke-virtual {v1, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Lexpo/modules/core/interfaces/services/UIManager$UIBlock;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$1;->val$block:Lexpo/modules/core/interfaces/services/UIManager$UIBlock;

    .line 70
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$1;->val$tClass:Ljava/lang/Class;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "; found "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " instead"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 70
    invoke-interface {v1, v2}, Lexpo/modules/core/interfaces/services/UIManager$UIBlock;->reject(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object v0, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$1;->val$block:Lexpo/modules/core/interfaces/services/UIManager$UIBlock;

    .line 74
    invoke-interface {v0, p1}, Lexpo/modules/core/interfaces/services/UIManager$UIBlock;->reject(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
