.class final Lexpo/modules/kotlin/records/RecordTypeConverter$propertyDescriptors$2;
.super Lkotlin/jvm/internal/Lambda;
.source "RecordTypeConverter.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/records/RecordTypeConverter;-><init>(Lexpo/modules/kotlin/types/TypeConverterProvider;Lkotlin/reflect/KType;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Ljava/util/Map<",
        "Lkotlin/reflect/KProperty1<",
        "+",
        "Ljava/lang/Object;",
        "*>;+",
        "Lexpo/modules/kotlin/records/RecordTypeConverter$PropertyDescriptor;",
        ">;>;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nRecordTypeConverter.kt\nKotlin\n*S Kotlin\n*F\n+ 1 RecordTypeConverter.kt\nexpo/modules/kotlin/records/RecordTypeConverter$propertyDescriptors$2\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 KAnnotatedElements.kt\nkotlin/reflect/full/KAnnotatedElements\n*L\n1#1,133:1\n1549#2:134\n1620#2,2:135\n288#2,2:138\n288#2,2:141\n1622#2:143\n20#3:137\n20#3:140\n*S KotlinDebug\n*F\n+ 1 RecordTypeConverter.kt\nexpo/modules/kotlin/records/RecordTypeConverter$propertyDescriptors$2\n*L\n33#1:134\n33#1:135,2\n34#1:138,2\n40#1:141,2\n33#1:143\n34#1:137\n40#1:140\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0000\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u001a\u0012\u0010\u0012\u000e\u0012\u0006\u0008\u0001\u0012\u00020\u0003\u0012\u0002\u0008\u00030\u0002\u0012\u0004\u0012\u00020\u00040\u0001\"\u0008\u0008\u0000\u0010\u0005*\u00020\u0006H\n\u00a2\u0006\u0002\u0008\u0007"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lkotlin/reflect/KProperty1;",
        "",
        "Lexpo/modules/kotlin/records/RecordTypeConverter$PropertyDescriptor;",
        "T",
        "Lexpo/modules/kotlin/records/Record;",
        "invoke"
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
.field final synthetic this$0:Lexpo/modules/kotlin/records/RecordTypeConverter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lexpo/modules/kotlin/records/RecordTypeConverter<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lexpo/modules/kotlin/records/RecordTypeConverter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/records/RecordTypeConverter<",
            "TT;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/kotlin/records/RecordTypeConverter$propertyDescriptors$2;->this$0:Lexpo/modules/kotlin/records/RecordTypeConverter;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 30
    invoke-virtual {p0}, Lexpo/modules/kotlin/records/RecordTypeConverter$propertyDescriptors$2;->invoke()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public final invoke()Ljava/util/Map;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lkotlin/reflect/KProperty1<",
            "+",
            "Ljava/lang/Object;",
            "*>;",
            "Lexpo/modules/kotlin/records/RecordTypeConverter$PropertyDescriptor;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/records/RecordTypeConverter$propertyDescriptors$2;->this$0:Lexpo/modules/kotlin/records/RecordTypeConverter;

    .line 31
    invoke-virtual {v0}, Lexpo/modules/kotlin/records/RecordTypeConverter;->getType()Lkotlin/reflect/KType;

    move-result-object v0

    invoke-interface {v0}, Lkotlin/reflect/KType;->getClassifier()Lkotlin/reflect/KClassifier;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type kotlin.reflect.KClass<*>"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lkotlin/reflect/KClass;

    .line 32
    invoke-static {v0}, Lkotlin/reflect/full/KClasses;->getMemberProperties(Lkotlin/reflect/KClass;)Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    iget-object v1, p0, Lexpo/modules/kotlin/records/RecordTypeConverter$propertyDescriptors$2;->this$0:Lexpo/modules/kotlin/records/RecordTypeConverter;

    .line 134
    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v0, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v2, Ljava/util/Collection;

    .line 135
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 136
    check-cast v3, Lkotlin/reflect/KProperty1;

    .line 34
    move-object v4, v3

    check-cast v4, Lkotlin/reflect/KAnnotatedElement;

    .line 137
    invoke-interface {v4}, Lkotlin/reflect/KAnnotatedElement;->getAnnotations()Ljava/util/List;

    move-result-object v5

    check-cast v5, Ljava/lang/Iterable;

    .line 138
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v8, v6

    check-cast v8, Ljava/lang/annotation/Annotation;

    .line 137
    instance-of v8, v8, Lexpo/modules/kotlin/records/Field;

    if-eqz v8, :cond_0

    goto :goto_1

    :cond_1
    move-object v6, v7

    .line 139
    :goto_1
    check-cast v6, Lexpo/modules/kotlin/records/Field;

    check-cast v6, Ljava/lang/annotation/Annotation;

    .line 34
    check-cast v6, Lexpo/modules/kotlin/records/Field;

    if-nez v6, :cond_2

    goto :goto_3

    .line 35
    :cond_2
    invoke-static {v1}, Lexpo/modules/kotlin/records/RecordTypeConverter;->access$getConverterProvider$p(Lexpo/modules/kotlin/records/RecordTypeConverter;)Lexpo/modules/kotlin/types/TypeConverterProvider;

    move-result-object v5

    invoke-interface {v3}, Lkotlin/reflect/KProperty1;->getReturnType()Lkotlin/reflect/KType;

    move-result-object v8

    invoke-interface {v5, v8}, Lexpo/modules/kotlin/types/TypeConverterProvider;->obtainTypeConverter(Lkotlin/reflect/KType;)Lexpo/modules/kotlin/types/TypeConverter;

    move-result-object v5

    .line 140
    invoke-interface {v4}, Lkotlin/reflect/KAnnotatedElement;->getAnnotations()Ljava/util/List;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    .line 141
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    move-object v9, v8

    check-cast v9, Ljava/lang/annotation/Annotation;

    .line 140
    instance-of v9, v9, Lexpo/modules/kotlin/records/Required;

    if-eqz v9, :cond_3

    move-object v7, v8

    .line 142
    :cond_4
    check-cast v7, Lexpo/modules/kotlin/records/Required;

    check-cast v7, Ljava/lang/annotation/Annotation;

    if-eqz v7, :cond_5

    const/4 v4, 0x1

    goto :goto_2

    :cond_5
    const/4 v4, 0x0

    .line 41
    :goto_2
    invoke-static {v1, v3}, Lexpo/modules/kotlin/records/RecordTypeConverter;->access$getValidators(Lexpo/modules/kotlin/records/RecordTypeConverter;Lkotlin/reflect/KProperty1;)Ljava/util/List;

    move-result-object v7

    .line 37
    new-instance v8, Lexpo/modules/kotlin/records/RecordTypeConverter$PropertyDescriptor;

    invoke-direct {v8, v5, v6, v4, v7}, Lexpo/modules/kotlin/records/RecordTypeConverter$PropertyDescriptor;-><init>(Lexpo/modules/kotlin/types/TypeConverter;Lexpo/modules/kotlin/records/Field;ZLjava/util/List;)V

    invoke-static {v3, v8}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v7

    .line 136
    :goto_3
    invoke-interface {v2, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 143
    :cond_6
    check-cast v2, Ljava/util/List;

    .line 134
    check-cast v2, Ljava/lang/Iterable;

    .line 44
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->filterNotNull(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 45
    invoke-static {v0}, Lkotlin/collections/MapsKt;->toMap(Ljava/lang/Iterable;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method
