import common
import edify_generator

def WriteRawImage(info, *args):
    return True

def AddAssertions(info):
    edify = info.script
    for i in xrange(len(edify.script)):
        if ");" in edify.script[i] and ("ro.product.device" in edify.script[i] or "ro.build.product" in edify.script[i]):
            edify.script[i] = ""
            return
    return

def PatchBootImage(info):
    return 

def FullOTA_InstallEnd(info):
    AddAssertions(info)
    return

def IncrementalOTA_InstallEnd(info):
    AddAssertions(info)
    return
