.class public final Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
.super Ljava/lang/Object;
.source "ImagePipelineConfig.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/core/ImagePipelineConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nImagePipelineConfig.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ImagePipelineConfig.kt\ncom/facebook/imagepipeline/core/ImagePipelineConfig$Builder\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,562:1\n1#2:563\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0092\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008+\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0008\u0010\u0096\u0001\u001a\u00030\u0097\u0001J\u0007\u0010\u0098\u0001\u001a\u00020HJ\u0007\u0010\u0099\u0001\u001a\u000204J\u0007\u0010\u009a\u0001\u001a\u000204J\u001d\u0010\u009b\u0001\u001a\u00020\u00002\u0014\u0010\r\u001a\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u000c\u0018\u00010\nJ\u0017\u0010\u009c\u0001\u001a\u00020\u00002\u000e\u0010\u0011\u001a\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\u0010J\u0011\u0010\u009d\u0001\u001a\u00020\u00002\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u0014J\u0017\u0010\u009e\u0001\u001a\u00020\u00002\u000e\u0010\u001a\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0018J\u0012\u0010\u009f\u0001\u001a\u00020\u00002\t\u0010\u00a0\u0001\u001a\u0004\u0018\u00010\u001dJ\u0012\u0010\u00a1\u0001\u001a\u00020\u00002\t\u0010\u00a2\u0001\u001a\u0004\u0018\u00010\u0006J\u0011\u0010\u00a3\u0001\u001a\u00020\u00002\u0008\u0010\"\u001a\u0004\u0018\u00010!J\u0011\u0010\u00a4\u0001\u001a\u00020\u00002\u0008\u0010&\u001a\u0004\u0018\u00010%J\u000f\u0010\u00a5\u0001\u001a\u00020\u00002\u0006\u0010*\u001a\u00020)J\u0017\u0010\u00a6\u0001\u001a\u00020\u00002\u000e\u00101\u001a\n\u0012\u0004\u0012\u000200\u0018\u00010/J\u000f\u0010\u00a7\u0001\u001a\u00020\u00002\u0006\u00105\u001a\u000204J\u000f\u0010\u00a8\u0001\u001a\u00020\u00002\u0006\u00108\u001a\u000204J\u0017\u0010\u00a9\u0001\u001a\u00020\u00002\u000e\u0010:\u001a\n\u0012\u0004\u0012\u000204\u0018\u00010\u0018J\u001d\u0010\u00aa\u0001\u001a\u00020\u00002\u0014\u0010=\u001a\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020<\u0018\u00010\nJ\u0017\u0010\u00ab\u0001\u001a\u00020\u00002\u000e\u0010?\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0018J\u0012\u0010\u00ac\u0001\u001a\u00020\u00002\t\u0010\u00a0\u0001\u001a\u0004\u0018\u00010\u001dJ\u0013\u0010\u00ad\u0001\u001a\u00020\u00002\n\u0010\u00ae\u0001\u001a\u0005\u0018\u00010\u0090\u0001J\u0011\u0010\u00af\u0001\u001a\u00020\u00002\u0008\u0010D\u001a\u0004\u0018\u00010CJ\u0011\u0010\u00b0\u0001\u001a\u00020\u00002\u0008\u0010L\u001a\u0004\u0018\u00010KJ\u0010\u0010\u00b1\u0001\u001a\u00020\u00002\u0007\u0010\u00b2\u0001\u001a\u00020OJ\u0011\u0010\u00b3\u0001\u001a\u00020\u00002\u0008\u0010T\u001a\u0004\u0018\u00010SJ\u0011\u0010\u00b4\u0001\u001a\u00020\u00002\u0008\u0010X\u001a\u0004\u0018\u00010WJ\u0011\u0010\u00b5\u0001\u001a\u00020\u00002\u0008\u0010\\\u001a\u0004\u0018\u00010[J\u0011\u0010\u00b6\u0001\u001a\u00020\u00002\u0008\u0010`\u001a\u0004\u0018\u00010_J\u000e\u0010h\u001a\u00020\u00002\u0006\u0010c\u001a\u00020OJ\u0017\u0010\u00b7\u0001\u001a\u00020\u00002\u000e\u0010k\u001a\n\u0012\u0004\u0012\u000204\u0018\u00010\u0018J\u0011\u0010\u00b8\u0001\u001a\u00020\u00002\u0008\u0010m\u001a\u0004\u0018\u00010lJ\u000e\u0010s\u001a\u00020\u00002\u0006\u0010p\u001a\u00020OJ\u0011\u0010\u00b9\u0001\u001a\u00020\u00002\u0008\u0010u\u001a\u0004\u0018\u00010tJ\u0015\u0010\u00ba\u0001\u001a\u00020\u00002\u000c\u0010y\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010xJ\u0011\u0010\u00bb\u0001\u001a\u00020\u00002\u0008\u0010}\u001a\u0004\u0018\u00010|J\u0013\u0010\u00bc\u0001\u001a\u00020\u00002\n\u0010\u0081\u0001\u001a\u0005\u0018\u00010\u0080\u0001J\u0013\u0010\u00bd\u0001\u001a\u00020\u00002\n\u0010\u0085\u0001\u001a\u0005\u0018\u00010\u0084\u0001J\u0019\u0010\u00be\u0001\u001a\u00020\u00002\u0010\u0010\u008c\u0001\u001a\u000b\u0012\u0005\u0012\u00030\u0088\u0001\u0018\u00010/J\u0019\u0010\u00bf\u0001\u001a\u00020\u00002\u0010\u0010\u008c\u0001\u001a\u000b\u0012\u0005\u0012\u00030\u008b\u0001\u0018\u00010/J\u0010\u0010\u00c0\u0001\u001a\u00020\u00002\u0007\u0010\u008e\u0001\u001a\u000204J\u0012\u0010\u00c1\u0001\u001a\u00020\u00002\t\u0010\u0094\u0001\u001a\u0004\u0018\u00010lR\"\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR:\u0010\r\u001a\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u000c\u0018\u00010\n2\u0014\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u000c\u0018\u00010\n@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR.\u0010\u0011\u001a\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\u00102\u000e\u0010\u0005\u001a\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\u0010@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013R\"\u0010\u0015\u001a\u0004\u0018\u00010\u00142\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0014@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0016\u0010\u0017R.\u0010\u001a\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u00182\u000e\u0010\u0005\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0018@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001b\u0010\u001cR\"\u0010\u001e\u001a\u0004\u0018\u00010\u001d2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u001d@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001f\u0010 R\"\u0010\"\u001a\u0004\u0018\u00010!2\u0008\u0010\u0005\u001a\u0004\u0018\u00010!@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008#\u0010$R\"\u0010&\u001a\u0004\u0018\u00010%2\u0008\u0010\u0005\u001a\u0004\u0018\u00010%@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\'\u0010(R\u001e\u0010*\u001a\u00020)2\u0006\u0010\u0005\u001a\u00020)@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008+\u0010,R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008-\u0010.R.\u00101\u001a\n\u0012\u0004\u0012\u000200\u0018\u00010/2\u000e\u0010\u0005\u001a\n\u0012\u0004\u0012\u000200\u0018\u00010/@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00082\u00103R\u001e\u00105\u001a\u0002042\u0006\u0010\u0005\u001a\u000204@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00086\u00107R\u001e\u00108\u001a\u0002042\u0006\u0010\u0005\u001a\u000204@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00089\u00107R.\u0010:\u001a\n\u0012\u0004\u0012\u000204\u0018\u00010\u00182\u000e\u0010\u0005\u001a\n\u0012\u0004\u0012\u000204\u0018\u00010\u0018@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008;\u0010\u001cR:\u0010=\u001a\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020<\u0018\u00010\n2\u0014\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020<\u0018\u00010\n@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008>\u0010\u000fR.\u0010?\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u00182\u000e\u0010\u0005\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0018@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008@\u0010\u001cR\"\u0010A\u001a\u0004\u0018\u00010\u001d2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u001d@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008B\u0010 R\"\u0010D\u001a\u0004\u0018\u00010C2\u0008\u0010\u0005\u001a\u0004\u0018\u00010C@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008E\u0010FR\u0011\u0010G\u001a\u00020H\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008I\u0010JR\"\u0010L\u001a\u0004\u0018\u00010K2\u0008\u0010\u0005\u001a\u0004\u0018\u00010K@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008M\u0010NR\u001e\u0010P\u001a\u00020O2\u0006\u0010\u0005\u001a\u00020O@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008Q\u0010RR\"\u0010T\u001a\u0004\u0018\u00010S2\u0008\u0010\u0005\u001a\u0004\u0018\u00010S@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008U\u0010VR\"\u0010X\u001a\u0004\u0018\u00010W2\u0008\u0010\u0005\u001a\u0004\u0018\u00010W@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008Y\u0010ZR\"\u0010\\\u001a\u0004\u0018\u00010[2\u0008\u0010\u0005\u001a\u0004\u0018\u00010[@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008]\u0010^R\"\u0010`\u001a\u0004\u0018\u00010_2\u0008\u0010\u0005\u001a\u0004\u0018\u00010_@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008a\u0010bR$\u0010c\u001a\u0004\u0018\u00010OX\u0086\u000e\u00a2\u0006\u0016\n\u0002\u0010j\u0012\u0004\u0008d\u0010e\u001a\u0004\u0008f\u0010g\"\u0004\u0008h\u0010iR.\u0010k\u001a\n\u0012\u0004\u0012\u000204\u0018\u00010\u00182\u000e\u0010\u0005\u001a\n\u0012\u0004\u0012\u000204\u0018\u00010\u0018@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008k\u0010\u001cR\"\u0010m\u001a\u0004\u0018\u00010l2\u0008\u0010\u0005\u001a\u0004\u0018\u00010l@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008n\u0010oR$\u0010p\u001a\u0004\u0018\u00010OX\u0086\u000e\u00a2\u0006\u0016\n\u0002\u0010j\u0012\u0004\u0008q\u0010e\u001a\u0004\u0008r\u0010g\"\u0004\u0008s\u0010iR\"\u0010u\u001a\u0004\u0018\u00010t2\u0008\u0010\u0005\u001a\u0004\u0018\u00010t@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008v\u0010wR*\u0010y\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010x2\u000c\u0010\u0005\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010x@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008z\u0010{R\"\u0010}\u001a\u0004\u0018\u00010|2\u0008\u0010\u0005\u001a\u0004\u0018\u00010|@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008~\u0010\u007fR\'\u0010\u0081\u0001\u001a\u0005\u0018\u00010\u0080\u00012\t\u0010\u0005\u001a\u0005\u0018\u00010\u0080\u0001@BX\u0086\u000e\u00a2\u0006\n\n\u0000\u001a\u0006\u0008\u0082\u0001\u0010\u0083\u0001R\'\u0010\u0085\u0001\u001a\u0005\u0018\u00010\u0084\u00012\t\u0010\u0005\u001a\u0005\u0018\u00010\u0084\u0001@BX\u0086\u000e\u00a2\u0006\n\n\u0000\u001a\u0006\u0008\u0086\u0001\u0010\u0087\u0001R2\u0010\u0089\u0001\u001a\u000b\u0012\u0005\u0012\u00030\u0088\u0001\u0018\u00010/2\u000f\u0010\u0005\u001a\u000b\u0012\u0005\u0012\u00030\u0088\u0001\u0018\u00010/@BX\u0086\u000e\u00a2\u0006\t\n\u0000\u001a\u0005\u0008\u008a\u0001\u00103R2\u0010\u008c\u0001\u001a\u000b\u0012\u0005\u0012\u00030\u008b\u0001\u0018\u00010/2\u000f\u0010\u0005\u001a\u000b\u0012\u0005\u0012\u00030\u008b\u0001\u0018\u00010/@BX\u0086\u000e\u00a2\u0006\t\n\u0000\u001a\u0005\u0008\u008d\u0001\u00103R \u0010\u008e\u0001\u001a\u0002042\u0006\u0010\u0005\u001a\u000204@BX\u0086\u000e\u00a2\u0006\t\n\u0000\u001a\u0005\u0008\u008f\u0001\u00107R\'\u0010\u0091\u0001\u001a\u0005\u0018\u00010\u0090\u00012\t\u0010\u0005\u001a\u0005\u0018\u00010\u0090\u0001@BX\u0086\u000e\u00a2\u0006\n\n\u0000\u001a\u0006\u0008\u0092\u0001\u0010\u0093\u0001R$\u0010\u0094\u0001\u001a\u0004\u0018\u00010l2\u0008\u0010\u0005\u001a\u0004\u0018\u00010l@BX\u0086\u000e\u00a2\u0006\t\n\u0000\u001a\u0005\u0008\u0095\u0001\u0010o\u00a8\u0006\u00c2\u0001"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;",
        "",
        "context",
        "Landroid/content/Context;",
        "(Landroid/content/Context;)V",
        "<set-?>",
        "Landroid/graphics/Bitmap$Config;",
        "bitmapConfig",
        "getBitmapConfig",
        "()Landroid/graphics/Bitmap$Config;",
        "Lcom/facebook/imagepipeline/cache/MemoryCache;",
        "Lcom/facebook/cache/common/CacheKey;",
        "Lcom/facebook/imagepipeline/image/CloseableImage;",
        "bitmapMemoryCache",
        "getBitmapMemoryCache",
        "()Lcom/facebook/imagepipeline/cache/MemoryCache;",
        "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;",
        "bitmapMemoryCacheEntryStateObserver",
        "getBitmapMemoryCacheEntryStateObserver",
        "()Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;",
        "Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheFactory;",
        "bitmapMemoryCacheFactory",
        "getBitmapMemoryCacheFactory",
        "()Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheFactory;",
        "Lcom/facebook/common/internal/Supplier;",
        "Lcom/facebook/imagepipeline/cache/MemoryCacheParams;",
        "bitmapMemoryCacheParamsSupplier",
        "getBitmapMemoryCacheParamsSupplier",
        "()Lcom/facebook/common/internal/Supplier;",
        "Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;",
        "bitmapMemoryCacheTrimStrategy",
        "getBitmapMemoryCacheTrimStrategy",
        "()Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;",
        "Lcom/facebook/imagepipeline/cache/CacheKeyFactory;",
        "cacheKeyFactory",
        "getCacheKeyFactory",
        "()Lcom/facebook/imagepipeline/cache/CacheKeyFactory;",
        "Lcom/facebook/callercontext/CallerContextVerifier;",
        "callerContextVerifier",
        "getCallerContextVerifier",
        "()Lcom/facebook/callercontext/CallerContextVerifier;",
        "Lcom/facebook/imagepipeline/debug/CloseableReferenceLeakTracker;",
        "closeableReferenceLeakTracker",
        "getCloseableReferenceLeakTracker",
        "()Lcom/facebook/imagepipeline/debug/CloseableReferenceLeakTracker;",
        "getContext",
        "()Landroid/content/Context;",
        "",
        "Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;",
        "customProducerSequenceFactories",
        "getCustomProducerSequenceFactories",
        "()Ljava/util/Set;",
        "",
        "diskCacheEnabled",
        "getDiskCacheEnabled",
        "()Z",
        "downsampleEnabled",
        "getDownsampleEnabled",
        "enableEncodedImageColorSpaceUsage",
        "getEnableEncodedImageColorSpaceUsage",
        "Lcom/facebook/common/memory/PooledByteBuffer;",
        "encodedMemoryCache",
        "getEncodedMemoryCache",
        "encodedMemoryCacheParamsSupplier",
        "getEncodedMemoryCacheParamsSupplier",
        "encodedMemoryCacheTrimStrategy",
        "getEncodedMemoryCacheTrimStrategy",
        "Lcom/facebook/imagepipeline/core/ExecutorSupplier;",
        "executorSupplier",
        "getExecutorSupplier",
        "()Lcom/facebook/imagepipeline/core/ExecutorSupplier;",
        "experimentsBuilder",
        "Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;",
        "getExperimentsBuilder",
        "()Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;",
        "Lcom/facebook/imagepipeline/core/FileCacheFactory;",
        "fileCacheFactory",
        "getFileCacheFactory",
        "()Lcom/facebook/imagepipeline/core/FileCacheFactory;",
        "",
        "httpConnectionTimeout",
        "getHttpConnectionTimeout",
        "()I",
        "Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;",
        "imageCacheStatsTracker",
        "getImageCacheStatsTracker",
        "()Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;",
        "Lcom/facebook/imagepipeline/decoder/ImageDecoder;",
        "imageDecoder",
        "getImageDecoder",
        "()Lcom/facebook/imagepipeline/decoder/ImageDecoder;",
        "Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig;",
        "imageDecoderConfig",
        "getImageDecoderConfig",
        "()Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig;",
        "Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;",
        "imageTranscoderFactory",
        "getImageTranscoderFactory",
        "()Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;",
        "imageTranscoderType",
        "getImageTranscoderType$annotations",
        "()V",
        "getImageTranscoderType",
        "()Ljava/lang/Integer;",
        "setImageTranscoderType",
        "(Ljava/lang/Integer;)V",
        "Ljava/lang/Integer;",
        "isPrefetchEnabledSupplier",
        "Lcom/facebook/cache/disk/DiskCacheConfig;",
        "mainDiskCacheConfig",
        "getMainDiskCacheConfig",
        "()Lcom/facebook/cache/disk/DiskCacheConfig;",
        "memoryChunkType",
        "getMemoryChunkType$annotations",
        "getMemoryChunkType",
        "setMemoryChunkType",
        "Lcom/facebook/common/memory/MemoryTrimmableRegistry;",
        "memoryTrimmableRegistry",
        "getMemoryTrimmableRegistry",
        "()Lcom/facebook/common/memory/MemoryTrimmableRegistry;",
        "Lcom/facebook/imagepipeline/producers/NetworkFetcher;",
        "networkFetcher",
        "getNetworkFetcher",
        "()Lcom/facebook/imagepipeline/producers/NetworkFetcher;",
        "Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;",
        "platformBitmapFactory",
        "getPlatformBitmapFactory",
        "()Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;",
        "Lcom/facebook/imagepipeline/memory/PoolFactory;",
        "poolFactory",
        "getPoolFactory",
        "()Lcom/facebook/imagepipeline/memory/PoolFactory;",
        "Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;",
        "progressiveJpegConfig",
        "getProgressiveJpegConfig",
        "()Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;",
        "Lcom/facebook/imagepipeline/listener/RequestListener2;",
        "requestListener2s",
        "getRequestListener2s",
        "Lcom/facebook/imagepipeline/listener/RequestListener;",
        "requestListeners",
        "getRequestListeners",
        "resizeAndRotateEnabledForNetwork",
        "getResizeAndRotateEnabledForNetwork",
        "Lcom/facebook/common/executors/SerialExecutorService;",
        "serialExecutorServiceForAnimatedImages",
        "getSerialExecutorServiceForAnimatedImages",
        "()Lcom/facebook/common/executors/SerialExecutorService;",
        "smallImageDiskCacheConfig",
        "getSmallImageDiskCacheConfig",
        "build",
        "Lcom/facebook/imagepipeline/core/ImagePipelineConfig;",
        "experiment",
        "isDiskCacheEnabled",
        "isDownsampleEnabled",
        "setBitmapMemoryCache",
        "setBitmapMemoryCacheEntryStateObserver",
        "setBitmapMemoryCacheFactory",
        "setBitmapMemoryCacheParamsSupplier",
        "setBitmapMemoryCacheTrimStrategy",
        "trimStrategy",
        "setBitmapsConfig",
        "config",
        "setCacheKeyFactory",
        "setCallerContextVerifier",
        "setCloseableReferenceLeakTracker",
        "setCustomFetchSequenceFactories",
        "setDiskCacheEnabled",
        "setDownsampleEnabled",
        "setEnableEncodedImageColorSpaceUsage",
        "setEncodedMemoryCache",
        "setEncodedMemoryCacheParamsSupplier",
        "setEncodedMemoryCacheTrimStrategy",
        "setExecutorServiceForAnimatedImages",
        "serialExecutorService",
        "setExecutorSupplier",
        "setFileCacheFactory",
        "setHttpConnectionTimeout",
        "httpConnectionTimeoutMs",
        "setImageCacheStatsTracker",
        "setImageDecoder",
        "setImageDecoderConfig",
        "setImageTranscoderFactory",
        "setIsPrefetchEnabledSupplier",
        "setMainDiskCacheConfig",
        "setMemoryTrimmableRegistry",
        "setNetworkFetcher",
        "setPlatformBitmapFactory",
        "setPoolFactory",
        "setProgressiveJpegConfig",
        "setRequestListener2s",
        "setRequestListeners",
        "setResizeAndRotateEnabledForNetwork",
        "setSmallImageDiskCacheConfig",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private bitmapConfig:Landroid/graphics/Bitmap$Config;

