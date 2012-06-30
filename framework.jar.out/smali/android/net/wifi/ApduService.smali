.class final Landroid/net/wifi/ApduService;
.super Ljava/lang/Object;
.source "ApduService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/net/wifi/ApduService$1;,
        Landroid/net/wifi/ApduService$ApduCommand;,
        Landroid/net/wifi/ApduService$ApduServiceRunner;
    }
.end annotation


# static fields
.field private static final LOCAL_LOGD:Z = false

.field private static final SOCKET_TIMEOUT:I = 0xbb8

.field private static final TAG:Ljava/lang/String; = "ApduService"

.field private static final WPA_SUPPLICANT_PROCESS_NAME:Ljava/lang/String; = "/system/bin/wpa_supplicant"


# instance fields
.field private mConnectionSocket:Landroid/net/LocalSocket;

.field private volatile mForceClose:Z

.field private final mLock:Ljava/lang/Object;

.field private final mRunnable:Ljava/lang/Runnable;

.field private mServerSocket:Landroid/net/LocalServerSocket;

.field private mSocketName:Ljava/lang/String;

.field private volatile mStarted:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .parameter "socketName"

    .prologue
    const/4 v1, 0x0

    .line 46
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/net/wifi/ApduService;->mLock:Ljava/lang/Object;

    .line 47
    iput-object p1, p0, Landroid/net/wifi/ApduService;->mSocketName:Ljava/lang/String;

    .line 48
    iput-boolean v1, p0, Landroid/net/wifi/ApduService;->mForceClose:Z

    .line 49
    iput-boolean v1, p0, Landroid/net/wifi/ApduService;->mStarted:Z

    .line 50
    new-instance v0, Landroid/net/wifi/ApduService$ApduServiceRunner;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroid/net/wifi/ApduService$ApduServiceRunner;-><init>(Landroid/net/wifi/ApduService;Landroid/net/wifi/ApduService$1;)V

    iput-object v0, p0, Landroid/net/wifi/ApduService;->mRunnable:Ljava/lang/Runnable;

    .line 52
    return-void
.end method

.method static synthetic access$100(Landroid/net/wifi/ApduService;)Landroid/net/LocalServerSocket;
    .locals 1
    .parameter "x0"

    .prologue
    .line 31
    iget-object v0, p0, Landroid/net/wifi/ApduService;->mServerSocket:Landroid/net/LocalServerSocket;

    return-object v0
.end method

.method static synthetic access$102(Landroid/net/wifi/ApduService;Landroid/net/LocalServerSocket;)Landroid/net/LocalServerSocket;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 31
    iput-object p1, p0, Landroid/net/wifi/ApduService;->mServerSocket:Landroid/net/LocalServerSocket;

    return-object p1
.end method

