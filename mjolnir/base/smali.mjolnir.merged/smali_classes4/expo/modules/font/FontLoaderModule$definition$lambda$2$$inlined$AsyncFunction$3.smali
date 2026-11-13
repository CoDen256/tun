.class public final Lexpo/modules/font/FontLoaderModule$definition$lambda$2$$inlined$AsyncFunction$3;
.super Lkotlin/jvm/internal/Lambda;
.source "ObjectDefinitionBuilder.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/font/FontLoaderModule;->definition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "[",
        "Ljava/lang/Object;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nObjectDefinitionBuilder.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$8\n+ 2 EnforceType.kt\nexpo/modules/kotlin/types/EnforceTypeKt\n+ 3 FontLoaderModule.kt\nexpo/modules/font/FontLoaderModule\n+ 4 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 5 AppContext.kt\nexpo/modules/kotlin/AppContext\n*L\n1#1,505:1\n15#2,4:506\n36#3,10:510\n46#3,6:521\n52#3,4:531\n1#4:520\n207#5,4:527\n*S KotlinDebug\n*F\n+ 1 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$8\n+ 2 FontLoaderModule.kt\nexpo/modules/font/FontLoaderModule\n*L\n233#1:506,4\n51#2:527,4\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0008\u0005\n\u0002\u0010\u0011\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0010\u0000\u001a\u0002H\u0001\"\u0006\u0008\u0000\u0010\u0001\u0018\u0001\"\u0006\u0008\u0001\u0010\u0002\u0018\u0001\"\u0006\u0008\u0002\u0010\u0003\u0018\u00012\u0010\u0010\u0004\u001a\u000c\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\u00060\u0005H\n\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "<anonymous>",
        "R",
        "P0",
        "P1",
        "<name for destructuring parameter 0>",
        "",
        "",
        "invoke",
        "([Ljava/lang/Object;)Ljava/lang/Object;",
        "expo/modules/kotlin/objects/ObjectDefinitionBuilder$AsyncFunction$8"
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
.field final synthetic this$0:Lexpo/modules/font/FontLoaderModule;


# direct methods
.method public constructor <init>(Lexpo/modules/font/FontLoaderModule;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/font/FontLoaderModule$definition$lambda$2$$inlined$AsyncFunction$3;->this$0:Lexpo/modules/font/FontLoaderModule;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 232
    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lexpo/modules/font/FontLoaderModule$definition$lambda$2$$inlined$AsyncFunction$3;->invoke([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invoke([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Lkotlin/Unit;"
        }
    .end annotation

    const-string v0, "<name for destructuring parameter 0>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 232
    aget-object v1, p1, v0

    const/4 v2, 0x1

    aget-object p1, p1, v2

    .line 234
    check-cast p1, Ljava/lang/String;

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lexpo/modules/font/FontLoaderModule$definition$lambda$2$$inlined$AsyncFunction$3;->this$0:Lexpo/modules/font/FontLoaderModule;

    .line 510
    invoke-virtual {v2}, Lexpo/modules/font/FontLoaderModule;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v2

    invoke-virtual {v2}, Lexpo/modules/kotlin/AppContext;->getReactContext()Landroid/content/Context;

    move-result-object v2

    if-eqz v2, :cond_3

    const-string v3, "asset://"

    const/4 v4, 0x2

    const/4 v5, 0x0

    .line 513
    invoke-static {p1, v3, v0, v4, v5}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 515
    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    const/16 v3, 0x9

    .line 516
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const-string v3, "substring(...)"

    invoke-static {p1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 514
    invoke-static {v2, p1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p1

    .line 513
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    goto :goto_0

    .line 519
    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    new-instance p1, Ljava/io/File;

    invoke-direct {p1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 523
    invoke-static {p1}, Landroid/graphics/Typeface;->createFromFile(Ljava/io/File;)Landroid/graphics/Typeface;

    move-result-object p1

    .line 518
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    :goto_0
    iget-object v2, p0, Lexpo/modules/font/FontLoaderModule$definition$lambda$2$$inlined$AsyncFunction$3;->this$0:Lexpo/modules/font/FontLoaderModule;

    .line 526
    invoke-virtual {v2}, Lexpo/modules/font/FontLoaderModule;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v2

    .line 528
    :try_start_0
    invoke-virtual {v2}, Lexpo/modules/kotlin/AppContext;->getLegacyModuleRegistry()Lexpo/modules/core/ModuleRegistry;

    move-result-object v2

    const-class v3, Lexpo/modules/interfaces/font/FontManagerInterface;

    invoke-virtual {v2, v3}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 526
    :catch_0
    check-cast v5, Lexpo/modules/interfaces/font/FontManagerInterface;

    if-eqz v5, :cond_1

    iget-object v2, p0, Lexpo/modules/font/FontLoaderModule$definition$lambda$2$$inlined$AsyncFunction$3;->this$0:Lexpo/modules/font/FontLoaderModule;

    .line 533
    invoke-virtual {v2}, Lexpo/modules/font/FontLoaderModule;->getPrefix()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v5, v1, v0, p1}, Lexpo/modules/interfaces/font/FontManagerInterface;->setTypeface(Ljava/lang/String;ILandroid/graphics/Typeface;)V

    .line 534
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    .line 531
    :cond_1
    new-instance p1, Lexpo/modules/font/FontManagerInterfaceNotFoundException;

    invoke-direct {p1}, Lexpo/modules/font/FontManagerInterfaceNotFoundException;-><init>()V

    throw p1

    .line 521
    :cond_2
    new-instance v0, Lexpo/modules/font/FileNotFoundException;

    invoke-direct {v0, p1}, Lexpo/modules/font/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 510
    :cond_3
    new-instance p1, Lexpo/modules/kotlin/exception/Exceptions$ReactContextLost;

    invoke-direct {p1}, Lexpo/modules/kotlin/exception/Exceptions$ReactContextLost;-><init>()V

    throw p1
.end method