.field private bitmapMemoryCache:Lcom/facebook/imagepipeline/cache/MemoryCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/cache/MemoryCache<",
            "Lcom/facebook/cache/common/CacheKey;",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;"
        }
    .end annotation
.end field

.field private bitmapMemoryCacheEntryStateObserver:Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver<",
            "Lcom/facebook/cache/common/CacheKey;",
            ">;"
        }
    .end annotation
.end field

.field private bitmapMemoryCacheFactory:Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheFactory;

.field private bitmapMemoryCacheParamsSupplier:Lcom/facebook/common/internal/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/Supplier<",
            "Lcom/facebook/imagepipeline/cache/MemoryCacheParams;",
            ">;"
        }
    .end annotation
.end field

.field private bitmapMemoryCacheTrimStrategy:Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;

.field private cacheKeyFactory:Lcom/facebook/imagepipeline/cache/CacheKeyFactory;

.field private callerContextVerifier:Lcom/facebook/callercontext/CallerContextVerifier;

.field private closeableReferenceLeakTracker:Lcom/facebook/imagepipeline/debug/CloseableReferenceLeakTracker;

.field private final context:Landroid/content/Context;

.field private customProducerSequenceFactories:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "+",
            "Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;",
            ">;"
        }
    .end annotation
.end field

.field private diskCacheEnabled:Z

