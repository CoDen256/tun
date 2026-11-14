.class public final synthetic Lexpo/modules/kotlin/functions/AsyncFunction$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lexpo/modules/kotlin/jni/JNIAsyncFunctionBody;


# instance fields
.field public final synthetic f$0:Ljava/lang/ref/WeakReference;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Lexpo/modules/kotlin/functions/AsyncFunction;

.field public final synthetic f$3:Lexpo/modules/kotlin/AppContext;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/ref/WeakReference;Ljava/lang/String;Lexpo/modules/kotlin/functions/AsyncFunction;Lexpo/modules/kotlin/AppContext;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/functions/AsyncFunction$$ExternalSyntheticLambda0;->f$0:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lexpo/modules/kotlin/functions/AsyncFunction$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lexpo/modules/kotlin/functions/AsyncFunction$$ExternalSyntheticLambda0;->f$2:Lexpo/modules/kotlin/functions/AsyncFunction;

    iput-object p4, p0, Lexpo/modules/kotlin/functions/AsyncFunction$$ExternalSyntheticLambda0;->f$3:Lexpo/modules/kotlin/AppContext;

    return-void
.end method


# virtual methods
.method public final invoke([Ljava/lang/Object;Lexpo/modules/kotlin/jni/PromiseImpl;)V
    .locals 6

    iget-object v0, p0, Lexpo/modules/kotlin/functions/AsyncFunction$$ExternalSyntheticLambda0;->f$0:Ljava/lang/ref/WeakReference;

    iget-object v1, p0, Lexpo/modules/kotlin/functions/AsyncFunction$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lexpo/modules/kotlin/functions/AsyncFunction$$ExternalSyntheticLambda0;->f$2:Lexpo/modules/kotlin/functions/AsyncFunction;

    iget-object v3, p0, Lexpo/modules/kotlin/functions/AsyncFunction$$ExternalSyntheticLambda0;->f$3:Lexpo/modules/kotlin/AppContext;

    move-object v4, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Lexpo/modules/kotlin/functions/AsyncFunction;->$r8$lambda$2cett06QSL8fDQUDX3B2PVqUkDE(Ljava/lang/ref/WeakReference;Ljava/lang/String;Lexpo/modules/kotlin/functions/AsyncFunction;Lexpo/modules/kotlin/AppContext;[Ljava/lang/Object;Lexpo/modules/kotlin/jni/PromiseImpl;)V

    return-void
.end method
