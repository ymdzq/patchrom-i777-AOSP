.class public Lcom/cyanogenmod/settings/device/SensorsFragmentActivity;
.super Landroid/preference/PreferenceFragment;
.source "SensorsFragmentActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method

.method public static restore(Landroid/content/Context;)V
    .locals 4
    .parameter "context"

    .prologue
    .line 75
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 76
    .local v1, sharedPrefs:Landroid/content/SharedPreferences;
    const-string v2, "use_accelerometer_calibration"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 81
    .local v0, accelerometerCalib:Z
    if-nez v0, :cond_0

    .line 82
    const-string v2, "/sys/class/sec/gsensorcal/calibration"

    const-string v3, "0"

    invoke-static {v2, v3}, Lcom/cyanogenmod/settings/device/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    :cond_0
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 42
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 44
    const v1, 0x7f040004

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/settings/device/SensorsFragmentActivity;->addPreferencesFromResource(I)V

    .line 45
    invoke-virtual {p0}, Lcom/cyanogenmod/settings/device/SensorsFragmentActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    .line 46
    .local v0, prefSet:Landroid/preference/PreferenceScreen;
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 5
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    .line 52
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    .line 54
    .local v1, key:Ljava/lang/String;
    const-string v2, "GalaxyS2Settings_Sensors"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "key: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    const-string v2, "use_accelerometer_calibration"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_2

    .line 57
    check-cast p2, Landroid/preference/CheckBoxPreference;

    .end local p2
    invoke-virtual {p2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v0, "1"

    .line 58
    .local v0, boxValue:Ljava/lang/String;
    :goto_0
    const-string v2, "/sys/class/sec/gsensorcal/calibration"

    invoke-static {v2, v0}, Lcom/cyanogenmod/settings/device/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .end local v0           #boxValue:Ljava/lang/String;
    :cond_0
    :goto_1
    const/4 v2, 0x1

    return v2

    .line 57
    :cond_1
    const-string v0, "0"

    goto :goto_0

    .line 59
    .restart local p2
    :cond_2
    const-string v2, "calibrate_accelerometer"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    .line 62
    const-string v2, "/sys/class/sec/gsensorcal/calibration"

    const-string v3, "0"

    invoke-static {v2, v3}, Lcom/cyanogenmod/settings/device/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    const-string v2, "/sys/class/sec/gsensorcal/calibration"

    const-string v3, "1"

    invoke-static {v2, v3}, Lcom/cyanogenmod/settings/device/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    invoke-virtual {p0}, Lcom/cyanogenmod/settings/device/SensorsFragmentActivity;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f06001b

    invoke-virtual {p0, v3}, Lcom/cyanogenmod/settings/device/SensorsFragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f06001c

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/settings/device/SensorsFragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/cyanogenmod/settings/device/Utils;->showDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method