.field private downsampleEnabled:Z

.field private enableEncodedImageColorSpaceUsage:Lcom/facebook/common/internal/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private encodedMemoryCache:Lcom/facebook/imagepipeline/cache/MemoryCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/cache/MemoryCache<",
            "Lcom/facebook/cache/common/CacheKey;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private encodedMemoryCacheParamsSupplier:Lcom/facebook/common/internal/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/Supplier<",
            "Lcom/facebook/imagepipeline/cache/MemoryCacheParams;",
            ">;"
        }
    .end annotation
.end field

.field private encodedMemoryCacheTrimStrategy:Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;

.field private executorSupplier:Lcom/facebook/imagepipeline/core/ExecutorSupplier;

.field private final experimentsBuilder:Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

.field private fileCacheFactory:Lcom/facebook/imagepipeline/core/FileCacheFactory;

.field private httpConnectionTimeout:I

.field private imageCacheStatsTracker:Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

.field private imageDecoder:Lcom/facebook/imagepipeline/decoder/ImageDecoder;

.field private imageDecoderConfig:Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig;

.field private imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

.field private imageTranscoderType:Ljava/lang/Integer;

.field private isPrefetchEnabledSupplier:Lcom/facebook/common/internal/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mainDiskCacheConfig:Lcom/facebook/cache/disk/DiskCacheConfig;

