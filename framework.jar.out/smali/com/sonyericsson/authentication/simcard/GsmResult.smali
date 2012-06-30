.class public final Lcom/sonyericsson/authentication/simcard/GsmResult;
.super Ljava/lang/Object;
.source "GsmResult.java"

# interfaces
.implements Lcom/orange/authentication/simcard/GsmAuthenticationResult;


# instance fields
.field private final kC:J

.field private final sRes:I


# direct methods
.method public constructor <init>(JI)V
    .locals 0
    .parameter "kcVal"
    .parameter "sres"

    .prologue
    .line 21
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-wide p1, p0, Lcom/sonyericsson/authentication/simcard/GsmResult;->kC:J

    .line 23
    iput p3, p0, Lcom/sonyericsson/authentication/simcard/GsmResult;->sRes:I

    .line 24
    return-void
.end method


# virtual methods
.method public final getKc()J
    .locals 2

    .prologue
    .line 41
    iget-wide v0, p0, Lcom/sonyericsson/authentication/simcard/GsmResult;->kC:J

    return-wide v0
.end method

.method public final getSres()I
    .locals 1

    .prologue
    .line 32
    iget v0, p0, Lcom/sonyericsson/authentication/simcard/GsmResult;->sRes:I

    return v0
.end method
