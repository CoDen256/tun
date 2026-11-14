.class Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule$GraphRequestCallback;
.super Ljava/lang/Object;
.source "FBGraphRequestModule.java"

# interfaces
.implements Lcom/facebook/GraphRequest$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GraphRequestCallback"
.end annotation


# instance fields
.field private mBatchID:I

.field private mIndex:Ljava/lang/String;

.field final synthetic this$0:Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;


# direct methods
.method public constructor <init>(Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;II)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule$GraphRequestCallback;->this$0:Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule$GraphRequestCallback;->mIndex:Ljava/lang/String;

    iput p3, p0, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule$GraphRequestCallback;->mBatchID:I

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/GraphResponse;)V
    .locals 3

    .line 92
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule$GraphRequestCallback;->this$0:Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;

    .line 93
    invoke-virtual {p1}, Lcom/facebook/GraphResponse;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->-$$Nest$mbuildFacebookRequestError(Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;Lcom/facebook/FacebookRequestError;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/WritableArray;->pushMap(Lcom/facebook/react/bridge/ReadableMap;)V

    iget-object v1, p0, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule$GraphRequestCallback;->this$0:Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;

    .line 94
    invoke-static {v1, p1}, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->-$$Nest$mbuildGraphResponse(Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;Lcom/facebook/GraphResponse;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/facebook/react/bridge/WritableArray;->pushMap(Lcom/facebook/react/bridge/ReadableMap;)V

    iget-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule$GraphRequestCallback;->this$0:Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;

    .line 95
    invoke-static {p1}, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->-$$Nest$fgetmResponses(Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;)Landroid/util/SparseArray;

    move-result-object p1

    iget v1, p0, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule$GraphRequestCallback;->mBatchID:I

    invoke-virtual {p1, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/bridge/WritableMap;

    iget-object v1, p0, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule$GraphRequestCallback;->mIndex:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    return-void
.end method
