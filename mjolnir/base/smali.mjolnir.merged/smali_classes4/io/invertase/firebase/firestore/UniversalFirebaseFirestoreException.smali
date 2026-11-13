.class public Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreException;
.super Ljava/lang/Exception;
.source "UniversalFirebaseFirestoreException.java"


# instance fields
.field private final code:Ljava/lang/String;

.field private final message:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/FirebaseFirestoreException;Ljava/lang/Throwable;)V
    .locals 27

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    if-eqz p1, :cond_0

    .line 30
    invoke-virtual/range {p1 .. p1}, Lcom/google/firebase/firestore/FirebaseFirestoreException;->getMessage()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    const-string v2, ""

    :goto_0
    invoke-direct {v0, v2, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    const-string v2, "permission-denied"

    const-string v3, "Operation was attempted past the valid range."

    const-string v4, "out-of-range"

    const-string v5, "Some requested document was not found."

    const-string v6, "not-found"

    const-string v7, "Client specified an invalid argument. Note that this differs from failed-precondition. invalid-argument indicates arguments that are problematic regardless of the state of the system (e.g., an invalid field name)."

    const-string v8, "invalid-argument"

    const-string v9, "Internal errors. Means some invariants expected by underlying system has been broken. If you see one of these errors, something is very broken."

    const-string v10, "internal"

    const-string v11, "failed-precondition"

    const-string v12, "Deadline expired before operation could complete. For operations that change the state of the system, this error may be returned even if the operation has completed successfully. For example, a successful response from a server could have been delayed long enough for the deadline to expire."

    const-string v13, "deadline-exceeded"

    const-string v14, "Unrecoverable data loss or corruption."

    const-string v15, "data-loss"

    const-string v16, "The operation was cancelled (typically by the caller)."

    const-string v17, "cancelled"

    const-string v18, "Some document that we attempted to create already exists."

    const-string v19, "already-exists"

    const-string v20, "The operation was aborted, typically due to a concurrency issue like transaction aborts, etc."

    const-string v21, "aborted"

    const-string v22, "An unknown error occurred"

    const-string v23, "unknown"

    if-eqz v1, :cond_12

    .line 35
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v24

    if-eqz v24, :cond_12

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v24, v2

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 36
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "([A-Z_]{3,25}):\\s(.*)"

    .line 37
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_13

    const/4 v2, 0x1

    .line 39
    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v25, v3

    const/4 v3, 0x2

    .line 40
    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 41
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/16 v26, -0x1

    sparse-switch v3, :sswitch_data_0

    goto/16 :goto_1

    :sswitch_0
    const-string v3, "UNIMPLEMENTED"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    goto/16 :goto_1

    :cond_1
    const/16 v26, 0xf

    goto/16 :goto_1

    :sswitch_1
    const-string v3, "ALREADY_EXISTS"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto/16 :goto_1

    :cond_2
    const/16 v26, 0xe

    goto/16 :goto_1

    :sswitch_2
    const-string v3, "UNAVAILABLE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    goto/16 :goto_1

    :cond_3
    const/16 v26, 0xd

    goto/16 :goto_1

    :sswitch_3
    const-string v3, "INTERNAL"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    goto/16 :goto_1

    :cond_4
    const/16 v26, 0xc

    goto/16 :goto_1

    :sswitch_4
    const-string v3, "NOT_FOUND"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    goto/16 :goto_1

    :cond_5
    const/16 v26, 0xb

    goto/16 :goto_1

    :sswitch_5
    const-string v3, "FAILED_PRECONDITION"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    goto/16 :goto_1

    :cond_6
    const/16 v26, 0xa

    goto/16 :goto_1

    :sswitch_6
    const-string v3, "OUT_OF_RANGE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    goto/16 :goto_1

    :cond_7
    const/16 v26, 0x9

    goto/16 :goto_1

    :sswitch_7
    const-string v3, "UNKNOWN"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    goto/16 :goto_1

    :cond_8
    const/16 v26, 0x8

    goto/16 :goto_1

    :sswitch_8
    const-string v3, "DEADLINE_EXCEEDED"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    goto :goto_1

    :cond_9
    const/16 v26, 0x7

    goto :goto_1

    :sswitch_9
    const-string v3, "ABORTED"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    goto :goto_1

    :cond_a
    const/16 v26, 0x6

    goto :goto_1

    :sswitch_a
    const-string v3, "UNAUTHENTICATED"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_b

    goto :goto_1

    :cond_b
    const/16 v26, 0x5

    goto :goto_1

    :sswitch_b
    const-string v3, "RESOURCE_EXHAUSTED"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    goto :goto_1

    :cond_c
    const/16 v26, 0x4

    goto :goto_1

    :sswitch_c
    const-string v3, "CANCELLED"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    goto :goto_1

    :cond_d
    const/16 v26, 0x3

    goto :goto_1

    :sswitch_d
    const-string v3, "PERMISSION_DENIED"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    goto :goto_1

    :cond_e
    const/16 v26, 0x2

    goto :goto_1

    :sswitch_e
    const-string v3, "INVALID_ARGUMENT"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_f

    goto :goto_1

    :cond_f
    const/16 v26, 0x1

    goto :goto_1

    :sswitch_f
    const-string v3, "DATA_LOSS"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_10

    goto :goto_1

    :cond_10
    const/16 v26, 0x0

    :goto_1
    packed-switch v26, :pswitch_data_0

    goto/16 :goto_3

    :pswitch_0
    const-string v1, "unimplemented"

    const-string v2, "Operation is not implemented or not supported/enabled."

    goto/16 :goto_4

    :pswitch_1
    move-object/from16 v2, v18

    move-object/from16 v1, v19

    goto/16 :goto_4

    :pswitch_2
    const-string v1, "unavailable"

    const-string v2, "The service is currently unavailable. This is a most likely a transient condition and may be corrected by retrying with a backoff."

    goto/16 :goto_4

    :pswitch_3
    move-object v2, v9

    move-object v1, v10

    goto/16 :goto_4

    :pswitch_4
    move-object v2, v5

    move-object v1, v6

    goto :goto_4

    :pswitch_5
    const-string v2, "query requires an index"

    .line 70
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_11

    goto :goto_2

    :cond_11
    const-string v1, "Operation was rejected because the system is not in a state required for the operation\'s execution. Ensure your query has been indexed via the Firebase console."

    :goto_2
    move-object v2, v1

    move-object v1, v11

    goto :goto_4

    :pswitch_6
    move-object v1, v4

    move-object/from16 v2, v25

    goto :goto_4

    :pswitch_7
    const-string v1, "Unknown error or an error from a different error domain."

    move-object v2, v1

    move-object/from16 v1, v23

    goto :goto_4

    :pswitch_8
    move-object v2, v12

    move-object v1, v13

    goto :goto_4

    :pswitch_9
    move-object/from16 v2, v20

    move-object/from16 v1, v21

    goto :goto_4

    :pswitch_a
    const-string v1, "unauthenticated"

    const-string v2, "The request does not have valid authentication credentials for the operation."

    goto :goto_4

    :pswitch_b
    const-string v1, "resource-exhausted"

    const-string v2, "Some resource has been exhausted, perhaps a per-user quota, or perhaps the entire file system is out of space."

    goto :goto_4

    :pswitch_c
    move-object/from16 v2, v16

    move-object/from16 v1, v17

    goto :goto_4

    :pswitch_d
    const-string v1, "The caller does not have permission to execute the specified operation."

    move-object v2, v1

    move-object/from16 v1, v24

    goto :goto_4

    :pswitch_e
    move-object v2, v7

    move-object v1, v8

    goto :goto_4

    :pswitch_f
    move-object v2, v14

    move-object v1, v15

    goto :goto_4

    :cond_12
    move-object/from16 v24, v2

    :cond_13
    move-object/from16 v25, v3

    :goto_3
    const/4 v1, 0x0

    move-object/from16 v2, v22

    :goto_4
    if-nez v1, :cond_15

    if-eqz p1, :cond_15

    .line 135
    sget-object v1, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreException$1;->$SwitchMap$com$google$firebase$firestore$FirebaseFirestoreException$Code:[I

    invoke-virtual/range {p1 .. p1}, Lcom/google/firebase/firestore/FirebaseFirestoreException;->getCode()Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_1

    move-object/from16 v3, v22

    goto :goto_5

    :pswitch_10
    const-string v3, "Unknown error or an error from a different error domain."

    :goto_5
    move-object/from16 v2, v23

    goto/16 :goto_7

    :pswitch_11
    const-string v2, "unimplemented"

    const-string v3, "Operation is not implemented or not supported/enabled."

    goto/16 :goto_7

    :pswitch_12
    const-string v2, "unavailable"

    const-string v3, "The service is currently unavailable. This is a most likely a transient condition and may be corrected by retrying with a backoff."

    goto/16 :goto_7

    :pswitch_13
    const-string v2, "unauthenticated"

    const-string v3, "The request does not have valid authentication credentials for the operation."

    goto/16 :goto_7

    :pswitch_14
    const-string v2, "resource-exhausted"

    const-string v3, "Some resource has been exhausted, perhaps a per-user quota, or perhaps the entire file system is out of space."

    goto/16 :goto_7

    :pswitch_15
    const-string v3, "The caller does not have permission to execute the specified operation."

    move-object/from16 v2, v24

    goto :goto_7

    :pswitch_16
    move-object v2, v4

    move-object/from16 v3, v25

    goto :goto_7

    :pswitch_17
    move-object v3, v5

    move-object v2, v6

    goto :goto_7

    :pswitch_18
    move-object v3, v7

    move-object v2, v8

    goto :goto_7

    :pswitch_19
    move-object v3, v9

    move-object v2, v10

    goto :goto_7

    .line 164
    :pswitch_1a
    invoke-virtual/range {p1 .. p1}, Lcom/google/firebase/firestore/FirebaseFirestoreException;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_14

    .line 165
    invoke-virtual/range {p1 .. p1}, Lcom/google/firebase/firestore/FirebaseFirestoreException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "query requires an index"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 166
    invoke-virtual/range {p1 .. p1}, Lcom/google/firebase/firestore/FirebaseFirestoreException;->getMessage()Ljava/lang/String;

    move-result-object v3

    goto :goto_6

    :cond_14
    const-string v3, "Operation was rejected because the system is not in a state required for the operation\'s execution. Ensure your query has been indexed via the Firebase console."

    :goto_6
    move-object v2, v11

    goto :goto_7

    :pswitch_1b
    move-object v3, v12

    move-object v2, v13

    goto :goto_7

    :pswitch_1c
    move-object v3, v14

    move-object v2, v15

    goto :goto_7

    :pswitch_1d
    move-object/from16 v3, v16

    move-object/from16 v2, v17

    goto :goto_7

    :pswitch_1e
    move-object/from16 v3, v18

    move-object/from16 v2, v19

    goto :goto_7

    :pswitch_1f
    move-object/from16 v3, v20

    move-object/from16 v2, v21

    goto :goto_7

    :cond_15
    move-object v3, v2

    move-object v2, v1

    :goto_7
    iput-object v2, v0, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreException;->code:Ljava/lang/String;

    iput-object v3, v0, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreException;->message:Ljava/lang/String;

    return-void

    :sswitch_data_0
    .sparse-switch
        -0x6dd13568 -> :sswitch_f
        -0x66065bdb -> :sswitch_e
        -0x546b1bf5 -> :sswitch_d
        -0x3d7fc6cf -> :sswitch_c
        -0x3d22bbc8 -> :sswitch_b
        -0x32a57dea -> :sswitch_a
        -0x1c6b5051 -> :sswitch_9
        -0x166c92a6 -> :sswitch_8
        0x19d1382a -> :sswitch_7
        0x296f62a6 -> :sswitch_6
        0x3a5dd69a -> :sswitch_5
        0x3cfe1ed6 -> :sswitch_4
        0x50a5b6bd -> :sswitch_3
        0x58a96c30 -> :sswitch_2
        0x6305fa43 -> :sswitch_1
        0x6e8fbca9 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
    .end packed-switch
.end method


# virtual methods
.method public getCode()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreException;->code:Ljava/lang/String;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreException;->message:Ljava/lang/String;

    return-object v0
.end method
