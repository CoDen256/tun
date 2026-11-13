.class final Lexpo/modules/kotlin/ModuleHolder$jsObject$2$1$1$1;
.super Ljava/lang/Object;
.source "ModuleHolder.kt"

# interfaces
.implements Lexpo/modules/kotlin/jni/JNIFunctionBody;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/ModuleHolder$jsObject$2;->invoke()Lexpo/modules/kotlin/jni/JavaScriptModuleObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0008\u0002\u0010\u0000\u001a\u0004\u0018\u00010\u0001\"\u0008\u0008\u0000\u0010\u0002*\u00020\u00032\u000e\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0005H\n\u00a2\u0006\u0004\u0008\u0006\u0010\u0007"
    }
    d2 = {
        "<anonymous>",
        "",
        "T",
        "Lexpo/modules/kotlin/modules/Module;",
        "it",
        "",
        "invoke",
        "([Ljava/lang/Object;)Ljava/lang/Object;"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $this_apply:Lexpo/modules/kotlin/jni/JavaScriptModuleObject;


# direct methods
.method constructor <init>(Lexpo/modules/kotlin/jni/JavaScriptModuleObject;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/kotlin/ModuleHolder$jsObject$2$1$1$1;->$this_apply:Lexpo/modules/kotlin/jni/JavaScriptModuleObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    const-string v0, "it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p1, p0, Lexpo/modules/kotlin/ModuleHolder$jsObject$2$1$1$1;->$this_apply:Lexpo/modules/kotlin/jni/JavaScriptModuleObject;

    .line 34
    invoke-virtual {p1}, Lexpo/modules/kotlin/jni/JavaScriptModuleObject;->getName()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