.field private memoryChunkType:Ljava/lang/Integer;

.field private memoryTrimmableRegistry:Lcom/facebook/common/memory/MemoryTrimmableRegistry;

.field private networkFetcher:Lcom/facebook/imagepipeline/producers/NetworkFetcher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/producers/NetworkFetcher<",
            "*>;"
        }
    .end annotation
.end field

.field private platformBitmapFactory:Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;

.field private poolFactory:Lcom/facebook/imagepipeline/memory/PoolFactory;

.field private progressiveJpegConfig:Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;

.field private requestListener2s:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "+",
            "Lcom/facebook/imagepipeline/listener/RequestListener2;",
            ">;"
        }
    .end annotation
.end field

.field private requestListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "+",
            "Lcom/facebook/imagepipeline/listener/RequestListener;",
            ">;"
        }
    .end annotation
.end field

.field private resizeAndRotateEnabledForNetwork:Z

.field private serialExecutorServiceForAnimatedImages:Lcom/facebook/common/executors/SerialExecutorService;

.field private smallImageDiskCacheConfig:Lcom/facebook/cache/disk/DiskCacheConfig;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->resizeAndRotateEnabledForNetwork:Z

    const/4 v1, -0x1

    iput v1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->httpConnectionTimeout:I

    .line 296
    new-instance v1, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    invoke-direct {v1, p0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;)V

    iput-object v1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->experimentsBuilder:Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    iput-boolean v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->diskCacheEnabled:Z

    .line 304
    new-instance v0, Lcom/facebook/imagepipeline/debug/NoOpCloseableReferenceLeakTracker;

    invoke-direct {v0}, Lcom/facebook/imagepipeline/debug/NoOpCloseableReferenceLeakTracker;-><init>()V

    check-cast v0, Lcom/facebook/imagepipeline/debug/CloseableReferenceLeakTracker;

    iput-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->closeableReferenceLeakTracker:Lcom/facebook/imagepipeline/debug/CloseableReferenceLeakTracker;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->context:Landroid/content/Context;

    return-void
