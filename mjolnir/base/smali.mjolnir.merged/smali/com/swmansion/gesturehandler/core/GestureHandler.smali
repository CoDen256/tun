.class public Lcom/swmansion/gesturehandler/core/GestureHandler;
.super Ljava/lang/Object;
.source "GestureHandler.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/swmansion/gesturehandler/core/GestureHandler$AdaptEventException;,
        Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;,
        Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ConcreteGestureHandlerT:",
        "Lcom/swmansion/gesturehandler/core/GestureHandler<",
        "TConcreteGestureHandlerT;>;>",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nGestureHandler.kt\nKotlin\n*S Kotlin\n*F\n+ 1 GestureHandler.kt\ncom/swmansion/gesturehandler/core/GestureHandler\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,872:1\n79#1:874\n79#1:876\n79#1:878\n79#1:880\n79#1:882\n1#2:873\n1#2:875\n1#2:877\n1#2:879\n1#2:881\n1#2:883\n*S KotlinDebug\n*F\n+ 1 GestureHandler.kt\ncom/swmansion/gesturehandler/core/GestureHandler\n*L\n119#1:874\n121#1:876\n134#1:878\n143#1:880\n164#1:882\n119#1:875\n121#1:877\n134#1:879\n143#1:881\n164#1:883\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00b2\u0001\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\n\n\u0002\u0008\u0004\n\u0002\u0010\u0014\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0007\n\u0002\u0010\u0007\n\u0002\u0008\u0019\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0012\n\u0002\u0010\u0015\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u00087\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0016\u0018\u0000 \u00cc\u0001*\u000e\u0008\u0000\u0010\u0001*\u0008\u0012\u0004\u0012\u0002H\u00010\u00002\u00020\u0002:\u0006\u00cb\u0001\u00cc\u0001\u00cd\u0001B\u0005\u00a2\u0006\u0002\u0010\u0003J\u0006\u0010e\u001a\u00020fJ\u0010\u0010e\u001a\u00020f2\u0006\u0010g\u001a\u00020\u001dH\u0016J\u0010\u0010h\u001a\u00020i2\u0006\u0010j\u001a\u00020iH\u0002J\u0010\u0010k\u001a\u00020f2\u0006\u0010l\u001a\u00020WH\u0002J\u0010\u0010m\u001a\u00020f2\u0006\u0010l\u001a\u00020WH\u0002J*\u0010n\u001a\u00028\u00002\u0017\u0010o\u001a\u0013\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020f0p\u00a2\u0006\u0002\u0008qH\u0084\u0008\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010rJ\u0006\u0010s\u001a\u00020fJ\u0006\u0010t\u001a\u00020fJ\u0008\u0010u\u001a\u00020fH\u0002J\u0008\u0010v\u001a\u0004\u0018\u00010\u000eJ\u0008\u0010w\u001a\u0004\u0018\u00010\u000eJ\u0018\u0010x\u001a\n z*\u0004\u0018\u00010y0y2\u0006\u0010l\u001a\u00020WH\u0002J\u0010\u0010{\u001a\u00020f2\u0006\u0010j\u001a\u00020iH\u0016J\u0018\u0010|\u001a\u00020f2\u0006\u0010}\u001a\u00020\u00052\u0006\u0010~\u001a\u00020\u0005H\u0016J\u0010\u0010\u007f\u001a\u00020f2\u0006\u0010j\u001a\u00020iH\u0002J\t\u0010\u0080\u0001\u001a\u00020fH\u0016J\u0011\u0010\u0081\u0001\u001a\u00020f2\u0006\u0010j\u001a\u00020iH\u0002J\u0011\u0010\u0082\u0001\u001a\u00020f2\u0006\u0010j\u001a\u00020iH\u0002J\u0007\u0010\u0083\u0001\u001a\u00020fJ\t\u0010\u0084\u0001\u001a\u00020fH\u0002J\u0007\u0010\u0085\u0001\u001a\u00020fJ\t\u0010\u0086\u0001\u001a\u00020\u0005H\u0002J\u0018\u0010\u0087\u0001\u001a\u0005\u0018\u00010\u0088\u00012\n\u0010\u0089\u0001\u001a\u0005\u0018\u00010\u008a\u0001H\u0002J\u0019\u0010\u008b\u0001\u001a\u00020f2\u0007\u0010\u008c\u0001\u001a\u00020i2\u0007\u0010\u008d\u0001\u001a\u00020iJ\u0014\u0010\u008e\u0001\u001a\u00020\u001d2\u000b\u0010\u008f\u0001\u001a\u0006\u0012\u0002\u0008\u00030\u0000J\u0012\u0010\u0090\u0001\u001a\u00020\u001d2\u0007\u0010\u0091\u0001\u001a\u00020\u0005H\u0002J\"\u0010$\u001a\u00020\u001d2\u0008\u0010]\u001a\u0004\u0018\u00010\\2\u0007\u0010\u0092\u0001\u001a\u00020%2\u0007\u0010\u0093\u0001\u001a\u00020%J\u0011\u0010\u0094\u0001\u001a\u00020f2\u0006\u0010}\u001a\u00020\u0005H\u0002J\u0011\u0010\u0095\u0001\u001a\u00020\u001d2\u0006\u0010j\u001a\u00020iH\u0002J\t\u0010\u0096\u0001\u001a\u00020fH\u0014J\u001a\u0010\u0097\u0001\u001a\u00020f2\u0006\u0010j\u001a\u00020i2\u0007\u0010\u008d\u0001\u001a\u00020iH\u0014J\u001a\u0010\u0098\u0001\u001a\u00020f2\u0006\u0010j\u001a\u00020i2\u0007\u0010\u008d\u0001\u001a\u00020iH\u0014J\t\u0010\u0099\u0001\u001a\u00020fH\u0014J\t\u0010\u009a\u0001\u001a\u00020fH\u0014J\u001a\u0010\u009b\u0001\u001a\u00020f2\u0006\u0010}\u001a\u00020\u00052\u0007\u0010\u009c\u0001\u001a\u00020\u0005H\u0014J\u001b\u0010\u009d\u0001\u001a\u00020f2\u0008\u0010]\u001a\u0004\u0018\u00010\\2\u0008\u0010@\u001a\u0004\u0018\u00010AJ\u0007\u0010\u009e\u0001\u001a\u00020fJ\t\u0010\u009f\u0001\u001a\u00020fH\u0016J\t\u0010\u00a0\u0001\u001a\u00020fH\u0016J\u000f\u0010\u00a1\u0001\u001a\u00028\u0000H\u0004\u00a2\u0006\u0003\u0010\u00a2\u0001J\u0016\u0010\u00a3\u0001\u001a\u00028\u00002\u0007\u0010\u00a4\u0001\u001a\u00020\u001d\u00a2\u0006\u0003\u0010\u00a5\u0001J\u0016\u0010\u00a6\u0001\u001a\u00028\u00002\u0007\u0010\u00a7\u0001\u001a\u00020%\u00a2\u0006\u0003\u0010\u00a8\u0001JC\u0010\u00a6\u0001\u001a\u00028\u00002\u0007\u0010\u00a9\u0001\u001a\u00020%2\u0007\u0010\u00aa\u0001\u001a\u00020%2\u0007\u0010\u00ab\u0001\u001a\u00020%2\u0007\u0010\u00ac\u0001\u001a\u00020%2\u0007\u0010\u00ad\u0001\u001a\u00020%2\u0007\u0010\u00ae\u0001\u001a\u00020%\u00a2\u0006\u0003\u0010\u00af\u0001J\u0018\u0010\u00b0\u0001\u001a\u00028\u00002\t\u0010\u00b1\u0001\u001a\u0004\u0018\u00010\u001b\u00a2\u0006\u0003\u0010\u00b2\u0001J\u0015\u0010\u00b3\u0001\u001a\u00028\u00002\u0006\u00105\u001a\u00020\u001d\u00a2\u0006\u0003\u0010\u00a5\u0001J\u0014\u00108\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u00106\u001a\u00020\u0005J\u0016\u0010\u00b4\u0001\u001a\u0006\u0012\u0002\u0008\u00030\u00002\t\u0010\u00b5\u0001\u001a\u0004\u0018\u00010?J\u0011\u0010\u00b6\u0001\u001a\u00020f2\u0006\u0010j\u001a\u00020iH\u0002J\u0015\u0010\u00b7\u0001\u001a\u00028\u00002\u0006\u0010H\u001a\u00020\u001d\u00a2\u0006\u0003\u0010\u00a5\u0001J\u0012\u0010\u00b8\u0001\u001a\u00020\u001d2\u0007\u0010\u008d\u0001\u001a\u00020iH\u0004J\u0016\u0010\u00b9\u0001\u001a\u00020\u001d2\u000b\u0010\u00ba\u0001\u001a\u0006\u0012\u0002\u0008\u00030\u0000H\u0016J\u0016\u0010\u00bb\u0001\u001a\u00020\u001d2\u000b\u0010\u00ba\u0001\u001a\u0006\u0012\u0002\u0008\u00030\u0000H\u0016J\u0016\u0010\u00bc\u0001\u001a\u00020\u001d2\u000b\u0010\u00ba\u0001\u001a\u0006\u0012\u0002\u0008\u00030\u0000H\u0016J\u0014\u0010\u00bd\u0001\u001a\u00020\u001d2\u000b\u0010\u00ba\u0001\u001a\u0006\u0012\u0002\u0008\u00030\u0000J\u0010\u0010\u00be\u0001\u001a\u00020f2\u0007\u0010\u00bf\u0001\u001a\u00020\u0005J\u0010\u0010\u00c0\u0001\u001a\u00020f2\u0007\u0010\u00bf\u0001\u001a\u00020\u0005J\n\u0010\u00c1\u0001\u001a\u00030\u00c2\u0001H\u0016J\u0014\u0010\u00c3\u0001\u001a\u00030\u00c4\u00012\u0008\u0010\u00c5\u0001\u001a\u00030\u00c4\u0001H\u0004J\u000f\u0010\u00c6\u0001\u001a\u00020f2\u0006\u0010j\u001a\u00020iJ\u0007\u0010\u00c7\u0001\u001a\u00020\u001dJ\u0017\u0010\u00c8\u0001\u001a\u00020f2\u000e\u0010\u00c9\u0001\u001a\t\u0012\u0004\u0012\u00020f0\u00ca\u0001R\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\"\u0004\u0008\u0008\u0010\tR\u001a\u0010\n\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000b\u0010\u0007\"\u0004\u0008\u000c\u0010\tR\"\u0010\u000f\u001a\u0004\u0018\u00010\u000e2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000e@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011R\"\u0010\u0012\u001a\u0004\u0018\u00010\u000e2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000e@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0011R\u001e\u0010\u0015\u001a\u00020\u00142\u0006\u0010\r\u001a\u00020\u0014@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0016\u0010\u0017R\u0010\u0010\u0018\u001a\u0004\u0018\u00010\u0019X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u001a\u001a\u0004\u0018\u00010\u001bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u001c\u001a\u00020\u001dX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001c\u0010\u001e\"\u0004\u0008\u001f\u0010 R\u001a\u0010!\u001a\u00020\u001dX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008!\u0010\u001e\"\u0004\u0008\"\u0010 R\u001e\u0010#\u001a\u00020\u001d2\u0006\u0010\r\u001a\u00020\u001d@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008#\u0010\u001eR\u001e\u0010$\u001a\u00020\u001d2\u0006\u0010\r\u001a\u00020\u001d@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008$\u0010\u001eR\u001e\u0010&\u001a\u00020%2\u0006\u0010\r\u001a\u00020%@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\'\u0010(R\u001e\u0010)\u001a\u00020%2\u0006\u0010\r\u001a\u00020%@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008*\u0010(R\u000e\u0010+\u001a\u00020%X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010,\u001a\u00020%X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0011\u0010-\u001a\u00020%8F\u00a2\u0006\u0006\u001a\u0004\u0008.\u0010(R\u0011\u0010/\u001a\u00020%8F\u00a2\u0006\u0006\u001a\u0004\u00080\u0010(R\u0011\u00101\u001a\u00020%8F\u00a2\u0006\u0006\u001a\u0004\u00082\u0010(R\u0011\u00103\u001a\u00020%8F\u00a2\u0006\u0006\u001a\u0004\u00084\u0010(R\u000e\u00105\u001a\u00020\u001dX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u00106\u001a\u00020\u0005X\u0084\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00087\u0010\u0007\"\u0004\u00088\u0010\tR\u001a\u00109\u001a\u00020\u001dX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008:\u0010\u001e\"\u0004\u0008;\u0010 R\u001e\u0010<\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0005@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008=\u0010\u0007R\u0010\u0010>\u001a\u0004\u0018\u00010?X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001c\u0010@\u001a\u0004\u0018\u00010AX\u0084\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008B\u0010C\"\u0004\u0008D\u0010ER\u001e\u0010F\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0005@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008G\u0010\u0007R\u000e\u0010H\u001a\u00020\u001dX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010I\u001a\u00020\u001dX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008J\u0010\u001e\"\u0004\u0008K\u0010 R\u001e\u0010L\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0005@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008M\u0010\u0007R\u001a\u0010N\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008O\u0010\u0007\"\u0004\u0008P\u0010\tR\u001e\u0010Q\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0005@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008R\u0010\u0007R\u000e\u0010S\u001a\u00020TX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0018\u0010U\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010W0VX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010XR\u001e\u0010Y\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0005@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008Z\u0010\u0007R\u000e\u0010[\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\"\u0010]\u001a\u0004\u0018\u00010\\2\u0008\u0010\r\u001a\u0004\u0018\u00010\\@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008^\u0010_R\u000e\u0010`\u001a\u00020TX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001e\u0010a\u001a\u00020%2\u0006\u0010\r\u001a\u00020%@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008b\u0010(R\u001e\u0010c\u001a\u00020%2\u0006\u0010\r\u001a\u00020%@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008d\u0010(\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u00ce\u0001"
    }
    d2 = {
        "Lcom/swmansion/gesturehandler/core/GestureHandler;",
        "ConcreteGestureHandlerT",
        "",
        "()V",
        "actionType",
        "",
        "getActionType",
        "()I",
        "setActionType",
        "(I)V",
        "activationIndex",
        "getActivationIndex",
        "setActivationIndex",
        "<set-?>",
        "Lcom/facebook/react/bridge/WritableArray;",
        "allTouchesPayload",
        "getAllTouchesPayload",
        "()Lcom/facebook/react/bridge/WritableArray;",
        "changedTouchesPayload",
        "getChangedTouchesPayload",
        "",
        "eventCoalescingKey",
        "getEventCoalescingKey",
        "()S",
        "hitSlop",
        "",
        "interactionController",
        "Lcom/swmansion/gesturehandler/core/GestureHandlerInteractionController;",
        "isActive",
        "",
        "()Z",
        "setActive",
        "(Z)V",
        "isAwaiting",
        "setAwaiting",
        "isEnabled",
        "isWithinBounds",
        "",
        "lastAbsolutePositionX",
        "getLastAbsolutePositionX",
        "()F",
        "lastAbsolutePositionY",
        "getLastAbsolutePositionY",
        "lastEventOffsetX",
        "lastEventOffsetY",
        "lastPositionInWindowX",
        "getLastPositionInWindowX",
        "lastPositionInWindowY",
        "getLastPositionInWindowY",
        "lastRelativePositionX",
        "getLastRelativePositionX",
        "lastRelativePositionY",
        "getLastRelativePositionY",
        "manualActivation",
        "mouseButton",
        "getMouseButton",
        "setMouseButton",
        "needsPointerData",
        "getNeedsPointerData",
        "setNeedsPointerData",
        "numberOfPointers",
        "getNumberOfPointers",
        "onTouchEventListener",
        "Lcom/swmansion/gesturehandler/core/OnTouchEventListener;",
        "orchestrator",
        "Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;",
        "getOrchestrator",
        "()Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;",
        "setOrchestrator",
        "(Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;)V",
        "pointerType",
        "getPointerType",
        "shouldCancelWhenOutside",
        "shouldResetProgress",
        "getShouldResetProgress",
        "setShouldResetProgress",
        "state",
        "getState",
        "tag",
        "getTag",
        "setTag",
        "touchEventType",
        "getTouchEventType",
        "trackedPointerIDs",
        "",
        "trackedPointers",
        "",
        "Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;",
        "[Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;",
        "trackedPointersCount",
        "getTrackedPointersCount",
        "trackedPointersIDsCount",
        "Landroid/view/View;",
        "view",
        "getView",
        "()Landroid/view/View;",
        "windowOffset",
        "x",
        "getX",
        "y",
        "getY",
        "activate",
        "",
        "force",
        "adaptEvent",
        "Landroid/view/MotionEvent;",
        "event",
        "addChangedPointer",
        "pointerData",
        "addPointerToAll",
        "applySelf",
        "block",
        "Lkotlin/Function1;",
        "Lkotlin/ExtensionFunctionType;",
        "(Lkotlin/jvm/functions/Function1;)Lcom/swmansion/gesturehandler/core/GestureHandler;",
        "begin",
        "cancel",
        "cancelPointers",
        "consumeAllTouchesPayload",
        "consumeChangedTouchesPayload",
        "createPointerData",
        "Lcom/facebook/react/bridge/WritableMap;",
        "kotlin.jvm.PlatformType",
        "dispatchHandlerUpdate",
        "dispatchStateChange",
        "newState",
        "prevState",
        "dispatchTouchDownEvent",
        "dispatchTouchEvent",
        "dispatchTouchMoveEvent",
        "dispatchTouchUpEvent",
        "end",
        "extractAllPointersData",
        "fail",
        "findNextLocalPointerId",
        "getActivity",
        "Landroid/app/Activity;",
        "context",
        "Landroid/content/Context;",
        "handle",
        "transformedEvent",
        "sourceEvent",
        "hasCommonPointers",
        "other",
        "isButtonInConfig",
        "clickedButton",
        "posX",
        "posY",
        "moveToState",
        "needAdapt",
        "onCancel",
        "onHandle",
        "onHandleHover",
        "onPrepare",
        "onReset",
        "onStateChange",
        "previousState",
        "prepare",
        "reset",
        "resetConfig",
        "resetProgress",
        "self",
        "()Lcom/swmansion/gesturehandler/core/GestureHandler;",
        "setEnabled",
        "enabled",
        "(Z)Lcom/swmansion/gesturehandler/core/GestureHandler;",
        "setHitSlop",
        "padding",
        "(F)Lcom/swmansion/gesturehandler/core/GestureHandler;",
        "leftPad",
        "topPad",
        "rightPad",
        "bottomPad",
        "width",
        "height",
        "(FFFFFF)Lcom/swmansion/gesturehandler/core/GestureHandler;",
        "setInteractionController",
        "controller",
        "(Lcom/swmansion/gesturehandler/core/GestureHandlerInteractionController;)Lcom/swmansion/gesturehandler/core/GestureHandler;",
        "setManualActivation",
        "setOnTouchEventListener",
        "listener",
        "setPointerType",
        "setShouldCancelWhenOutside",
        "shouldActivateWithMouse",
        "shouldBeCancelledBy",
        "handler",
        "shouldRecognizeSimultaneously",
        "shouldRequireToWaitForFailure",
        "shouldWaitForHandlerFailure",
        "startTrackingPointer",
        "pointerId",
        "stopTrackingPointer",
        "toString",
        "",
        "transformPoint",
        "Landroid/graphics/PointF;",
        "point",
        "updatePointerData",
        "wantEvents",
        "withMarkedAsInBounds",
        "closure",
        "Lkotlin/Function0;",
        "AdaptEventException",
        "Companion",
        "PointerData",
        "react-native-gesture-handler_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final ACTION_TYPE_JS_FUNCTION_NEW_API:I = 0x4

.field public static final ACTION_TYPE_JS_FUNCTION_OLD_API:I = 0x3

.field public static final ACTION_TYPE_NATIVE_ANIMATED_EVENT:I = 0x2

.field public static final ACTION_TYPE_REANIMATED_WORKLET:I = 0x1

.field public static final Companion:Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;

.field public static final DIRECTION_DOWN:I = 0x8

.field public static final DIRECTION_LEFT:I = 0x2

.field public static final DIRECTION_RIGHT:I = 0x1

.field public static final DIRECTION_UP:I = 0x4

.field private static final HIT_SLOP_BOTTOM_IDX:I = 0x3

.field private static final HIT_SLOP_HEIGHT_IDX:I = 0x5

.field private static final HIT_SLOP_LEFT_IDX:I = 0x0

.field public static final HIT_SLOP_NONE:F = NaNf

.field private static final HIT_SLOP_RIGHT_IDX:I = 0x2

.field private static final HIT_SLOP_TOP_IDX:I = 0x1

.field private static final HIT_SLOP_WIDTH_IDX:I = 0x4

.field private static final MAX_POINTERS_COUNT:I = 0xc

.field public static final POINTER_TYPE_MOUSE:I = 0x2

.field public static final POINTER_TYPE_OTHER:I = 0x3

.field public static final POINTER_TYPE_STYLUS:I = 0x1

.field public static final POINTER_TYPE_TOUCH:I = 0x0

.field public static final STATE_ACTIVE:I = 0x4

.field public static final STATE_BEGAN:I = 0x2

.field public static final STATE_CANCELLED:I = 0x3

.field public static final STATE_END:I = 0x5

.field public static final STATE_FAILED:I = 0x1

.field public static final STATE_UNDETERMINED:I

.field private static nextEventCoalescingKey:S

.field private static pointerCoords:[Landroid/view/MotionEvent$PointerCoords;

.field private static pointerProps:[Landroid/view/MotionEvent$PointerProperties;


# instance fields
.field private actionType:I

.field private activationIndex:I

.field private allTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

.field private changedTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

.field private eventCoalescingKey:S

.field private hitSlop:[F

.field private interactionController:Lcom/swmansion/gesturehandler/core/GestureHandlerInteractionController;

.field private isActive:Z

.field private isAwaiting:Z

.field private isEnabled:Z

.field private isWithinBounds:Z

.field private lastAbsolutePositionX:F

.field private lastAbsolutePositionY:F

.field private lastEventOffsetX:F

.field private lastEventOffsetY:F

.field private manualActivation:Z

.field private mouseButton:I

.field private needsPointerData:Z

.field private numberOfPointers:I

.field private onTouchEventListener:Lcom/swmansion/gesturehandler/core/OnTouchEventListener;

.field private orchestrator:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;

.field private pointerType:I

.field private shouldCancelWhenOutside:Z

.field private shouldResetProgress:Z

.field private state:I

.field private tag:I

.field private touchEventType:I

.field private final trackedPointerIDs:[I

.field private final trackedPointers:[Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;

.field private trackedPointersCount:I

.field private trackedPointersIDsCount:I

.field private view:Landroid/view/View;

.field private final windowOffset:[I

.field private x:F

.field private y:F


# direct methods
.method public static synthetic $r8$lambda$9NpqmGEKC0WJMvnDQzG_U0Vd138(Lcom/swmansion/gesturehandler/core/GestureHandler;)V
    .locals 0

    invoke-static {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setEnabled$lambda$3$lambda$2(Lcom/swmansion/gesturehandler/core/GestureHandler;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->Companion:Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xc

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointerIDs:[I

    const/4 v1, 0x2

    new-array v2, v1, [I

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v1, :cond_0

    .line 25
    aput v3, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    iput-object v2, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->windowOffset:[I

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->isEnabled:Z

    new-array v1, v0, [Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;

    :goto_1
    if-ge v3, v0, :cond_1

    const/4 v2, 0x0

    .line 49
    aput-object v2, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    iput-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointers:[Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;

    const/4 v0, 0x3

    iput v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->pointerType:I

    return-void
.end method

.method public static final synthetic access$getPointerCoords$cp()[Landroid/view/MotionEvent$PointerCoords;
    .locals 1

    sget-object v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->pointerCoords:[Landroid/view/MotionEvent$PointerCoords;

    return-object v0
.end method

.method public static final synthetic access$getPointerProps$cp()[Landroid/view/MotionEvent$PointerProperties;
    .locals 1

    sget-object v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->pointerProps:[Landroid/view/MotionEvent$PointerProperties;

    return-object v0
.end method

.method public static final synthetic access$getTrackedPointerIDs$p(Lcom/swmansion/gesturehandler/core/GestureHandler;)[I
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointerIDs:[I

    return-object p0
.end method

.method public static final synthetic access$getTrackedPointersIDsCount$p(Lcom/swmansion/gesturehandler/core/GestureHandler;)I
    .locals 0

    .line 22
    iget p0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersIDsCount:I

    return p0
.end method

.method public static final synthetic access$self(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/core/GestureHandler;
    .locals 0

    .line 22
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->self()Lcom/swmansion/gesturehandler/core/GestureHandler;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$setPointerCoords$cp([Landroid/view/MotionEvent$PointerCoords;)V
    .locals 0

    sput-object p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->pointerCoords:[Landroid/view/MotionEvent$PointerCoords;

    return-void
.end method

.method public static final synthetic access$setPointerProps$cp([Landroid/view/MotionEvent$PointerProperties;)V
    .locals 0

    sput-object p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->pointerProps:[Landroid/view/MotionEvent$PointerProperties;

    return-void
.end method

.method private final adaptEvent(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;
    .locals 25

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    .line 246
    invoke-direct/range {p0 .. p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->needAdapt(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    return-object v2

    .line 249
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v3, 0x2

    const/4 v4, 0x5

    const/4 v5, 0x0

    const/4 v6, -0x1

    const/4 v7, 0x1

    if-eqz v0, :cond_3

    const/4 v8, 0x6

    if-eq v0, v7, :cond_1

    if-eq v0, v4, :cond_3

    if-eq v0, v8, :cond_1

    move v3, v0

    move v0, v6

    goto :goto_0

    .line 260
    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    .line 261
    invoke-virtual {v2, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v4

    iget-object v9, v1, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointerIDs:[I

    .line 262
    aget v4, v9, v4

    if-eq v4, v6, :cond_5

    iget v3, v1, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersIDsCount:I

    if-ne v3, v7, :cond_2

    move v3, v7

    goto :goto_0

    :cond_2
    move v3, v8

    goto :goto_0

    .line 252
    :cond_3
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    .line 253
    invoke-virtual {v2, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v8

    iget-object v9, v1, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointerIDs:[I

    .line 254
    aget v8, v9, v8

    if-eq v8, v6, :cond_5

    iget v3, v1, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersIDsCount:I

    if-ne v3, v7, :cond_4

    move v3, v5

    goto :goto_0

    :cond_4
    move v3, v4

    :cond_5
    :goto_0
    sget-object v4, Lcom/swmansion/gesturehandler/core/GestureHandler;->Companion:Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;

    iget v7, v1, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersIDsCount:I

    .line 268
    invoke-static {v4, v7}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$initPointerProps(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;I)V

    .line 270
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    sub-float/2addr v4, v7

    .line 271
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v7

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    sub-float/2addr v7, v8

    .line 272
    invoke-virtual {v2, v4, v7}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 274
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v8

    move v13, v3

    move v14, v5

    :goto_1
    const-string v3, "pointerCoords"

    const-string v9, "pointerProps"

    const/4 v10, 0x0

    if-ge v5, v8, :cond_b

    .line 276
    invoke-virtual {v2, v5}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v11

    iget-object v12, v1, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointerIDs:[I

    .line 277
    aget v12, v12, v11

    if-eq v12, v6, :cond_a

    sget-object v12, Lcom/swmansion/gesturehandler/core/GestureHandler;->pointerProps:[Landroid/view/MotionEvent$PointerProperties;

    if-nez v12, :cond_6

    .line 278
    invoke-static {v9}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v12, v10

    :cond_6
    aget-object v12, v12, v14

    invoke-virtual {v2, v5, v12}, Landroid/view/MotionEvent;->getPointerProperties(ILandroid/view/MotionEvent$PointerProperties;)V

    sget-object v12, Lcom/swmansion/gesturehandler/core/GestureHandler;->pointerProps:[Landroid/view/MotionEvent$PointerProperties;

    if-nez v12, :cond_7

    .line 279
    invoke-static {v9}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v12, v10

    :cond_7
    aget-object v9, v12, v14

    invoke-static {v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v12, v1, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointerIDs:[I

    aget v11, v12, v11

    iput v11, v9, Landroid/view/MotionEvent$PointerProperties;->id:I

    sget-object v9, Lcom/swmansion/gesturehandler/core/GestureHandler;->pointerCoords:[Landroid/view/MotionEvent$PointerCoords;

    if-nez v9, :cond_8

    .line 280
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_2

    :cond_8
    move-object v10, v9

    :goto_2
    aget-object v3, v10, v14

    invoke-virtual {v2, v5, v3}, Landroid/view/MotionEvent;->getPointerCoords(ILandroid/view/MotionEvent$PointerCoords;)V

    if-ne v5, v0, :cond_9

    shl-int/lit8 v3, v14, 0x8

    or-int/2addr v13, v3

    :cond_9
    add-int/lit8 v14, v14, 0x1

    :cond_a
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_b
    sget-object v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->pointerProps:[Landroid/view/MotionEvent$PointerProperties;

    if-nez v0, :cond_c

    .line 290
    invoke-static {v9}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v10

    :cond_c
    array-length v0, v0

    if-nez v0, :cond_d

    goto :goto_3

    :cond_d
    sget-object v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->pointerCoords:[Landroid/view/MotionEvent$PointerCoords;

    if-nez v0, :cond_e

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v10

    :cond_e
    array-length v0, v0

    if-nez v0, :cond_11

    .line 291
    :goto_3
    new-instance v0, Ljava/lang/IllegalStateException;

    sget-object v2, Lcom/swmansion/gesturehandler/core/GestureHandler;->pointerCoords:[Landroid/view/MotionEvent$PointerCoords;

    if-nez v2, :cond_f

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v10

    :cond_f
    array-length v2, v2

    sget-object v3, Lcom/swmansion/gesturehandler/core/GestureHandler;->pointerProps:[Landroid/view/MotionEvent$PointerProperties;

    if-nez v3, :cond_10

    invoke-static {v9}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_4

    :cond_10
    move-object v10, v3

    :goto_4
    array-length v3, v10

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "pointerCoords.size="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", pointerProps.size="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 297
    :cond_11
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v5

    .line 298
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v11

    sget-object v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->pointerProps:[Landroid/view/MotionEvent$PointerProperties;

    if-nez v0, :cond_12

    .line 301
    invoke-static {v9}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v15, v10

    goto :goto_5

    :cond_12
    move-object v15, v0

    :goto_5
    sget-object v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->pointerCoords:[Landroid/view/MotionEvent$PointerCoords;

    if-nez v0, :cond_13

    .line 302
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object/from16 v16, v10

    goto :goto_6

    :cond_13
    move-object/from16 v16, v0

    .line 303
    :goto_6
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getMetaState()I

    move-result v17

    .line 304
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v18

    .line 305
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getXPrecision()F

    move-result v19

    .line 306
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getYPrecision()F

    move-result v20

    .line 307
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v21

    .line 308
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v22

    .line 309
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v23

    .line 310
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getFlags()I

    move-result v24

    move-wide v9, v5

    .line 296
    invoke-static/range {v9 .. v24}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    move-result-object v0

    const-string v3, "obtain(...)"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    neg-float v3, v4

    neg-float v4, v7

    .line 315
    invoke-virtual {v2, v3, v4}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 316
    invoke-virtual {v0, v3, v4}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    return-object v0

    :catch_0
    move-exception v0

    .line 313
    new-instance v3, Lcom/swmansion/gesturehandler/core/GestureHandler$AdaptEventException;

    invoke-direct {v3, v1, v2, v0}, Lcom/swmansion/gesturehandler/core/GestureHandler$AdaptEventException;-><init>(Lcom/swmansion/gesturehandler/core/GestureHandler;Landroid/view/MotionEvent;Ljava/lang/IllegalArgumentException;)V

    throw v3
.end method

.method private final addChangedPointer(Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;)V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->changedTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    if-nez v0, :cond_0

    .line 515
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v0

    iput-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->changedTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    :cond_0
    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->changedTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    .line 518
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->createPointerData(Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/bridge/ReadableMap;

    invoke-interface {v0, p1}, Lcom/facebook/react/bridge/WritableArray;->pushMap(Lcom/facebook/react/bridge/ReadableMap;)V

    return-void
.end method

.method private final addPointerToAll(Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;)V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->allTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    if-nez v0, :cond_0

    .line 523
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v0

    iput-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->allTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    :cond_0
    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->allTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    .line 526
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->createPointerData(Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/bridge/ReadableMap;

    invoke-interface {v0, p1}, Lcom/facebook/react/bridge/WritableArray;->pushMap(Lcom/facebook/react/bridge/ReadableMap;)V

    return-void
.end method

.method private final cancelPointers()V
    .locals 10

    const/4 v0, 0x4

    iput v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->touchEventType:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->changedTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    .line 499
    invoke-direct {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->extractAllPointersData()V

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointers:[Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;

    .line 501
    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    if-eqz v4, :cond_0

    .line 503
    invoke-direct {p0, v4}, Lcom/swmansion/gesturehandler/core/GestureHandler;->addChangedPointer(Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;)V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    iput v2, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersCount:I

    iget-object v4, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointers:[Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x6

    const/4 v9, 0x0

    .line 508
    invoke-static/range {v4 .. v9}, Lkotlin/collections/ArraysKt;->fill$default([Ljava/lang/Object;Ljava/lang/Object;IIILjava/lang/Object;)V

    .line 510
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchTouchEvent()V

    return-void
.end method

.method private final createPointerData(Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;)Lcom/facebook/react/bridge/WritableMap;
    .locals 4

    .line 529
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "id"

    .line 530
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;->getPointerId()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    .line 531
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;->getX()F

    move-result v1

    invoke-static {v1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v1

    float-to-double v1, v1

    const-string/jumbo v3, "x"

    invoke-interface {v0, v3, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 532
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;->getY()F

    move-result v1

    invoke-static {v1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v1

    float-to-double v1, v1

    const-string/jumbo v3, "y"

    invoke-interface {v0, v3, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 533
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;->getAbsoluteX()F

    move-result v1

    invoke-static {v1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result v1

    float-to-double v1, v1

    const-string v3, "absoluteX"

    invoke-interface {v0, v3, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    .line 534
    invoke-virtual {p1}, Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;->getAbsoluteY()F

    move-result p1

    invoke-static {p1}, Lcom/facebook/react/uimanager/PixelUtil;->toDIPFromPixel(F)F

    move-result p1

    float-to-double v1, p1

    const-string p1, "absoluteY"

    invoke-interface {v0, p1, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    return-object v0
.end method

.method private final dispatchTouchDownEvent(Landroid/view/MotionEvent;)V
    .locals 10

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->changedTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    const/4 v0, 0x1

    iput v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->touchEventType:I

    .line 403
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 404
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    sub-float/2addr v2, v3

    .line 405
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    sub-float/2addr v3, v4

    iget-object v8, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointers:[Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;

    .line 407
    new-instance v9, Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;

    .line 409
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    .line 410
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v5

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    .line 411
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v6

    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    add-float/2addr v6, v2

    iget-object v2, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->windowOffset:[I

    const/4 v7, 0x0

    aget v2, v2, v7

    int-to-float v2, v2

    sub-float/2addr v6, v2

    .line 412
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    add-float/2addr p1, v3

    iget-object v2, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->windowOffset:[I

    aget v2, v2, v0

    int-to-float v2, v2

    sub-float v7, p1, v2

    move-object v2, v9

    move v3, v1

    .line 407
    invoke-direct/range {v2 .. v7}, Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;-><init>(IFFFF)V

    aput-object v9, v8, v1

    iget p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersCount:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersCount:I

    iget-object p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointers:[Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;

    .line 415
    aget-object p1, p1, v1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->addChangedPointer(Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;)V

    .line 416
    invoke-direct {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->extractAllPointersData()V

    .line 418
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchTouchEvent()V

    return-void
.end method

.method private final dispatchTouchMoveEvent(Landroid/view/MotionEvent;)V
    .locals 10

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->changedTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    const/4 v0, 0x2

    iput v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->touchEventType:I

    .line 446
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    sub-float/2addr v0, v1

    .line 447
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    sub-float/2addr v1, v2

    .line 450
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_0
    if-ge v4, v2, :cond_2

    .line 451
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    iget-object v7, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointers:[Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;

    .line 452
    aget-object v6, v7, v6

    if-nez v6, :cond_0

    goto :goto_1

    .line 454
    :cond_0
    invoke-virtual {v6}, Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;->getX()F

    move-result v7

    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v8

    cmpg-float v7, v7, v8

    if-nez v7, :cond_1

    invoke-virtual {v6}, Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;->getY()F

    move-result v7

    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    cmpg-float v7, v7, v8

    if-nez v7, :cond_1

    goto :goto_1

    .line 455
    :cond_1
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    invoke-virtual {v6, v7}, Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;->setX(F)V

    .line 456
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    invoke-virtual {v6, v7}, Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;->setY(F)V

    .line 457
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    add-float/2addr v7, v0

    iget-object v8, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->windowOffset:[I

    aget v8, v8, v3

    int-to-float v8, v8

    sub-float/2addr v7, v8

    invoke-virtual {v6, v7}, Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;->setAbsoluteX(F)V

    .line 458
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    add-float/2addr v7, v1

    iget-object v8, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->windowOffset:[I

    const/4 v9, 0x1

    aget v8, v8, v9

    int-to-float v8, v8

    sub-float/2addr v7, v8

    invoke-virtual {v6, v7}, Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;->setAbsoluteY(F)V

    .line 460
    invoke-direct {p0, v6}, Lcom/swmansion/gesturehandler/core/GestureHandler;->addChangedPointer(Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;)V

    add-int/lit8 v5, v5, 0x1

    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    if-lez v5, :cond_3

    .line 469
    invoke-direct {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->extractAllPointersData()V

    .line 470
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchTouchEvent()V

    :cond_3
    return-void
.end method

.method private final dispatchTouchUpEvent(Landroid/view/MotionEvent;)V
    .locals 10

    .line 422
    invoke-direct {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->extractAllPointersData()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->changedTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    const/4 v1, 0x3

    iput v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->touchEventType:I

    .line 425
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 426
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    sub-float/2addr v2, v3

    .line 427
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    sub-float/2addr v3, v4

    iget-object v8, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointers:[Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;

    .line 429
    new-instance v9, Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;

    .line 431
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    .line 432
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v5

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    .line 433
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v6

    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    add-float/2addr v6, v2

    iget-object v2, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->windowOffset:[I

    const/4 v7, 0x0

    aget v2, v2, v7

    int-to-float v2, v2

    sub-float/2addr v6, v2

    .line 434
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    add-float/2addr p1, v3

    iget-object v2, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->windowOffset:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    int-to-float v2, v2

    sub-float v7, p1, v2

    move-object v2, v9

    move v3, v1

    .line 429
    invoke-direct/range {v2 .. v7}, Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;-><init>(IFFFF)V

    aput-object v9, v8, v1

    iget-object p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointers:[Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;

    .line 436
    aget-object p1, p1, v1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->addChangedPointer(Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;)V

    iget-object p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointers:[Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;

    .line 437
    aput-object v0, p1, v1

    iget p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersCount:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersCount:I

    .line 440
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchTouchEvent()V

    return-void
.end method

.method private final extractAllPointersData()V
    .locals 4

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->allTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointers:[Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;

    .line 489
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    if-eqz v3, :cond_0

    .line 491
    invoke-direct {p0, v3}, Lcom/swmansion/gesturehandler/core/GestureHandler;->addPointerToAll(Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private final findNextLocalPointerId()I
    .locals 5

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget v2, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersIDsCount:I

    if-ge v1, v2, :cond_3

    move v2, v0

    :goto_1
    iget-object v3, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointerIDs:[I

    .line 203
    array-length v4, v3

    if-ge v2, v4, :cond_1

    .line 204
    aget v4, v3, v2

    if-ne v4, v1, :cond_0

    goto :goto_2

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 209
    :cond_1
    :goto_2
    array-length v3, v3

    if-ne v2, v3, :cond_2

    return v1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return v1
.end method

.method private final getActivity(Landroid/content/Context;)Landroid/app/Activity;
    .locals 1

    .line 193
    instance-of v0, p1, Lcom/facebook/react/bridge/ReactContext;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/facebook/react/bridge/ReactContext;

    invoke-virtual {p1}, Lcom/facebook/react/bridge/ReactContext;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p1

    goto :goto_0

    .line 194
    :cond_0
    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_1

    check-cast p1, Landroid/app/Activity;

    goto :goto_0

    .line 195
    :cond_1
    instance-of v0, p1, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_2

    check-cast p1, Landroid/content/ContextWrapper;

    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object p1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method private final isButtonInConfig(I)Z
    .locals 3

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->mouseButton:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    if-ne p1, v2, :cond_0

    move v1, v2

    :cond_0
    return v1

    :cond_1
    and-int/2addr p1, v0

    if-eqz p1, :cond_2

    move v1, v2

    :cond_2
    return v1
.end method

.method private final moveToState(I)V
    .locals 3

    .line 550
    invoke-static {}, Lcom/facebook/react/bridge/UiThreadUtil;->assertOnUiThread()V

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->state:I

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersCount:I

    if-lez v0, :cond_2

    const/4 v0, 0x5

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 557
    :cond_1
    invoke-direct {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->cancelPointers()V

    :cond_2
    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->state:I

    iput p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->state:I

    const/4 v1, 0x4

    if-ne p1, v1, :cond_3

    sget-short v1, Lcom/swmansion/gesturehandler/core/GestureHandler;->nextEventCoalescingKey:S

    add-int/lit8 v2, v1, 0x1

    int-to-short v2, v2

    sput-short v2, Lcom/swmansion/gesturehandler/core/GestureHandler;->nextEventCoalescingKey:S

    iput-short v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->eventCoalescingKey:S

    :cond_3
    iget-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->orchestrator:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;

    .line 568
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v1, p0, p1, v0}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->onHandlerStateChange(Lcom/swmansion/gesturehandler/core/GestureHandler;II)V

    .line 569
    invoke-virtual {p0, p1, v0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->onStateChange(II)V

    return-void
.end method

.method private final needAdapt(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 232
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersIDsCount:I

    const/4 v1, 0x1

    if-eq p1, v0, :cond_0

    return v1

    :cond_0
    iget-object p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointerIDs:[I

    .line 236
    array-length p1, p1

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-ge v2, p1, :cond_2

    iget-object v3, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointerIDs:[I

    .line 237
    aget v3, v3, v2

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1

    if-eq v3, v2, :cond_1

    return v1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method private static final setEnabled$lambda$3$lambda$2(Lcom/swmansion/gesturehandler/core/GestureHandler;)V
    .locals 1

    const-string v0, "$this_applySelf"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 128
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->cancel()V

    return-void
.end method

.method private final setPointerType(Landroid/view/MotionEvent;)V
    .locals 2

    .line 774
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    .line 776
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v1, 0x2

    if-eq p1, v1, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :cond_2
    :goto_0
    iput v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->pointerType:I

    return-void
.end method


# virtual methods
.method public final activate()V
    .locals 1

    const/4 v0, 0x0

    .line 667
    invoke-virtual {p0, v0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->activate(Z)V

    return-void
.end method

.method public activate(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->manualActivation:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_2

    :cond_0
    iget p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->state:I

    if-eqz p1, :cond_1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    :cond_1
    const/4 p1, 0x4

    .line 671
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->moveToState(I)V

    :cond_2
    return-void
.end method

.method protected final applySelf(Lkotlin/jvm/functions/Function1;)Lcom/swmansion/gesturehandler/core/GestureHandler;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-TConcreteGestureHandlerT;",
            "Lkotlin/Unit;",
            ">;)TConcreteGestureHandlerT;"
        }
    .end annotation

    const-string v0, "block"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 79
    invoke-static {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->access$self(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/core/GestureHandler;

    move-result-object v0

    invoke-interface {p1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public final begin()V
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->state:I

    if-nez v0, :cond_0

    const/4 v0, 0x2

    .line 677
    invoke-direct {p0, v0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->moveToState(I)V

    :cond_0
    return-void
.end method

.method public final cancel()V
    .locals 2

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->state:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    if-eqz v0, :cond_0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->isAwaiting:Z

    if-eqz v0, :cond_1

    .line 656
    :cond_0
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->onCancel()V

    const/4 v0, 0x3

    .line 657
    invoke-direct {p0, v0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->moveToState(I)V

    :cond_1
    return-void
.end method

.method public final consumeAllTouchesPayload()Lcom/facebook/react/bridge/WritableArray;
    .locals 2

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->allTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->allTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    return-object v0
.end method

.method public final consumeChangedTouchesPayload()Lcom/facebook/react/bridge/WritableArray;
    .locals 2

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->changedTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->changedTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    return-object v0
.end method

.method public dispatchHandlerUpdate(Landroid/view/MotionEvent;)V
    .locals 2

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->onTouchEventListener:Lcom/swmansion/gesturehandler/core/OnTouchEventListener;

    if-eqz v0, :cond_0

    .line 92
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->self()Lcom/swmansion/gesturehandler/core/GestureHandler;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lcom/swmansion/gesturehandler/core/OnTouchEventListener;->onHandlerUpdate(Lcom/swmansion/gesturehandler/core/GestureHandler;Landroid/view/MotionEvent;)V

    :cond_0
    return-void
.end method

.method public dispatchStateChange(II)V
    .locals 2

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->onTouchEventListener:Lcom/swmansion/gesturehandler/core/OnTouchEventListener;

    if-eqz v0, :cond_0

    .line 88
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->self()Lcom/swmansion/gesturehandler/core/GestureHandler;

    move-result-object v1

    invoke-interface {v0, v1, p1, p2}, Lcom/swmansion/gesturehandler/core/OnTouchEventListener;->onStateChange(Lcom/swmansion/gesturehandler/core/GestureHandler;II)V

    :cond_0
    return-void
.end method

.method public dispatchTouchEvent()V
    .locals 2

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->changedTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->onTouchEventListener:Lcom/swmansion/gesturehandler/core/OnTouchEventListener;

    if-eqz v0, :cond_0

    .line 97
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->self()Lcom/swmansion/gesturehandler/core/GestureHandler;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/swmansion/gesturehandler/core/OnTouchEventListener;->onTouchEvent(Lcom/swmansion/gesturehandler/core/GestureHandler;)V

    :cond_0
    return-void
.end method

.method public final end()V
    .locals 2

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->state:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x5

    .line 683
    invoke-direct {p0, v0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->moveToState(I)V

    :cond_1
    return-void
.end method

.method public final fail()V
    .locals 2

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->state:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    if-eqz v0, :cond_0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 663
    invoke-direct {p0, v0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->moveToState(I)V

    :cond_1
    return-void
.end method

.method public final getActionType()I
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->actionType:I

    return v0
.end method

.method public final getActivationIndex()I
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->activationIndex:I

    return v0
.end method

.method public final getAllTouchesPayload()Lcom/facebook/react/bridge/WritableArray;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->allTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    return-object v0
.end method

.method public final getChangedTouchesPayload()Lcom/facebook/react/bridge/WritableArray;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->changedTouchesPayload:Lcom/facebook/react/bridge/WritableArray;

    return-object v0
.end method

.method public final getEventCoalescingKey()S
    .locals 1

    iget-short v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->eventCoalescingKey:S

    return v0
.end method

.method public final getLastAbsolutePositionX()F
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->lastAbsolutePositionX:F

    return v0
.end method

.method public final getLastAbsolutePositionY()F
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->lastAbsolutePositionY:F

    return v0
.end method

.method public final getLastPositionInWindowX()F
    .locals 3

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->lastAbsolutePositionX:F

    iget v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->lastEventOffsetX:F

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->windowOffset:[I

    const/4 v2, 0x0

    .line 800
    aget v1, v1, v2

    int-to-float v1, v1

    sub-float/2addr v0, v1

    return v0
.end method

.method public final getLastPositionInWindowY()F
    .locals 3

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->lastAbsolutePositionY:F

    iget v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->lastEventOffsetY:F

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->windowOffset:[I

    const/4 v2, 0x1

    .line 802
    aget v1, v1, v2

    int-to-float v1, v1

    sub-float/2addr v0, v1

    return v0
.end method

.method public final getLastRelativePositionX()F
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->lastAbsolutePositionX:F

    return v0
.end method

.method public final getLastRelativePositionY()F
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->lastAbsolutePositionY:F

    return v0
.end method

.method protected final getMouseButton()I
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->mouseButton:I

    return v0
.end method

.method public final getNeedsPointerData()Z
    .locals 1

    iget-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->needsPointerData:Z

    return v0
.end method

.method public final getNumberOfPointers()I
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->numberOfPointers:I

    return v0
.end method

.method protected final getOrchestrator()Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->orchestrator:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;

    return-object v0
.end method

.method public final getPointerType()I
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->pointerType:I

    return v0
.end method

.method public final getShouldResetProgress()Z
    .locals 1

    iget-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->shouldResetProgress:Z

    return v0
.end method

.method public final getState()I
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->state:I

    return v0
.end method

.method public final getTag()I
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->tag:I

    return v0
.end method

.method public final getTouchEventType()I
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->touchEventType:I

    return v0
.end method

.method public final getTrackedPointersCount()I
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersCount:I

    return v0
.end method

.method public final getView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->view:Landroid/view/View;

    return-object v0
.end method

.method public final getX()F
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->x:F

    return v0
.end method

.method public final getY()F
    .locals 1

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->y:F

    return v0
.end method

.method public final handle(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)V
    .locals 7

    const-string/jumbo v0, "transformedEvent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "sourceEvent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->isEnabled:Z

    if-eqz v0, :cond_a

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->state:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_a

    const/4 v1, 0x1

    if-eq v0, v1, :cond_a

    const/4 v2, 0x5

    if-eq v0, v2, :cond_a

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersIDsCount:I

    if-ge v0, v1, :cond_0

    goto/16 :goto_3

    :cond_0
    const/4 v0, 0x2

    :try_start_0
    new-array v2, v0, [Landroid/view/MotionEvent;

    .line 356
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->adaptEvent(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-direct {p0, p2}, Lcom/swmansion/gesturehandler/core/GestureHandler;->adaptEvent(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v3

    aput-object v3, v2, v1
    :try_end_0
    .catch Lcom/swmansion/gesturehandler/core/GestureHandler$AdaptEventException; {:try_start_0 .. :try_end_0} :catch_0

    aget-object v2, v2, v4

    .line 363
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    iput v4, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->x:F

    .line 364
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    iput v4, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->y:F

    .line 365
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v4

    iput v4, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->numberOfPointers:I

    iget-object v4, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->view:Landroid/view/View;

    iget v5, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->x:F

    iget v6, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->y:F

    .line 366
    invoke-virtual {p0, v4, v5, v6}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isWithinBounds(Landroid/view/View;FF)Z

    move-result v4

    iput-boolean v4, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->isWithinBounds:Z

    iget-boolean v5, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->shouldCancelWhenOutside:Z

    if-eqz v5, :cond_3

    if-nez v4, :cond_3

    iget p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->state:I

    const/4 p2, 0x4

    if-ne p1, p2, :cond_1

    .line 369
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->cancel()V

    goto :goto_0

    :cond_1
    if-ne p1, v0, :cond_2

    .line 371
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->fail()V

    :cond_2
    :goto_0
    return-void

    .line 375
    :cond_3
    sget-object v0, Lcom/swmansion/gesturehandler/core/GestureUtils;->INSTANCE:Lcom/swmansion/gesturehandler/core/GestureUtils;

    invoke-virtual {v0, v2, v1}, Lcom/swmansion/gesturehandler/core/GestureUtils;->getLastPointerX(Landroid/view/MotionEvent;Z)F

    move-result v0

    iput v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->lastAbsolutePositionX:F

    .line 376
    sget-object v0, Lcom/swmansion/gesturehandler/core/GestureUtils;->INSTANCE:Lcom/swmansion/gesturehandler/core/GestureUtils;

    invoke-virtual {v0, v2, v1}, Lcom/swmansion/gesturehandler/core/GestureUtils;->getLastPointerY(Landroid/view/MotionEvent;Z)F

    move-result v0

    iput v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->lastAbsolutePositionY:F

    .line 377
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->lastEventOffsetX:F

    .line 378
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->lastEventOffsetY:F

    .line 380
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x7

    const/16 v4, 0x9

    if-eqz v0, :cond_4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-eq v0, v4, :cond_4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_5

    .line 381
    :cond_4
    invoke-direct {p0, p2}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setPointerType(Landroid/view/MotionEvent;)V

    .line 384
    :cond_5
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-eq v0, v4, :cond_7

    .line 385
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-eq v0, v1, :cond_7

    .line 386
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_6

    goto :goto_1

    .line 390
    :cond_6
    invoke-virtual {p0, v2, v3}, Lcom/swmansion/gesturehandler/core/GestureHandler;->onHandle(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)V

    goto :goto_2

    .line 388
    :cond_7
    :goto_1
    invoke-virtual {p0, v2, v3}, Lcom/swmansion/gesturehandler/core/GestureHandler;->onHandleHover(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)V

    .line 392
    :goto_2
    invoke-static {v2, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    .line 393
    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    .line 395
    :cond_8
    invoke-static {v3, p2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_9

    .line 396
    invoke-virtual {v3}, Landroid/view/MotionEvent;->recycle()V

    :cond_9
    return-void

    .line 358
    :catch_0
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->fail()V

    :cond_a
    :goto_3
    return-void
.end method

.method public final hasCommonPointers(Lcom/swmansion/gesturehandler/core/GestureHandler;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;)Z"
        }
    .end annotation

    const-string v0, "other"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointerIDs:[I

    .line 110
    array-length v0, v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    iget-object v3, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointerIDs:[I

    .line 111
    aget v3, v3, v2

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    iget-object v3, p1, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointerIDs:[I

    aget v3, v3, v2

    if-eq v3, v4, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public final isActive()Z
    .locals 1

    iget-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->isActive:Z

    return v0
.end method

.method public final isAwaiting()Z
    .locals 1

    iget-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->isAwaiting:Z

    return v0
.end method

.method public final isEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->isEnabled:Z

    return v0
.end method

.method public final isWithinBounds()Z
    .locals 1

    iget-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->isWithinBounds:Z

    return v0
.end method

.method public final isWithinBounds(Landroid/view/View;FF)Z
    .locals 15

    .line 615
    invoke-static/range {p1 .. p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    .line 616
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    move-object v2, p0

    iget-object v3, v2, Lcom/swmansion/gesturehandler/core/GestureHandler;->hitSlop:[F

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-eqz v3, :cond_8

    .line 618
    aget v7, v3, v5

    .line 619
    aget v8, v3, v4

    const/4 v9, 0x2

    .line 620
    aget v9, v3, v9

    const/4 v10, 0x3

    .line 621
    aget v10, v3, v10

    sget-object v11, Lcom/swmansion/gesturehandler/core/GestureHandler;->Companion:Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;

    .line 622
    invoke-static {v11, v7}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result v12

    if-eqz v12, :cond_0

    sub-float v12, v6, v7

    goto :goto_0

    :cond_0
    move v12, v6

    .line 625
    :goto_0
    invoke-static {v11, v8}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result v13

    if-eqz v13, :cond_1

    sub-float/2addr v6, v8

    .line 628
    :cond_1
    invoke-static {v11, v9}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result v13

    if-eqz v13, :cond_2

    add-float/2addr v0, v9

    .line 631
    :cond_2
    invoke-static {v11, v10}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result v13

    if-eqz v13, :cond_3

    add-float/2addr v1, v10

    :cond_3
    const/4 v13, 0x4

    .line 634
    aget v13, v3, v13

    const/4 v14, 0x5

    .line 635
    aget v3, v3, v14

    .line 636
    invoke-static {v11, v13}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result v14

    if-eqz v14, :cond_5

    .line 637
    invoke-static {v11, v7}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result v7

    if-nez v7, :cond_4

    sub-float v7, v0, v13

    move v12, v7

    goto :goto_1

    .line 639
    :cond_4
    invoke-static {v11, v9}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result v7

    if-nez v7, :cond_5

    add-float/2addr v13, v12

    move v0, v13

    .line 643
    :cond_5
    :goto_1
    invoke-static {v11, v3}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 644
    invoke-static {v11, v8}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result v7

    if-nez v7, :cond_6

    sub-float v3, v1, v3

    move v6, v3

    goto :goto_2

    .line 646
    :cond_6
    invoke-static {v11, v10}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result v7

    if-nez v7, :cond_7

    add-float/2addr v3, v6

    move v1, v3

    :cond_7
    :goto_2
    move v3, v6

    move v6, v12

    goto :goto_3

    :cond_8
    move v3, v6

    :goto_3
    cmpg-float v6, v6, p2

    if-gtz v6, :cond_9

    cmpg-float v0, p2, v0

    if-gtz v0, :cond_9

    cmpg-float v0, v3, p3

    if-gtz v0, :cond_9

    cmpg-float v0, p3, v1

    if-gtz v0, :cond_9

    goto :goto_4

    :cond_9
    move v4, v5

    :goto_4
    return v4
.end method

.method protected onCancel()V
    .locals 0

    return-void
.end method

.method protected onHandle(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)V
    .locals 1

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "sourceEvent"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 692
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->moveToState(I)V

    return-void
.end method

.method protected onHandleHover(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)V
    .locals 1

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "sourceEvent"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method protected onPrepare()V
    .locals 0

    return-void
.end method

.method protected onReset()V
    .locals 0

    return-void
.end method

.method protected onStateChange(II)V
    .locals 0

    return-void
.end method

.method public final prepare(Landroid/view/View;Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;)V
    .locals 2

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->view:Landroid/view/View;

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->orchestrator:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointerIDs:[I

    const/4 v1, -0x1

    .line 172
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersIDsCount:I

    iput v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->state:I

    iput-object p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->view:Landroid/view/View;

    iput-object p2, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->orchestrator:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    .line 178
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    goto :goto_0

    :cond_0
    move-object p1, p2

    :goto_0
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->getActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object p1

    if-eqz p1, :cond_1

    const p2, 0x1020002

    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p2

    :cond_1
    if-eqz p2, :cond_2

    iget-object p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->windowOffset:[I

    .line 180
    invoke-virtual {p2, p1}, Landroid/view/View;->getLocationOnScreen([I)V

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->windowOffset:[I

    .line 182
    aput v0, p1, v0

    const/4 p2, 0x1

    .line 183
    aput v0, p1, p2

    .line 186
    :goto_1
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->onPrepare()V

    return-void

    .line 171
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Already prepared or hasn\'t been reset"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final reset()V
    .locals 7

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->view:Landroid/view/View;

    iput-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->orchestrator:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointerIDs:[I

    const/4 v1, -0x1

    .line 759
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersIDsCount:I

    iput v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersCount:I

    iget-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointers:[Lcom/swmansion/gesturehandler/core/GestureHandler$PointerData;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x6

    const/4 v6, 0x0

    .line 762
    invoke-static/range {v1 .. v6}, Lkotlin/collections/ArraysKt;->fill$default([Ljava/lang/Object;Ljava/lang/Object;IIILjava/lang/Object;)V

    iput v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->touchEventType:I

    .line 764
    invoke-virtual {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->onReset()V

    return-void
.end method

.method public resetConfig()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->needsPointerData:Z

    iput-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->manualActivation:Z

    iput-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->shouldCancelWhenOutside:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->isEnabled:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->hitSlop:[F

    return-void
.end method

.method public resetProgress()V
    .locals 0

    return-void
.end method

.method protected final self()Lcom/swmansion/gesturehandler/core/GestureHandler;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TConcreteGestureHandlerT;"
        }
    .end annotation

    const-string v0, "null cannot be cast to non-null type ConcreteGestureHandlerT of com.swmansion.gesturehandler.core.GestureHandler"

    .line 76
    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v0, p0

    check-cast v0, Lcom/swmansion/gesturehandler/core/GestureHandler;

    return-object p0
.end method

.method public final setActionType(I)V
    .locals 0

    iput p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->actionType:I

    return-void
.end method

.method public final setActivationIndex(I)V
    .locals 0

    iput p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->activationIndex:I

    return-void
.end method

.method public final setActive(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->isActive:Z

    return-void
.end method

.method public final setAwaiting(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->isAwaiting:Z

    return-void
.end method

.method public final setEnabled(Z)Lcom/swmansion/gesturehandler/core/GestureHandler;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TConcreteGestureHandlerT;"
        }
    .end annotation

    .line 876
    invoke-static {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->access$self(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/core/GestureHandler;

    move-result-object v0

    .line 125
    iget-object v1, v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->view:Landroid/view/View;

    if-eqz v1, :cond_0

    iget-boolean v1, v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->isEnabled:Z

    if-eq v1, p1, :cond_0

    .line 128
    new-instance v1, Lcom/swmansion/gesturehandler/core/GestureHandler$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0}, Lcom/swmansion/gesturehandler/core/GestureHandler$$ExternalSyntheticLambda0;-><init>(Lcom/swmansion/gesturehandler/core/GestureHandler;)V

    invoke-static {v1}, Lcom/facebook/react/bridge/UiThreadUtil;->runOnUiThread(Ljava/lang/Runnable;)Z

    .line 130
    :cond_0
    iput-boolean p1, v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->isEnabled:Z

    return-object v0
.end method

.method public final setHitSlop(F)Lcom/swmansion/gesturehandler/core/GestureHandler;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TConcreteGestureHandlerT;"
        }
    .end annotation

    const/high16 v5, 0x7fc00000    # Float.NaN

    const/high16 v6, 0x7fc00000    # Float.NaN

    move-object v0, p0

    move v1, p1

    move v2, p1

    move v3, p1

    move v4, p1

    .line 160
    invoke-virtual/range {v0 .. v6}, Lcom/swmansion/gesturehandler/core/GestureHandler;->setHitSlop(FFFFFF)Lcom/swmansion/gesturehandler/core/GestureHandler;

    move-result-object p1

    return-object p1
.end method

.method public final setHitSlop(FFFFFF)Lcom/swmansion/gesturehandler/core/GestureHandler;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFFFFF)TConcreteGestureHandlerT;"
        }
    .end annotation

    .line 880
    invoke-static {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->access$self(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/core/GestureHandler;

    move-result-object v0

    .line 144
    iget-object v1, v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->hitSlop:[F

    if-nez v1, :cond_0

    const/4 v1, 0x6

    new-array v1, v1, [F

    .line 145
    iput-object v1, v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->hitSlop:[F

    .line 147
    :cond_0
    iget-object v1, v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->hitSlop:[F

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v2, 0x0

    aput p1, v1, v2

    .line 148
    iget-object v1, v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->hitSlop:[F

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v2, 0x1

    aput p2, v1, v2

    .line 149
    iget-object v1, v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->hitSlop:[F

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v2, 0x2

    aput p3, v1, v2

    .line 150
    iget-object v1, v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->hitSlop:[F

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v2, 0x3

    aput p4, v1, v2

    .line 151
    iget-object v1, v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->hitSlop:[F

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v2, 0x4

    aput p5, v1, v2

    .line 152
    iget-object v1, v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->hitSlop:[F

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v2, 0x5

    aput p6, v1, v2

    sget-object v1, Lcom/swmansion/gesturehandler/core/GestureHandler;->Companion:Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;

    .line 153
    invoke-static {v1, p5}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {v1, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {v1, p3}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Cannot have all of left, right and width defined"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 154
    :cond_2
    :goto_0
    invoke-static {v1, p5}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result p5

    if-eqz p5, :cond_4

    invoke-static {v1, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result p1

    if-nez p1, :cond_4

    invoke-static {v1, p3}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "When width is set one of left or right pads need to be defined"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 155
    :cond_4
    :goto_1
    invoke-static {v1, p6}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-static {v1, p4}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-static {v1, p2}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result p1

    if-nez p1, :cond_5

    goto :goto_2

    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Cannot have all of top, bottom and height defined"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 156
    :cond_6
    :goto_2
    invoke-static {v1, p6}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result p1

    if-eqz p1, :cond_8

    invoke-static {v1, p4}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result p1

    if-nez p1, :cond_8

    invoke-static {v1, p2}, Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;->access$hitSlopSet(Lcom/swmansion/gesturehandler/core/GestureHandler$Companion;F)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_3

    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "When height is set one of top or bottom pads need to be defined"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_8
    :goto_3
    return-object v0
.end method

.method public final setInteractionController(Lcom/swmansion/gesturehandler/core/GestureHandlerInteractionController;)Lcom/swmansion/gesturehandler/core/GestureHandler;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/swmansion/gesturehandler/core/GestureHandlerInteractionController;",
            ")TConcreteGestureHandlerT;"
        }
    .end annotation

    .line 882
    invoke-static {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->access$self(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/core/GestureHandler;

    move-result-object v0

    .line 164
    iput-object p1, v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->interactionController:Lcom/swmansion/gesturehandler/core/GestureHandlerInteractionController;

    return-object v0
.end method

.method public final setManualActivation(Z)Lcom/swmansion/gesturehandler/core/GestureHandler;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TConcreteGestureHandlerT;"
        }
    .end annotation

    .line 878
    invoke-static {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->access$self(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/core/GestureHandler;

    move-result-object v0

    .line 134
    iput-boolean p1, v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->manualActivation:Z

    return-object v0
.end method

.method public final setMouseButton(I)Lcom/swmansion/gesturehandler/core/GestureHandler;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "TConcreteGestureHandlerT;>;"
        }
    .end annotation

    .line 166
    move-object v0, p0

    check-cast v0, Lcom/swmansion/gesturehandler/core/GestureHandler;

    iput p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->mouseButton:I

    return-object p0
.end method

.method protected final setMouseButton(I)V
    .locals 0

    iput p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->mouseButton:I

    return-void
.end method

.method public final setNeedsPointerData(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->needsPointerData:Z

    return-void
.end method

.method public final setOnTouchEventListener(Lcom/swmansion/gesturehandler/core/OnTouchEventListener;)Lcom/swmansion/gesturehandler/core/GestureHandler;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/swmansion/gesturehandler/core/OnTouchEventListener;",
            ")",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;"
        }
    .end annotation

    iput-object p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->onTouchEventListener:Lcom/swmansion/gesturehandler/core/OnTouchEventListener;

    return-object p0
.end method

.method protected final setOrchestrator(Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;)V
    .locals 0

    iput-object p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->orchestrator:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;

    return-void
.end method

.method public final setShouldCancelWhenOutside(Z)Lcom/swmansion/gesturehandler/core/GestureHandler;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TConcreteGestureHandlerT;"
        }
    .end annotation

    .line 874
    invoke-static {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->access$self(Lcom/swmansion/gesturehandler/core/GestureHandler;)Lcom/swmansion/gesturehandler/core/GestureHandler;

    move-result-object v0

    .line 119
    iput-boolean p1, v0, Lcom/swmansion/gesturehandler/core/GestureHandler;->shouldCancelWhenOutside:Z

    return-object v0
.end method

.method public final setShouldResetProgress(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->shouldResetProgress:Z

    return-void
.end method

.method public final setTag(I)V
    .locals 0

    iput p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->tag:I

    return-void
.end method

.method protected final shouldActivateWithMouse(Landroid/view/MotionEvent;)Z
    .locals 4

    const-string v0, "sourceEvent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 715
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v1

    const/4 v2, 0x3

    const/4 v3, 0x1

    if-ne v1, v2, :cond_3

    .line 717
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-eq v1, v3, :cond_2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const/4 v2, 0x6

    if-eq v1, v2, :cond_2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const/4 v2, 0x5

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 722
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionButton()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isButtonInConfig(I)Z

    move-result v1

    if-nez v1, :cond_1

    return v0

    .line 727
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-ne v1, v2, :cond_3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getButtonState()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->isButtonInConfig(I)Z

    move-result p1

    if-nez p1, :cond_3

    :cond_2
    :goto_0
    return v0

    :cond_3
    return v3
.end method

.method public shouldBeCancelledBy(Lcom/swmansion/gesturehandler/core/GestureHandler;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;)Z"
        }
    .end annotation

    const-string v0, "handler"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    iget-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->interactionController:Lcom/swmansion/gesturehandler/core/GestureHandlerInteractionController;

    if-eqz v1, :cond_1

    .line 609
    invoke-interface {v1, p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerInteractionController;->shouldHandlerBeCancelledBy(Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/swmansion/gesturehandler/core/GestureHandler;)Z

    move-result v0

    :cond_1
    return v0
.end method

.method public shouldRecognizeSimultaneously(Lcom/swmansion/gesturehandler/core/GestureHandler;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;)Z"
        }
    .end annotation

    const-string v0, "handler"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-ne p1, p0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->interactionController:Lcom/swmansion/gesturehandler/core/GestureHandlerInteractionController;

    if-eqz v0, :cond_1

    .line 601
    invoke-interface {v0, p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerInteractionController;->shouldRecognizeSimultaneously(Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/swmansion/gesturehandler/core/GestureHandler;)Z

    move-result p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public shouldRequireToWaitForFailure(Lcom/swmansion/gesturehandler/core/GestureHandler;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;)Z"
        }
    .end annotation

    const-string v0, "handler"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    iget-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->interactionController:Lcom/swmansion/gesturehandler/core/GestureHandlerInteractionController;

    if-eqz v1, :cond_1

    .line 585
    invoke-interface {v1, p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerInteractionController;->shouldRequireHandlerToWaitForFailure(Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/swmansion/gesturehandler/core/GestureHandler;)Z

    move-result v0

    :cond_1
    return v0
.end method

.method public final shouldWaitForHandlerFailure(Lcom/swmansion/gesturehandler/core/GestureHandler;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/swmansion/gesturehandler/core/GestureHandler<",
            "*>;)Z"
        }
    .end annotation

    const-string v0, "handler"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    iget-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->interactionController:Lcom/swmansion/gesturehandler/core/GestureHandlerInteractionController;

    if-eqz v1, :cond_1

    .line 593
    invoke-interface {v1, p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerInteractionController;->shouldWaitForHandlerFailure(Lcom/swmansion/gesturehandler/core/GestureHandler;Lcom/swmansion/gesturehandler/core/GestureHandler;)Z

    move-result v0

    :cond_1
    return v0
.end method

.method public final startTrackingPointer(I)V
    .locals 3

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointerIDs:[I

    .line 218
    aget v1, v0, p1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 219
    invoke-direct {p0}, Lcom/swmansion/gesturehandler/core/GestureHandler;->findNextLocalPointerId()I

    move-result v1

    aput v1, v0, p1

    iget p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersIDsCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersIDsCount:I

    :cond_0
    return-void
.end method

.method public final stopTrackingPointer(I)V
    .locals 3

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointerIDs:[I

    .line 225
    aget v1, v0, p1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 226
    aput v2, v0, p1

    iget p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersIDsCount:I

    add-int/2addr p1, v2

    iput p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersIDsCount:I

    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->view:Landroid/view/View;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 790
    :cond_0
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 791
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->tag:I

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "@["

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]:"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected final transformPoint(Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .locals 2

    const-string v0, "point"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->orchestrator:Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->view:Landroid/view/View;

    .line 750
    invoke-virtual {v0, v1, p1}, Lcom/swmansion/gesturehandler/core/GestureHandlerOrchestrator;->transformPointToViewCoords(Landroid/view/View;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    move-object p1, v0

    goto :goto_1

    :cond_1
    :goto_0
    move-object v0, p0

    check-cast v0, Lcom/swmansion/gesturehandler/core/GestureHandler;

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 751
    iput v0, p1, Landroid/graphics/PointF;->x:F

    .line 752
    iput v0, p1, Landroid/graphics/PointF;->y:F

    :goto_1
    return-object p1
.end method

.method public final updatePointerData(Landroid/view/MotionEvent;)V
    .locals 2

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 475
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    goto :goto_1

    .line 478
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 481
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_4

    .line 482
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchTouchMoveEvent(Landroid/view/MotionEvent;)V

    goto :goto_2

    .line 479
    :cond_2
    :goto_0
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchTouchMoveEvent(Landroid/view/MotionEvent;)V

    .line 480
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchTouchUpEvent(Landroid/view/MotionEvent;)V

    goto :goto_2

    .line 476
    :cond_3
    :goto_1
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchTouchDownEvent(Landroid/view/MotionEvent;)V

    .line 477
    invoke-direct {p0, p1}, Lcom/swmansion/gesturehandler/core/GestureHandler;->dispatchTouchMoveEvent(Landroid/view/MotionEvent;)V

    :cond_4
    :goto_2
    return-void
.end method

.method public final wantEvents()Z
    .locals 3

    iget-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->isEnabled:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->state:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 v2, 0x3

    if-eq v0, v2, :cond_0

    const/4 v2, 0x5

    if-eq v0, v2, :cond_0

    iget v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->trackedPointersIDsCount:I

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public final withMarkedAsInBounds(Lkotlin/jvm/functions/Function0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "closure"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->isWithinBounds:Z

    .line 769
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/swmansion/gesturehandler/core/GestureHandler;->isWithinBounds:Z

    return-void
.end method
