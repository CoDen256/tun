.class Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$1;
.super Lcom/facebook/react/bridge/GuardedAsyncTask;
.source "AsyncStorageModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule;->multiGet(Lcom/facebook/react/bridge/ReadableArray;Lcom/facebook/react/bridge/Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/react/bridge/GuardedAsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule;

.field final synthetic val$callback:Lcom/facebook/react/bridge/Callback;

.field final synthetic val$keys:Lcom/facebook/react/bridge/ReadableArray;


# direct methods
.method constructor <init>(Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule;Lcom/facebook/react/bridge/ReactContext;Lcom/facebook/react/bridge/Callback;Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 0

    iput-object p1, p0, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$1;->this$0:Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule;

    iput-object p3, p0, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$1;->val$callback:Lcom/facebook/react/bridge/Callback;

    iput-object p4, p0, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$1;->val$keys:Lcom/facebook/react/bridge/ReadableArray;

    .line 146
    invoke-direct {p0, p2}, Lcom/facebook/react/bridge/GuardedAsyncTask;-><init>(Lcom/facebook/react/bridge/ReactContext;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackgroundGuarded([Ljava/lang/Object;)V
    .locals 0

    .line 146
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$1;->doInBackgroundGuarded([Ljava/lang/Void;)V

    return-void
.end method

.method protected varargs doInBackgroundGuarded([Ljava/lang/Void;)V
    .locals 19

    move-object/from16 v1, p0

    iget-object v0, v1, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$1;->this$0:Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule;

    .line 149
    invoke-static {v0}, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule;->-$$Nest$mensureDatabase(Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule;)Z

    move-result v0

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-nez v0, :cond_0

    iget-object v0, v1, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$1;->val$callback:Lcom/facebook/react/bridge/Callback;

    new-array v2, v2, [Ljava/lang/Object;

    .line 150
    invoke-static {v4}, Lcom/reactnativecommunity/asyncstorage/AsyncStorageErrorUtil;->getDBError(Ljava/lang/String;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v6

    aput-object v6, v2, v5

    aput-object v4, v2, v3

    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V

    return-void

    :cond_0
    const-string v0, "key"

    const-string v6, "value"

    .line 154
    filled-new-array {v0, v6}, [Ljava/lang/String;

    move-result-object v0

    .line 155
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 156
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v15

    move v14, v5

    :goto_0
    iget-object v7, v1, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$1;->val$keys:Lcom/facebook/react/bridge/ReadableArray;

    .line 157
    invoke-interface {v7}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v7

    if-ge v14, v7, :cond_5

    iget-object v7, v1, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$1;->val$keys:Lcom/facebook/react/bridge/ReadableArray;

    .line 158
    invoke-interface {v7}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v7

    sub-int/2addr v7, v14

    const/16 v8, 0x3e7

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v13

    iget-object v7, v1, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$1;->this$0:Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule;

    .line 159
    invoke-static {v7}, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule;->-$$Nest$fgetmReactDatabaseSupplier(Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule;)Lcom/reactnativecommunity/asyncstorage/ReactDatabaseSupplier;

    move-result-object v7

    invoke-virtual {v7}, Lcom/reactnativecommunity/asyncstorage/ReactDatabaseSupplier;->get()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7

    const-string v8, "catalystLocalStorage"

    .line 162
    invoke-static {v13}, Lcom/reactnativecommunity/asyncstorage/AsyncLocalStorageUtil;->buildKeySelection(I)Ljava/lang/String;

    move-result-object v10

    iget-object v9, v1, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$1;->val$keys:Lcom/facebook/react/bridge/ReadableArray;

    .line 163
    invoke-static {v9, v14, v13}, Lcom/reactnativecommunity/asyncstorage/AsyncLocalStorageUtil;->buildKeySelectionArgs(Lcom/facebook/react/bridge/ReadableArray;II)[Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object v9, v0

    move/from16 v18, v13

    move-object/from16 v13, v16

    move v4, v14

    move-object/from16 v14, v17

    .line 159
    invoke-virtual/range {v7 .. v14}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 167
    invoke-virtual {v6}, Ljava/util/HashSet;->clear()V

    .line 169
    :try_start_0
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v8

    iget-object v9, v1, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$1;->val$keys:Lcom/facebook/react/bridge/ReadableArray;

    invoke-interface {v9}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v9

    if-eq v8, v9, :cond_1

    move v14, v4

    :goto_1
    add-int v8, v4, v18

    if-ge v14, v8, :cond_1

    iget-object v8, v1, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$1;->val$keys:Lcom/facebook/react/bridge/ReadableArray;

    .line 172
    invoke-interface {v8, v14}, Lcom/facebook/react/bridge/ReadableArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    .line 176
    :cond_1
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 178
    :cond_2
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v8

    .line 179
    invoke-interface {v7, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lcom/facebook/react/bridge/WritableArray;->pushString(Ljava/lang/String;)V

    .line 180
    invoke-interface {v7, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lcom/facebook/react/bridge/WritableArray;->pushString(Ljava/lang/String;)V

    .line 181
    invoke-interface {v15, v8}, Lcom/facebook/react/bridge/WritableArray;->pushArray(Lcom/facebook/react/bridge/ReadableArray;)V

    .line 182
    invoke-interface {v7, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 183
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v8, :cond_2

    .line 190
    :cond_3
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 193
    invoke-virtual {v6}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 194
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v9

    .line 195
    invoke-interface {v9, v8}, Lcom/facebook/react/bridge/WritableArray;->pushString(Ljava/lang/String;)V

    .line 196
    invoke-interface {v9}, Lcom/facebook/react/bridge/WritableArray;->pushNull()V

    .line 197
    invoke-interface {v15, v9}, Lcom/facebook/react/bridge/WritableArray;->pushArray(Lcom/facebook/react/bridge/ReadableArray;)V

    goto :goto_2

    .line 199
    :cond_4
    invoke-virtual {v6}, Ljava/util/HashSet;->clear()V

    add-int/lit16 v14, v4, 0x3e7

    const/4 v4, 0x0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    goto :goto_3

    :catch_0
    move-exception v0

    :try_start_1
    const-string v4, "ReactNative"

    .line 186
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6, v0}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v4, v1, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$1;->val$callback:Lcom/facebook/react/bridge/Callback;

    new-array v2, v2, [Ljava/lang/Object;

    .line 187
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    const/4 v6, 0x0

    invoke-static {v6, v0}, Lcom/reactnativecommunity/asyncstorage/AsyncStorageErrorUtil;->getError(Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    aput-object v0, v2, v5

    aput-object v6, v2, v3

    invoke-interface {v4, v2}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 190
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    return-void

    :goto_3
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 191
    throw v0

    :cond_5
    iget-object v0, v1, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$1;->val$callback:Lcom/facebook/react/bridge/Callback;

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v4, v2, v5

    aput-object v15, v2, v3

    .line 202
    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V

    return-void
.end method
