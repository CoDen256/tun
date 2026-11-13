.class public final synthetic Lexpo/modules/kotlin/allocators/ObjectConstructorFactory$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lexpo/modules/kotlin/allocators/ObjectConstructor;


# instance fields
.field public final synthetic f$0:Ljava/lang/reflect/Constructor;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/reflect/Constructor;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/allocators/ObjectConstructorFactory$$ExternalSyntheticLambda0;->f$0:Ljava/lang/reflect/Constructor;

    return-void
.end method


# virtual methods
.method public final construct()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/allocators/ObjectConstructorFactory$$ExternalSyntheticLambda0;->f$0:Ljava/lang/reflect/Constructor;

    invoke-static {v0}, Lexpo/modules/kotlin/allocators/ObjectConstructorFactory;->$r8$lambda$gMs_IWj-D5ge4e5bnXBbdh78BEc(Ljava/lang/reflect/Constructor;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
