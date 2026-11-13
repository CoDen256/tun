.class Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;
.super Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;
.source "ReactNativeFirebaseAuthModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->signInWithPhoneNumber(Ljava/lang/String;Ljava/lang/String;ZLcom/facebook/react/bridge/Promise;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private promiseResolved:Z

.field final synthetic this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

.field final synthetic val$firebaseAuth:Lcom/google/firebase/auth/FirebaseAuth;

.field final synthetic val$promise:Lcom/facebook/react/bridge/Promise;


# direct methods
.method public static synthetic $r8$lambda$4vGbY5iCthyPDjqBTCdaVeTSSJc(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;Lcom/google/firebase/auth/PhoneAuthCredential;Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->lambda$onVerificationCompleted$0(Lcom/google/firebase/auth/PhoneAuthCredential;Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method

.method constructor <init>(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Lcom/google/firebase/auth/FirebaseAuth;Lcom/facebook/react/bridge/Promise;)V
    .locals 0

    iput-object p1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    iput-object p2, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->val$firebaseAuth:Lcom/google/firebase/auth/FirebaseAuth;

    iput-object p3, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 865
    invoke-direct {p0}, Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->promiseResolved:Z

    return-void
.end method

.method private synthetic lambda$onVerificationCompleted$0(Lcom/google/firebase/auth/PhoneAuthCredential;Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 876
    invoke-virtual {p3}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const-string v1, "Auth"

    if-eqz v0, :cond_0

    const-string p3, "signInWithPhoneNumber:autoVerified:signInWithCredential:onComplete:success"

    .line 878
    invoke-static {v1, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean p3, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->promiseResolved:Z

    if-nez p3, :cond_1

    .line 886
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p3

    .line 888
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    const/4 v1, 0x0

    .line 889
    invoke-virtual {p1, v0, v1}, Lcom/google/firebase/auth/PhoneAuthCredential;->writeToParcel(Landroid/os/Parcel;I)V

    const/16 p1, 0x10

    .line 890
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 891
    invoke-virtual {v0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    .line 892
    invoke-static {v1, p1}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->-$$Nest$fputmVerificationId(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Ljava/lang/String;)V

    .line 893
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    const-string v0, "verificationId"

    .line 895
    invoke-interface {p3, v0, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 896
    invoke-interface {p2, p3}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    .line 901
    :cond_0
    invoke-virtual {p3}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    const-string p3, "signInWithPhoneNumber:autoVerified:signInWithCredential:onComplete:failure"

    .line 902
    invoke-static {v1, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-boolean p3, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->promiseResolved:Z

    if-nez p3, :cond_1

    iget-object p3, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    .line 909
    invoke-static {p3, p2, p1}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->-$$Nest$mpromiseRejectAuthException(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public onCodeAutoRetrievalTimeOut(Ljava/lang/String;)V
    .locals 0

    .line 939
    invoke-super {p0, p1}, Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;->onCodeAutoRetrievalTimeOut(Ljava/lang/String;)V

    return-void
.end method

.method public onCodeSent(Ljava/lang/String;Lcom/google/firebase/auth/PhoneAuthProvider$ForceResendingToken;)V
    .locals 1

    iget-object v0, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    .line 929
    invoke-static {v0, p1}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->-$$Nest$fputmVerificationId(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Ljava/lang/String;)V

    iget-object v0, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    .line 930
    invoke-static {v0, p2}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->-$$Nest$fputmForceResendingToken(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Lcom/google/firebase/auth/PhoneAuthProvider$ForceResendingToken;)V

    .line 931
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p2

    const-string v0, "verificationId"

    .line 932
    invoke-interface {p2, v0, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 933
    invoke-interface {p1, p2}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->promiseResolved:Z

    return-void
.end method

.method public onVerificationCompleted(Lcom/google/firebase/auth/PhoneAuthCredential;)V
    .locals 4

    iget-object v0, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->val$firebaseAuth:Lcom/google/firebase/auth/FirebaseAuth;

    .line 872
    invoke-virtual {v0, p1}, Lcom/google/firebase/auth/FirebaseAuth;->signInWithCredential(Lcom/google/firebase/auth/AuthCredential;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    iget-object v1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    .line 874
    invoke-virtual {v1}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->getExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    iget-object v2, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->val$promise:Lcom/facebook/react/bridge/Promise;

    new-instance v3, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, p1, v2}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1$$ExternalSyntheticLambda0;-><init>(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;Lcom/google/firebase/auth/PhoneAuthCredential;Lcom/facebook/react/bridge/Promise;)V

    .line 873
    invoke-virtual {v0, v1, v3}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public onVerificationFailed(Lcom/google/firebase/FirebaseException;)V
    .locals 2

    const-string v0, "Auth"

    const-string v1, "signInWithPhoneNumber:verification:failed"

    .line 920
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    iget-object v1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$1;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 921
    invoke-static {v0, v1, p1}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->-$$Nest$mpromiseRejectAuthException(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method
