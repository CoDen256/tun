.class final Lcom/facebook/react/uimanager/UIViewOperationQueue$UpdateLayoutOperation;
.super Lcom/facebook/react/uimanager/UIViewOperationQueue$ViewOperation;
.source "UIViewOperationQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/react/uimanager/UIViewOperationQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "UpdateLayoutOperation"
.end annotation


# instance fields
.field private final mHeight:I

.field private final mParentTag:I

.field private final mWidth:I

.field private final mX:I

.field private final mY:I

.field final synthetic this$0:Lcom/facebook/react/uimanager/UIViewOperationQueue;


# direct methods
.method public constructor <init>(Lcom/facebook/react/uimanager/UIViewOperationQueue;IIIIII)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$UpdateLayoutOperation;->this$0:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    .line 123
    invoke-direct {p0, p1, p3}, Lcom/facebook/react/uimanager/UIViewOperationQueue$ViewOperation;-><init>(Lcom/facebook/react/uimanager/UIViewOperationQueue;I)V

    iput p2, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$UpdateLayoutOperation;->mParentTag:I

    iput p4, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$UpdateLayoutOperation;->mX:I

    iput p5, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$UpdateLayoutOperation;->mY:I

    iput p6, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$UpdateLayoutOperation;->mWidth:I

    iput p7, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$UpdateLayoutOperation;->mHeight:I

    const-string/jumbo p1, "updateLayout"

    .line 129
    iget p2, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$UpdateLayoutOperation;->mTag:I

    const-wide/16 p3, 0x0

    invoke-static {p3, p4, p1, p2}, Lcom/facebook/systrace/Systrace;->startAsyncFlow(JLjava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public execute()V
    .locals 8

    const-string/jumbo v0, "updateLayout"

    .line 134
    iget v1, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$UpdateLayoutOperation;->mTag:I

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Lcom/facebook/systrace/Systrace;->endAsyncFlow(JLjava/lang/String;I)V

    iget-object v0, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$UpdateLayoutOperation;->this$0:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    .line 135
    invoke-static {v0}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->-$$Nest$fgetmNativeViewHierarchyManager(Lcom/facebook/react/uimanager/UIViewOperationQueue;)Lcom/facebook/react/uimanager/NativeViewHierarchyManager;

    move-result-object v1

    iget v2, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$UpdateLayoutOperation;->mParentTag:I

    iget v3, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$UpdateLayoutOperation;->mTag:I

    iget v4, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$UpdateLayoutOperation;->mX:I

    iget v5, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$UpdateLayoutOperation;->mY:I

    iget v6, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$UpdateLayoutOperation;->mWidth:I

    iget v7, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$UpdateLayoutOperation;->mHeight:I

    invoke-virtual/range {v1 .. v7}, Lcom/facebook/react/uimanager/NativeViewHierarchyManager;->updateLayout(IIIIII)V

    return-void
.end method
