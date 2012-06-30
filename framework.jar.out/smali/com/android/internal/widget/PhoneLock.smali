.class Lcom/android/internal/widget/PhoneLock;
.super Ljava/lang/Object;
.source "LockPatternUtils.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 63
    const-string/jumbo v0, "phonelock"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 64
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native read_ta_phone_lock()Z
.end method

.method public static native write_ta_phone_lock(Z)V
.end method
