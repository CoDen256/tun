.class public final synthetic Lexpo/modules/kotlin/views/FilteredReadableMap$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lexpo/modules/kotlin/Filter;


# instance fields
.field public final synthetic f$0:Lexpo/modules/kotlin/views/FilteredReadableMap;


# direct methods
.method public synthetic constructor <init>(Lexpo/modules/kotlin/views/FilteredReadableMap;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/views/FilteredReadableMap$$ExternalSyntheticLambda1;->f$0:Lexpo/modules/kotlin/views/FilteredReadableMap;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Z
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/views/FilteredReadableMap$$ExternalSyntheticLambda1;->f$0:Lexpo/modules/kotlin/views/FilteredReadableMap;

    check-cast p1, Ljava/util/Map$Entry;

    invoke-static {v0, p1}, Lexpo/modules/kotlin/views/FilteredReadableMap;->$r8$lambda$B3rm-O9Sm-J-fhCd3DbjAmzoqJ4(Lexpo/modules/kotlin/views/FilteredReadableMap;Ljava/util/Map$Entry;)Z

    move-result p1

    return p1
.end method
