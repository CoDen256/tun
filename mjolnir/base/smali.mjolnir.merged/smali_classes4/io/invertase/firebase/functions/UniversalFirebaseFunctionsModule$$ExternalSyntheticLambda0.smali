.class public final synthetic Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Lcom/facebook/react/bridge/ReadableMap;

.field public final synthetic f$4:Ljava/lang/String;

.field public final synthetic f$5:Ljava/lang/Integer;

.field public final synthetic f$6:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iput-object p2, p0, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;->f$2:Ljava/lang/String;

    iput-object p4, p0, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;->f$3:Lcom/facebook/react/bridge/ReadableMap;

    iput-object p5, p0, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;->f$4:Ljava/lang/String;

    iput-object p6, p0, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;->f$5:Ljava/lang/Integer;

    iput-object p7, p0, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;->f$6:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 7

    iget-object v0, p0, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iget-object v1, p0, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;->f$2:Ljava/lang/String;

    iget-object v3, p0, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;->f$3:Lcom/facebook/react/bridge/ReadableMap;

    iget-object v4, p0, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;->f$4:Ljava/lang/String;

    iget-object v5, p0, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;->f$5:Ljava/lang/Integer;

    iget-object v6, p0, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule$$ExternalSyntheticLambda0;->f$6:Ljava/lang/Object;

    invoke-static/range {v0 .. v6}, Lio/invertase/firebase/functions/UniversalFirebaseFunctionsModule;->lambda$httpsCallableFromUrl$1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
