//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <bitsdojo_window_windows/bitsdojo_window_plugin.h>
#include <dynamic_color/dynamic_color_plugin_c_api.h>
#include <emoji_picker_flutter/emoji_picker_flutter_plugin_c_api.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  BitsdojoWindowPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("BitsdojoWindowPlugin"));
  DynamicColorPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DynamicColorPluginCApi"));
  EmojiPickerFlutterPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("EmojiPickerFlutterPluginCApi"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
