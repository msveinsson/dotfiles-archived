-- Keybindings for hs_select_window (Alt + key or Alt + Shift + key)

local SWbindings = {
  all_windows =  { {"alt"}, "b"},
  app_windows =  { {"alt", "shift"}, "b"}
}   
spoon.hs_select_window:bindHotkeys(SWbindings)