.end method

.method public static synthetic getImageTranscoderType$annotations()V
    .locals 0

    return-void
.end method

.method public static synthetic getMemoryChunkType$annotations()V
    .locals 0

    return-void
.end method


# virtual methods
.method public final build()Lcom/facebook/imagepipeline/core/ImagePipelineConfig;
    .locals 2

    .line 486
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/facebook/imagepipeline/core/ImagePipelineConfig;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method

.method public final experiment()Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->experimentsBuilder:Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    return-object v0
.end method

.method public final getBitmapConfig()Landroid/graphics/Bitmap$Config;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->bitmapConfig:Landroid/graphics/Bitmap$Config;

    return-object v0
.end method

.method public final getBitmapMemoryCache()Lcom/facebook/imagepipeline/cache/MemoryCache;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/cache/MemoryCache<",
            "Lcom/facebook/cache/common/CacheKey;",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->bitmapMemoryCache:Lcom/facebook/imagepipeline/cache/MemoryCache;

    return-object v0
.end method

.method public final getBitmapMemoryCacheEntryStateObserver()Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver<",
            "Lcom/facebook/cache/common/CacheKey;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->bitmapMemoryCacheEntryStateObserver:Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;

    return-object v0
.end method

.method public final getBitmapMemoryCacheFactory()Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheFactory;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->bitmapMemoryCacheFactory:Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheFactory;

    return-object v0
