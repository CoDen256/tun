.class Lcom/google/firebase/firestore/local/SQLitePersistence$1;
.super Ljava/lang/Object;
.source "SQLitePersistence.java"

# interfaces
.implements Landroid/database/sqlite/SQLiteTransactionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/local/SQLitePersistence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/firebase/firestore/local/SQLitePersistence;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/local/SQLitePersistence;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/local/SQLitePersistence$1;->this$0:Lcom/google/firebase/firestore/local/SQLitePersistence;

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBegin()V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLitePersistence$1;->this$0:Lcom/google/firebase/firestore/local/SQLitePersistence;

    .line 96
    invoke-static {v0}, Lcom/google/firebase/firestore/local/SQLitePersistence;->access$000(Lcom/google/firebase/firestore/local/SQLitePersistence;)Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->onTransactionStarted()V

    return-void
.end method

.method public onCommit()V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/SQLitePersistence$1;->this$0:Lcom/google/firebase/firestore/local/SQLitePersistence;

    .line 101
    invoke-static {v0}, Lcom/google/firebase/firestore/local/SQLitePersistence;->access$000(Lcom/google/firebase/firestore/local/SQLitePersistence;)Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/local/SQLiteLruReferenceDelegate;->onTransactionCommitted()V

    return-void
.end method

.method public onRollback()V
    .locals 0

    return-void
.end method
