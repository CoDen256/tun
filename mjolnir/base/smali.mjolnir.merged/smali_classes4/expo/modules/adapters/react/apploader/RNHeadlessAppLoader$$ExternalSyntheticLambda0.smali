.class public final synthetic Lexpo/modules/adapters/react/apploader/RNHeadlessAppLoader$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/facebook/react/ReactInstanceManager;

.field public final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/react/ReactInstanceManager;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/adapters/react/apploader/RNHeadlessAppLoader$$ExternalSyntheticLambda0;->f$0:Lcom/facebook/react/ReactInstanceManager;

    iput-object p2, p0, Lexpo/modules/adapters/react/apploader/RNHeadlessAppLoader$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lexpo/modules/adapters/react/apploader/RNHeadlessAppLoader$$ExternalSyntheticLambda0;->f$0:Lcom/facebook/react/ReactInstanceManager;

    iget-object v1, p0, Lexpo/modules/adapters/react/apploader/RNHeadlessAppLoader$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    invoke-static {v0, v1}, Lexpo/modules/adapters/react/apploader/RNHeadlessAppLoader;->$r8$lambda$zHL-Vj9_NdT_XdmDyzN5TICOzj0(Lcom/facebook/react/ReactInstanceManager;Ljava/lang/String;)V

    return-void
.end method