.end method

.method public final getBitmapMemoryCacheParamsSupplier()Lcom/facebook/common/internal/Supplier;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/common/internal/Supplier<",
            "Lcom/facebook/imagepipeline/cache/MemoryCacheParams;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->bitmapMemoryCacheParamsSupplier:Lcom/facebook/common/internal/Supplier;

    return-object v0
.end method

.method public final getBitmapMemoryCacheTrimStrategy()Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->bitmapMemoryCacheTrimStrategy:Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;

    return-object v0
.end method

.method public final getCacheKeyFactory()Lcom/facebook/imagepipeline/cache/CacheKeyFactory;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->cacheKeyFactory:Lcom/facebook/imagepipeline/cache/CacheKeyFactory;

    return-object v0
.end method

.method public final getCallerContextVerifier()Lcom/facebook/callercontext/CallerContextVerifier;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->callerContextVerifier:Lcom/facebook/callercontext/CallerContextVerifier;

    return-object v0
.end method

.method public final getCloseableReferenceLeakTracker()Lcom/facebook/imagepipeline/debug/CloseableReferenceLeakTracker;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->closeableReferenceLeakTracker:Lcom/facebook/imagepipeline/debug/CloseableReferenceLeakTracker;

    return-object v0
.end method

.method public final getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->context:Landroid/content/Context;

    return-object v0
.end method

.method public final getCustomProducerSequenceFactories()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->customProducerSequenceFactories:Ljava/util/Set;

    return-object v0
.end method

.method public final getDiskCacheEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->diskCacheEnabled:Z

    return v0
.end method

.method public final getDownsampleEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->downsampleEnabled:Z

    return v0
.end method

.method public final getEnableEncodedImageColorSpaceUsage()Lcom/facebook/common/internal/Supplier;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->enableEncodedImageColorSpaceUsage:Lcom/facebook/common/internal/Supplier;

    return-object v0
.end method

.method public final getEncodedMemoryCache()Lcom/facebook/imagepipeline/cache/MemoryCache;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/cache/MemoryCache<",
            "Lcom/facebook/cache/common/CacheKey;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->encodedMemoryCache:Lcom/facebook/imagepipeline/cache/MemoryCache;

    return-object v0
.end method

.method public final getEncodedMemoryCacheParamsSupplier()Lcom/facebook/common/internal/Supplier;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/common/internal/Supplier<",
            "Lcom/facebook/imagepipeline/cache/MemoryCacheParams;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->encodedMemoryCacheParamsSupplier:Lcom/facebook/common/internal/Supplier;

    return-object v0
.end method

.method public final getEncodedMemoryCacheTrimStrategy()Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->encodedMemoryCacheTrimStrategy:Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;

    return-object v0
.end method

.method public final getExecutorSupplier()Lcom/facebook/imagepipeline/core/ExecutorSupplier;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->executorSupplier:Lcom/facebook/imagepipeline/core/ExecutorSupplier;

    return-object v0
.end method

.method public final getExperimentsBuilder()Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->experimentsBuilder:Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    return-object v0
.end method

.method public final getFileCacheFactory()Lcom/facebook/imagepipeline/core/FileCacheFactory;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->fileCacheFactory:Lcom/facebook/imagepipeline/core/FileCacheFactory;

    return-object v0
.end method

.method public final getHttpConnectionTimeout()I
    .locals 1

    iget v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->httpConnectionTimeout:I

    return v0
.end method

.method public final getImageCacheStatsTracker()Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->imageCacheStatsTracker:Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

    return-object v0
.end method

.method public final getImageDecoder()Lcom/facebook/imagepipeline/decoder/ImageDecoder;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->imageDecoder:Lcom/facebook/imagepipeline/decoder/ImageDecoder;

    return-object v0
.end method

.method public final getImageDecoderConfig()Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->imageDecoderConfig:Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig;

    return-object v0
.end method

.method public final getImageTranscoderFactory()Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

    return-object v0
.end method

.method public final getImageTranscoderType()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->imageTranscoderType:Ljava/lang/Integer;

    return-object v0
.end method

.method public final getMainDiskCacheConfig()Lcom/facebook/cache/disk/DiskCacheConfig;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->mainDiskCacheConfig:Lcom/facebook/cache/disk/DiskCacheConfig;

    return-object v0
.end method

.method public final getMemoryChunkType()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->memoryChunkType:Ljava/lang/Integer;

    return-object v0
.end method

.method public final getMemoryTrimmableRegistry()Lcom/facebook/common/memory/MemoryTrimmableRegistry;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->memoryTrimmableRegistry:Lcom/facebook/common/memory/MemoryTrimmableRegistry;

    return-object v0
.end method

.method public final getNetworkFetcher()Lcom/facebook/imagepipeline/producers/NetworkFetcher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/NetworkFetcher<",
            "*>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->networkFetcher:Lcom/facebook/imagepipeline/producers/NetworkFetcher;

    return-object v0
.end method

