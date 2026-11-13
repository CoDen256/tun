.class Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;
.super Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;
.source "ReactNativeFirebaseAuthModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->verifyPhoneNumber(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

.field final synthetic val$appName:Ljava/lang/String;

.field final synthetic val$requestKey:Ljava/lang/String;


# direct methods
.method constructor <init>(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    iput-object p2, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->val$appName:Ljava/lang/String;

    iput-object p3, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->val$requestKey:Ljava/lang/String;

    .line 1242
    invoke-direct {p0}, Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;-><init>()V

    return-void
.end method


# virtual methods
.method public onCodeAutoRetrievalTimeOut(Ljava/lang/String;)V
    .locals 4

    .line 1306
    invoke-super {p0, p1}, Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;->onCodeAutoRetrievalTimeOut(Ljava/lang/String;)V

    const-string v0, "Auth"

    const-string v1, "verifyPhoneNumber:verification:onCodeAutoRetrievalTimeOut"

    .line 1307
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1308
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "verificationId"

    .line 1309
    invoke-interface {v0, v1, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    iget-object v1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->val$appName:Ljava/lang/String;

    iget-object v2, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->val$requestKey:Ljava/lang/String;

    const-string v3, "onCodeAutoRetrievalTimeout"

    .line 1310
    invoke-static {p1, v1, v2, v3, v0}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->-$$Nest$msendPhoneStateEvent(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method public onCodeSent(Ljava/lang/String;Lcom/google/firebase/auth/PhoneAuthProvider$ForceResendingToken;)V
    .locals 3

    const-string v0, "Auth"

    const-string v1, "verifyPhoneNumber:verification:onCodeSent"

    .line 1283
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    .line 1284
    invoke-static {v0, p2}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->-$$Nest$fputmForceResendingToken(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Lcom/google/firebase/auth/PhoneAuthProvider$ForceResendingToken;)V

    .line 1285
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p2

    const-string v0, "verificationId"

    .line 1286
    invoke-interface {p2, v0, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1300
    invoke-interface {p2, v0, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    iget-object v0, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->val$appName:Ljava/lang/String;

    iget-object v1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->val$requestKey:Ljava/lang/String;

    const-string v2, "onCodeSent"

    .line 1301
    invoke-static {p1, v0, v1, v2, p2}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->-$$Nest$msendPhoneStateEvent(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method public onVerificationCompleted(Lcom/google/firebase/auth/PhoneAuthCredential;)V
    .locals 4

    iget-object v0, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    .line 1247
    invoke-static {v0, p1}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->-$$Nest$fputmCredential(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Lcom/google/firebase/auth/PhoneAuthCredential;)V

    const-string v0, "Auth"

    const-string v1, "verifyPhoneNumber:verification:onVerificationCompleted"

    .line 1249
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1250
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 1252
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    const/4 v2, 0x0

    .line 1253
    invoke-virtual {p1, v1, v2}, Lcom/google/firebase/auth/PhoneAuthCredential;->writeToParcel(Landroid/os/Parcel;I)V

    const/16 p1, 0x10

    .line 1256
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 1257
    invoke-virtual {v1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    .line 1260
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    add-int/lit8 v2, v2, 0x8

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 1261
    invoke-virtual {v1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "code"

    .line 1263
    invoke-interface {v0, v3, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "verificationId"

    .line 1264
    invoke-interface {v0, v2, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1265
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    iget-object p1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    iget-object v1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->val$appName:Ljava/lang/String;

    iget-object v2, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->val$requestKey:Ljava/lang/String;

    const-string v3, "onVerificationComplete"

    .line 1266
    invoke-static {p1, v1, v2, v3, v0}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->-$$Nest$msendPhoneStateEvent(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method public onVerificationFailed(Lcom/google/firebase/FirebaseException;)V
    .locals 4

    const-string v0, "Auth"

    const-string v1, "verifyPhoneNumber:verification:onVerificationFailed"

    .line 1274
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1275
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    iget-object v1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    .line 1276
    invoke-static {v1, p1}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->-$$Nest$mgetJSError(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Ljava/lang/Exception;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    const-string v1, "error"

    invoke-interface {v0, v1, p1}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    iget-object p1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->this$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    iget-object v1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->val$appName:Ljava/lang/String;

    iget-object v2, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$4;->val$requestKey:Ljava/lang/String;

    const-string v3, "onVerificationFailed"

    .line 1277
    invoke-static {p1, v1, v2, v3, v0}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->-$$Nest$msendPhoneStateEvent(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method
