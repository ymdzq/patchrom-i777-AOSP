.class public Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;
.super Landroid/preference/PreferenceFragment;
.source "ScreenFragmentActivity.java"


# instance fields
.field private mPanelGamma:Lcom/cyanogenmod/settings/device/PanelGamma;

.field private mTouchscreenSensitivity:Lcom/cyanogenmod/settings/device/TouchscreenSensitivity;

.field private mmDNIeMode:Lcom/cyanogenmod/settings/device/mDNIeMode;

.field private mmDNIeNegative:Lcom/cyanogenmod/settings/device/mDNIeNegative;

.field private mmDNIeOutdoor:Lcom/cyanogenmod/settings/device/mDNIeOutdoor;

.field private mmDNIeScenario:Lcom/cyanogenmod/settings/device/mDNIeScenario;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method

.method public static restore(Landroid/content/Context;)V
    .locals 4
    .parameter "context"

    .prologue
    .line 106
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 107
    .local v1, sharedPrefs:Landroid/content/SharedPreferences;
    const-string v2, "touchkey_light"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 109
    .local v0, light:Z
    const-string v3, "/sys/class/sec/sec_touchkey/force_disable"

    if-eqz v0, :cond_0

    const-string v2, "0"

    :goto_0
    invoke-static {v3, v2}, Lcom/cyanogenmod/settings/device/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    const-string v3, "/sys/class/sec/sec_touchkey/brightness"

    if-eqz v0, :cond_1

    const-string v2, "1"

    :goto_1
    invoke-static {v3, v2}, Lcom/cyanogenmod/settings/device/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    return-void

    .line 109
    :cond_0
    const-string v2, "1"

    goto :goto_0

    .line 110
    :cond_1
    const-string v2, "2"

    goto :goto_1
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 49
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 51
    const v1, 0x7f040003

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->addPreferencesFromResource(I)V

    .line 52
    invoke-virtual {p0}, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    .line 54
    .local v0, prefSet:Landroid/preference/PreferenceScreen;
    const-string v1, "mdnie_scenario"

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/settings/device/mDNIeScenario;

    iput-object v1, p0, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->mmDNIeScenario:Lcom/cyanogenmod/settings/device/mDNIeScenario;

    .line 55
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->mmDNIeScenario:Lcom/cyanogenmod/settings/device/mDNIeScenario;

    invoke-static {}, Lcom/cyanogenmod/settings/device/mDNIeScenario;->isSupported()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/settings/device/mDNIeScenario;->setEnabled(Z)V

    .line 57
    const-string v1, "mdnie_mode"

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/settings/device/mDNIeMode;

    iput-object v1, p0, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->mmDNIeMode:Lcom/cyanogenmod/settings/device/mDNIeMode;

    .line 58
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->mmDNIeMode:Lcom/cyanogenmod/settings/device/mDNIeMode;

    invoke-static {}, Lcom/cyanogenmod/settings/device/mDNIeMode;->isSupported()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/settings/device/mDNIeMode;->setEnabled(Z)V

    .line 60
    const-string v1, "mdnie_negative"

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/settings/device/mDNIeNegative;

    iput-object v1, p0, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->mmDNIeNegative:Lcom/cyanogenmod/settings/device/mDNIeNegative;

    .line 61
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->mmDNIeNegative:Lcom/cyanogenmod/settings/device/mDNIeNegative;

    invoke-static {}, Lcom/cyanogenmod/settings/device/mDNIeNegative;->isSupported()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/settings/device/mDNIeNegative;->setEnabled(Z)V

    .line 63
    const-string v1, "mdnie_outdoor"

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/settings/device/mDNIeOutdoor;

    iput-object v1, p0, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->mmDNIeOutdoor:Lcom/cyanogenmod/settings/device/mDNIeOutdoor;

    .line 64
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->mmDNIeOutdoor:Lcom/cyanogenmod/settings/device/mDNIeOutdoor;

    invoke-static {}, Lcom/cyanogenmod/settings/device/mDNIeOutdoor;->isSupported()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/settings/device/mDNIeOutdoor;->setEnabled(Z)V

    .line 66
    const-string v1, "panel_gamma"

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/settings/device/PanelGamma;

    iput-object v1, p0, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->mPanelGamma:Lcom/cyanogenmod/settings/device/PanelGamma;

    .line 67
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->mPanelGamma:Lcom/cyanogenmod/settings/device/PanelGamma;

    iget-object v2, p0, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->mPanelGamma:Lcom/cyanogenmod/settings/device/PanelGamma;

    invoke-static {}, Lcom/cyanogenmod/settings/device/PanelGamma;->isSupported()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/settings/device/PanelGamma;->setEnabled(Z)V

    .line 69
    const-string v1, "touchscreen_sensitivity"

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/settings/device/TouchscreenSensitivity;

    iput-object v1, p0, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->mTouchscreenSensitivity:Lcom/cyanogenmod/settings/device/TouchscreenSensitivity;

    .line 70
    iget-object v1, p0, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->mTouchscreenSensitivity:Lcom/cyanogenmod/settings/device/TouchscreenSensitivity;

    iget-object v2, p0, Lcom/cyanogenmod/settings/device/ScreenFragmentActivity;->mTouchscreenSensitivity:Lcom/cyanogenmod/settings/device/TouchscreenSensitivity;

    invoke-static {}, Lcom/cyanogenmod/settings/device/TouchscreenSensitivity;->isSupported()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/settings/device/TouchscreenSensitivity;->setEnabled(Z)V

    .line 72
    const-string v1, "touchkey_light"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 73
    const-string v1, "touchkey_timeout"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 77
    :goto_0
    return-void

    .line 75
    :cond_0
    const-string v1, "touchkey_timeout"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setEnabled(Z)V

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 5
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v4, 0x1

    .line 82
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 84
    .local v0, key:Ljava/lang/String;
    const-string v1, "GalaxyS2Settings_Screen"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "key: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    const-string v1, "touchkey_light"

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    .line 87
    check-cast p2, Landroid/preference/CheckBoxPreference;

    .end local p2
    invoke-virtual {p2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 88
    const-string v1, "/sys/class/sec/sec_touchkey/force_disable"

    const-string v2, "0"

    invoke-static {v1, v2}, Lcom/cyanogenmod/settings/device/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    const-string v1, "/sys/class/sec/sec_touchkey/brightness"

    const-string v2, "1"

    invoke-static {v1, v2}, Lcom/cyanogenmod/settings/device/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    const-string v1, "touchkey_timeout"

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 98
    :cond_0
    :goto_0
    return v4

    .line 92
    :cond_1
    const-string v1, "/sys/class/sec/sec_touchkey/force_disable"

    const-string v2, "1"

    invoke-static {v1, v2}, Lcom/cyanogenmod/settings/device/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    const-string v1, "/sys/class/sec/sec_touchkey/brightness"

    const-string v2, "2"

    invoke-static {v1, v2}, Lcom/cyanogenmod/settings/device/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    const-string v1, "touchkey_timeout"

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setEnabled(Z)V

    goto :goto_0
.end method