.method public final getPlatformBitmapFactory()Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->platformBitmapFactory:Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;

    return-object v0
.end method

.method public final getPoolFactory()Lcom/facebook/imagepipeline/memory/PoolFactory;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->poolFactory:Lcom/facebook/imagepipeline/memory/PoolFactory;

    return-object v0
.end method

.method public final getProgressiveJpegConfig()Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->progressiveJpegConfig:Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;

    return-object v0
.end method

.method public final getRequestListener2s()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/facebook/imagepipeline/listener/RequestListener2;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->requestListener2s:Ljava/util/Set;

    return-object v0
.end method

.method public final getRequestListeners()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/facebook/imagepipeline/listener/RequestListener;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->requestListeners:Ljava/util/Set;

    return-object v0
.end method

.method public final getResizeAndRotateEnabledForNetwork()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->resizeAndRotateEnabledForNetwork:Z

    return v0
.end method

.method public final getSerialExecutorServiceForAnimatedImages()Lcom/facebook/common/executors/SerialExecutorService;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->serialExecutorServiceForAnimatedImages:Lcom/facebook/common/executors/SerialExecutorService;

    return-object v0
.end method

.method public final getSmallImageDiskCacheConfig()Lcom/facebook/cache/disk/DiskCacheConfig;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->smallImageDiskCacheConfig:Lcom/facebook/cache/disk/DiskCacheConfig;

    return-object v0
.end method

.method public final isDiskCacheEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->diskCacheEnabled:Z

    return v0
.end method

.method public final isDownsampleEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->downsampleEnabled:Z

    return v0
.end method

.method public final isPrefetchEnabledSupplier()Lcom/facebook/common/internal/Supplier;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->isPrefetchEnabledSupplier:Lcom/facebook/common/internal/Supplier;

    return-object v0
.end method

.method public final setBitmapMemoryCache(Lcom/facebook/imagepipeline/cache/MemoryCache;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/MemoryCache<",
            "Lcom/facebook/cache/common/CacheKey;",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;"
        }
    .end annotation

    .line 467
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->bitmapMemoryCache:Lcom/facebook/imagepipeline/cache/MemoryCache;

    return-object p0
.end method

.method public final setBitmapMemoryCacheEntryStateObserver(Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver<",
            "Lcom/facebook/cache/common/CacheKey;",
            ">;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;"
        }
    .end annotation

    .line 329
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->bitmapMemoryCacheEntryStateObserver:Lcom/facebook/imagepipeline/cache/CountingMemoryCache$EntryStateObserver;

    return-object p0
.end method

