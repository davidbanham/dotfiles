-------------------------------------------------------------------------------
-- Main --
main :: IO ()
main = xmonad =<< statusBar cmd pp kb conf
  where
    uhook = withUrgencyHookC NoUrgencyHook urgentConfig
    cmd = "xmobar -x0"
    --cmd = "bash -c \"tee >(xmobar -x0) | xmobar -x1 | xmobar -x2\""
    pp = customPP
    kb = toggleStrutsKey
    conf = uhook myConfig
