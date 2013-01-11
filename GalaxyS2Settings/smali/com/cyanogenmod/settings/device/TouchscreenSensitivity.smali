.class public Lcom/cyanogenmod/settings/device/TouchscreenSensitivity;
.super Landroid/preference/ListPreference;
.source "TouchscreenSensitivity.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    invoke-virtual {p0, p0}, Lcom/cyanogenmod/settings/device/TouchscreenSensitivity;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 33
    return-void
.end method

.method public static isSupported()Z
    .locals 1

    .prologue
    .line 38
    const-string v0, "/sys/class/sec/sec_touchscreen/tsp_threshold"

    invoke-static {v0}, Lcom/cyanogenmod/settings/device/Utils;->fileExists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 1
    .parameter "preference"
    .parameter "newValue"

    .prologue
    .line 55
    const-string v0, "/sys/class/sec/sec_touchscreen/tsp_threshold"

    check-cast p2, Ljava/lang/String;

    .end local p2
    invoke-static {v0, p2}, Lcom/cyanogenmod/settings/device/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    const/4 v0, 0x1

    return v0
.end method