.method public final setBitmapMemoryCacheFactory(Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheFactory;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 480
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->bitmapMemoryCacheFactory:Lcom/facebook/imagepipeline/cache/BitmapMemoryCacheFactory;

    return-object p0
.end method

.method public final setBitmapMemoryCacheParamsSupplier(Lcom/facebook/common/internal/Supplier;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/internal/Supplier<",
            "Lcom/facebook/imagepipeline/cache/MemoryCacheParams;",
            ">;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;"
        }
    .end annotation

    .line 323
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->bitmapMemoryCacheParamsSupplier:Lcom/facebook/common/internal/Supplier;

    return-object p0

    .line 324
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Required value was null."

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final setBitmapMemoryCacheTrimStrategy(Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 333
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->bitmapMemoryCacheTrimStrategy:Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;

    return-object p0
.end method

.method public final setBitmapsConfig(Landroid/graphics/Bitmap$Config;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 319
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->bitmapConfig:Landroid/graphics/Bitmap$Config;

    return-object p0
.end method

.method public final setCacheKeyFactory(Lcom/facebook/imagepipeline/cache/CacheKeyFactory;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 341
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->cacheKeyFactory:Lcom/facebook/imagepipeline/cache/CacheKeyFactory;

    return-object p0
.end method

.method public final setCallerContextVerifier(Lcom/facebook/callercontext/CallerContextVerifier;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 458
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->callerContextVerifier:Lcom/facebook/callercontext/CallerContextVerifier;

    return-object p0
.end method

.method public final setCloseableReferenceLeakTracker(Lcom/facebook/imagepipeline/debug/CloseableReferenceLeakTracker;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    const-string v0, "closeableReferenceLeakTracker"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 464
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->closeableReferenceLeakTracker:Lcom/facebook/imagepipeline/debug/CloseableReferenceLeakTracker;

    return-object p0
.end method

.method public final setCustomFetchSequenceFactories(Ljava/util/Set;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "+",
            "Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;",
            ">;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;"
        }
    .end annotation

    .line 443
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->customProducerSequenceFactories:Ljava/util/Set;

    return-object p0
.end method

.method public final setDiskCacheEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 361
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->diskCacheEnabled:Z

    return-object p0
.end method

.method public final setDownsampleEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 355
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->downsampleEnabled:Z

    return-object p0
.end method

.method public final setEnableEncodedImageColorSpaceUsage(Lcom/facebook/common/internal/Supplier;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;"
        }
    .end annotation

    .line 386
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->enableEncodedImageColorSpaceUsage:Lcom/facebook/common/internal/Supplier;

    return-object p0
.end method

.method public final setEncodedMemoryCache(Lcom/facebook/imagepipeline/cache/MemoryCache;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/MemoryCache<",
            "Lcom/facebook/cache/common/CacheKey;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;"
        }
    .end annotation

    .line 473
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->encodedMemoryCache:Lcom/facebook/imagepipeline/cache/MemoryCache;

    return-object p0
.end method

.method public final setEncodedMemoryCacheParamsSupplier(Lcom/facebook/common/internal/Supplier;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/internal/Supplier<",
            "Lcom/facebook/imagepipeline/cache/MemoryCacheParams;",
            ">;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;"
        }
    .end annotation

    .line 367
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->encodedMemoryCacheParamsSupplier:Lcom/facebook/common/internal/Supplier;

    return-object p0

    .line 368
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Required value was null."

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final setEncodedMemoryCacheTrimStrategy(Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 337
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->encodedMemoryCacheTrimStrategy:Lcom/facebook/imagepipeline/cache/MemoryCache$CacheTrimStrategy;

    return-object p0
.end method

.method public final setExecutorServiceForAnimatedImages(Lcom/facebook/common/executors/SerialExecutorService;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 477
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->serialExecutorServiceForAnimatedImages:Lcom/facebook/common/executors/SerialExecutorService;

    return-object p0
.end method

.method public final setExecutorSupplier(Lcom/facebook/imagepipeline/core/ExecutorSupplier;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 371
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->executorSupplier:Lcom/facebook/imagepipeline/core/ExecutorSupplier;

    return-object p0
.end method

.method public final setFileCacheFactory(Lcom/facebook/imagepipeline/core/FileCacheFactory;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 349
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->fileCacheFactory:Lcom/facebook/imagepipeline/core/FileCacheFactory;

    return-object p0
.end method

.method public final setHttpConnectionTimeout(I)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 345
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->httpConnectionTimeout:I

    return-object p0
.end method

.method public final setImageCacheStatsTracker(Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 376
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->imageCacheStatsTracker:Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

    return-object p0
.end method

.method public final setImageDecoder(Lcom/facebook/imagepipeline/decoder/ImageDecoder;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 380
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->imageDecoder:Lcom/facebook/imagepipeline/decoder/ImageDecoder;

    return-object p0
.end method

.method public final setImageDecoderConfig(Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 454
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->imageDecoderConfig:Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig;

    return-object p0
.end method

.method public final setImageTranscoderFactory(Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 395
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

    return-object p0
.end method

.method public final setImageTranscoderType(I)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 390
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    .line 391
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->imageTranscoderType:Ljava/lang/Integer;

    return-object p0
.end method

.method public final setImageTranscoderType(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->imageTranscoderType:Ljava/lang/Integer;

    return-void
.end method

.method public final setIsPrefetchEnabledSupplier(Lcom/facebook/common/internal/Supplier;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;"
        }
    .end annotation

    .line 400
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->isPrefetchEnabledSupplier:Lcom/facebook/common/internal/Supplier;

    return-object p0
.end method

.method public final setMainDiskCacheConfig(Lcom/facebook/cache/disk/DiskCacheConfig;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 404
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->mainDiskCacheConfig:Lcom/facebook/cache/disk/DiskCacheConfig;

    return-object p0
.end method

.method public final setMemoryChunkType(I)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 413
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    .line 414
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->memoryChunkType:Ljava/lang/Integer;

    return-object p0
.end method

.method public final setMemoryChunkType(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->memoryChunkType:Ljava/lang/Integer;

    return-void
.end method

.method public final setMemoryTrimmableRegistry(Lcom/facebook/common/memory/MemoryTrimmableRegistry;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 409
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->memoryTrimmableRegistry:Lcom/facebook/common/memory/MemoryTrimmableRegistry;

    return-object p0
.end method

.method public final setNetworkFetcher(Lcom/facebook/imagepipeline/producers/NetworkFetcher;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/NetworkFetcher<",
            "*>;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;"
        }
    .end annotation

    .line 417
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->networkFetcher:Lcom/facebook/imagepipeline/producers/NetworkFetcher;

    return-object p0
.end method

.method public final setPlatformBitmapFactory(Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 421
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->platformBitmapFactory:Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;

    return-object p0
.end method

.method public final setPoolFactory(Lcom/facebook/imagepipeline/memory/PoolFactory;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 425
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->poolFactory:Lcom/facebook/imagepipeline/memory/PoolFactory;

    return-object p0
.end method

.method public final setProgressiveJpegConfig(Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 429
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->progressiveJpegConfig:Lcom/facebook/imagepipeline/decoder/ProgressiveJpegConfig;

    return-object p0
.end method

.method public final setRequestListener2s(Ljava/util/Set;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "+",
            "Lcom/facebook/imagepipeline/listener/RequestListener2;",
            ">;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;"
        }
    .end annotation

    .line 437
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->requestListener2s:Ljava/util/Set;

    return-object p0
.end method

.method public final setRequestListeners(Ljava/util/Set;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "+",
            "Lcom/facebook/imagepipeline/listener/RequestListener;",
            ">;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;"
        }
    .end annotation

    .line 433
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->requestListeners:Ljava/util/Set;

    return-object p0
.end method

.method public final setResizeAndRotateEnabledForNetwork(Z)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 446
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->resizeAndRotateEnabledForNetwork:Z

    return-object p0
.end method

.method public final setSmallImageDiskCacheConfig(Lcom/facebook/cache/disk/DiskCacheConfig;)Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;
    .locals 1

    .line 450
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;->smallImageDiskCacheConfig:Lcom/facebook/cache/disk/DiskCacheConfig;

    return-object p0
.end method
