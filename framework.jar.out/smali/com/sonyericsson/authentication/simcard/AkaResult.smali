.class public final Lcom/sonyericsson/authentication/simcard/AkaResult;
.super Ljava/lang/Object;
.source "AkaResult.java"

# interfaces
.implements Lcom/orange/authentication/simcard/AkaAuthenticationResult;


# instance fields
.field private final cK:[B

.field private final iK:[B

.field private final res:[B


# direct methods
.method public constructor <init>([B[B[B)V
    .locals 1
    .parameter "cipherKey"
    .parameter "secretKey"
    .parameter "response"

    .prologue
    .line 23
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 24
    invoke-virtual {p1}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    iput-object v0, p0, Lcom/sonyericsson/authentication/simcard/AkaResult;->cK:[B

    .line 25
    invoke-virtual {p2}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    iput-object v0, p0, Lcom/sonyericsson/authentication/simcard/AkaResult;->iK:[B

    .line 26
    invoke-virtual {p3}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    iput-object v0, p0, Lcom/sonyericsson/authentication/simcard/AkaResult;->res:[B

    .line 27
    return-void
.end method


# virtual methods
.method public final getCk()[B
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/sonyericsson/authentication/simcard/AkaResult;->cK:[B

    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method public final getIk()[B
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/sonyericsson/authentication/simcard/AkaResult;->iK:[B

    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method public final getRes()[B
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/sonyericsson/authentication/simcard/AkaResult;->res:[B

    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method
