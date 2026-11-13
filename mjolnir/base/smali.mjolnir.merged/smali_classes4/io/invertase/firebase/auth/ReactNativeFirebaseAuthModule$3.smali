.class Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$3;
.super Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;
.source "ReactNativeFirebaseAuthModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->verifyPhoneNumberForMultiFactor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

.field final synthetic val$promise:Lcom/facebook/react/bridge/Promise;


# direct methods
.method constructor <init>(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Lcom/facebook/react/bridge/Promise;)V
    .locals 0

    iput-object p1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$3;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    iput-object p2, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$3;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 1067
    invoke-direct {p0}, Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;-><init>()V

    return-void
.end method


# virtual methods
.method public onCodeSent(Ljava/lang/String;Lcom/google/firebase/auth/PhoneAuthProvider$ForceResendingToken;)V
    .locals 0

    iget-object p2, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$3;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 1087
    invoke-interface {p2, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public onVerificationCompleted(Lcom/google/firebase/auth/PhoneAuthCredential;)V
    .locals 2

    iget-object p1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$3;->val$promise:Lcom/facebook/react/bridge/Promise;

    const-string v0, "not-implemented"

    const-string v1, "This is currently not supported."

    .line 1074
    invoke-static {p1, v0, v1}, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->rejectPromiseWithCodeAndMessage(Lcom/facebook/react/bridge/Promise;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onVerificationFailed(Lcom/google/firebase/FirebaseException;)V
    .locals 2

    iget-object v0, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$3;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    iget-object v1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$3;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 1080
    invoke-static {v0, v1, p1}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->-$$Nest$mpromiseRejectAuthException(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method
