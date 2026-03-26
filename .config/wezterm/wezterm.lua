local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.enable_wayland = false
-- 字体配置
config.font = wezterm.font_with_fallback({
	-- "DepartureMono Nerd Font",
	-- "Fusion Pixel 12px M zh_hans",
	{ family = "Recursive Mono Casual Static" },
	-- { family = "JetBrains Mono Nerd Font", weight = "Bold" },
	-- "HarmonyOS Sans SC",
	{ family = "HarmonyOS Sans SC", weight = "Bold" },
})
config.font_size = 16

-- 颜色和透明度
config.color_scheme = "Catppuccin Macchiato"
-- config.window_background_opacity = 0.7
-- config.text_background_opacity = 0.7
-- config.window_decorations = "RESIZE"

-- 快捷键说明（Leader键为 ALT + w，按下后2秒内触发后续快捷键）
-- 标签页管理
--   LEADER + c: 新建标签页
--   LEADER + x: 关闭当前面板
--   LEADER + b: 切换到上一个标签页
--   LEADER + n: 切换到下一个标签页
--   LEADER + 数字(0-9): 切换到对应标签页
-- 面板拆分
--   LEADER + -: 纵向拆分面板
--   LEADER + \: 横向
-- 面板导航
--   LEADER + h/j/k/l: 分别切换左/下/上/右面板
-- 面板调整大小
--   LEADER + 方向键: 按5单位调整对应方向面板大小

config.leader = { key = "w", mods = "ALT", timeout_milliseconds = 2000 }

config.keys = {
	{ mods = "LEADER", key = "c", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ mods = "LEADER", key = "x", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	{ mods = "LEADER", key = "b", action = wezterm.action.ActivateTabRelative(-1) },
	{ mods = "LEADER", key = "n", action = wezterm.action.ActivateTabRelative(1) },
	{ mods = "LEADER", key = "\\", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "-", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "ALT", key = "h", action = wezterm.action.ActivatePaneDirection("Left") },
	{ mods = "ALT", key = "j", action = wezterm.action.ActivatePaneDirection("Down") },
	{ mods = "ALT", key = "k", action = wezterm.action.ActivatePaneDirection("Up") },
	{ mods = "ALT", key = "l", action = wezterm.action.ActivatePaneDirection("Right") },
	{ mods = "ALT", key = "LeftArrow", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ mods = "ALT", key = "RightArrow", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	{ mods = "ALT", key = "DownArrow", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	{ mods = "ALT", key = "UpArrow", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
}

for i = 0, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end

config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

wezterm.on("update-right-status", function(window, _)
	local prefix = ""
	if window:leader_is_active() then
		prefix = " 🌊"
	end
	window:set_right_status(wezterm.format({ { Text = prefix } }))
end)

return config
