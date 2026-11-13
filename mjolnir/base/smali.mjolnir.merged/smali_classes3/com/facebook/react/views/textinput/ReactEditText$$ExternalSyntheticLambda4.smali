.class public final synthetic Lcom/facebook/react/views/textinput/ReactEditText$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/core/util/Predicate;


# instance fields
.field public final synthetic f$0:Lcom/facebook/react/views/textinput/ReactEditText;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/react/views/textinput/ReactEditText;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/views/textinput/ReactEditText$$ExternalSyntheticLambda4;->f$0:Lcom/facebook/react/views/textinput/ReactEditText;

    return-void
.end method


# virtual methods
.method public synthetic and(Landroidx/core/util/Predicate;)Landroidx/core/util/Predicate;
    .locals 0

    invoke-static {p0, p1}, Landroidx/core/util/Predicate$-CC;->$default$and(Landroidx/core/util/Predicate;Landroidx/core/util/Predicate;)Landroidx/core/util/Predicate;

    move-result-object p1

    return-object p1
.end method

.method public synthetic negate()Landroidx/core/util/Predicate;
    .locals 1

    invoke-static {p0}, Landroidx/core/util/Predicate$-CC;->$default$negate(Landroidx/core/util/Predicate;)Landroidx/core/util/Predicate;

    move-result-object v0

    return-object v0
.end method

.method public synthetic or(Landroidx/core/util/Predicate;)Landroidx/core/util/Predicate;
    .locals 0

    invoke-static {p0, p1}, Landroidx/core/util/Predicate$-CC;->$default$or(Landroidx/core/util/Predicate;Landroidx/core/util/Predicate;)Landroidx/core/util/Predicate;

    move-result-object p1

    return-object p1
.end method

.method public final test(Ljava/lang/Object;)Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/textinput/ReactEditText$$ExternalSyntheticLambda4;->f$0:Lcom/facebook/react/views/textinput/ReactEditText;

    check-cast p1, Lcom/facebook/react/views/text/internal/span/ReactUnderlineSpan;

    invoke-static {v0, p1}, Lcom/facebook/react/views/textinput/ReactEditText;->$r8$lambda$jY4YHbaOC6y9DUWoqMHcG9gLSqw(Lcom/facebook/react/views/textinput/ReactEditText;Lcom/facebook/react/views/text/internal/span/ReactUnderlineSpan;)Z

    move-result p1

    return p1
.end method
