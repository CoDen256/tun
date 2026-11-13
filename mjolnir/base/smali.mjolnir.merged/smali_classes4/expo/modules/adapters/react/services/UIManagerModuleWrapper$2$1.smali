.class Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$2$1;
.super Ljava/lang/Object;
.source "UIManagerModuleWrapper.java"

# interfaces
.implements Lexpo/modules/core/interfaces/services/UIManager$ViewHolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$2;->execute(Lcom/facebook/react/uimanager/NativeViewHierarchyManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$2;

.field final synthetic val$nativeViewHierarchyManager:Lcom/facebook/react/uimanager/NativeViewHierarchyManager;


# direct methods
.method constructor <init>(Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$2;Lcom/facebook/react/uimanager/NativeViewHierarchyManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$2$1;->this$1:Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$2;

    iput-object p2, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$2$1;->val$nativeViewHierarchyManager:Lcom/facebook/react/uimanager/NativeViewHierarchyManager;

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get(Ljava/lang/Object;)Landroid/view/View;
    .locals 3

    .line 89
    instance-of v0, p1, Ljava/lang/Number;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lexpo/modules/adapters/react/services/UIManagerModuleWrapper$2$1;->val$nativeViewHierarchyManager:Lcom/facebook/react/uimanager/NativeViewHierarchyManager;

    .line 91
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/facebook/react/uimanager/NativeViewHierarchyManager;->resolveView(I)Landroid/view/View;

    move-result-object p1
    :try_end_0
    .catch Lcom/facebook/react/uimanager/IllegalViewOperationException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    return-object v1

    .line 96
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Provided tag is of class "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " whereas React expects tags to be integers. Are you sure you\'re providing proper argument to addUIBlock?"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "E_INVALID_TAG"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1
.end method
