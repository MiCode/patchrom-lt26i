import common
import edify_generator

def AddAssertions(info):
    edify = info.script
    for i in xrange(len(edify.script)):
        if ");" in edify.script[i] and ("ro.product.device" in edify.script[i] or "ro.build.product" in edify.script[i]):
            edify.script[i] = 'assert(getprop("ro.product.device") == "LT26i" || getprop("ro.build.product") == "LT26i");'
            return
    return

def AddWifiLink(info):
    info.script.AppendExtra('symlink("data/misc/audio/wcd9310_anc.bin","system/etc/firmware/wcd9310/wcd9310_anc.bin");')
    info.script.AppendExtra('symlink("data/misc/audio/mbhc.bin","system/etc/firmware/wcd9310/wcd9310_mbhc.bin");')
    return 

def FullOTA_InstallEnd(info):
    AddAssertions(info)
#    AddWifiLink(info)
    return

def IncrementalOTA_InstallEnd(info):
    AddAssertions(info)
#    AddWifiLink(info)
    return
