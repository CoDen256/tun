.class public final Lexpo/modules/kotlin/records/RecordTypeConverter;
.super Lexpo/modules/kotlin/types/DynamicAwareTypeConverters;
.source "RecordTypeConverter.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/kotlin/records/RecordTypeConverter$PropertyDescriptor;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lexpo/modules/kotlin/records/Record;",
        ">",
        "Lexpo/modules/kotlin/types/DynamicAwareTypeConverters<",
        "TT;>;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nRecordTypeConverter.kt\nKotlin\n*S Kotlin\n*F\n+ 1 RecordTypeConverter.kt\nexpo/modules/kotlin/records/RecordTypeConverter\n+ 2 ExceptionDecorator.kt\nexpo/modules/kotlin/exception/ExceptionDecoratorKt\n+ 3 CodedException.kt\nexpo/modules/kotlin/exception/CodedExceptionKt\n+ 4 _Maps.kt\nkotlin/collections/MapsKt___MapsKt\n+ 5 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 6 DynamicExtenstions.kt\nexpo/modules/kotlin/DynamicExtenstionsKt\n+ 7 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 8 KAnnotatedElements.kt\nkotlin/reflect/full/KAnnotatedElements\n*L\n1#1,133:1\n5#2,4:134\n5#2,4:147\n11#3,5:138\n11#3,5:151\n215#4:143\n216#4:159\n1#5:144\n6#6,2:145\n9#6:158\n1855#7,2:156\n1549#7:160\n1620#7,2:161\n288#7,2:164\n1622#7:166\n1549#7:167\n1620#7,3:168\n20#8:163\n*S KotlinDebug\n*F\n+ 1 RecordTypeConverter.kt\nexpo/modules/kotlin/records/RecordTypeConverter\n*L\n48#1:134,4\n85#1:147,4\n48#1:138,5\n85#1:151,5\n71#1:143\n71#1:159\n82#1:145,2\n82#1:158\n92#1:156,2\n114#1:160\n114#1:161,2\n115#1:164,2\n114#1:166\n120#1:167\n120#1:168,3\n115#1:163\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000n\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u0008\u0012\u0004\u0012\u0002H\u00010\u0003:\u0001,B\u0015\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0002\u0010\u0008J\u0015\u0010\u0016\u001a\u00028\u00002\u0006\u0010\u0017\u001a\u00020\u000eH\u0016\u00a2\u0006\u0002\u0010\u0018J\u0015\u0010\u0019\u001a\u00028\u00002\u0006\u0010\u0017\u001a\u00020\u001aH\u0016\u00a2\u0006\u0002\u0010\u001bJ\u0015\u0010\u001c\u001a\u00028\u00002\u0006\u0010\u001d\u001a\u00020\u001eH\u0002\u00a2\u0006\u0002\u0010\u001fJ\u0008\u0010 \u001a\u00020!H\u0016J\"\u0010\"\u001a\u0008\u0012\u0004\u0012\u0002H\u00010#\"\u0004\u0008\u0001\u0010\u00012\u000c\u0010$\u001a\u0008\u0012\u0004\u0012\u0002H\u00010%H\u0002J&\u0010&\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030(0\'2\u0012\u0010)\u001a\u000e\u0012\u0006\u0008\u0001\u0012\u00020\u000e\u0012\u0002\u0008\u00030\rH\u0002J\u0008\u0010*\u001a\u00020+H\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R3\u0010\u000b\u001a\u001a\u0012\u0010\u0012\u000e\u0012\u0006\u0008\u0001\u0012\u00020\u000e\u0012\u0002\u0008\u00030\r\u0012\u0004\u0012\u00020\u000f0\u000c8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u0013\u001a\u0004\u0008\u0010\u0010\u0011R\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015\u00a8\u0006-"
    }
    d2 = {
        "Lexpo/modules/kotlin/records/RecordTypeConverter;",
        "T",
        "Lexpo/modules/kotlin/records/Record;",
        "Lexpo/modules/kotlin/types/DynamicAwareTypeConverters;",
        "converterProvider",
        "Lexpo/modules/kotlin/types/TypeConverterProvider;",
        "type",
        "Lkotlin/reflect/KType;",
        "(Lexpo/modules/kotlin/types/TypeConverterProvider;Lkotlin/reflect/KType;)V",
        "objectConstructorFactory",
        "Lexpo/modules/kotlin/allocators/ObjectConstructorFactory;",
        "propertyDescriptors",
        "",
        "Lkotlin/reflect/KProperty1;",
        "",
        "Lexpo/modules/kotlin/records/RecordTypeConverter$PropertyDescriptor;",
        "getPropertyDescriptors",
        "()Ljava/util/Map;",
        "propertyDescriptors$delegate",
        "Lkotlin/Lazy;",
        "getType",
        "()Lkotlin/reflect/KType;",
        "convertFromAny",
        "value",
        "(Ljava/lang/Object;)Lexpo/modules/kotlin/records/Record;",
        "convertFromDynamic",
        "Lcom/facebook/react/bridge/Dynamic;",
        "(Lcom/facebook/react/bridge/Dynamic;)Lexpo/modules/kotlin/records/Record;",
        "convertFromReadableMap",
        "jsMap",
        "Lcom/facebook/react/bridge/ReadableMap;",
        "(Lcom/facebook/react/bridge/ReadableMap;)Lexpo/modules/kotlin/records/Record;",
        "getCppRequiredTypes",
        "Lexpo/modules/kotlin/jni/ExpectedType;",
        "getObjectConstructor",
        "Lexpo/modules/kotlin/allocators/ObjectConstructor;",
        "clazz",
        "Ljava/lang/Class;",
        "getValidators",
        "",
        "Lexpo/modules/kotlin/records/FieldValidator;",
        "property",
        "isTrivial",
        "",
        "PropertyDescriptor",
        "expo-modules-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final converterProvider:Lexpo/modules/kotlin/types/TypeConverterProvider;

.field private final objectConstructorFactory:Lexpo/modules/kotlin/allocators/ObjectConstructorFactory;

.field private final propertyDescriptors$delegate:Lkotlin/Lazy;

.field private final type:Lkotlin/reflect/KType;


# direct methods
.method public constructor <init>(Lexpo/modules/kotlin/types/TypeConverterProvider;Lkotlin/reflect/KType;)V
    .locals 1

    const-string v0, "converterProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "type"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    invoke-interface {p2}, Lkotlin/reflect/KType;->isMarkedNullable()Z

    move-result v0

    invoke-direct {p0, v0}, Lexpo/modules/kotlin/types/DynamicAwareTypeConverters;-><init>(Z)V

    iput-object p1, p0, Lexpo/modules/kotlin/records/RecordTypeConverter;->converterProvider:Lexpo/modules/kotlin/types/TypeConverterProvider;

    iput-object p2, p0, Lexpo/modules/kotlin/records/RecordTypeConverter;->type:Lkotlin/reflect/KType;

    .line 29
    new-instance p1, Lexpo/modules/kotlin/allocators/ObjectConstructorFactory;

    invoke-direct {p1}, Lexpo/modules/kotlin/allocators/ObjectConstructorFactory;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/records/RecordTypeConverter;->objectConstructorFactory:Lexpo/modules/kotlin/allocators/ObjectConstructorFactory;

    .line 30
    new-instance p1, Lexpo/modules/kotlin/records/RecordTypeConverter$propertyDescriptors$2;

    invoke-direct {p1, p0}, Lexpo/modules/kotlin/records/RecordTypeConverter$propertyDescriptors$2;-><init>(Lexpo/modules/kotlin/records/RecordTypeConverter;)V

    check-cast p1, Lkotlin/jvm/functions/Function0;

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lexpo/modules/kotlin/records/RecordTypeConverter;->propertyDescriptors$delegate:Lkotlin/Lazy;

    return-void
.end method

.method public static final synthetic access$getConverterProvider$p(Lexpo/modules/kotlin/records/RecordTypeConverter;)Lexpo/modules/kotlin/types/TypeConverterProvider;
    .locals 0

    .line 25
    iget-object p0, p0, Lexpo/modules/kotlin/records/RecordTypeConverter;->converterProvider:Lexpo/modules/kotlin/types/TypeConverterProvider;

    return-object p0
.end method

.method public static final synthetic access$getValidators(Lexpo/modules/kotlin/records/RecordTypeConverter;Lkotlin/reflect/KProperty1;)Ljava/util/List;
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/records/RecordTypeConverter;->getValidators(Lkotlin/reflect/KProperty1;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private final convertFromReadableMap(Lcom/facebook/react/bridge/ReadableMap;)Lexpo/modules/kotlin/records/Record;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReadableMap;",
            ")TT;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/records/RecordTypeConverter;->type:Lkotlin/reflect/KType;

    .line 67
    invoke-interface {v0}, Lkotlin/reflect/KType;->getClassifier()Lkotlin/reflect/KClassifier;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type kotlin.reflect.KClass<*>"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lkotlin/reflect/KClass;

    .line 68
    invoke-static {v0}, Lkotlin/jvm/JvmClassMappingKt;->getJavaClass(Lkotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p0, v0}, Lexpo/modules/kotlin/records/RecordTypeConverter;->getObjectConstructor(Ljava/lang/Class;)Lexpo/modules/kotlin/allocators/ObjectConstructor;

    move-result-object v0

    invoke-interface {v0}, Lexpo/modules/kotlin/allocators/ObjectConstructor;->construct()Ljava/lang/Object;

    move-result-object v0

    .line 70
    invoke-direct {p0}, Lexpo/modules/kotlin/records/RecordTypeConverter;->getPropertyDescriptors()Ljava/util/Map;

    move-result-object v1

    .line 143
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 71
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lkotlin/reflect/KProperty1;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lexpo/modules/kotlin/records/RecordTypeConverter$PropertyDescriptor;

    .line 72
    invoke-virtual {v2}, Lexpo/modules/kotlin/records/RecordTypeConverter$PropertyDescriptor;->getFieldAnnotation()Lexpo/modules/kotlin/records/Field;

    move-result-object v4

    invoke-interface {v4}, Lexpo/modules/kotlin/records/Field;->key()Ljava/lang/String;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Ljava/lang/CharSequence;

    invoke-static {v5}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v5

    const/4 v6, 0x0

    if-nez v5, :cond_0

    goto :goto_1

    :cond_0
    move-object v4, v6

    :goto_1
    if-nez v4, :cond_1

    invoke-interface {v3}, Lkotlin/reflect/KProperty1;->getName()Ljava/lang/String;

    move-result-object v4

    .line 74
    :cond_1
    invoke-interface {p1, v4}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 75
    invoke-virtual {v2}, Lexpo/modules/kotlin/records/RecordTypeConverter$PropertyDescriptor;->isRequired()Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0

    .line 76
    :cond_2
    new-instance p1, Lexpo/modules/kotlin/exception/FieldRequiredException;

    invoke-direct {p1, v3}, Lexpo/modules/kotlin/exception/FieldRequiredException;-><init>(Lkotlin/reflect/KProperty1;)V

    throw p1

    .line 82
    :cond_3
    invoke-interface {p1, v4}, Lcom/facebook/react/bridge/ReadableMap;->getDynamic(Ljava/lang/String;)Lcom/facebook/react/bridge/Dynamic;

    move-result-object v4

    const-string v5, "getDynamic(...)"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    :try_start_0
    move-object v5, v3

    check-cast v5, Lkotlin/reflect/KProperty;

    invoke-static {v5}, Lkotlin/reflect/jvm/ReflectJvmMapping;->getJavaField(Lkotlin/reflect/KProperty;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 86
    :try_start_1
    invoke-virtual {v2}, Lexpo/modules/kotlin/records/RecordTypeConverter$PropertyDescriptor;->getTypeConverter()Lexpo/modules/kotlin/types/TypeConverter;

    move-result-object v7

    const/4 v8, 0x2

    invoke-static {v7, v4, v6, v8, v6}, Lexpo/modules/kotlin/types/TypeConverter;->convert$default(Lexpo/modules/kotlin/types/TypeConverter;Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v3, :cond_4

    .line 91
    :try_start_2
    invoke-virtual {v2}, Lexpo/modules/kotlin/records/RecordTypeConverter$PropertyDescriptor;->getValidators()Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    .line 156
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lexpo/modules/kotlin/records/FieldValidator;

    const-string v7, "null cannot be cast to non-null type expo.modules.kotlin.records.FieldValidator<kotlin.Any>"

    .line 94
    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v6, v3}, Lexpo/modules/kotlin/records/FieldValidator;->validate(Ljava/lang/Object;)V

    goto :goto_2

    :cond_4
    const/4 v2, 0x1

    .line 98
    invoke-virtual {v5, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 99
    invoke-virtual {v5, v0, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 100
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 158
    invoke-interface {v4}, Lcom/facebook/react/bridge/Dynamic;->recycle()V

    goto/16 :goto_0

    :catchall_0
    move-exception p1

    .line 152
    :try_start_3
    instance-of v0, p1, Lexpo/modules/kotlin/exception/CodedException;

    if-nez v0, :cond_6

    .line 153
    instance-of v0, p1, Lexpo/modules/core/errors/CodedException;

    if-eqz v0, :cond_5

    new-instance v0, Lexpo/modules/kotlin/exception/CodedException;

    move-object v1, p1

    check-cast v1, Lexpo/modules/core/errors/CodedException;

    invoke-virtual {v1}, Lexpo/modules/core/errors/CodedException;->getCode()Ljava/lang/String;

    move-result-object v1

    const-string v2, "getCode(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lexpo/modules/kotlin/exception/CodedException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    .line 154
    :cond_5
    new-instance v0, Lexpo/modules/kotlin/exception/UnexpectedException;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/exception/UnexpectedException;-><init>(Ljava/lang/Throwable;)V

    check-cast v0, Lexpo/modules/kotlin/exception/CodedException;

    goto :goto_3

    .line 152
    :cond_6
    move-object v0, p1

    check-cast v0, Lexpo/modules/kotlin/exception/CodedException;

    .line 85
    :goto_3
    new-instance p1, Lexpo/modules/kotlin/exception/FieldCastException;

    invoke-interface {v3}, Lkotlin/reflect/KProperty1;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3}, Lkotlin/reflect/KProperty1;->getReturnType()Lkotlin/reflect/KType;

    move-result-object v2

    invoke-interface {v4}, Lcom/facebook/react/bridge/Dynamic;->getType()Lcom/facebook/react/bridge/ReadableType;

    move-result-object v3

    const-string v5, "getType(...)"

    invoke-static {v3, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p1, v1, v2, v3, v0}, Lexpo/modules/kotlin/exception/FieldCastException;-><init>(Ljava/lang/String;Lkotlin/reflect/KType;Lcom/facebook/react/bridge/ReadableType;Lexpo/modules/kotlin/exception/CodedException;)V

    check-cast p1, Ljava/lang/Throwable;

    .line 150
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception p1

    .line 158
    invoke-interface {v4}, Lcom/facebook/react/bridge/Dynamic;->recycle()V

    throw p1

    :cond_7
    const-string p1, "null cannot be cast to non-null type T of expo.modules.kotlin.records.RecordTypeConverter"

    .line 104
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lexpo/modules/kotlin/records/Record;

    return-object v0
.end method

.method private final getObjectConstructor(Ljava/lang/Class;)Lexpo/modules/kotlin/allocators/ObjectConstructor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lexpo/modules/kotlin/allocators/ObjectConstructor<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/records/RecordTypeConverter;->objectConstructorFactory:Lexpo/modules/kotlin/allocators/ObjectConstructorFactory;

    .line 108
    invoke-virtual {v0, p1}, Lexpo/modules/kotlin/allocators/ObjectConstructorFactory;->get(Ljava/lang/Class;)Lexpo/modules/kotlin/allocators/ObjectConstructor;

    move-result-object p1

    return-object p1
.end method

.method private final getPropertyDescriptors()Ljava/util/Map;
    .locals 1
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

    iget-object v0, p0, Lexpo/modules/kotlin/records/RecordTypeConverter;->propertyDescriptors$delegate:Lkotlin/Lazy;

    .line 30
    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    return-object v0
.end method

.method private final getValidators(Lkotlin/reflect/KProperty1;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/reflect/KProperty1<",
            "+",
            "Ljava/lang/Object;",
            "*>;)",
            "Ljava/util/List<",
            "Lexpo/modules/kotlin/records/FieldValidator<",
            "*>;>;"
        }
    .end annotation

    .line 113
    invoke-interface {p1}, Lkotlin/reflect/KProperty1;->getAnnotations()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 160
    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v0, v2}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v1, Ljava/util/Collection;

    .line 161
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 162
    check-cast v3, Ljava/lang/annotation/Annotation;

    .line 115
    invoke-static {v3}, Lkotlin/jvm/JvmClassMappingKt;->getAnnotationClass(Ljava/lang/annotation/Annotation;)Lkotlin/reflect/KClass;

    move-result-object v4

    check-cast v4, Lkotlin/reflect/KAnnotatedElement;

    .line 163
    invoke-interface {v4}, Lkotlin/reflect/KAnnotatedElement;->getAnnotations()Ljava/util/List;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    .line 164
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v7, v5

    check-cast v7, Ljava/lang/annotation/Annotation;

    .line 163
    instance-of v7, v7, Lexpo/modules/kotlin/records/BindUsing;

    if-eqz v7, :cond_0

    goto :goto_1

    :cond_1
    move-object v5, v6

    .line 165
    :goto_1
    check-cast v5, Lexpo/modules/kotlin/records/BindUsing;

    check-cast v5, Ljava/lang/annotation/Annotation;

    .line 115
    check-cast v5, Lexpo/modules/kotlin/records/BindUsing;

    if-nez v5, :cond_2

    goto :goto_2

    .line 117
    :cond_2
    invoke-static {v3, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v6

    .line 162
    :goto_2
    invoke-interface {v1, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 166
    :cond_3
    check-cast v1, Ljava/util/List;

    .line 160
    check-cast v1, Ljava/lang/Iterable;

    .line 119
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->filterNotNull(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 167
    new-instance v1, Ljava/util/ArrayList;

    invoke-static {v0, v2}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v1, Ljava/util/Collection;

    .line 168
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 169
    check-cast v2, Lkotlin/Pair;

    .line 120
    invoke-virtual {v2}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/annotation/Annotation;

    invoke-virtual {v2}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lexpo/modules/kotlin/records/BindUsing;

    .line 121
    invoke-interface {v2}, Lexpo/modules/kotlin/records/BindUsing;->binder()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    invoke-static {v2}, Lkotlin/reflect/full/KClasses;->createInstance(Lkotlin/reflect/KClass;)Ljava/lang/Object;

    move-result-object v2

    const-string v4, "null cannot be cast to non-null type expo.modules.kotlin.records.ValidationBinder"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Lexpo/modules/kotlin/records/ValidationBinder;

    .line 122
    invoke-interface {p1}, Lkotlin/reflect/KProperty1;->getReturnType()Lkotlin/reflect/KType;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lexpo/modules/kotlin/records/ValidationBinder;->bind(Ljava/lang/annotation/Annotation;Lkotlin/reflect/KType;)Lexpo/modules/kotlin/records/FieldValidator;

    move-result-object v2

    .line 169
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 170
    :cond_4
    check-cast v1, Ljava/util/List;

    return-object v1
.end method


# virtual methods
.method public convertFromAny(Ljava/lang/Object;)Lexpo/modules/kotlin/records/Record;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 54
    instance-of v0, p1, Lcom/facebook/react/bridge/ReadableMap;

    if-eqz v0, :cond_0

    .line 55
    check-cast p1, Lcom/facebook/react/bridge/ReadableMap;

    invoke-direct {p0, p1}, Lexpo/modules/kotlin/records/RecordTypeConverter;->convertFromReadableMap(Lcom/facebook/react/bridge/ReadableMap;)Lexpo/modules/kotlin/records/Record;

    move-result-object p1

    return-object p1

    .line 59
    :cond_0
    check-cast p1, Lexpo/modules/kotlin/records/Record;

    return-object p1
.end method

.method public bridge synthetic convertFromAny(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 25
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/records/RecordTypeConverter;->convertFromAny(Ljava/lang/Object;)Lexpo/modules/kotlin/records/Record;

    move-result-object p1

    return-object p1
.end method

.method public convertFromDynamic(Lcom/facebook/react/bridge/Dynamic;)Lexpo/modules/kotlin/records/Record;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/Dynamic;",
            ")TT;"
        }
    .end annotation

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    :try_start_0
    invoke-interface {p1}, Lcom/facebook/react/bridge/Dynamic;->asMap()Lcom/facebook/react/bridge/ReadableMap;

    move-result-object p1

    .line 50
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lexpo/modules/kotlin/records/RecordTypeConverter;->convertFromReadableMap(Lcom/facebook/react/bridge/ReadableMap;)Lexpo/modules/kotlin/records/Record;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p1

    :catchall_0
    move-exception p1

    .line 139
    instance-of v0, p1, Lexpo/modules/kotlin/exception/CodedException;

    if-nez v0, :cond_1

    .line 140
    instance-of v0, p1, Lexpo/modules/core/errors/CodedException;

    if-eqz v0, :cond_0

    new-instance v0, Lexpo/modules/kotlin/exception/CodedException;

    move-object v1, p1

    check-cast v1, Lexpo/modules/core/errors/CodedException;

    invoke-virtual {v1}, Lexpo/modules/core/errors/CodedException;->getCode()Ljava/lang/String;

    move-result-object v1

    const-string v2, "getCode(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lexpo/modules/kotlin/exception/CodedException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 141
    :cond_0
    new-instance v0, Lexpo/modules/kotlin/exception/UnexpectedException;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/exception/UnexpectedException;-><init>(Ljava/lang/Throwable;)V

    check-cast v0, Lexpo/modules/kotlin/exception/CodedException;

    goto :goto_0

    .line 139
    :cond_1
    move-object v0, p1

    check-cast v0, Lexpo/modules/kotlin/exception/CodedException;

    .line 48
    :goto_0
    new-instance p1, Lexpo/modules/kotlin/exception/RecordCastException;

    iget-object v1, p0, Lexpo/modules/kotlin/records/RecordTypeConverter;->type:Lkotlin/reflect/KType;

    invoke-direct {p1, v1, v0}, Lexpo/modules/kotlin/exception/RecordCastException;-><init>(Lkotlin/reflect/KType;Lexpo/modules/kotlin/exception/CodedException;)V

    check-cast p1, Ljava/lang/Throwable;

    .line 137
    throw p1
.end method

.method public bridge synthetic convertFromDynamic(Lcom/facebook/react/bridge/Dynamic;)Ljava/lang/Object;
    .locals 0

    .line 25
    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/records/RecordTypeConverter;->convertFromDynamic(Lcom/facebook/react/bridge/Dynamic;)Lexpo/modules/kotlin/records/Record;

    move-result-object p1

    return-object p1
.end method

.method public getCppRequiredTypes()Lexpo/modules/kotlin/jni/ExpectedType;
    .locals 4

    .line 62
    new-instance v0, Lexpo/modules/kotlin/jni/ExpectedType;

    const/4 v1, 0x1

    new-array v1, v1, [Lexpo/modules/kotlin/jni/CppType;

    const/4 v2, 0x0

    sget-object v3, Lexpo/modules/kotlin/jni/CppType;->READABLE_MAP:Lexpo/modules/kotlin/jni/CppType;

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    return-object v0
.end method

.method public final getType()Lkotlin/reflect/KType;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/records/RecordTypeConverter;->type:Lkotlin/reflect/KType;

    return-object v0
.end method

.method public isTrivial()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