.method static synthetic access$200(Landroid/net/wifi/ApduService;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 31
    iget-object v0, p0, Landroid/net/wifi/ApduService;->mSocketName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Landroid/net/wifi/ApduService;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 31
    invoke-direct {p0}, Landroid/net/wifi/ApduService;->runService()V

    return-void
.end method

.method static synthetic access$400(Landroid/net/wifi/ApduService;)Landroid/net/LocalSocket;
    .locals 1
    .parameter "x0"

    .prologue
    .line 31
    iget-object v0, p0, Landroid/net/wifi/ApduService;->mConnectionSocket:Landroid/net/LocalSocket;

    return-object v0
.end method

.method static synthetic access$502(Landroid/net/wifi/ApduService;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 31
    iput-boolean p1, p0, Landroid/net/wifi/ApduService;->mStarted:Z

    return p1
.end method

.method private communicateWithClient()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 217
    iget-object v1, p0, Landroid/net/wifi/ApduService;->mConnectionSocket:Landroid/net/LocalSocket;

    const/16 v2, 0xbb8

    invoke-virtual {v1, v2}, Landroid/net/LocalSocket;->setSoTimeout(I)V

    .line 218
    iget-object v1, p0, Landroid/net/wifi/ApduService;->mConnectionSocket:Landroid/net/LocalSocket;

    invoke-virtual {v1}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    .line 219
    .local v8, in:Ljava/io/InputStream;
    iget-object v1, p0, Landroid/net/wifi/ApduService;->mConnectionSocket:Landroid/net/LocalSocket;

    invoke-virtual {v1}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v9

    .line 220
    .local v9, out:Ljava/io/OutputStream;
    new-instance v7, Landroid/net/wifi/ApduService$ApduCommand;

    invoke-direct {v7, p0, v8}, Landroid/net/wifi/ApduService$ApduCommand;-><init>(Landroid/net/wifi/ApduService;Ljava/io/InputStream;)V

    .line 222
    .local v7, apduCommand:Landroid/net/wifi/ApduService$ApduCommand;
    const-string/jumbo v1, "phone"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v0

    .line 223
    .local v0, phone:Lcom/android/internal/telephony/ITelephony;
    if-nez v0, :cond_1

    .line 224
    const-string v1, "ApduService"

    const-string v2, "Error retrieving ITelephony interface"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    :cond_0
    return-void

    .line 228
    :cond_1
    :goto_0
    invoke-virtual {v7}, Landroid/net/wifi/ApduService$ApduCommand;->hasData()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 229
    iget v1, v7, Landroid/net/wifi/ApduService$ApduCommand;->mCla:I

    iget v2, v7, Landroid/net/wifi/ApduService$ApduCommand;->mCmd:I

    iget v3, v7, Landroid/net/wifi/ApduService$ApduCommand;->mP1:I

    iget v4, v7, Landroid/net/wifi/ApduService$ApduCommand;->mP2:I

    iget v5, v7, Landroid/net/wifi/ApduService$ApduCommand;->mLen:I

    iget-object v6, v7, Landroid/net/wifi/ApduService$ApduCommand;->mData:Ljava/lang/String;

    invoke-interface/range {v0 .. v6}, Lcom/android/internal/telephony/ITelephony;->transmitIccBasicChannel(IIIIILjava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 238
    .local v10, response:Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/io/OutputStream;->write([B)V

    .line 239
    const/4 v1, 0x0

    invoke-virtual {v9, v1}, Ljava/io/OutputStream;->write(I)V

    .line 241
    new-instance v7, Landroid/net/wifi/ApduService$ApduCommand;

    .end local v7           #apduCommand:Landroid/net/wifi/ApduService$ApduCommand;
    invoke-direct {v7, p0, v8}, Landroid/net/wifi/ApduService$ApduCommand;-><init>(Landroid/net/wifi/ApduService;Ljava/io/InputStream;)V

    .line 242
    .restart local v7       #apduCommand:Landroid/net/wifi/ApduService$ApduCommand;
    goto :goto_0
.end method

.method private isPidAllowed(I)Z
    .locals 13
    .parameter "pid"

    .prologue
    const/4 v9, 0x0

    .line 165
    const/4 v3, 0x0

    .line 166
    .local v3, process:Ljava/lang/Process;
    const/4 v5, 0x0

    .line 170
    .local v5, reader:Ljava/io/BufferedReader;
    :try_start_0
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "/system/bin/ps -p "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 171
    .local v0, command:Ljava/lang/String;
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v3

    .line 172
    invoke-virtual {v3}, Ljava/lang/Process;->waitFor()I

    move-result v7

    .line 173
    .local v7, result:I
    if-eqz v7, :cond_1

    .line 174
    const-string v10, "ApduService"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Could not execute command: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_2

    .line 206
    if-eqz v5, :cond_0

    .line 208
    :try_start_1
    throw v5
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4

    .line 210
    .end local v0           #command:Ljava/lang/String;
    .end local v7           #result:I
    :cond_0
    :goto_0
    return v9

    .line 177
    .restart local v0       #command:Ljava/lang/String;
    .restart local v7       #result:I
    :cond_1
    :try_start_2
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v10, Ljava/io/InputStreamReader;

    invoke-virtual {v3}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v11, 0x200

    invoke-direct {v6, v10, v11}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2

    .line 180
    .end local v5           #reader:Ljava/io/BufferedReader;
    .local v6, reader:Ljava/io/BufferedReader;
    :try_start_3
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 181
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .line 182
    .local v2, line:Ljava/lang/String;
    if-nez v2, :cond_3

    .line 183
    const-string v10, "ApduService"

    const-string v11, "Could not read process info"

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_a
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_9

    .line 206
    if-eqz v6, :cond_2

    .line 208
    :try_start_4
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_5

    :cond_2
    :goto_1
    move-object v5, v6

    .line 210
    .end local v6           #reader:Ljava/io/BufferedReader;
    .restart local v5       #reader:Ljava/io/BufferedReader;
    goto :goto_0

    .line 188
    .end local v5           #reader:Ljava/io/BufferedReader;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    :cond_3
    :try_start_5
    const-string v10, "\\s"

    invoke-virtual {v2, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 189
    .local v8, tokens:[Ljava/lang/String;
    array-length v10, v8

    add-int/lit8 v10, v10, -0x1

    aget-object v4, v8, v10

    .line 191
    .local v4, processName:Ljava/lang/String;
    const-string v10, "/system/bin/wpa_supplicant"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_a
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_9

    move-result v10

    if-eqz v10, :cond_5

    .line 195
    const/4 v9, 0x1

    .line 206
    if-eqz v6, :cond_4

    .line 208
    :try_start_6
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_6

    :cond_4
    :goto_2
    move-object v5, v6

    .line 210
    .end local v6           #reader:Ljava/io/BufferedReader;
    .restart local v5       #reader:Ljava/io/BufferedReader;
    goto :goto_0

    .line 206
    .end local v5           #reader:Ljava/io/BufferedReader;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    :cond_5
    if-eqz v6, :cond_6

    .line 208
    :try_start_7
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_7

    :cond_6
    :goto_3
    move-object v5, v6

    .line 210
    .end local v6           #reader:Ljava/io/BufferedReader;
    .restart local v5       #reader:Ljava/io/BufferedReader;
    goto :goto_0

    .line 199
    .end local v0           #command:Ljava/lang/String;
    .end local v2           #line:Ljava/lang/String;
    .end local v4           #processName:Ljava/lang/String;
    .end local v7           #result:I
    .end local v8           #tokens:[Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 200
    .local v1, e:Ljava/io/IOException;
    :goto_4
    :try_start_8
    const-string v10, "ApduService"

    const-string v11, "Failed to perform security check"

    invoke-static {v10, v11, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 206
    if-eqz v5, :cond_0

    .line 208
    :try_start_9
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_1

    goto :goto_0

    .line 209
    :catch_1
    move-exception v10

    goto :goto_0

    .line 202
    .end local v1           #e:Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 203
    .local v1, e:Ljava/lang/InterruptedException;
    :goto_5
    :try_start_a
    const-string v10, "ApduService"

    const-string v11, "Failed to perform security check"

    invoke-static {v10, v11, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 206
    if-eqz v5, :cond_0

    .line 208
    :try_start_b
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_3

    goto :goto_0

    .line 209
    :catch_3
    move-exception v10

    goto :goto_0

    .line 206
    .end local v1           #e:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v9

    :goto_6
    if-eqz v5, :cond_7

    .line 208
    :try_start_c
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_8

    .line 210
    :cond_7
    :goto_7
    throw v9

    .line 209
    .restart local v0       #command:Ljava/lang/String;
    .restart local v7       #result:I
    :catch_4
    move-exception v10

    goto :goto_0

    .end local v5           #reader:Ljava/io/BufferedReader;
    .restart local v2       #line:Ljava/lang/String;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    :catch_5
    move-exception v10

    goto :goto_1

    .restart local v4       #processName:Ljava/lang/String;
    .restart local v8       #tokens:[Ljava/lang/String;
    :catch_6
    move-exception v10

    goto :goto_2

    :catch_7
    move-exception v10

    goto :goto_3

    .end local v0           #command:Ljava/lang/String;
    .end local v2           #line:Ljava/lang/String;
    .end local v4           #processName:Ljava/lang/String;
    .end local v6           #reader:Ljava/io/BufferedReader;
    .end local v7           #result:I
    .end local v8           #tokens:[Ljava/lang/String;
    .restart local v5       #reader:Ljava/io/BufferedReader;
    :catch_8
    move-exception v10

    goto :goto_7

    .line 206
    .end local v5           #reader:Ljava/io/BufferedReader;
    .restart local v0       #command:Ljava/lang/String;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    .restart local v7       #result:I
    :catchall_1
    move-exception v9

    move-object v5, v6

    .end local v6           #reader:Ljava/io/BufferedReader;
    .restart local v5       #reader:Ljava/io/BufferedReader;
    goto :goto_6

    .line 202
    .end local v5           #reader:Ljava/io/BufferedReader;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    :catch_9
    move-exception v1

    move-object v5, v6

    .end local v6           #reader:Ljava/io/BufferedReader;
    .restart local v5       #reader:Ljava/io/BufferedReader;
    goto :goto_5

    .line 199
    .end local v5           #reader:Ljava/io/BufferedReader;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    :catch_a
    move-exception v1

    move-object v5, v6

    .end local v6           #reader:Ljava/io/BufferedReader;
    .restart local v5       #reader:Ljava/io/BufferedReader;
    goto :goto_4
.end method

.method private runService()V
    .locals 3

    .prologue
    .line 94
    :goto_0
    iget-boolean v1, p0, Landroid/net/wifi/ApduService;->mForceClose:Z

    if-nez v1, :cond_1

    .line 95
    invoke-direct {p0}, Landroid/net/wifi/ApduService;->waitForConnection()V

    .line 97
    iget-boolean v1, p0, Landroid/net/wifi/ApduService;->mForceClose:Z

    if-nez v1, :cond_0

    .line 102
    :try_start_0
    invoke-direct {p0}, Landroid/net/wifi/ApduService;->communicateWithClient()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 114
    :cond_0
    :goto_1
    :try_start_1
    iget-object v1, p0, Landroid/net/wifi/ApduService;->mConnectionSocket:Landroid/net/LocalSocket;

    invoke-virtual {v1}, Landroid/net/LocalSocket;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 118
    :goto_2
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/net/wifi/ApduService;->mConnectionSocket:Landroid/net/LocalSocket;

    goto :goto_0

    .line 103
    :catch_0
    move-exception v0

    .line 104
    .local v0, e:Ljava/io/IOException;
    const-string v1, "ApduService"

    const-string v2, "Error communicating with client"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 105
    .end local v0           #e:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 106
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "ApduService"

    const-string v2, "Error communicating with client"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 115
    .end local v0           #e:Landroid/os/RemoteException;
    :catch_2
    move-exception v0

    .line 116
    .local v0, e:Ljava/io/IOException;
    const-string v1, "ApduService"

    const-string v2, "Error closing connection socket"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 123
    .end local v0           #e:Ljava/io/IOException;
    :cond_1
    return-void
.end method

.method private waitForConnection()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 130
    :try_start_0
    iget-object v2, p0, Landroid/net/wifi/ApduService;->mServerSocket:Landroid/net/LocalServerSocket;

    invoke-virtual {v2}, Landroid/net/LocalServerSocket;->accept()Landroid/net/LocalSocket;

    move-result-object v2

    iput-object v2, p0, Landroid/net/wifi/ApduService;->mConnectionSocket:Landroid/net/LocalSocket;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    iget-object v2, p0, Landroid/net/wifi/ApduService;->mConnectionSocket:Landroid/net/LocalSocket;

    if-nez v2, :cond_1

    .line 138
    const-string v2, "ApduService"

    const-string v3, "Server socket missing. Closing down service..."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    iput-boolean v4, p0, Landroid/net/wifi/ApduService;->mForceClose:Z

    .line 159
    :cond_0
    :goto_0
    return-void

    .line 131
    :catch_0
    move-exception v1

    .line 132
    .local v1, e:Ljava/io/IOException;
    const-string v2, "ApduService"

    const-string v3, "Error calling accept on server socket. Closing down service..."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    iput-boolean v4, p0, Landroid/net/wifi/ApduService;->mForceClose:Z

    goto :goto_0

    .line 149
    .end local v1           #e:Ljava/io/IOException;
    :cond_1
    :try_start_1
    iget-object v2, p0, Landroid/net/wifi/ApduService;->mConnectionSocket:Landroid/net/LocalSocket;

    invoke-virtual {v2}, Landroid/net/LocalSocket;->getPeerCredentials()Landroid/net/Credentials;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    .line 156
    .local v0, credentials:Landroid/net/Credentials;
    invoke-virtual {v0}, Landroid/net/Credentials;->getPid()I

    move-result v2

    invoke-direct {p0, v2}, Landroid/net/wifi/ApduService;->isPidAllowed(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 157
    iput-boolean v4, p0, Landroid/net/wifi/ApduService;->mForceClose:Z

    goto :goto_0

    .line 150
    .end local v0           #credentials:Landroid/net/Credentials;
    :catch_1
    move-exception v1

    .line 151
    .restart local v1       #e:Ljava/io/IOException;
    const-string v2, "ApduService"

    const-string v3, "Could not get peer credentials from socket. Closing down service..."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    iput-boolean v4, p0, Landroid/net/wifi/ApduService;->mForceClose:Z

    goto :goto_0
.end method


# virtual methods
.method public start()V
    .locals 3

    .prologue
    .line 342
    iget-object v1, p0, Landroid/net/wifi/ApduService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 343
    :try_start_0
    iget-boolean v0, p0, Landroid/net/wifi/ApduService;->mStarted:Z

    if-eqz v0, :cond_0

    .line 344
    const-string v0, "ApduService"

    const-string v2, "Could not start APDU Service, already started"

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 345
    monitor-exit v1

    .line 354
    :goto_0
    return-void

    .line 347
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/net/wifi/ApduService;->mStarted:Z

    .line 348
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/net/wifi/ApduService;->mForceClose:Z

    .line 349
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 353
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Landroid/net/wifi/ApduService;->mRunnable:Ljava/lang/Runnable;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0

    .line 349
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method stop()V
    .locals 5

    .prologue
    .line 357
    iget-object v3, p0, Landroid/net/wifi/ApduService;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 358
    :try_start_0
    iget-boolean v2, p0, Landroid/net/wifi/ApduService;->mStarted:Z

    if-nez v2, :cond_0

    .line 359
    const-string v2, "ApduService"

    const-string v4, "Could not stop APDU service, not started"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    monitor-exit v3

    .line 383
    :goto_0
    return-void

    .line 362
    :cond_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 368
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/net/wifi/ApduService;->mForceClose:Z

    .line 369
    new-instance v1, Landroid/net/LocalSocket;

    invoke-direct {v1}, Landroid/net/LocalSocket;-><init>()V

    .line 373
    .local v1, tempSocket:Landroid/net/LocalSocket;
    :try_start_1
    new-instance v2, Landroid/net/LocalSocketAddress;

    iget-object v3, p0, Landroid/net/wifi/ApduService;->mSocketName:Ljava/lang/String;

    invoke-direct {v2, v3}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 379
    :goto_1
    :try_start_2
    invoke-virtual {v1}, Landroid/net/LocalSocket;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 380
    :catch_0
    move-exception v0

    .line 381
    .local v0, e:Ljava/io/IOException;
    const-string v2, "ApduService"

    const-string v3, "Unable to close temporary local socket"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 362
    .end local v0           #e:Ljava/io/IOException;
    .end local v1           #tempSocket:Landroid/net/LocalSocket;
    :catchall_0
    move-exception v2

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2

    .line 374
    .restart local v1       #tempSocket:Landroid/net/LocalSocket;
    :catch_1
    move-exception v0

    .line 375
    .restart local v0       #e:Ljava/io/IOException;
    const-string v2, "ApduService"

    const-string v3, "Cannot stop service (server socket connect failed)"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method
